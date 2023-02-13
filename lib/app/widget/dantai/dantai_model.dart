import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dantai_model.freezed.dart';
part 'dantai_model.g.dart';

List<DantaiModel> dantaiListFromJson(List<dynamic> data) =>
    List<DantaiModel>.from(data.map((x) => DantaiModel.fromJson(x as Map<String, dynamic>)));

DantaiModel dantaiFromJson(String str) => DantaiModel.fromJson(json.decode(str) as Map<String, dynamic>);



@freezed
class DantaiModel with _$DantaiModel {
  const DantaiModel._();
  const factory DantaiModel({

    @JsonKey(name: 'OrganizationBunrui', disallowNullValue: false) String? organizationBunrui,
    @JsonKey(name: 'OrganizationKbn', disallowNullValue: false) String? organizationKbn,
    @JsonKey(name: 'Id', disallowNullValue: false) int? id,
    @JsonKey(name: 'Code', disallowNullValue: false) String? code,
    @JsonKey(name: 'Name', disallowNullValue: false) String? name,
  }) = _DantaiModel;

  factory DantaiModel.fromJson(Map<String, dynamic> json) => _$DantaiModelFromJson(json);
}


