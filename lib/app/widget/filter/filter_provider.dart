import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/app/widget/attendance/timed_model.dart';
import 'package:shusekibo/app/widget/attendance/timed_provider.dart';
import 'package:shusekibo/app/widget/common/app_state.dart';
import 'package:shusekibo/app/widget/dantai/dantai_model.dart';
import 'package:shusekibo/app/widget/dantai/dantai_provider.dart';
import 'package:shusekibo/app/widget/filter/extra_filter_model.dart';
import 'package:shusekibo/app/widget/filter/filter_model.dart';
import 'package:shusekibo/app/widget/gakunen/gakunen_model.dart';
import 'package:shusekibo/app/widget/gakunen/gakunen_provider.dart';
import 'package:shusekibo/app/widget/shozoku/shozoku_model.dart';
import 'package:shusekibo/app/widget/shozoku/shozoku_provider.dart';
import 'package:shusekibo/shared/util/date_util.dart';

final filterProvider = StateProvider<FilterModel>((ref) => const FilterModel());

final attendanceFilterProvider = StateProvider<ExtraFilterModel>((ref) => const ExtraFilterModel());
final attendanceTimedFilterProvider = StateProvider<ExtraFilterModel>((ref) => const ExtraFilterModel());
final healthFilterProvider = StateProvider<ExtraFilterModel>((ref) => const ExtraFilterModel());
final awarenessFilterProvider = StateProvider<ExtraFilterModel>((ref) => const ExtraFilterModel());

final healthFilterDateProvider = StateProvider<DateTime>((ref) => DateTime.now());
final attendanceFilterDateProvider = StateProvider<DateTime>((ref) => DateTime.now());
final attendanceTimedFilterDateProvider = StateProvider<DateTime>((ref) => DateTime.now());
final awarenessFilterBeginDateProvider = StateProvider<DateTime>((ref) => DateTime.now());
final awarenessFilterEndDateProvider = StateProvider<DateTime>((ref) => DateTime.now());

final filterInitProvider =
    StateNotifierProvider<FilterInitNotifier, AppState>((ref) {
  final dantai = ref.watch(dantaiProvider);
  final gakunen = ref.watch(gakunenProvider);
  final shozoku = ref.watch(shozokuProvider);
  final timed = ref.watch(timedProvider);

  return FilterInitNotifier(
    ref,
    dantai,
    gakunen,
    shozoku,
    timed,
  );
});

class FilterInitNotifier extends StateNotifier<AppState> {
  FilterInitNotifier(
    this._ref,
    this._dantai,
    this._gakunen,
    this._shozoku,
    this._timed,
  ) : super(const AppState.loading());

  final Ref _ref;
  final DantaiModel _dantai;
  final GakunenModel _gakunen;
  final ShozokuModel _shozoku;
  final TimedModel _timed;


  Future<void> _fetch() async {
    update();

    if (mounted) {
      state = const AppState.loaded();
    }
  }

  void clear() {
    _ref.read(filterProvider.notifier).state = const FilterModel();
    
    _ref.read(attendanceFilterProvider.notifier).state = const ExtraFilterModel();
    _ref.read(attendanceTimedFilterProvider.notifier).state = const ExtraFilterModel();
    _ref.read(healthFilterProvider.notifier).state = const ExtraFilterModel();
    _ref.read(awarenessFilterProvider.notifier).state = const ExtraFilterModel();

    _ref.read(healthFilterDateProvider.notifier).state = DateTime.now();
    _ref.read(attendanceFilterDateProvider.notifier).state = DateTime.now();
    _ref.read(attendanceTimedFilterDateProvider.notifier).state = DateTime.now();
    _ref.read(awarenessFilterBeginDateProvider.notifier).state = DateTime.now();
    _ref.read(awarenessFilterEndDateProvider.notifier).state = DateTime.now();
  }

  void updateHealthFilter({required DateTime targetDate}) {
    update();
    _ref.read(healthFilterProvider.notifier).state = ExtraFilterModel(
      targetDate: targetDate,
      japanDate: DateUtil.getJapaneseDate(targetDate),
    );
  }

  void update({
    DateTime? targetDate,
    String? japanDate,
    DateTime? beginDate,
    DateTime? endDate,
  }) {
    _ref.read(filterProvider.notifier).state = FilterModel(
        dantaiId: _dantai.id,
        organizationKbn: _dantai.organizationKbn,
        dantaiName: _dantai.name,
        gakunenCode: _gakunen.gakunenCode,
        gakunenRyakusho: _gakunen.gakunenRyakusho,
        classId: _shozoku.id,
        classCode: _shozoku.classCode,
        className: _shozoku.className,
        //
        jigenIdx: _timed.jigenIdx,
        jigenRyaku: _timed.ryaku,
        targetDate: targetDate,
        japanDate: japanDate,
        beginDate: beginDate,
        endDate: endDate
    );
  }  
}
