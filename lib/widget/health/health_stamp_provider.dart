import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/app/provider/app_start_provider.dart';
import 'package:shusekibo/app/state/app_start_state.dart';
import 'package:shusekibo/widget/health/health_stamp_model.dart';
import 'package:shusekibo/widget/health/health_stamp_repository.dart';
import 'package:shusekibo/widget/health/health_stamp_state.dart';


final healthStampListProvider =
    StateNotifierProvider<HealthStampListProvider, HealthStampState>((ref) {
  final appStartState = ref.watch(appStartProvider);

  return HealthStampListProvider(ref, appStartState);
});

final healthStampProvider =
    StateProvider<HealthStampModel>((ref) => HealthStampModel());
final healthUnregistShowProvider = StateProvider<bool>((ref) => false);

class HealthStampListProvider extends StateNotifier<HealthStampState> {
  HealthStampListProvider(this._ref, this._appStartState)
      : super(const HealthStampState.loading()) {
    _init();
  }

  final Ref _ref;
  final AppStartState _appStartState;

  late final HealthStampRepository _repository =
      _ref.read(healthStampRepositoryProvider);

  Future<void> _init() async {
    await _fetchHealthStampList();
  }

  Future<void> _fetchHealthStampList() async {
    final response = await _repository.fetch();
    if (mounted) {
      state = response;
    }
  }
}
