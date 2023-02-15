import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/app/widget/attendance/attendance_reason_model.dart';
import 'package:shusekibo/app/widget/attendance/attendance_reason_repository.dart';
import 'package:shusekibo/app/widget/attendance/attendance_reason_state.dart';
import 'package:shusekibo/app/widget/attendance/attendance_stamp_model.dart';
import 'package:shusekibo/app/widget/attendance/attendance_stamp_provider.dart';
import 'package:shusekibo/app/widget/cache/cache_provider.dart';

final attendanceReasonInitProvider =
    StateNotifierProvider<AttendanceReasonNotifier, AttendanceReasonState>(
        (ref) {
  final stamp = ref.watch(attendanceStampProvider);

  return AttendanceReasonNotifier(ref, stamp);
});


final attendanceReason1Provider = StateProvider<AttendanceReasonModel>(
  (ref) => const AttendanceReasonModel(),
);
final attendanceReason2Provider = StateProvider<AttendanceReasonModel>(
  (ref) => const AttendanceReasonModel(),
);
final attendanceTimedReason1Provider = StateProvider<AttendanceReasonModel>(
  (ref) => const AttendanceReasonModel(),
);
final attendanceTimedReason2Provider = StateProvider<AttendanceReasonModel>(
  (ref) => const AttendanceReasonModel(),
);

class AttendanceReasonNotifier
    extends StateNotifier<AttendanceReasonState> {
  AttendanceReasonNotifier(this._ref, this._stamp)
      : super(const AttendanceReasonState.loading()) {
    _init();
  }

  final Ref _ref;
  final AttendanceStampModel _stamp;

  late final AttendanceReasonRepository _repository =
      _ref.read(attendanceReasonRepositoryProvider);

  Future<void> _init() async {
    if (_stamp.shukketsuJokyoCd == null) return;
    
    final reason1Map = _ref.read(attendanceReason1Cache);

    if (reason1Map.isEmpty) {
      await _fetch();
    } else if (reason1Map.containsKey('${_stamp.shukketsuJokyoCd}')) {
      state = const AttendanceReasonState.loaded();
    } else {
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
