import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:shusekibo/shared/http/api_provider.dart';
import 'package:shusekibo/shared/http/api_response.dart';
import 'package:shusekibo/shared/http/app_exception.dart';
import 'package:shusekibo/app/widget/dantai/dantai_model.dart';
import 'package:shusekibo/app/widget/dashboard/home_attendance_model.dart';
import 'package:shusekibo/app/widget/dashboard/home_attendance_state.dart';

abstract class HomeAttendanceRepositoryProtocol {
  Future<HomeAttendanceState> fetch(DantaiModel dantai); 
}

final homeAttendanceRepositoryProvider = Provider(HomeAttendanceRepository.new);

class HomeAttendanceRepository implements HomeAttendanceRepositoryProtocol {
  HomeAttendanceRepository(this._ref);

  late final ApiProvider _api = _ref.read(apiProvider);
  final Ref _ref;

  @override
  Future<HomeAttendanceState> fetch(DantaiModel dantai) async {
    final today = DateFormat('yyyy-MM-dd').format(DateTime.now()).toString();

    var url = 'api/syukketsu/classbetsu?date=$today';
    if (dantai.id != null){
      url = '$url&dantaiId=${dantai.id}';
    }
    final response = await _api.get(url);

    response.when(
        success: (success) {},
        error: (error) {return HomeAttendanceState.error(error);},
    );

    if (response is APISuccess) {
      final value = response.value;
      try {

        final homeAttendance =
            homeAttendanceListFromJson(value as List<dynamic>);

        return HomeAttendanceState.loaded(homeAttendance);
      } catch (e) {
        return HomeAttendanceState.error(
            AppException.errorWithMessage(e.toString()),);
      }
    } else if (response is APIError) {
      return HomeAttendanceState.error(response.exception);
    } else {
      return const HomeAttendanceState.loading();
    }
  }
}
