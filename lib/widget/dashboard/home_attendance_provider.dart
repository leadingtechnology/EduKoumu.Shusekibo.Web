import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/widget/dantai/dantai_model.dart';
import 'package:shusekibo/widget/dantai/dantai_provider.dart';
import 'package:shusekibo/widget/dashboard/home_attendance_model.dart';
import 'package:shusekibo/widget/dashboard/home_attendance_repository.dart';
import 'package:shusekibo/widget/dashboard/home_attendance_state.dart';

final homeAttendanceListProvider =
    StateNotifierProvider<HomeAttendanceListProvider, HomeAttendanceState>(
        (ref) {
  final dantai = ref.watch(dantaiProvider);

  return HomeAttendanceListProvider(ref, dantai);
});

final homeAttendanceProvider =
    StateProvider<HomeAttendanceModel>((ref) => const HomeAttendanceModel());

class HomeAttendanceListProvider extends StateNotifier<HomeAttendanceState> {
  HomeAttendanceListProvider(this._ref, this._dantai)
      : super(const HomeAttendanceState.loading()) {
    _init();
  }

  final Ref _ref;
  final DantaiModel _dantai;

  late final HomeAttendanceRepository _repository =
      _ref.read(homeAttendanceRepositoryProvider);

  Future<void> _init() async {
    await _fetch();
  }

  Future<void> _fetch() async {
    final response = await _repository.fetch(_dantai);
    if (mounted) {
      state = response;
    }
  }
}
