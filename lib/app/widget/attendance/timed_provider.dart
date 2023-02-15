import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:shusekibo/app/widget/attendance/timed_model.dart';
import 'package:shusekibo/app/widget/attendance/timed_repository.dart';
import 'package:shusekibo/app/widget/attendance/timed_state.dart';
import 'package:shusekibo/app/widget/cache/cache_provider.dart';
import 'package:shusekibo/app/widget/filter/filter_provider.dart';
import 'package:shusekibo/app/widget/shozoku/shozoku_model.dart';
import 'package:shusekibo/app/widget/shozoku/shozoku_provider.dart';

final timedInitProvider =
    StateNotifierProvider<TimedInitProvider, TimedState>((ref) {
      final shozoku = ref.watch(shozokuProvider);
      final targetDate = ref.watch(attendanceTimedFilterDateProvider);

  return TimedInitProvider(ref, shozoku, targetDate);
});

final timedProvider = StateProvider<TimedModel>((ref) => const TimedModel());

class TimedInitProvider extends StateNotifier<TimedState> {
  TimedInitProvider(
    this._ref,
    this._shozoku,
    this._targetDate,
  ) : super(const TimedState.loading()) {
    _init();
  }

  final Ref _ref;
  final ShozokuModel _shozoku;
  final DateTime _targetDate;

  late final TimedRepository _repository = _ref.read(timedRepositoryProvider);

  Future<void> _init() async {
    if (_shozoku.id == null) return;

    final timedMap = _ref.read(timedCache);
    final strDate = DateFormat('yyyy-MM-dd').format(_targetDate);

    if (timedMap.isEmpty) {
      await _fetch();
    } else if (timedMap.containsKey('${_shozoku.id}-$strDate')) {
      state = const TimedState.loaded();
    } else {
      await _fetch();
    }
  }

  Future<void> _fetch() async {
    final response = await _repository.fetch(_shozoku);
    if (mounted) {
      state = response;
    }
  }
}
