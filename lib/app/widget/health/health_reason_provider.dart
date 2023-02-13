import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/app/widget/cache/cache_provider.dart';
import 'package:shusekibo/app/widget/health/health_reason_model.dart';
import 'package:shusekibo/app/widget/health/health_reason_repository.dart';
import 'package:shusekibo/app/widget/health/health_reason_state.dart';
import 'package:shusekibo/app/widget/health/health_stamp_model.dart';
import 'package:shusekibo/app/widget/health/health_stamp_provider.dart';

final healthReasonInitProvider =
    StateNotifierProvider<HealthReasonInitNotifier, HealthReasonState>((ref) {
  final stamp = ref.watch(healthStampProvider);

  return HealthReasonInitNotifier(ref, stamp);
});

final healthReason1Provider =
    StateProvider<HealthReasonModel>((ref) => const HealthReasonModel());
final healthReason2Provider =
    StateProvider<HealthReasonModel>((ref) => const HealthReasonModel());    

class HealthReasonInitNotifier extends StateNotifier<HealthReasonState> {
  HealthReasonInitNotifier(this._ref, this._stamp)
      : super(const HealthReasonState.loading()) {
    _init();
  }

  final Ref _ref;
  final HealthStampModel _stamp;

  late final HealthReasonRepository _repository =
      _ref.read(healthReasonRepositoryProvider);

  Future<void> _init() async {
    if (_stamp.jokyoCd == null) return;

    final reason1Map = _ref.read(healthReason1Cache);

    if (reason1Map.isEmpty){
      await _fetch();
    }else if (reason1Map.containsKey('${_stamp.jokyoCd}')){
      state = const HealthReasonState.loaded();
    }else{
      await _fetch();
    }
  }

  Future<void> _fetch() async {
    final response = await _repository.fetch(_stamp);
    if (mounted) {
      state = response;
    }
  }
}
