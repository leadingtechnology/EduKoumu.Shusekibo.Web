import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/widget/attendance/attendance_reason_model.dart';
import 'package:shusekibo/widget/attendance/attendance_reason_repository.dart';
import 'package:shusekibo/widget/attendance/attendance_stamp_model.dart';
import 'package:shusekibo/widget/attendance/attendance_stamp_provider.dart';
import 'package:shusekibo/widget/common/app_state.dart';

final attendanceReasonListProvider =
    StateNotifierProvider<AttendanceReasonListProvider, AppState>(
        (ref) {
  final stamp = ref.watch(attendanceStampProvider);

  return AttendanceReasonListProvider(ref, stamp);
});


final attendanceReason1Provider =
    StateProvider<AttendanceReasonModel>((ref) => const AttendanceReasonModel());
final attendanceReason1ListProvider =
    StateProvider<List<AttendanceReasonModel>>((ref) => []);    

final attendanceReason2Provider = StateProvider<AttendanceReasonModel>(
    (ref) => const AttendanceReasonModel());
final attendanceReason2ListProvider =
    StateProvider<List<AttendanceReasonModel>>((ref) => []);    


class AttendanceReasonListProvider
    extends StateNotifier<AppState> {
  AttendanceReasonListProvider(this._ref, this._stamp)
      : super(const AppState.loading()) {
    _init();
  }

  final Ref _ref;
  final AttendanceStampModel _stamp;

  late final AttendanceReasonRepository _repository =
      _ref.read(attendanceReasonRepositoryProvider);

  Future<void> _init() async {
    if (_stamp.shukketsuJokyoCd == null){
      state = const AppState.loading();
    }else{
      await _fetchAttendanceReasonList();
    }
  }

  Future<void> _fetchAttendanceReasonList() async {
    final response = await _repository.fetch(_stamp);
    if (mounted) {
      state = response;
    }
  }
}
