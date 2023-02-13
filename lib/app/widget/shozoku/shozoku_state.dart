import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shusekibo/shared/http/app_exception.dart';

import 'package:shusekibo/app/widget/shozoku/shozoku_model.dart';

part 'shozoku_state.freezed.dart';

@freezed
class ShozokuState with _$ShozokuState {
  const factory ShozokuState.loading() = _Loading;
  const factory ShozokuState.loaded() = _Loaded;
  const factory ShozokuState.error(AppException error) = _Error;
}
