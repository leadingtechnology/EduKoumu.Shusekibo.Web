import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shusekibo/shared/http/app_exception.dart';

import 'gakunen_model.dart';

part 'gakunen_state.freezed.dart';

@freezed
class GakunenState with _$GakunenState {
  const factory GakunenState.loading() = _Loading;
  const factory GakunenState.loaded() = _Loaded;
  const factory GakunenState.error(AppException error) = _Error;
}
