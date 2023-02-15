import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/app/widget/attendance/attendance_meibo_state.dart';
import 'package:shusekibo/shared/http/api_provider.dart';
import 'package:shusekibo/shared/http/api_response.dart';
import 'package:shusekibo/shared/http/app_exception.dart';

abstract class AttendanceMeiboRepositoryProtocol {
  Future<AttendanceMeiboState> fetch(); 
}
final attendanceMeiboRepositoryProvider =
    Provider(AttendanceMeiboRepository.new);


class AttendanceMeiboRepository implements AttendanceMeiboRepositoryProtocol {
  AttendanceMeiboRepository(this._ref);

  late final ApiProvider _api = _ref.read(apiProvider);
  final Ref _ref;

  @override
  Future<AttendanceMeiboState> fetch() async {
    final response = await _api.get(' ');

    response.when(
        success: (success) {},
        error: (error) {return AttendanceMeiboState.error(error);},
    );

    if (response is APISuccess) {
      final value = response.value;
      try {


        return const AttendanceMeiboState.loaded();
      } catch (e) {
        return AttendanceMeiboState.error(
            AppException.errorWithMessage(e.toString()),);
      }
    } else if (response is APIError) {
      return AttendanceMeiboState.error(response.exception);
    } else {
      return const AttendanceMeiboState.loading();
    }
  }
}
