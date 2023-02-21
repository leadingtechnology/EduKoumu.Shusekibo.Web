import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/app/widget/cache/cache_provider.dart';
import 'package:shusekibo/app/widget/dantai/dantai_model.dart';
import 'package:shusekibo/app/widget/gakunen/gakunen_model.dart';
import 'package:shusekibo/app/widget/gakunen/gakunen_provider.dart';
import 'package:shusekibo/app/widget/gakunen/gakunen_state.dart';
import 'package:shusekibo/shared/http/api_provider.dart';
import 'package:shusekibo/shared/http/api_response.dart';
import 'package:shusekibo/shared/http/app_exception.dart';

abstract class GakunenRepositoryProtocol {
  Future<GakunenState> fetch(DantaiModel dantai);
}

final gakunenRepositoryProvider = Provider(GakunenRepository.new);

class GakunenRepository implements GakunenRepositoryProtocol {
  GakunenRepository(this._ref);

  late final ApiProvider _api = _ref.read(apiProvider);
  final Ref _ref;

  @override
  Future<GakunenState> fetch(DantaiModel dantai) async {
    final response = await _api.get('api/gakunen?kbn=${dantai.organizationKbn}');

    response.when(
        success: (success) {},
        error: (error) {
          return GakunenState.error(error);
        },);

    if (response is APISuccess) {
      final value = response.value;
      try {
        final gakunen = gakunenListFromJson(value as List<dynamic>);
        
        if (gakunen.isNotEmpty) {
          final gk = gakunen.first;
          final nasi = GakunenModel(
            organizationId: gk.organizationId,
            gakunenCode: '0',
            gakunenName: '学年なし',
            gakunenRyakusho: '学年なし',
            kateiKbn: gk.kateiKbn,
            zaisekiAgeLowLimit: gk.zaisekiAgeLowLimit,
            isTantoGakunen: gk.isTantoGakunen,
            id:0,
            code: '0',
            name: '学年なし',
          );
          gakunen.add(nasi);
        }

        _ref.read(gakunenProvider.notifier).state = gakunen.first;
        _ref.read(gakunenCache.notifier).state['${dantai.id}'] = gakunen;

        return const GakunenState.loaded();
      } catch (e) {
        return GakunenState.error(AppException.errorWithMessage(e.toString()));
      }
    } else if (response is APIError) {
      return GakunenState.error(response.exception);
    } else {
      return const GakunenState.loading();
    }
  }
}
