import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/app/provider/app_start_provider.dart';
import 'package:shusekibo/app/state/app_start_state.dart';
import 'package:shusekibo/widget/attendance/attendance_stamp_model.dart';
import 'package:shusekibo/widget/attendance/attendance_stamp_repository.dart';
import 'package:shusekibo/widget/common/app_state.dart';

final attendanceStampListProvider =
    StateNotifierProvider<AttendanceStampListProvider, AppState>(
        (ref) {
  final appStartState = ref.watch(appStartProvider);

  return AttendanceStampListProvider(ref, appStartState);
});

final attendanceStampProvider =
    StateProvider<AttendanceStampModel>((ref) => const AttendanceStampModel());

final attendanceRegistStampProvider =
    StateProvider<List<AttendanceStampModel>>((ref) => []);
final attendanceUnregistStampProvider =
    StateProvider<List<AttendanceStampModel>>((ref) => []);


class AttendanceStampListProvider extends StateNotifier<AppState> {
  AttendanceStampListProvider(this._ref, this._appStartState)
      : super(const AppState.loading()) {
    _init();
  }

  final Ref _ref;
  final AppStartState _appStartState;

  late final AttendanceStampRepository _repository =
      _ref.read(attendanceStampRepositoryProvider);

  Future<void> _init() async {
    await _fetchAttendanceStampList();
  }

  Future<void> _fetchAttendanceStampList() async {
    final response = await _repository.fetch();
    if (mounted) {
      state = response;
    }
  }
}
