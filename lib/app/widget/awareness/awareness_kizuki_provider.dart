import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/app/widget/awareness/awareness_kizuki_model.dart';
import 'package:shusekibo/app/widget/awareness/awareness_kizuki_repository.dart';
import 'package:shusekibo/app/widget/awareness/awareness_kizuki_state.dart';
import 'package:shusekibo/app/widget/awareness/awareness_meibo_provider.dart';
import 'package:shusekibo/app/widget/awareness/awareness_meibo_repository.dart';
import 'package:shusekibo/app/widget/cache/cache_provider.dart';
import 'package:shusekibo/app/widget/filter/filter_model.dart';
import 'package:shusekibo/app/widget/filter/filter_provider.dart';

final awarenessKizukiInitProvider =
    StateNotifierProvider<AwarenessKizukiNotifier, AwarenessKizukiState>(
        (ref) {
  final filter = ref.watch(filterProvider);

  return AwarenessKizukiNotifier(ref, filter);
});

final awarenessKizukiProvider =
    StateProvider<AwarenessKizukiModel>((ref) => const AwarenessKizukiModel());
final awarenessCountProvider = StateProvider<int>((ref) => 0);
final awarenessListSearchProvider = StateProvider<int>((ref) => 0);

class AwarenessKizukiNotifier extends StateNotifier<AwarenessKizukiState> {
  AwarenessKizukiNotifier(this._ref, this._filter)
      : super(const AwarenessKizukiState.loading()) {
    _init();
  }

  final Ref _ref;
  final FilterModel _filter;

  late final AwarenessKizukiRepository _repository =
      _ref.read(awarenessKizukiRepositoryProvider);
  late final AwarenessMeiboRepository _rep =
      _ref.read(awarenessMeiboRepositoryProvider);
  
  Future<void> _init() async {
    if (_filter.classId != null) {
      await fetch();
    } else if (_filter.classId == null) {
      state = const AwarenessKizukiState.blank();
    }
  }

  Future<void> fetch() async {
    final response = await _repository.fetch();
    if (mounted) {
      state = response;
    }
  }

  Future<void> patch(String str) async {
    final juyo = _ref.read(awarenessJuyoProvider);
    final burui = _ref.read(awarenessBunruiProvider);

    final id = _ref.read(awarenessEditProvider);
    final kizuki = _ref.read(awarenessKizukiCache)['$id'];

    final json = '''
{
    "Id": ${kizuki!.id},
    "Kizuki": "$str",
    "JuyoFlg": $juyo,
    "KaruteBunruiCode": $burui,
}
   ''';

    await _repository.patch(id, json);
    await _repository.fetch();
  }

  Future<void> delete(int id) async {
    final response = await _repository.delete(id);
    if (mounted) {
      state = response;
    }
  }
}
