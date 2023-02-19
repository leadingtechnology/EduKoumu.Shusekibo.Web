import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/app/widget/attendance/attendance_meibo_model.dart';
import 'package:shusekibo/app/widget/attendance/attendance_meibo_repository.dart';
import 'package:shusekibo/app/widget/attendance/attendance_meibo_state.dart';
import 'package:shusekibo/app/widget/attendance/attendance_reason_model.dart';
import 'package:shusekibo/app/widget/attendance/attendance_stamp_model.dart';
import 'package:shusekibo/app/widget/attendance/attendance_status_model.dart';
import 'package:shusekibo/app/widget/cache/cache_provider.dart';
import 'package:shusekibo/app/widget/dantai/dantai_provider.dart';
import 'package:shusekibo/app/widget/dashboard/home_attendance_repository.dart';
import 'package:shusekibo/app/widget/filter/filter_model.dart';
import 'package:shusekibo/app/widget/filter/filter_provider.dart';

final attendanceMeiboInitProvider =
    StateNotifierProvider<AttendanceMeiboNotifier, AttendanceMeiboState>(
        (ref) {
  final filter = ref.watch(filterProvider);

  return AttendanceMeiboNotifier(ref, filter);
});

final attendanceMeiboProvider =
    StateProvider<AttendanceMeiboModel>((ref) => const AttendanceMeiboModel());
final attendanceShiftProvider = StateProvider<bool>((ref) => false);
final attendanceCountProvider = StateProvider<int>((ref) => 0);

class AttendanceMeiboNotifier extends StateNotifier<AttendanceMeiboState> {
  AttendanceMeiboNotifier(this._ref, this._filter)
      : super(const AttendanceMeiboState.loading()) {
    _init();
  }

  final Ref _ref;
  final FilterModel _filter;

  late final AttendanceMeiboRepository _repository =
      _ref.read(attendanceMeiboRepositoryProvider);
  late final HomeAttendanceRepository _homeRepository =
      _ref.read(homeAttendanceRepositoryProvider);

  Future<void> _init() async {
    if (_filter.classId != null) {
      await _fetch();
    } else if (_filter.classId == null) {
      state = const AttendanceMeiboState.blank();
    }
  }

  Future<void> _fetch() async {
    final response = await _repository.fetch(_filter);
    if (mounted) {
      state = response;
    }
  }

  Future<void> save() async {
    await _repository.save();
    await _homeRepository.fetch(_ref.read(dantaiProvider));
  }

  // set stamp by Id
  void updateById(
      AttendanceMeiboModel meibo,
      AttendanceStampModel stamp,
      AttendanceReasonModel reason1,
      AttendanceReasonModel reason2,) async {

    if (stamp.shukketsuJokyoCd == '001') return;

    // set all.
    if (stamp.shukketsuBunrui == '50' || stamp.shukketsuBunrui == '60') {
      final meibos = _ref.read(attendanceMeibosCache).values.toList();

      for (final m in meibos) {
        updateBox(m, stamp, reason1, reason2);
      }

      return;
    }

    //clear all and set one
    if (meibo.jokyoList![0].shukketsuBunrui == '50' || 
        meibo.jokyoList![0].shukketsuBunrui == '60') 
    {
      final meibos = _ref.read(attendanceMeibosCache).values.toList();
      
      const s = AttendanceStampModel(
        shukketsuJokyoCd: '999',
        shukketsuBunrui: '',
        shukketsuKbn: '',
      );

      for (final m in meibos) {
        if (m.studentKihonId == meibo.studentKihonId) {
          updateBox(meibo, stamp, reason1, reason2);
        } else {
          updateBox(m, s, const AttendanceReasonModel(),
              const AttendanceReasonModel(),);
        }
      }

      return;
    }

    // set one
    updateBox(meibo, stamp, reason1, reason2);
  }

  // cover blank values
  Future<void> updateByBlank() async {
    final meibos = _ref.read(attendanceMeibosCache).values.toList();
    
    if (meibos.isEmpty) return;

    final stamp = _ref.read(attendanceRegistStampCache)['100'];
    for (final m in meibos) {
      if (m.jokyoList![0].shukketsuBunrui!.isEmpty) {
        updateBox(m, stamp!, const AttendanceReasonModel(),
            const AttendanceReasonModel(),);
      }
    }
  }

  void updateBox(
    AttendanceMeiboModel meibo,
    AttendanceStampModel stamp,
    AttendanceReasonModel reason1,
    AttendanceReasonModel reason2,
  ) {
    final status = stamp.shukketsuJokyoCd == '999'
        ? const AttendanceStatusModel(
            shukketsuBunrui: '',
            shukketsuKbn: '',
            ryaku: '',
            jiyu1: '',
            jiyu2: '',
          )
        : AttendanceStatusModel(
            shukketsuBunrui: stamp.shukketsuBunrui,
            shukketsuKbn: stamp.shukketsuKbn,
            ryaku: stamp.shukketsuJokyoNmRyaku,
            jiyu1: reason1.shukketsuJiyuNmSeishiki ?? '',
            jiyu2: reason2.shukketsuJiyuNmSeishiki ?? '',
          );
    final newMeibo = AttendanceMeiboModel(
      studentKihonId: meibo.studentKihonId,
      studentSeq: meibo.studentSeq,
      gakunen: meibo.gakunen,
      className: meibo.className,
      studentNumber: meibo.studentNumber,
      photoImageFlg: meibo.photoImageFlg,
      name: meibo.name,
      genderCode: meibo.genderCode,
      photoUrl: meibo.photoUrl,
      jokyoList: [status],
    );
    
    _ref
        .read(attendanceMeibosCache.notifier)
        .state['${newMeibo.studentKihonId}'] = newMeibo;

  }

  Future<void> getPhoto() async {
    await _repository.save();
    await _homeRepository.fetch(_ref.read(dantaiProvider));
  }

}
