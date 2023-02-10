import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/shared/http/api_provider.dart';
import 'package:shusekibo/shared/http/api_response.dart';
import 'package:shusekibo/shared/http/app_exception.dart';
import 'package:shusekibo/widget/dantai/dantai_model.dart';
import 'package:shusekibo/widget/shozoku/shozoku_model.dart';
import 'package:shusekibo/widget/shozoku/shozoku_provider.dart';
import 'package:shusekibo/widget/shozoku/shozoku_state.dart';

abstract class ShozokuRepositoryProtocol {
  Future<ShozokuState> fetch(DantaiModel dantai);
}

final shozokuRepositoryProvider = Provider(ShozokuRepository.new);

class ShozokuRepository implements ShozokuRepositoryProtocol {
  ShozokuRepository(this._ref);

  late final ApiProvider _api = _ref.read(apiProvider);
  final Ref _ref;

  @override
  Future<ShozokuState> fetch(DantaiModel dantai) async {
    final response = await _api.get('api/dantai/${dantai.id}/shozoku');

    response.when(
        success: (success) {},
        error: (error) {
          return ShozokuState.error(error);
        });

    if (response is APISuccess) {
      final value = response.value;
      try {
        final _shozoku = shozokuListFromJson(value as List<dynamic>);

        _ref.read(shozokuProvider.notifier).state = _shozoku.first;

        return ShozokuState.loaded(_shozoku);
      } catch (e) {
        return ShozokuState.error(AppException.errorWithMessage(e.toString()));
      }
    } else if (response is APIError) {
      return ShozokuState.error(response.exception);
    } else {
      return const ShozokuState.loading();
    }
  }
}
