import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/app/widget/dantai/dantai_model.dart';
import 'package:shusekibo/app/widget/dantai/dantai_provider.dart';
import 'package:shusekibo/app/widget/dantai/dantai_state.dart';
import 'package:shusekibo/app/widget/dashboard/home_health_model.dart';
import 'package:shusekibo/app/widget/dashboard/home_health_repository.dart';
import 'package:shusekibo/app/widget/dashboard/home_health_state.dart';

final homeHealthListProvider =
    StateNotifierProvider<HomeHealthListProvider, HomeHealthState>((ref) {
  final dantaiState = ref.watch(dantaiInitProvider);
  final dantai = ref.watch(dantaiProvider);

  return HomeHealthListProvider(ref, dantaiState, dantai);
});

final homeHealthProvider =
    StateProvider<HomeHealthModel>((ref) => const HomeHealthModel());

class HomeHealthListProvider extends StateNotifier<HomeHealthState> {
  HomeHealthListProvider(this._ref, this._dantaiState, this._dantai)
      : super(const HomeHealthState.loading()) {
    _init();
  }

  final Ref _ref;
  final DantaiState _dantaiState;
  final DantaiModel _dantai;

  late final HomeHealthRepository _repository =
      _ref.read(homeHealthRepositoryProvider);

  Future<void> _init() async {
    _dantaiState.maybeWhen(
      loaded: () {
        _fetch();
      },
      // ignore: no-empty-block
      orElse: () {},
    );
  }

  Future<void> _fetch() async {
    final response = await _repository.fetch(dantai:_dantai);
    if (mounted) {
      state = response;
    }
  }
}
