import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:shusekibo/app/widget/cache/cache_provider.dart';
import 'package:shusekibo/app/widget/common/app_state.dart';
import 'package:shusekibo/app/widget/dashboard/tokobi_model.dart';
import 'package:shusekibo/app/widget/dashboard/tokobi_repository.dart';
import 'package:shusekibo/app/widget/shozoku/shozoku_model.dart';
import 'package:shusekibo/app/widget/shozoku/shozoku_provider.dart';

final tokobiListProvider =
    StateNotifierProvider<TokobiListProvider, AppState>((ref) {
  final shozoku = ref.watch(shozokuProvider);
  final tokobiDate = ref.watch(tokobiDateProvider);
  
  return TokobiListProvider(ref, shozoku, tokobiDate);
});

final tokobiProvider = StateProvider<TokobiModel>((ref) => const TokobiModel());
final tokobiDateProvider = StateProvider<DateTime>((ref) => DateTime.now());

class TokobiListProvider extends StateNotifier<AppState> {
  TokobiListProvider(this._ref, this._shozoku, this._tokobiDate)
      : super(const AppState.loading()) {
    _init();
  }

  final Ref _ref;
  final ShozokuModel _shozoku;
  final DateTime _tokobiDate;
  
  late final TokobiRepository _repository = _ref.read(tokobiRepositoryProvider);

  Future<void> _init() async {
    if (_shozoku.id == null) return;

    final timedMap = _ref.read(tokobiCache);
    final strDate = DateFormat('yyyy-MM-dd').format(_tokobiDate);

    if (timedMap.isEmpty) {
      await _fetch();
    } else if (timedMap.containsKey('${_shozoku.id}-$strDate')) {
      state = const AppState.loaded();
    } else {
      await _fetch();
    }
  }

  Future<void> _fetch() async {
    final response = await _repository.fetch(_shozoku, _tokobiDate);
    if (mounted) {
      state = response;
    }
  }
}
