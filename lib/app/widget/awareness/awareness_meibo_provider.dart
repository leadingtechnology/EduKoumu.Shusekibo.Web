import 'package:flutter_riverpod/flutter_riverpod.dart';
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
final awarenessBunruiProvider = StateProvider<int>((ref) => 10);
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
    final maibosMap = _ref.read(awarenessMeibosCache);

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
        selectFlag: !(meibo.selectFlag ?? false),
      );

      maibosMap['${meibo.studentId}'] = meibo;
    }

    _ref.read(awarenessMeibosCache.notifier).state = maibosMap;
    _ref.read(awarenessCountProvider.notifier).state = maibosMap.values
        .toList()
        .where((e) => e.selectFlag ?? false)
        .toList()
        .length;
  }

  Future<void> updateById(int studentId) async {
    final maibosMap = _ref.read(awarenessMeibosCache);
    var meibo = maibosMap['$studentId'];

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
      selectFlag: !(meibo.selectFlag ?? false),
    );

    _ref.read(awarenessMeibosCache.notifier).state['$studentId'] = meibo;

    _ref.read(awarenessCountProvider.notifier).state = maibosMap.values
        .toList()
        .where((e) => e.selectFlag ?? false)
        .toList()
        .length;
  }

  // set stamp by Id
  Future<void> updateByMeibo(AwarenessMeiboModel meibo) async {
    final maibosMap = _ref.read(awarenessMeibosCache);

    final m = AwarenessMeiboModel(
      gakunen: meibo.gakunen,
      shozokuId: meibo.shozokuId,
      className: meibo.className,
      shussekiNo: meibo.shussekiNo,
      studentId: meibo.studentId,
      studentName: meibo.studentName,
      photoUrl: meibo.photoUrl,
      genderCode: meibo.genderCode,
      kizukiCount: meibo.kizukiCount,
      selectFlag: !(meibo.selectFlag ?? false),
    );

    _ref.read(awarenessMeibosCache.notifier).state['${m.studentId}'] = m;

    _ref.read(awarenessCountProvider.notifier).state = maibosMap.values
        .toList()
        .where((e) => e.selectFlag ?? false)
        .toList()
        .length;
  }

  Future<void> save(String str, AwarenessOperationItem opt) async {
    final juyo = _ref.read(awarenessJuyoProvider);
    final burui = _ref.read(awarenessBunruiProvider);

    String students;
    int shozokuId;
    if (opt == AwarenessOperationItem.add) {
      final meiboMap = _ref.read(awarenessMeibosCache);
      final studentList =
          meiboMap.values.toList().where((e) => e.selectFlag ?? false).toList();

      shozokuId = studentList.first.shozokuId ?? 0;
      students = studentList.map((e) => e.studentId).toList().toString();
    } else {
      final kizukiMap = _ref.read(awarenessKizukiCache);
      final studentList = kizukiMap.values.toList();

      shozokuId = studentList.first.shozokuId ?? 0;
      students = _ref.read(awarenessStudentAddProvider).toString();
    }

    final json = '''
{
    "ShozokuId": $shozokuId,
    "studentKihonIdList": $students,
    "kizuki": "$str",
    "juyoFlg": $juyo,
    "karuteBunruiCode": "$burui"
}
   ''';

    //final response = await _api.post2('api/shozoku/${filter.classId}/KenkouKansatsubo?date=${strDate}', json);

    final response = await _repository.save(json);
    final res = await _rep.fetch();
    if (opt != AwarenessOperationItem.add) {
      final resp = await _repository.fetch(_filter);
    }

    if (mounted) {
      state = response;
    }
  }
}
