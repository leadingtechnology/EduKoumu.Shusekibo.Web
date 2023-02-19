import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/app/widget/attendance/attendance_meibo_state.dart';
import 'package:shusekibo/app/widget/attendance/attendance_reason_model.dart';
import 'package:shusekibo/app/widget/attendance/attendance_stamp_model.dart';
import 'package:shusekibo/app/widget/attendance/attendance_timed_meibo_model.dart';
import 'package:shusekibo/app/widget/attendance/attendance_timed_meibo_repository.dart';
import 'package:shusekibo/app/widget/attendance/attendance_timed_status_model.dart';
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
      setState();

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
          updateCache(
            m,
            s,
            const AttendanceReasonModel(),
            const AttendanceReasonModel(),
          );
        }
      }
      setState();

      return;
    }

    // set one
    updateCache(meibo, stamp, reason1, reason2);
    setState();
  }

  // cover blank values
  void updateByBlank() {
    final meibos = _ref.read(attendanceTimedMeibosCache).values.toList();
    final filter = _ref.read(filterProvider);

    if (meibos.isEmpty) return;

    final stamp = _ref.read(attendanceRegistStampCache)['100'];

    for (final m in meibos) {
      final jokyos = m.jokyoList!
          .where((e) =>
              e.jigenIdx == filter.jigenIdx && e.shukketsuBunrui!.isNotEmpty,)
          .toList();
      
      if (jokyos.isNotEmpty) continue;

      updateCache(
        m,
        stamp!,
        const AttendanceReasonModel(),
        const AttendanceReasonModel(),
      );
    }

    setState();
  }

  void updateCache(
    AttendanceTimedMeiboModel meibo,
    AttendanceStampModel stamp,
    AttendanceReasonModel reason1,
    AttendanceReasonModel reason2,
  ) {
    final filter = _ref.read(filterProvider);
    
    final status = stamp.shukketsuJokyoCd == '999'
        ? AttendanceTimedStatusModel(
            jigenIdx: filter.jigenIdx,
            shukketsuBunrui: '',
            shukketsuKbn: '',
            ryaku: '',
            jiyu1: '',
            jiyu2: '',
          )
        : AttendanceTimedStatusModel(
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

  void setState() {
    final m = _ref.read(attendanceTimedMeibosCache);
    _ref.read(attendanceTimedMeibosCache.notifier).state = {};
    _ref.read(attendanceTimedMeibosCache.notifier).state = m;

    print('------ attendance timed cache : ${m.toString()}');

  }

  void updateBox(
    AttendanceTimedMeiboModel meibo,
    AttendanceStampModel stamp,
    AttendanceReasonModel reason1,
    AttendanceReasonModel reason2, 
  ) async {

    final filter = _ref.read(filterProvider);

    final status = stamp.shukketsuJokyoCd == '999'
        ? AttendanceTimedStatusModel(
            jigenIdx: filter.jigenIdx,
            shukketsuBunrui: '',
            shukketsuKbn: '',
            ryaku: '',
            jiyu1: '',
            jiyu2: '',
          )
        : AttendanceTimedStatusModel(
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
