import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/app/provider/app_start_provider.dart';
import 'package:shusekibo/app/state/app_start_state.dart';
import 'package:shusekibo/app/widget/attendance/attendance_meibo_model.dart';
import 'package:shusekibo/app/widget/attendance/attendance_meibo_repository.dart';
import 'package:shusekibo/app/widget/attendance/attendance_meibo_state.dart';

final attendanceMeiboListProvider = StateNotifierProvider<AttendanceMeiboListProvider, AttendanceMeiboState>((ref) {
  final appStartState = ref.watch(appStartProvider);


  return AttendanceMeiboListProvider(ref, appStartState);
});

final attendanceMeiboProvider = StateProvider<AttendanceMeiboModel>((ref) => AttendanceMeiboModel());

class AttendanceMeiboListProvider extends StateNotifier<AttendanceMeiboState> {
  AttendanceMeiboListProvider(this._ref, this._appStartState)
      : super(const AttendanceMeiboState.loading()) {
    _init();
  }

  final Ref _ref;
  final AppStartState _appStartState;

  late final AttendanceMeiboRepository _repository =
      _ref.read(attendanceMeiboRepositoryProvider);

  Future<void> _init() async {
    _fetch(); 
  }

  Future<void> _fetch() async {
    final response = await _repository.fetch();
    if (mounted) {
      state = response;
    }
  }
}
