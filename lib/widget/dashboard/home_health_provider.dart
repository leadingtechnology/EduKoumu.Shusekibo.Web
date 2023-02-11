import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/widget/dantai/dantai_model.dart';
import 'package:shusekibo/widget/dantai/dantai_provider.dart';
import 'package:shusekibo/widget/dashboard/home_health_model.dart';
import 'package:shusekibo/widget/dashboard/home_health_repository.dart';
import 'package:shusekibo/widget/dashboard/home_health_state.dart';

final homeHealthListProvider =
    StateNotifierProvider<HomeHealthListProvider, HomeHealthState>((ref) {
  final dantai = ref.watch(dantaiProvider);

  return HomeHealthListProvider(ref, dantai);
});

final homeHealthProvider =
    StateProvider<HomeHealthModel>((ref) => const HomeHealthModel());

class HomeHealthListProvider extends StateNotifier<HomeHealthState> {
  HomeHealthListProvider(this._ref, this._dantai)
      : super(const HomeHealthState.loading()) {
    _init();
  }

  final Ref _ref;
  final DantaiModel _dantai;

  late final HomeHealthRepository _repository =
      _ref.read(homeHealthRepositoryProvider);

  Future<void> _init() async {
    await _fetch();
  }

  Future<void> _fetch() async {
    final response = await _repository.fetch(_dantai);
    if (mounted) {
      state = response;
    }
  }
}
