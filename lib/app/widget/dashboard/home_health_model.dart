import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_health_model.freezed.dart';
part 'home_health_model.g.dart';

List<HomeHealthModel> homeHealthListFromJson(List<dynamic> data) =>
    List<HomeHealthModel>.from(data.map((x) => HomeHealthModel.fromJson(x as Map<String, dynamic>)));

HomeHealthModel homeHealthFromJson(String str) => HomeHealthModel.fromJson(json.decode(str) as Map<String, dynamic>);

@freezed
class HomeHealthModel with _$HomeHealthModel {
  const HomeHealthModel._();
  const factory HomeHealthModel({

    @JsonKey(name: 'ClassName', disallowNullValue: false) String? className,
    @JsonKey(name: 'Zaiseki', disallowNullValue: false) int? zaiseki,
    @JsonKey(name: 'Shusseki', disallowNullValue: false) int? shusseki,
    @JsonKey(name: 'Tikoku', disallowNullValue: false) int? tikoku,
    @JsonKey(name: 'Sotai', disallowNullValue: false) int? sotai,
    @JsonKey(name: 'KessekiShuttei', disallowNullValue: false) int? kessekiShuttei,
    @JsonKey(name: 'Influenza', disallowNullValue: false) int? influenza,
    @JsonKey(name: 'DoneKenkoKansatsuFlg', disallowNullValue: false) bool? doneKenkoKansatsuFlg,
  }) = _HomeHealthModel;

  factory HomeHealthModel.fromJson(Map<String, dynamic> json) => _$HomeHealthModelFromJson(json);
}

