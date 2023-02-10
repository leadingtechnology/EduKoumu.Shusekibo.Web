import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/widget/dantai/dantai_model.dart';
import 'package:shusekibo/widget/dantai/dantai_provider.dart';
import 'package:shusekibo/widget/gakunen/gakunen_model.dart';
import 'package:shusekibo/widget/gakunen/gakunen_repository.dart';
import 'package:shusekibo/widget/gakunen/gakunen_state.dart';

final gakunenListProvider =
    StateNotifierProvider<GakunenListProvider, GakunenState>((ref) {
  final dantai = ref.watch(dantaiProvider);
  
  return GakunenListProvider(ref, dantai);
});

final gakunenProvider = StateProvider<GakunenModel>(
  (ref) => const GakunenModel(),
);

class GakunenListProvider extends StateNotifier<GakunenState> {
  GakunenListProvider(this._ref, this.dantai)
      : super(const GakunenState.loading()) {
    _init();
  }

  final Ref _ref;
  final DantaiModel dantai;

  late final GakunenRepository _repository = _ref.read(gakunenRepositoryProvider);

  Future<void> _init() async {
    if(dantai.id == null) {
      state = const GakunenState.loading();
    }else{
      await _fetchGakunenList();
    }
  }

  Future<void> _fetchGakunenList() async {
    final response = await _repository.fetch(dantai);
    if (mounted) {
      state = response;
    }
  }
}
