import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/app/provider/app_start_provider.dart';
import 'package:shusekibo/app/state/app_start_state.dart';
import 'package:shusekibo/app/widget/attendance/attendance_meibo_state.dart';
import 'package:shusekibo/app/widget/attendance/attendance_timed_meibo_model.dart';
import 'package:shusekibo/app/widget/attendance/attendance_timed_meibo_repository.dart';

final attendanceTimedMeiboInitProvider = StateNotifierProvider<
    AttendanceTimedMeiboInitNotifier, AttendanceMeiboState>((ref) {
  final appStartState = ref.watch(appStartProvider);


  return AttendanceTimedMeiboInitNotifier(ref, appStartState);
});

final attendanceTimedMeiboProvider = StateProvider<AttendanceTimedMeiboModel>(
    (ref) => const AttendanceTimedMeiboModel(),);

class AttendanceTimedMeiboInitNotifier
    extends StateNotifier<AttendanceMeiboState> {

  AttendanceTimedMeiboInitNotifier(this._ref, this._appStartState)
      : super(const AttendanceMeiboState.loading()) {
    _init();
  }

  final Ref _ref;
  final AppStartState _appStartState;


  late final AttendanceTimedMeiboRepository _repository =
      _ref.read(attendanceTimedMeiboRepositoryProvider);

  Future<void> _init() async { 
      await _fetch();
   }

  Future<void> _fetch() async {
    final response = await _repository.fetch();
    if (mounted) {
      state = response;
    }
  }

  void updateByBlank(){
    
  }
}
