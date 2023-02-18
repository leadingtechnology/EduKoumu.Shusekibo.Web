import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/app/widget/cache/cache_provider.dart';
import 'package:shusekibo/app/widget/dantai/dantai_model.dart';
import 'package:shusekibo/app/widget/dantai/dantai_provider.dart';
import 'package:shusekibo/app/widget/gakunen/gakunen_model.dart';
import 'package:shusekibo/app/widget/gakunen/gakunen_repository.dart';
import 'package:shusekibo/app/widget/gakunen/gakunen_state.dart';

final gakunenInitProvider =
    StateNotifierProvider<GakunenInitProvider, GakunenState>((ref) {
  final dantai = ref.watch(dantaiProvider);
  
  return GakunenInitProvider(ref, dantai);
});

final gakunenProvider = StateProvider<GakunenModel>(
  (ref) => const GakunenModel(),
);

class GakunenInitProvider extends StateNotifier<GakunenState> {
  GakunenInitProvider(this._ref, this._dantai)
      : super(const GakunenState.loading()) {
    _init();
  }

  final Ref _ref;
  final DantaiModel _dantai;

  late final GakunenRepository _repository = _ref.read(gakunenRepositoryProvider);

  Future<void> _init() async {
    if (_dantai.id == null) return;
    
    final gakunenMap = _ref.read(gakunenCache);

    if (gakunenMap.isEmpty) {
      await _fetch();
    } else if (!gakunenMap.containsKey('${_dantai.id}')) {
      await _fetch();
    } else {
      state = const GakunenState.loaded();
    }
  }

  Future<void> _fetch() async {
    final response = await _repository.fetch(_dantai);
    if (mounted) {
      state = response;
    }
  }
}
