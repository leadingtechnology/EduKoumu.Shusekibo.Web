import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/app/widget/cache/cache_provider.dart';
import 'package:shusekibo/app/widget/health/health_reason_repository.dart';
import 'package:shusekibo/app/widget/health/health_stamp_model.dart';
import 'package:shusekibo/app/widget/health/health_stamp_provider.dart';
import 'package:shusekibo/app/widget/health/health_stamp_state.dart';
import 'package:shusekibo/shared/http/api_provider.dart';
import 'package:shusekibo/shared/http/api_response.dart';
import 'package:shusekibo/shared/http/app_exception.dart';

abstract class HealthStampRepositoryProtocol {
  Future<HealthStampState> fetch(); 
}

final healthStampRepositoryProvider = Provider(HealthStampRepository.new);

class HealthStampRepository implements HealthStampRepositoryProtocol {
  HealthStampRepository(this._ref);

  late final ApiProvider _api = _ref.read(apiProvider);
  final Ref _ref;

  late final HealthReasonRepository _reasonRep =
      _ref.read(healthReasonRepositoryProvider);  

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
            healthStampListFromJson(value['UnregistStampList'] as List<dynamic>);
       
        _ref.read(healthStampProvider.notifier).state = registStampList.first;
        
        // Cacheの作成
        final registStampMap = Map.fromIterables(
          registStampList.map((e) => '${e.jokyoCd}').toList(),
          registStampList.map((e) => e).toList(),
        );
        final unregistStampMap = Map.fromIterables(
          unregistStampList.map((e) => '${e.jokyoCd}').toList(),
          unregistStampList.map((e) => e).toList(),
        );

        _ref.read(healthRegistStampCache.notifier).state = registStampMap;
        _ref.read(healthUnegistStampCache.notifier).state = unregistStampMap;

        //初期処理時に理由情報も取得する。
        final stamp = registStampList[1];
        await _reasonRep.fetch(stamp);

        return HealthStampState.loaded();
      } catch (e) {
        return HealthStampState.error(
            AppException.errorWithMessage(e.toString()),);
      }
  
    } else if (response is APIError) {
      return HealthStampState.error(response.exception);
    } else {
      return const HealthStampState.loading();
    }
  }
}
