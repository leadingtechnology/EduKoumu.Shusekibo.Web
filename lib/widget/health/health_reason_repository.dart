import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/shared/http/api_provider.dart';
import 'package:shusekibo/shared/http/api_response.dart';
import 'package:shusekibo/shared/http/app_exception.dart';
import 'package:shusekibo/widget/common/app_state.dart';
import 'package:shusekibo/widget/health/health_reason_model.dart';
import 'package:shusekibo/widget/health/health_reason_provider.dart';
import 'package:shusekibo/widget/health/health_stamp_model.dart';

abstract class HealthReasonRepositoryProtocol {
  Future<AppState> fetch(HealthStampModel stamp);
}

final healthReasonRepositoryProvider = Provider(HealthReasonRepository.new);

class HealthReasonRepository implements HealthReasonRepositoryProtocol {
  HealthReasonRepository(this._ref);

  late final ApiProvider _api = _ref.read(apiProvider);
  final Ref _ref;

  @override
  Future<AppState> fetch(HealthStampModel stamp) async {
    final response = await _api.get('api/KenkouKansatsubo/reasons/${stamp.jokyoCd}');

    response.when(
        success: (success) {},
        error: (error) {
          return AppState.error(error);
        },);

    if (response is APISuccess) {
      final value = response.value;
      try {
        final reason1List =
            healthReasonListFromJson(
            value['Reason1List'][0]['ReasonList'] as List<dynamic>,);
        _ref.read(healthReason1ListProvider.notifier).state = reason1List;
        if (reason1List.isNotEmpty){
          _ref.read(healthReason1Provider.notifier).state = reason1List.first;
        }

        if (stamp.jokyoCd == '430') {
          final reason2List =
              healthReasonListFromJson(
              value['Reason2List'][0]['ReasonList'] as List<dynamic>,);
              
          _ref.read(healthReason2ListProvider.notifier).state = reason2List;
          if (reason2List.isNotEmpty){
            _ref.read(healthReason2Provider.notifier).state = reason2List.first;
          }
        }else{
          _ref.read(healthReason2ListProvider.notifier).state = [];
          _ref.read(healthReason2Provider.notifier).state = const HealthReasonModel();
        }

        return const AppState.loaded();
      } catch (e) {
        return AppState.error(
            AppException.errorWithMessage(e.toString()),);
      }
    } else if (response is APIError) {
      return AppState.error(response.exception);
    } else {
      return const AppState.loading();
    }
  }
}
