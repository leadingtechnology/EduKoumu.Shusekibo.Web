import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/app/feature/auth/provider/auth_provider.dart';
import 'package:shusekibo/app/provider/app_start_provider.dart';
import 'package:shusekibo/app/state/app_start_state.dart';
import 'package:shusekibo/app/widget/awareness/awareness_bunrui_model.dart';
import 'package:shusekibo/app/widget/awareness/awareness_bunrui_repository.dart';
import 'package:shusekibo/app/widget/cache/cache_provider.dart';
import 'package:shusekibo/app/widget/common/app_state.dart';

final awarenessBunruiInitProvider =
    StateNotifierProvider<AwarenessBunruiNotifier, AppState>((ref) {
  final appStartState = ref.watch(appStartProvider);

  return AwarenessBunruiNotifier(ref, appStartState);
});

final bunruiProvider =
    StateProvider<AwarenessBunruiModel>((ref) => const AwarenessBunruiModel());

class AwarenessBunruiNotifier extends StateNotifier<AppState> {
  AwarenessBunruiNotifier(this._ref, this._appStartState)
      : super(const AppState.loading()) {
    _init();
  }

  final Ref _ref;
  final AppStartState _appStartState;

  late final AwarenessBunruiRepository _repository =
      _ref.read(awarenessBunruiRepositoryProvider);

  Future<void> _init() async {
    final token = _ref.read(tokenProvider);
    _appStartState.maybeWhen(
      authenticated: (menuId) {
        final map = _ref.read(bunruiCache);
        if (map.isEmpty) {
          _fetch();
        } else if (!map.containsKey('${token.LoginId}')) {
          _fetch();
        } else {
          state = const AppState.loaded();
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
