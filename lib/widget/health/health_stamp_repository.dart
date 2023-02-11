import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/shared/http/api_provider.dart';
import 'package:shusekibo/shared/http/api_response.dart';
import 'package:shusekibo/shared/http/app_exception.dart';
import 'package:shusekibo/widget/health/health_stamp_model.dart';
import 'package:shusekibo/widget/health/health_stamp_provider.dart';
import 'package:shusekibo/widget/health/health_stamp_state.dart';

abstract class HealthStampRepositoryProtocol {
  Future<HealthStampState> fetch(); 
}

final healthStampRepositoryProvider = Provider(HealthStampRepository.new);

class HealthStampRepository implements HealthStampRepositoryProtocol {
  HealthStampRepository(this._ref);

  late final ApiProvider _api = _ref.read(apiProvider);
  final Ref _ref;

  @override
  Future<HealthStampState> fetch() async {
    final response = await _api.get('api/KenkouKansatsubo/stamps');

    response.when(
        success: (success) {},
        error: (error) {return HealthStampState.error(error);},
    );

    if (response is APISuccess) {
      final value = response.value;
      try {
        // Regist Stamp
        final registStampList =
            healthStampListFromJson(value['RegistStampList'] as List<dynamic>);

        // Add 2 stamps
        const handStamp = HealthStampModel(
            jokyoCd: '001', jokyoNmRyaku: '(未選択)', jokyoKey: '',);
        const delStamp = HealthStampModel(
            jokyoCd: '999', jokyoNmRyaku: 'クリア', jokyoKey: 'Delete',);
        
        registStampList..insert(0, handStamp)
        ..add(delStamp);

        // Unregist Stamp
        final unregistStampList =
            healthStampListFromJson(value['RegistStampList'] as List<dynamic>);
       
        _ref.read(healthStampProvider.notifier).state = registStampList.first;

        return HealthStampState.loaded(registStampList, unregistStampList);
      } catch (e) {
        return HealthStampState.error(AppException.errorWithMessage(e.toString()));
      }
  
    } else if (response is APIError) {
      return HealthStampState.error(response.exception);
    } else {
      return const HealthStampState.loading();
    }
  }
}
