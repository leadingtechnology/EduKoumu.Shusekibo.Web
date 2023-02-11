import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/app/provider/app_start_provider.dart';
import 'package:shusekibo/app/state/app_start_state.dart';
import 'package:shusekibo/widget/attendance/attendance_stamp_model.dart';
import 'package:shusekibo/widget/attendance/attendance_stamp_repository.dart';
import 'package:shusekibo/widget/attendance/attendance_stamp_state.dart';

final attendanceStampListProvider =
    StateNotifierProvider<AttendanceStampListProvider, AttendanceStampState>(
        (ref) {
  
  final appStartState = ref.watch(appStartProvider);

  return AttendanceStampListProvider(ref, appStartState);
});

final attendanceStampProvider =
    StateProvider<AttendanceStampModel>((ref) => const AttendanceStampModel());

class AttendanceStampListProvider extends StateNotifier<AttendanceStampState> {
  AttendanceStampListProvider(this._ref, this._appStartState)
      : super(const AttendanceStampState.loading()) {
    _init();
  }

  final Ref _ref;
  final AppStartState _appStartState;

  late final AttendanceStampRepository _repository =
      _ref.read(attendanceStampRepositoryProvider);

  Future<void> _init() async {
    _appStartState.maybeWhen(
        authenticated: (menuId) {
          _fetch();
        },
        orElse: () {},);
  }

  Future<void> _fetch() async {
    final response = await _repository.fetch();
    if (mounted) {
      state = response;
    }
  }
}
