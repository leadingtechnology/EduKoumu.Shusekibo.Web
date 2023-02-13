import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shusekibo/shared/http/app_exception.dart';

import 'package:shusekibo/app/widget/filter/extra_filter_model.dart';

part 'extra_filter_state.freezed.dart';

@freezed
class ExtraFilterState with _$ExtraFilterState {
  const factory ExtraFilterState.loading() = _Loading;
  const factory ExtraFilterState.loaded(ExtraFilterModel exterFilter) =
      _Loaded;
  const factory ExtraFilterState.error(AppException error) = _Error;
}
