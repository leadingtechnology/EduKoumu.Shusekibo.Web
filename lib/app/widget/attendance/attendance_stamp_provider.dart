import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/app/provider/app_start_provider.dart';
import 'package:shusekibo/app/state/app_start_state.dart';
import 'package:shusekibo/app/widget/attendance/attendance_stamp_model.dart';
import 'package:shusekibo/app/widget/attendance/attendance_stamp_repository.dart';
import 'package:shusekibo/app/widget/attendance/attendance_stamp_state.dart';
import 'package:shusekibo/app/widget/cache/cache_provider.dart';

final attendanceStampProvider = StateProvider<AttendanceStampModel>((ref) => const AttendanceStampModel());
final attendanceUnregistShowProvider = StateProvider<bool>((ref) => false);

final attendanceStampInitProvider =
    StateNotifierProvider<AttendanceStampNotifier, AttendanceStampState>(
        (ref) {
  final appStartState = ref.watch(appStartProvider);

  return AttendanceStampNotifier(ref, appStartState);
});

class AttendanceStampNotifier extends StateNotifier<AttendanceStampState> {
  AttendanceStampNotifier(this._ref, this._appStartState)
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
        final stampMap = _ref.read(attendanceRegistStampCache);
        if (stampMap.isEmpty) {
          _fetch();
        } else {
          state = const AttendanceStampState.loaded();
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
