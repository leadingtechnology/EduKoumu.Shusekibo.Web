import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'gakunen_model.freezed.dart';
part 'gakunen_model.g.dart';

List<GakunenModel> gakunenListFromJson(List<dynamic> data) =>
    List<GakunenModel>.from(data.map((x) => GakunenModel.fromJson(x as Map<String, dynamic>)));

GakunenModel gakunenFromJson(String str) => GakunenModel.fromJson(json.decode(str) as Map<String, dynamic>);



@freezed
class GakunenModel with _$GakunenModel {
  const GakunenModel._();
  const factory GakunenModel({

    @JsonKey(name: 'OrganizationId', disallowNullValue: false) int? organizationId,
    @JsonKey(name: 'GakunenCode', disallowNullValue: false) String? gakunenCode,
    @JsonKey(name: 'GakunenName', disallowNullValue: false) String? gakunenName,
    @JsonKey(name: 'GakunenRyakusho', disallowNullValue: false) String? gakunenRyakusho,
    @JsonKey(name: 'KateiKbn', disallowNullValue: false) String? kateiKbn,
    @JsonKey(name: 'ZaisekiAgeLowLimit', disallowNullValue: false) int? zaisekiAgeLowLimit,
    @JsonKey(name: 'IsTantoGakunen', disallowNullValue: false) bool? isTantoGakunen,
    @JsonKey(name: 'Id', disallowNullValue: false) int? id,
    @JsonKey(name: 'Code', disallowNullValue: false) String? code,
    @JsonKey(name: 'Name', disallowNullValue: false) String? name,
  }) = _GakunenModel;

  factory GakunenModel.fromJson(Map<String, dynamic> json) => _$GakunenModelFromJson(json);
}


