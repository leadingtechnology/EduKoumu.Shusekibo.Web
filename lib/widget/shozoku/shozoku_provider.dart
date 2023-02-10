import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/widget/dantai/dantai_model.dart';
import 'package:shusekibo/widget/dantai/dantai_provider.dart';
import 'package:shusekibo/widget/gakunen/gakunen_model.dart';
import 'package:shusekibo/widget/gakunen/gakunen_provider.dart';
import 'package:shusekibo/widget/shozoku/shozoku_model.dart';
import 'package:shusekibo/widget/shozoku/shozoku_repository.dart';
import 'package:shusekibo/widget/shozoku/shozoku_state.dart';

final shozokuListProvider =
    StateNotifierProvider<ShozokuListProvider, ShozokuState>((ref) {
  final dantai = ref.watch(dantaiProvider);
  final gakunen = ref.watch(gakunenProvider);

  return ShozokuListProvider(ref, dantai, gakunen);
});

final shozokuProvider = StateProvider<ShozokuModel>((ref) => ShozokuModel());

class ShozokuListProvider extends StateNotifier<ShozokuState> {
  ShozokuListProvider(this._ref, this.dantai, this.gakunen)
      : super(const ShozokuState.loading()) {
    _init();
  }

  final Ref _ref;
  final DantaiModel dantai;
  final GakunenModel gakunen;

  late final ShozokuRepository _repository = _ref.read(shozokuRepositoryProvider);

  Future<void> _init() async {
    if (dantai.id == null || gakunen.id == null){
      state = const ShozokuState.loading();
    }else{
      await _fetchShozokuList();
    }

  }

  Future<void> _fetchShozokuList() async {
    final response = await _repository.fetch(dantai);
    if (mounted) {
      state = response;
    }
  }
}
