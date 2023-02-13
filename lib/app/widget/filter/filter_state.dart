import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shusekibo/shared/http/app_exception.dart';
import 'package:shusekibo/app/widget/filter/filter_model.dart';


part 'filter_state.freezed.dart';

@freezed
class FilterState with _$FilterState {
  const factory FilterState.loading() = _Loading;
  const factory FilterState.loaded(FilterModel filter) = _Loaded;
  const factory FilterState.error(AppException error) = _Error;
}
