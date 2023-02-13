import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/shared/http/api_provider.dart';
import 'package:shusekibo/shared/http/api_response.dart';
import 'package:shusekibo/shared/http/app_exception.dart';
import 'package:shusekibo/app/widget/cache/cache_provider.dart';
import 'package:shusekibo/app/widget/dantai/dantai_model.dart';
import 'package:shusekibo/app/widget/gakunen/gakunen_model.dart';
import 'package:shusekibo/app/widget/gakunen/gakunen_provider.dart';
import 'package:shusekibo/app/widget/gakunen/gakunen_state.dart';

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
        });

    if (response is APISuccess) {
      final value = response.value;
      try {
        final _gakunen = gakunenListFromJson(value as List<dynamic>);

        _ref.read(gakunenProvider.notifier).state = _gakunen.first;
        _ref.read(gakunenCache.notifier).state['${dantai.id}'] = _gakunen;

        return GakunenState.loaded();
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
