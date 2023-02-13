import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/app/feature/auth/provider/auth_provider.dart';
import 'package:shusekibo/app/provider/app_start_provider.dart';
import 'package:shusekibo/app/state/app_start_state.dart';
import 'package:shusekibo/app/widget/cache/cache_provider.dart';
import 'package:shusekibo/app/widget/dantai/dantai_model.dart';
import 'package:shusekibo/app/widget/dantai/dantai_repository.dart';
import 'package:shusekibo/app/widget/dantai/dantai_state.dart';

final dantaiInitProvider =
    StateNotifierProvider<DantaiListProvider, DantaiState>((ref) {
      final appStartState = ref.watch(appStartProvider);

      return DantaiListProvider(ref, appStartState);
});

final dantaiProvider = StateProvider<DantaiModel>((ref) => const DantaiModel());

class DantaiListProvider extends StateNotifier<DantaiState> {
  DantaiListProvider(this._ref, this._appStartState)
      : super(const DantaiState.loading()) {
    _init();
  }

  final Ref _ref;
  final AppStartState _appStartState;

  late final DantaiRepository _repository = _ref.read(dantaiRepositoryProvider);

  Future<void> _init() async {
    final token = _ref.read(tokenProvider);
    _appStartState.maybeWhen(
      authenticated: (menuId) {
        final dantaiMap = _ref.read(dantaiCache);
        if (dantaiMap.isEmpty) {
          _fetch();
        }else if(!dantaiMap.containsKey(token.LoginId)){
          _fetch();
        } else {
          state = const DantaiState.loaded();
        }
      },
      // ignore: no-empty-block
      orElse: () {},
    );
    
  }

  Future<void> _fetch() async {
    final response = await _repository.fetch();
    if (mounted) {
      state = response;
    }
  }
}
