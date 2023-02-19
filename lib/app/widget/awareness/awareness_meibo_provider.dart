import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/app/widget/awareness/awareness_kizuki_model.dart';
import 'package:shusekibo/app/widget/awareness/awareness_kizuki_provider.dart';
import 'package:shusekibo/app/widget/awareness/awareness_kizuki_repository.dart';
import 'package:shusekibo/app/widget/awareness/awareness_meibo_model.dart';
import 'package:shusekibo/app/widget/awareness/awareness_meibo_repository.dart';
import 'package:shusekibo/app/widget/awareness/awareness_meibo_state.dart';
import 'package:shusekibo/app/widget/awareness/awareness_operation_item.dart';
import 'package:shusekibo/app/widget/cache/cache_provider.dart';
import 'package:shusekibo/app/widget/filter/filter_model.dart';
import 'package:shusekibo/app/widget/filter/filter_provider.dart';

final awarenessMeiboInitProvider =
    StateNotifierProvider<AwarenessMeiboNotifier, AwarenessMeiboState>(
        (ref) {
  final filter = ref.watch(filterProvider);

  return AwarenessMeiboNotifier(ref, filter);
});

final awarenessMeiboProvider =
    StateProvider<AwarenessMeiboModel>((ref) => const AwarenessMeiboModel());
final awarenessTabProvider = StateProvider<int>((ref) => 0); // switch the tab.
final awarenessBunruiProvider = StateProvider<String>((ref) => '');
final awarenessJuyoProvider = StateProvider<bool>((ref) => false);
final awarenessStudentAddProvider = StateProvider<List<int>>((ref) => []);
final awarenessEditProvider = StateProvider<int>((ref) => 0);

final awarenessListJuyoProvider = StateProvider<bool>((ref) => false);
final awarenessListTextProvider = StateProvider<String>((ref) => '');
final awarenessListIdProvider = StateProvider<String>((ref) => '');

final awarenessTextProvider = StateProvider<String>((ref) => '');

class AwarenessMeiboNotifier extends StateNotifier<AwarenessMeiboState> {
  AwarenessMeiboNotifier(this._ref, this._filter)
      : super(const AwarenessMeiboState.loading()) {
    _init();
  }

  final Ref _ref;
  final FilterModel _filter;

  late final AwarenessMeiboRepository _repository =
      _ref.read(awarenessMeiboRepositoryProvider);
  late final AwarenessKizukiRepository _rep =
      _ref.read(awarenessKizukiRepositoryProvider);

  Future<void> _init() async {
    if (_filter.classId != null) {
      await _fetch();
    } else if (_filter.classId == null) {
      state = const AwarenessMeiboState.blank();
    }
  }

  Future<void> _fetch() async {
    final response = await _repository.fetch(_filter);
    if (mounted) {
      state = response;
    }
  }

  Future<void> updateByList(List<AwarenessMeiboModel> meibos) async {
    final _box = _ref.read(awarenessMeibosCache).values.toList();

    for (var meibo in meibos) {
      meibo = AwarenessMeiboModel(
          gakunen: meibo.gakunen,
          shozokuId: meibo.shozokuId,
          className: meibo.className,
          shussekiNo: meibo.shussekiNo,
          studentId: meibo.studentId,
          studentName: meibo.studentName,
          photoUrl: meibo.photoUrl,
          genderCode: meibo.genderCode,
          kizukiCount: meibo.kizukiCount,
          selectFlag: !(meibo.selectFlag ?? false),);

      _ref.read(awarenessMeibosCache.notifier).state['${meibo.studentId}'] =
          meibo;
    }
    _ref.read(awarenessCountProvider.notifier).state = _ref
        .read(awarenessMeibosCache)
        .values
        .toList()
        .where((e) => e.selectFlag ?? false)
        .toList()
        .length;
  }

  Future<void> updateById(int studentId) async {
    var meibo = _ref.read(awarenessMeibosCache)['$studentId'];
    meibo = AwarenessMeiboModel(
        gakunen: meibo!.gakunen,
        shozokuId: meibo.shozokuId,
        className: meibo.className,
        shussekiNo: meibo.shussekiNo,
        studentId: meibo.studentId,
        studentName: meibo.studentName,
        photoUrl: meibo.photoUrl,
        genderCode: meibo.genderCode,
        kizukiCount: meibo.kizukiCount,
        selectFlag: !(meibo.selectFlag ?? false));

    _ref.read(awarenessMeibosCache.notifier).state['$studentId'] = meibo;

    _ref.read(awarenessCountProvider.notifier).state = _ref
        .read(awarenessMeibosCache)
        .values
        .toList()
        .where((e) => e.selectFlag ?? false)
        .toList()
        .length;
  }

  // set stamp by Id
  Future<void> updateByMeibo(AwarenessMeiboModel meibo) async {
    
    final newMeibo = AwarenessMeiboModel(
        gakunen: meibo.gakunen,
        shozokuId: meibo.shozokuId,
        className: meibo.className,
        shussekiNo: meibo.shussekiNo,
        studentId: meibo.studentId,
        studentName: meibo.studentName,
        photoUrl: meibo.photoUrl,
        genderCode: meibo.genderCode,
        kizukiCount: meibo.kizukiCount,
        selectFlag: !(meibo.selectFlag ?? false),);

    _ref.read(awarenessMeibosCache.notifier).state['${newMeibo.studentId}'] =
        newMeibo;

    _ref.read(awarenessCountProvider.notifier).state = _ref
        .read(awarenessMeibosCache)
        .values
        .toList()
        .where((e) => e.selectFlag ?? false)
        .toList()
        .length;
  }

  Future<void> save(String str, AwarenessOperationItem opt) async {
    final juyo = _ref.read(awarenessJuyoProvider);
    final burui = _ref.read(awarenessBunruiProvider);
    final filter = _ref.read(filterProvider);

    String students;
    if (opt == AwarenessOperationItem.add) {
      final meibos = _ref.read(awarenessMeibosCache).values;
      
      students = meibos
          .map((e) {
            if (e.selectFlag ?? false) {
              return e.studentId;
            }
          })
          .toList()
          .toString();
    } else {
      students = _ref.read(awarenessStudentAddProvider).toString();
    }

    final json = '''
{
    "ShozokuId": ${filter.classId},
    "studentKihonIdList": $students,
    "kizuki": "$str",
    "juyoFlg": $juyo,
    "karuteBunruiCode": "$burui"
}
   ''';
    final response = await _repository.save(json);
    if (mounted) {
      state = response;
    }
  }
}
