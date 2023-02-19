import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/app/widget/dantai/dantai_model.dart';
import 'package:shusekibo/app/widget/dantai/dantai_provider.dart';
import 'package:shusekibo/app/widget/dantai/dantai_state.dart';
import 'package:shusekibo/app/widget/dashboard/home_attendance_model.dart';
import 'package:shusekibo/app/widget/dashboard/home_attendance_repository.dart';
import 'package:shusekibo/app/widget/dashboard/home_attendance_state.dart';

final homeAttendanceListProvider =
    StateNotifierProvider<HomeAttendanceListProvider, HomeAttendanceState>(
        (ref) {

  final dantai = ref.watch(dantaiProvider);
  final dantaiState = ref.watch(dantaiInitProvider);

  return HomeAttendanceListProvider(ref, dantaiState, dantai);
});

final homeAttendanceProvider =
    StateProvider<HomeAttendanceModel>((ref) => const HomeAttendanceModel());

class HomeAttendanceListProvider extends StateNotifier<HomeAttendanceState> {
  HomeAttendanceListProvider(this._ref, this._dantaiState,this._dantai)
      : super(const HomeAttendanceState.loading()) {
    _init();
  }

  final Ref _ref;
  final DantaiState _dantaiState;
  final DantaiModel _dantai;

  late final HomeAttendanceRepository _repository =
      _ref.read(homeAttendanceRepositoryProvider);

  Future<void> _init() async {
    _dantaiState.maybeWhen(
      loaded: () {
        _fetch();
      },
      // ignore: no-empty-block
      orElse: () {},
    );
  }

  Future<void> _fetch() async {
    final response = await _repository.fetch(dantai: _dantai);
    if (mounted) {
      state = response;
    }
  }
}
