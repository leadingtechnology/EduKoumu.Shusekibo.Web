import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/app/widget/attendance/timed_model.dart';
import 'package:shusekibo/app/widget/attendance/timed_repository.dart';
import 'package:shusekibo/app/widget/attendance/timed_state.dart';
import 'package:shusekibo/app/widget/cache/cache_provider.dart';
import 'package:shusekibo/app/widget/filter/filter_provider.dart';
import 'package:shusekibo/app/widget/shozoku/shozoku_model.dart';
import 'package:shusekibo/app/widget/shozoku/shozoku_provider.dart';
import 'package:shusekibo/app/widget/shozoku/shozoku_state.dart';

final timedInitProvider =
    StateNotifierProvider<TimedInitProvider, TimedState>((ref) {
      
  final shozokuState = ref.watch(shozokuInitProvider);
  final shozoku = ref.watch(shozokuProvider);
  final dt = ref.watch(attendanceTimedFilterDateProvider);

  return TimedInitProvider(ref, shozokuState, shozoku, dt);
});

final timedProvider = StateProvider<TimedModel>((ref) => const TimedModel());

class TimedInitProvider extends StateNotifier<TimedState> {
  TimedInitProvider(this._ref, this._shozokuState, this._shozoku, this._dt)
      : super(const TimedState.loading()) {
    _init();
  }

  final Ref _ref;
  final ShozokuState _shozokuState;
  final ShozokuModel _shozoku;
  final DateTime _dt;

  late final TimedRepository _repository = _ref.read(timedRepositoryProvider);

  Future<void> _init() async {

    _shozokuState.maybeWhen(
      loaded: () {
        if (!_ref.read(timedCache).containsKey('${_shozoku.id}')) {
          _fetch();
        }
      },
      orElse: () {},
    );
  }

  Future<void> _fetch() async {
    final response = await _repository.fetch(_shozoku, _dt);
    if (mounted) {
      state = response;
    }
  }
}
