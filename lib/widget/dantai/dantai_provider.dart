import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/widget/dantai/dantai_model.dart';
import 'package:shusekibo/widget/dantai/dantai_repository.dart';
import 'package:shusekibo/widget/dantai/dantai_state.dart';

final dantaiListProvider =
    StateNotifierProvider<DantaiListProvider, DantaiState>((ref) {

  return DantaiListProvider(ref);
});

final dantaiProvider = StateProvider<DantaiModel>((ref) => const DantaiModel());

class DantaiListProvider extends StateNotifier<DantaiState> {
  DantaiListProvider(this._ref)
      : super(const DantaiState.loading()) {
    _init();
  }

  final Ref _ref;

  late final DantaiRepository _repository = _ref.read(dantaiRepositoryProvider);

  Future<void> _init() async {
    await _fetchDantaiList();
  }

  Future<void> _fetchDantaiList() async {
    final response = await _repository.fetch();

    if (mounted) {
      state = response;
    }
  }
}
