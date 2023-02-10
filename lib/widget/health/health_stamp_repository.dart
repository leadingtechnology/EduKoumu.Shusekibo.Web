import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/shared/http/api_provider.dart';
import 'package:shusekibo/shared/http/api_response.dart';
import 'package:shusekibo/shared/http/app_exception.dart';
import 'package:shusekibo/widget/common/app_state.dart';
import 'package:shusekibo/widget/health/health_stamp_model.dart';
import 'package:shusekibo/widget/health/health_stamp_provider.dart';

abstract class HealthStampRepositoryProtocol {
  Future<AppState> fetch(); 
}

final healthStampRepositoryProvider = Provider(HealthStampRepository.new);

class HealthStampRepository implements HealthStampRepositoryProtocol {
  HealthStampRepository(this._ref);

  late final ApiProvider _api = _ref.read(apiProvider);
  final Ref _ref;

  @override
  Future<AppState> fetch() async {
    final response = await _api.get('api/KenkouKansatsubo/stamps');

    response.when(
        success: (success) {},
        error: (error) {return AppState.error(error);},
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
        _ref.read(healthRegistStampProvider.notifier).state = registStampList;

        // Unregist Stamp
        final unregistStampList =
            healthStampListFromJson(value['RegistStampList'] as List<dynamic>);
        _ref.read(healthUnregistStampProvider.notifier).state = unregistStampList;
       
        _ref.read(healthStampProvider.notifier).state = registStampList.first;

        return const AppState.loaded();
      } catch (e) {
        return AppState.error(AppException.errorWithMessage(e.toString()));
      }
  
    } else if (response is APIError) {
      return AppState.error(response.exception);
    } else {
      return const AppState.loading();
    }
  }
}
