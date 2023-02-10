import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'shozoku_model.freezed.dart';
part 'shozoku_model.g.dart';

List<ShozokuModel> shozokuListFromJson(List<dynamic> data) =>
    List<ShozokuModel>.from(data.map((x) => ShozokuModel.fromJson(x as Map<String, dynamic>)));

ShozokuModel shozokuFromJson(String str) => ShozokuModel.fromJson(json.decode(str) as Map<String, dynamic>);



@freezed
class ShozokuModel with _$ShozokuModel {
  const ShozokuModel._();
  const factory ShozokuModel({

    @JsonKey(name: 'OrganizationCode', disallowNullValue: false) String? organizationCode,
    @JsonKey(name: 'OrganizationId', disallowNullValue: false) int? organizationId,
    @JsonKey(name: 'Nendo', disallowNullValue: false) String? nendo,
    @JsonKey(name: 'GakunenCode', disallowNullValue: false) String? gakunenCode,
    @JsonKey(name: 'ClassId', disallowNullValue: false) int? classId,
    @JsonKey(name: 'ClassBunrui', disallowNullValue: false) String? classBunrui,
    @JsonKey(name: 'ClassKbn', disallowNullValue: false) String? classKbn,
    @JsonKey(name: 'ClassCode', disallowNullValue: false) String? classCode,
    @JsonKey(name: 'ClassName', disallowNullValue: false) String? className,
    @JsonKey(name: 'ShozokuId', disallowNullValue: false) int? shozokuId,
    @JsonKey(name: 'ShozokuCode', disallowNullValue: false) String? shozokuCode,
    @JsonKey(name: 'IsGakuseki', disallowNullValue: false) bool? isGakuseki,
    @JsonKey(name: 'IsTokubetsuShien', disallowNullValue: false) bool? isTokubetsuShien,
    @JsonKey(name: 'Hyojijun', disallowNullValue: false) int? hyojijun,
    @JsonKey(name: 'IsTanninClass', disallowNullValue: false) bool? isTanninClass,
    @JsonKey(name: 'IsTantoClass', disallowNullValue: false) bool? isTantoClass,
    @JsonKey(name: 'Id', disallowNullValue: false) int? id,
    @JsonKey(name: 'Code', disallowNullValue: false) String? code,
    @JsonKey(name: 'Name', disallowNullValue: false) String? name,
  }) = _ShozokuModel;

  factory ShozokuModel.fromJson(Map<String, dynamic> json) => _$ShozokuModelFromJson(json);
}


