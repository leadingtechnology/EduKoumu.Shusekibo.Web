import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shusekibo/shared/http/app_exception.dart';

part 'awareness_meibo_state.freezed.dart';

@freezed
class AwarenessMeiboState with _$AwarenessMeiboState {
  const factory AwarenessMeiboState.blank() = _Blank;
  const factory AwarenessMeiboState.loading() = _Loading;
  const factory AwarenessMeiboState.loaded() = _Loaded;
  const factory AwarenessMeiboState.error(AppException error) = _Error;
}
