import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/app/widget/cache/cache_provider.dart';
import 'package:shusekibo/app/widget/dantai/dantai_model.dart';
import 'package:shusekibo/app/widget/dantai/dantai_provider.dart';
import 'package:shusekibo/app/widget/shozoku/shozoku_model.dart';
import 'package:shusekibo/app/widget/shozoku/shozoku_repository.dart';
import 'package:shusekibo/app/widget/shozoku/shozoku_state.dart';

final shozokuInitProvider =
    StateNotifierProvider<ShozokuInitProvider, ShozokuState>((ref) {
  final dantai = ref.watch(dantaiProvider);

  return ShozokuInitProvider(ref, dantai);
});

final shozokuProvider =
    StateProvider<ShozokuModel>((ref) => const ShozokuModel());

class ShozokuInitProvider extends StateNotifier<ShozokuState> {
  ShozokuInitProvider(this._ref, this._dantai)
      : super(const ShozokuState.loading()) {
    _init();
  }

  final Ref _ref;
  final DantaiModel _dantai;

  late final ShozokuRepository _repository = _ref.read(shozokuRepositoryProvider);

  Future<void> _init() async {
    if (_dantai.id == null) return;
    
    final shozokuMap = _ref.read(shozokuCache);

    if (shozokuMap.isEmpty) {
      await _fetch();
    } else if (!shozokuMap.containsKey('${_dantai.id}')) {
      await _fetch();
    } else {
      state = const ShozokuState.loaded();
    }
  }

  Future<void> _fetch() async {
    final response = await _repository.fetch(_dantai);
    if (mounted) {
      state = response;
    }
  }
}
