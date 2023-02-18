import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/app/widget/cache/cache_provider.dart';
import 'package:shusekibo/app/widget/dantai/dantai_provider.dart';
import 'package:shusekibo/app/widget/dashboard/home_health_repository.dart';
import 'package:shusekibo/app/widget/filter/filter_model.dart';
import 'package:shusekibo/app/widget/filter/filter_provider.dart';
import 'package:shusekibo/app/widget/health/health_meibo_model.dart';
import 'package:shusekibo/app/widget/health/health_meibo_repository.dart';
import 'package:shusekibo/app/widget/health/health_meibo_state.dart';
import 'package:shusekibo/app/widget/health/health_reason_model.dart';
import 'package:shusekibo/app/widget/health/health_stamp_model.dart';
import 'package:shusekibo/app/widget/health/health_status_model.dart';

final healthMeiboInitProvider =
    StateNotifierProvider<HealthMeiboInitProvider, HealthMeiboState>((ref) {
  final filter = ref.watch(filterProvider);

  return HealthMeiboInitProvider(ref, filter);
});

final healthMeiboProvider =
    StateProvider<HealthMeiboModel>((ref) => const HealthMeiboModel());
final healthShiftProvider = StateProvider<bool>((ref) => false);

class HealthMeiboInitProvider extends StateNotifier<HealthMeiboState> {
  HealthMeiboInitProvider(this._ref, this._filter)
      : super(const HealthMeiboState.loading()) {
    _init();
  }

  final Ref _ref;
  final FilterModel _filter;

  late final HealthMeiboRepository _repository =
      _ref.read(healthMeiboRepositoryProvider);
  late final HomeHealthRepository _homeRepository =
      _ref.read(homeHealthRepositoryProvider);

  Future<void> _init() async {
    if (_filter.classId != null) {
      await _fetch();
    }else if(_filter.classId == null){
      state = const HealthMeiboState.blank();
    }
  }

  Future<void> _fetch() async {
    final response = await _repository.fetch(_filter);
    if (mounted) {
      state = response;
    }
  }

  Future<void> save() async {
    final dantai = _ref.read(dantaiProvider);
    await _homeRepository.fetch(dantai);

    final response2 = await _repository.save();

    if (mounted) {
      state = response2;
    }
  }

  // set stamp by Id
  void updateById(HealthMeiboModel meibo, HealthStampModel stamp,
      HealthReasonModel reason1, HealthReasonModel reason2,) {
    
    if (stamp.jokyoCd == '001') return;

    // set all.
    if (stamp.bunrui == '50') {
      final meibos = _ref.read(healthMeibosCache).values.toList();
      for (final m in meibos) {
        updateBox(m, stamp, reason1, reason2);
      }

      return;
    }

    //clear all and set one
    if (meibo.jokyoList![0].jokyoCode!.startsWith('5')) {

      final meibos = _ref.read(healthMeibosCache).values.toList();
      const s =
          HealthStampModel(jokyoCd: '999', jokyoNmRyaku: ' ', jokyoKey: ' ');

      for (final m in meibos) {
        if (m.studentKihonId == meibo.studentKihonId) {
          updateBox(meibo, stamp, reason1, reason2);
        } else {
          updateBox(m, s, const HealthReasonModel(), const HealthReasonModel());
        }
      }

      return;
    }

    // set one
    updateBox(meibo, stamp, reason1, reason2);
  }

  // cover blank values
  void updateByBlank() {
    final meibos = _ref.read(healthMeibosCache).values.toList();

    if (meibos.isEmpty) return;

    final stamp = _ref.read(healthRegistStampCache)['100'];

    for (final m in meibos) {
      if (m.jokyoList![0].jokyoCode!.isEmpty) {
        updateBox(m, stamp!, const HealthReasonModel(jiyuNmSeishiki: '健康'),
            const HealthReasonModel(),);
      }
    }
  }

  void updateBox(
    HealthMeiboModel meibo,
    HealthStampModel stamp,
    HealthReasonModel reason1,
    HealthReasonModel reason2,
  ) {

    final status = stamp.jokyoCd == '999'
        ? HealthStatusModel(
            kokyoDate: DateTime.now(),
            jokyoCode: '',
            ryaku: '',
            jiyu1Code: '',
            jiyu1: '',
            jiyu2: '',
            isEditable: true,)
        : HealthStatusModel(
            kokyoDate: DateTime.now(),
            jokyoCode: stamp.jokyoCd,
            ryaku: stamp.jokyoNmRyaku,
            jiyu1Code: reason1.jiyuCd,
            jiyu1: reason1.jiyuNmSeishiki ?? '',
            jiyu2: reason2.jiyuNmSeishiki ?? '',
            isEditable: true,);

    final newMeibo = HealthMeiboModel(
        studentKihonId: meibo.studentKihonId,
        studentSeq: meibo.studentSeq,
        gakunen: meibo.gakunen,
        className: meibo.className,
        studentNumber: meibo.studentNumber,
        photoImageFlg: meibo.photoImageFlg,
        name: meibo.name,
        genderCode: meibo.genderCode,
        photoUrl: meibo.photoUrl,
        jokyoList: [status],);
    
    final meibos = _ref.read(healthMeibosCache);
    meibos['${newMeibo.studentKihonId}'] = newMeibo;
    _ref.read(healthMeibosCache.notifier).state = meibos;
  }

}
