import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/app/widget/attendance/timed_provider.dart';
import 'package:shusekibo/app/widget/common/app_state.dart';
import 'package:shusekibo/app/widget/dantai/dantai_provider.dart';
import 'package:shusekibo/app/widget/filter/filter_model.dart';
import 'package:shusekibo/app/widget/gakunen/gakunen_provider.dart';
import 'package:shusekibo/app/widget/shozoku/shozoku_provider.dart';
import 'package:shusekibo/shared/util/date_util.dart';

final filterProvider = StateProvider<FilterModel>((ref) => const FilterModel());
final kouryuProvider = StateProvider<bool>((ref) => false);

final targetDateProvider = StateProvider<DateTime>((ref) => DateTime.now());
final beginDateProvider = StateProvider<DateTime>((ref) => DateTime.now());
final endDateProvider = StateProvider<DateTime>((ref) => DateTime.now());

final filterInitProvider =
    StateNotifierProvider<FilterInitNotifier, AppState>((ref) {

  return FilterInitNotifier(
    ref,
  );
});

class FilterInitNotifier extends StateNotifier<AppState> {
  FilterInitNotifier(
    this._ref,
  ) : super(const AppState.loading());

  final Ref _ref;


  Future<void> _fetch() async {
    update();

    if (mounted) {
      state = const AppState.loaded();
    }
  }

  void clear() {
    _ref.read(filterProvider.notifier).state = const FilterModel();
  }

  void update({
    DateTime? beginDate,
    DateTime? endDate,
  }) {
    final dantai = _ref.watch(dantaiProvider);
    final gakunen = _ref.watch(gakunenProvider);
    final shozoku = _ref.watch(shozokuProvider);
    final timed = _ref.watch(timedProvider);
    final targetDate = _ref.watch(targetDateProvider);
    final kyoryu = _ref.read(kouryuProvider);
    final filter = _ref.read(filterProvider);
    
    _ref.read(filterProvider.notifier).state = FilterModel(
      dantaiId: dantai.id,
      organizationKbn: dantai.organizationKbn,
      dantaiName: dantai.name,
      gakunenCode: gakunen.gakunenCode,
      gakunenRyakusho: gakunen.gakunenRyakusho,
      kouryuGakkyu: kyoryu,
      classId: shozoku.id,
      classCode: shozoku.classCode,
      className: shozoku.className,
      //
      jigenIdx: timed.jigenIdx,
      jigenRyaku: timed.ryaku,
      targetDate: targetDate,
      japanDate: DateUtil.getJapaneseDate(targetDate),
      beginDate: beginDate ?? filter.beginDate,
      endDate: endDate ?? filter.endDate,
    );
  }  
}
