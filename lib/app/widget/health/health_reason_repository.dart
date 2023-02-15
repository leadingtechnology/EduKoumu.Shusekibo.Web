import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/app/widget/cache/cache_provider.dart';
import 'package:shusekibo/app/widget/health/health_reason_model.dart';
import 'package:shusekibo/app/widget/health/health_reason_provider.dart';
import 'package:shusekibo/app/widget/health/health_reason_state.dart';
import 'package:shusekibo/app/widget/health/health_stamp_model.dart';
import 'package:shusekibo/shared/http/api_provider.dart';
import 'package:shusekibo/shared/http/api_response.dart';
import 'package:shusekibo/shared/http/app_exception.dart';

abstract class HealthReasonRepositoryProtocol {
  Future<HealthReasonState> fetch(HealthStampModel stamp);
}

final healthReasonRepositoryProvider = Provider(HealthReasonRepository.new);

class HealthReasonRepository implements HealthReasonRepositoryProtocol {
  HealthReasonRepository(this._ref);

  late final ApiProvider _api = _ref.read(apiProvider);
  final Ref _ref;

  @override
  Future<HealthReasonState> fetch(HealthStampModel stamp) async {
    final response = await _api.get('api/KenkouKansatsubo/reasons/${stamp.jokyoCd}');

    response.when(
        success: (success) {},
        error: (error) {
          return HealthReasonState.error(error);
        },);

    if (response is APISuccess) {
      final value = response.value;
      try {
        final reason1List =
            healthReasonListFromJson(
            value['Reason1List'][0]['ReasonList'] as List<dynamic>,);
        if (reason1List.isNotEmpty){
          _ref.read(healthReason1Provider.notifier).state = reason1List.first;
        }

        var reason2List = <HealthReasonModel>[];

        if (stamp.jokyoCd == '430') {
           reason2List =
              healthReasonListFromJson(
              value['Reason2List'][0]['ReasonList'] as List<dynamic>,);
        }
        if (reason2List.isNotEmpty) {
          _ref.read(healthReason2Provider.notifier).state = reason2List.first;
        }

        _ref.read(healthReason1Cache.notifier).state['${stamp.jokyoCd}'] =
            reason1List;
        _ref.read(healthReason2Cache.notifier).state['${stamp.jokyoCd}'] =
            reason2List;

        return const HealthReasonState.loaded();
      } catch (e) {
        return HealthReasonState.error(
            AppException.errorWithMessage(e.toString()),);
      }
    } else if (response is APIError) {
      return HealthReasonState.error(response.exception);
    } else {
      return const HealthReasonState.loading();
    }
  }
}
