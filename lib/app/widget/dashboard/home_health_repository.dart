import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:shusekibo/shared/http/api_provider.dart';
import 'package:shusekibo/shared/http/api_response.dart';
import 'package:shusekibo/shared/http/app_exception.dart';
import 'package:shusekibo/app/widget/dantai/dantai_model.dart';
import 'package:shusekibo/app/widget/dashboard/home_health_model.dart';
import 'package:shusekibo/app/widget/dashboard/home_health_state.dart';

abstract class HomeHealthRepositoryProtocol {
  Future<HomeHealthState> fetch(DantaiModel dantai); 
}

final homeHealthRepositoryProvider = Provider(HomeHealthRepository.new);

class HomeHealthRepository implements HomeHealthRepositoryProtocol {
  HomeHealthRepository(this._ref);

  late final ApiProvider _api = _ref.read(apiProvider);
  final Ref _ref;

  @override
  Future<HomeHealthState> fetch(DantaiModel dantai) async {
    final today =
        DateFormat('yyyy-MM-dd').format(DateTime.now()).toString();

    var url = 'api/kenkou/classbetsu?date=$today';
    if (dantai.id != null) {
      url = '$url&dantaiId=${dantai.id}';
    }
    final response = await _api.get(url);

    response.when(
        // ignore: no-empty-block
        success: (success) {},
        error: (error) {return HomeHealthState.error(error);},
    );

    if (response is APISuccess) {
      final value = response.value;
      try {
        final homeHealth = homeHealthListFromJson(value as List<dynamic>);
     
        return HomeHealthState.loaded(homeHealth);
      } catch (e) {
        return HomeHealthState.error(
            AppException.errorWithMessage(e.toString()),);
      }
    } else if (response is APIError) {
      return HomeHealthState.error(response.exception);
    } else {
      return const HomeHealthState.loading();
    }
  }
}
