import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/app/widget/attendance/attendance_meibo_state.dart';
import 'package:shusekibo/app/widget/attendance/attendance_reason_model.dart';
import 'package:shusekibo/app/widget/attendance/attendance_stamp_model.dart';
import 'package:shusekibo/app/widget/attendance/attendance_status_model.dart';
import 'package:shusekibo/app/widget/attendance/attendance_timed_meibo_model.dart';
import 'package:shusekibo/app/widget/attendance/attendance_timed_meibo_repository.dart';
import 'package:shusekibo/app/widget/cache/cache_provider.dart';
import 'package:shusekibo/app/widget/filter/filter_model.dart';
import 'package:shusekibo/app/widget/filter/filter_provider.dart';

final attendanceTimedMeiboInitProvider = StateNotifierProvider<
    AttendanceTimedMeiboInitNotifier, AttendanceMeiboState>((ref) {
  final filter = ref.watch(filterProvider);

  return AttendanceTimedMeiboInitNotifier(ref, filter);
});

final attendanceTimedMeiboProvider = StateProvider<AttendanceTimedMeiboModel>(
    (ref) => const AttendanceTimedMeiboModel(),);

class AttendanceTimedMeiboInitNotifier
    extends StateNotifier<AttendanceMeiboState> {

  AttendanceTimedMeiboInitNotifier(this._ref, this._filter,)
      : super(const AttendanceMeiboState.loading()) {
    _init();
  }

  final Ref _ref;
  final FilterModel _filter;


  late final AttendanceTimedMeiboRepository _repository =
      _ref.read(attendanceTimedMeiboRepositoryProvider);

  Future<void> _init() async { 
    print('attendance search filter: $_filter');
    
    if (_filter.classId != null && _filter.jigenIdx != null) {
      await _fetch();
    } else if (_filter.classId == null || _filter.jigenIdx == null) {
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
    state = await _repository.save();
  }

  // set stamp by Id
  void updateById(
      AttendanceTimedMeiboModel meibo,
      AttendanceStampModel stamp,
      AttendanceReasonModel reason1,
      AttendanceReasonModel reason2,) {
    if (stamp.shukketsuJokyoCd == '001') return;

    // set all.
    if (stamp.shukketsuBunrui == '50' || stamp.shukketsuBunrui == '60') {
      final meibos = _ref.read(attendanceTimedMeibosCache).values.toList();
      for (final m in meibos) {
        updateCache(m, stamp, reason1, reason2);
      }

      return;
    }

    //clear all and set one
    if (meibo.jokyoList![0].shukketsuBunrui == '50' ||
        meibo.jokyoList![0].shukketsuBunrui == '60') {
      final meibos =
          _ref.read(attendanceTimedMeibosCache).values.toList();
      const s = AttendanceStampModel(
          shukketsuJokyoCd: '999', shukketsuBunrui: '', shukketsuKbn: '',);

      for (final m in meibos) {
        if (m.studentKihonId == meibo.studentKihonId) {
          updateCache(meibo, stamp, reason1, reason2);
        } else {
          updateCache(m, s, const AttendanceReasonModel(),
              const AttendanceReasonModel());
        }
      }

      return;
    }

    // set one
    updateCache(meibo, stamp, reason1, reason2);
  }

  // cover blank values
  void updateByBlank() {
    final meibos = _ref.read(attendanceTimedMeibosCache).values.toList();

    if (meibos.isEmpty) return;

    final stamp = _ref.read(attendanceRegistStampCache)['100'];

    for (final m in meibos) {
      if (m.jokyoList![0].shukketsuBunrui!.isEmpty) {
        updateCache(m, stamp!, const AttendanceReasonModel(),
            const AttendanceReasonModel(),);
      }
    }
  }

  void updateCache(
    AttendanceTimedMeiboModel meibo,
    AttendanceStampModel stamp,
    AttendanceReasonModel reason1,
    AttendanceReasonModel reason2,
  ) {
    final filter = _ref.read(filterProvider);
    
    final status = stamp.shukketsuJokyoCd == '999'
        ? AttendanceStatusModel(
            jigenIdx: filter.jigenIdx,
            shukketsuBunrui: '',
            shukketsuKbn: '',
            ryaku: '',
            jiyu1: '',
            jiyu2: '',
          )
        : AttendanceStatusModel(
            jigenIdx: filter.jigenIdx,
            shukketsuBunrui: stamp.shukketsuBunrui,
            shukketsuKbn: stamp.shukketsuKbn,
            ryaku: stamp.shukketsuJokyoNmRyaku,
            jiyu1: reason1.shukketsuJiyuNmSeishiki ?? '',
            jiyu2: reason2.shukketsuJiyuNmSeishiki ?? '',
          );

    final newMeibo = AttendanceTimedMeiboModel(
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

    final meibos = _ref.read(attendanceTimedMeibosCache);
    meibos['${newMeibo.studentKihonId}'] = newMeibo;
    _ref.read(attendanceTimedMeibosCache.notifier).state = meibos;
  }

  void updateBox(
    AttendanceTimedMeiboModel meibo,
    AttendanceStampModel stamp,
    AttendanceReasonModel reason1,
    AttendanceReasonModel reason2, 
  ) async {

    final filter = _ref.read(filterProvider);

    final status = stamp.shukketsuJokyoCd == '999'
        ? AttendanceStatusModel(
            jigenIdx: filter.jigenIdx,
            shukketsuBunrui: '',
            shukketsuKbn: '',
            ryaku: '',
            jiyu1: '',
            jiyu2: '',
          )
        : AttendanceStatusModel(
            jigenIdx: filter.jigenIdx,
            shukketsuBunrui: stamp.shukketsuBunrui,
            shukketsuKbn: stamp.shukketsuKbn,
            ryaku: stamp.shukketsuJokyoNmRyaku,
            jiyu1: reason1.shukketsuJiyuNmSeishiki ?? '',
            jiyu2: reason2.shukketsuJiyuNmSeishiki ?? '',
          );

    final newMeibo = AttendanceTimedMeiboModel(
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
        .read(attendanceTimedMeibosCache.notifier)
        .state['${newMeibo.studentKihonId}'] = newMeibo;
  }

}
