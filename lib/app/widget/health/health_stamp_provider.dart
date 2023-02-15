import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/app/provider/app_start_provider.dart';
import 'package:shusekibo/app/state/app_start_state.dart';
import 'package:shusekibo/app/widget/cache/cache_provider.dart';
import 'package:shusekibo/app/widget/health/health_stamp_model.dart';
import 'package:shusekibo/app/widget/health/health_stamp_repository.dart';
import 'package:shusekibo/app/widget/health/health_stamp_state.dart';

final healthStampProvider =
    StateProvider<HealthStampModel>((ref) => const HealthStampModel());
final healthUnregistShowProvider = StateProvider<bool>((ref) => false);

final healthStampInitProvider =
    StateNotifierProvider<HealthStampInitNotifier, HealthStampState>((ref) {
      final appStartState = ref.watch(appStartProvider);

      return HealthStampInitNotifier(ref, appStartState);
});

class HealthStampInitNotifier extends StateNotifier<HealthStampState> {
  HealthStampInitNotifier(this._ref, this._appStartState)
      : super(const HealthStampState.loading()) {
    _init();
  }

  final Ref _ref;
  final AppStartState _appStartState;

  late final HealthStampRepository _repository =
      _ref.read(healthStampRepositoryProvider);

  Future<void> _init() async {
    _appStartState.maybeWhen(
      authenticated: (menuId) {
        final stampMap = _ref.read(healthRegistStampCache);
        if (stampMap.isEmpty) {
          _fetch();
        } else {
          state = const HealthStampState.loaded();
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
