import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'awareness_kizuki_model.freezed.dart';
part 'awareness_kizuki_model.g.dart';

List<AwarenessKizukiModel> awarenessKizukiListFromJson(List<dynamic> data) =>
    List<AwarenessKizukiModel>.from(data.map((x) => AwarenessKizukiModel.fromJson(x as Map<String, dynamic>)));

AwarenessKizukiModel awarenessKizukiFromJson(String str) => AwarenessKizukiModel.fromJson(json.decode(str) as Map<String, dynamic>);



@freezed
class AwarenessKizukiModel with _$AwarenessKizukiModel {
  const factory AwarenessKizukiModel({

    @JsonKey(name: 'Id', disallowNullValue: false)  int? id,
    @JsonKey(name: 'Nendo', disallowNullValue: false)  String? nendo,
    @JsonKey(name: 'KaruteSettingId', disallowNullValue: false)  int? karuteSettingId,
    @JsonKey(name: 'ShubetsuCode', disallowNullValue: false)  String? shubetsuCode,
    @JsonKey(name: 'ShubetsuName', disallowNullValue: false)  String? shubetsuName,
    @JsonKey(name: 'BunruiCode', disallowNullValue: false)  String? bunruiCode,
    @JsonKey(name: 'BunruiName', disallowNullValue: false)  String? bunruiName,
    @JsonKey(name: 'Naiyou', disallowNullValue: false)  String? naiyou,
    @JsonKey(name: 'GakkiId', disallowNullValue: false)  int? gakkiId,
    @JsonKey(name: 'GakkiName', disallowNullValue: false)  String? gakkiName,
    @JsonKey(name: 'Gakunen', disallowNullValue: false)  String? gakunen,
    @JsonKey(name: 'ShozokuId', disallowNullValue: false)  int? shozokuId,
    @JsonKey(name: 'ShozokuBunrui', disallowNullValue: false)  String? shozokuBunrui,
    @JsonKey(name: 'ShozokuKbn', disallowNullValue: false)  String? shozokuKbn,
    @JsonKey(name: 'ShozokuCode', disallowNullValue: false)  String? shozokuCode,
    @JsonKey(name: 'ClassName', disallowNullValue: false)  String? className,
    @JsonKey(name: 'ShussekiNo', disallowNullValue: false)  String? shussekiNo,
    @JsonKey(name: 'StudentId', disallowNullValue: false)  int? studentId,
    @JsonKey(name: 'SeitoSeq', disallowNullValue: false)  String? seitoSeq,
    @JsonKey(name: 'StudentName', disallowNullValue: false)  String? studentName,
    @JsonKey(name: 'ExistPhoto', disallowNullValue: false)  bool? existPhoto,
    @JsonKey(name: 'PhotoUrl', disallowNullValue: false) String? photoUrl,
    @JsonKey(name: 'TourokusyaId', disallowNullValue: false)  int? tourokusyaId,
    @JsonKey(name: 'TourokusyaName', disallowNullValue: false)  String? tourokusyaName,
    @JsonKey(name: 'JuyoFlg', disallowNullValue: false)  bool? juyoFlg,
    @JsonKey(name: 'TorokuDate', disallowNullValue: false)  String? torokuDate,
    @JsonKey(name: 'HasAttachment', disallowNullValue: false)  bool? hasAttachment,
    @JsonKey(name: 'CommentCount', disallowNullValue: false)  int? commentCount,
    @JsonKey(name: 'CreateDate', disallowNullValue: false)  String? createDate,
    @JsonKey(name: 'UpdateDate', disallowNullValue: false)  String? updateDate,
    @JsonKey(name: 'TimeStamp', disallowNullValue: false)  String? timeStamp,

  }) = _AwarenessKizukiModel;
  const AwarenessKizukiModel._();

  factory AwarenessKizukiModel.fromJson(Map<String, dynamic> json) => _$AwarenessKizukiModelFromJson(json);
}
