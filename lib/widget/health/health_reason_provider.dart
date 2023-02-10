import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/widget/common/app_state.dart';
import 'package:shusekibo/widget/health/health_reason_model.dart';
import 'package:shusekibo/widget/health/health_reason_repository.dart';
import 'package:shusekibo/widget/health/health_stamp_model.dart';
import 'package:shusekibo/widget/health/health_stamp_provider.dart';

final healthReasonListProvider =
    StateNotifierProvider<HealthReasonListProvider, AppState>((ref) {
  final stamp = ref.watch(healthStampProvider);

  return HealthReasonListProvider(ref, stamp);
});

final healthReason1Provider =
    StateProvider<HealthReasonModel>((ref) => const HealthReasonModel());
final healthReason1ListProvider =
    StateProvider<List<HealthReasonModel>>((ref) => []);

final healthReason2Provider =
    StateProvider<HealthReasonModel>((ref) => const HealthReasonModel());    
final healthReason2ListProvider =
    StateProvider<List<HealthReasonModel>>((ref) => []);    

class HealthReasonListProvider extends StateNotifier<AppState> {
  HealthReasonListProvider(this._ref, this._stamp)
      : super(const AppState.loading()) {
    _init();
  }

  final Ref _ref;
  final HealthStampModel _stamp;

  late final HealthReasonRepository _repository =
      _ref.read(healthReasonRepositoryProvider);

  Future<void> _init() async {
    await _fetchHealthReasonList();
  }

  Future<void> _fetchHealthReasonList() async {
    final response = await _repository.fetch(_stamp);
    if (mounted) {
      state = response;
    }
  }
}
