// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'gakunen_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GakunenModel _$GakunenModelFromJson(Map<String, dynamic> json) {
  return _GakunenModel.fromJson(json);
}

/// @nodoc
mixin _$GakunenModel {
  @JsonKey(name: 'OrganizationId', disallowNullValue: false)
  int? get organizationId => throw _privateConstructorUsedError;
  @JsonKey(name: 'GakunenCode', disallowNullValue: false)
  String? get gakunenCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'GakunenName', disallowNullValue: false)
  String? get gakunenName => throw _privateConstructorUsedError;
  @JsonKey(name: 'GakunenRyakusho', disallowNullValue: false)
  String? get gakunenRyakusho => throw _privateConstructorUsedError;
  @JsonKey(name: 'KateiKbn', disallowNullValue: false)
  String? get kateiKbn => throw _privateConstructorUsedError;
  @JsonKey(name: 'ZaisekiAgeLowLimit', disallowNullValue: false)
  int? get zaisekiAgeLowLimit => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsTantoGakunen', disallowNullValue: false)
  bool? get isTantoGakunen => throw _privateConstructorUsedError;
  @JsonKey(name: 'Id', disallowNullValue: false)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Code', disallowNullValue: false)
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'Name', disallowNullValue: false)
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GakunenModelCopyWith<GakunenModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GakunenModelCopyWith<$Res> {
  factory $GakunenModelCopyWith(
          GakunenModel value, $Res Function(GakunenModel) then) =
      _$GakunenModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'OrganizationId', disallowNullValue: false)
          int? organizationId,
      @JsonKey(name: 'GakunenCode', disallowNullValue: false)
          String? gakunenCode,
      @JsonKey(name: 'GakunenName', disallowNullValue: false)
          String? gakunenName,
      @JsonKey(name: 'GakunenRyakusho', disallowNullValue: false)
          String? gakunenRyakusho,
      @JsonKey(name: 'KateiKbn', disallowNullValue: false)
          String? kateiKbn,
      @JsonKey(name: 'ZaisekiAgeLowLimit', disallowNullValue: false)
          int? zaisekiAgeLowLimit,
      @JsonKey(name: 'IsTantoGakunen', disallowNullValue: false)
          bool? isTantoGakunen,
      @JsonKey(name: 'Id', disallowNullValue: false)
          int? id,
      @JsonKey(name: 'Code', disallowNullValue: false)
          String? code,
      @JsonKey(name: 'Name', disallowNullValue: false)
          String? name});
}

/// @nodoc
class _$GakunenModelCopyWithImpl<$Res> implements $GakunenModelCopyWith<$Res> {
  _$GakunenModelCopyWithImpl(this._value, this._then);

  final GakunenModel _value;
  // ignore: unused_field
  final $Res Function(GakunenModel) _then;

  @override
  $Res call({
    Object? organizationId = freezed,
    Object? gakunenCode = freezed,
    Object? gakunenName = freezed,
    Object? gakunenRyakusho = freezed,
    Object? kateiKbn = freezed,
    Object? zaisekiAgeLowLimit = freezed,
    Object? isTantoGakunen = freezed,
    Object? id = freezed,
    Object? code = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      organizationId: organizationId == freezed
          ? _value.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as int?,
      gakunenCode: gakunenCode == freezed
          ? _value.gakunenCode
          : gakunenCode // ignore: cast_nullable_to_non_nullable
              as String?,
      gakunenName: gakunenName == freezed
          ? _value.gakunenName
          : gakunenName // ignore: cast_nullable_to_non_nullable
              as String?,
      gakunenRyakusho: gakunenRyakusho == freezed
          ? _value.gakunenRyakusho
          : gakunenRyakusho // ignore: cast_nullable_to_non_nullable
              as String?,
      kateiKbn: kateiKbn == freezed
          ? _value.kateiKbn
          : kateiKbn // ignore: cast_nullable_to_non_nullable
              as String?,
      zaisekiAgeLowLimit: zaisekiAgeLowLimit == freezed
          ? _value.zaisekiAgeLowLimit
          : zaisekiAgeLowLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      isTantoGakunen: isTantoGakunen == freezed
          ? _value.isTantoGakunen
          : isTantoGakunen // ignore: cast_nullable_to_non_nullable
              as bool?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_GakunenModelCopyWith<$Res>
    implements $GakunenModelCopyWith<$Res> {
  factory _$$_GakunenModelCopyWith(
          _$_GakunenModel value, $Res Function(_$_GakunenModel) then) =
      __$$_GakunenModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'OrganizationId', disallowNullValue: false)
          int? organizationId,
      @JsonKey(name: 'GakunenCode', disallowNullValue: false)
          String? gakunenCode,
      @JsonKey(name: 'GakunenName', disallowNullValue: false)
          String? gakunenName,
      @JsonKey(name: 'GakunenRyakusho', disallowNullValue: false)
          String? gakunenRyakusho,
      @JsonKey(name: 'KateiKbn', disallowNullValue: false)
          String? kateiKbn,
      @JsonKey(name: 'ZaisekiAgeLowLimit', disallowNullValue: false)
          int? zaisekiAgeLowLimit,
      @JsonKey(name: 'IsTantoGakunen', disallowNullValue: false)
          bool? isTantoGakunen,
      @JsonKey(name: 'Id', disallowNullValue: false)
          int? id,
      @JsonKey(name: 'Code', disallowNullValue: false)
          String? code,
      @JsonKey(name: 'Name', disallowNullValue: false)
          String? name});
}

/// @nodoc
class __$$_GakunenModelCopyWithImpl<$Res>
    extends _$GakunenModelCopyWithImpl<$Res>
    implements _$$_GakunenModelCopyWith<$Res> {
  __$$_GakunenModelCopyWithImpl(
      _$_GakunenModel _value, $Res Function(_$_GakunenModel) _then)
      : super(_value, (v) => _then(v as _$_GakunenModel));

  @override
  _$_GakunenModel get _value => super._value as _$_GakunenModel;

  @override
  $Res call({
    Object? organizationId = freezed,
    Object? gakunenCode = freezed,
    Object? gakunenName = freezed,
    Object? gakunenRyakusho = freezed,
    Object? kateiKbn = freezed,
    Object? zaisekiAgeLowLimit = freezed,
    Object? isTantoGakunen = freezed,
    Object? id = freezed,
    Object? code = freezed,
    Object? name = freezed,
  }) {
    return _then(_$_GakunenModel(
      organizationId: organizationId == freezed
          ? _value.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as int?,
      gakunenCode: gakunenCode == freezed
          ? _value.gakunenCode
          : gakunenCode // ignore: cast_nullable_to_non_nullable
              as String?,
      gakunenName: gakunenName == freezed
          ? _value.gakunenName
          : gakunenName // ignore: cast_nullable_to_non_nullable
              as String?,
      gakunenRyakusho: gakunenRyakusho == freezed
          ? _value.gakunenRyakusho
          : gakunenRyakusho // ignore: cast_nullable_to_non_nullable
              as String?,
      kateiKbn: kateiKbn == freezed
          ? _value.kateiKbn
          : kateiKbn // ignore: cast_nullable_to_non_nullable
              as String?,
      zaisekiAgeLowLimit: zaisekiAgeLowLimit == freezed
          ? _value.zaisekiAgeLowLimit
          : zaisekiAgeLowLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      isTantoGakunen: isTantoGakunen == freezed
          ? _value.isTantoGakunen
          : isTantoGakunen // ignore: cast_nullable_to_non_nullable
              as bool?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GakunenModel extends _GakunenModel {
  const _$_GakunenModel(
      {@JsonKey(name: 'OrganizationId', disallowNullValue: false)
          this.organizationId,
      @JsonKey(name: 'GakunenCode', disallowNullValue: false)
          this.gakunenCode,
      @JsonKey(name: 'GakunenName', disallowNullValue: false)
          this.gakunenName,
      @JsonKey(name: 'GakunenRyakusho', disallowNullValue: false)
          this.gakunenRyakusho,
      @JsonKey(name: 'KateiKbn', disallowNullValue: false)
          this.kateiKbn,
      @JsonKey(name: 'ZaisekiAgeLowLimit', disallowNullValue: false)
          this.zaisekiAgeLowLimit,
      @JsonKey(name: 'IsTantoGakunen', disallowNullValue: false)
          this.isTantoGakunen,
      @JsonKey(name: 'Id', disallowNullValue: false)
          this.id,
      @JsonKey(name: 'Code', disallowNullValue: false)
          this.code,
      @JsonKey(name: 'Name', disallowNullValue: false)
          this.name})
      : super._();

  factory _$_GakunenModel.fromJson(Map<String, dynamic> json) =>
      _$$_GakunenModelFromJson(json);

  @override
  @JsonKey(name: 'OrganizationId', disallowNullValue: false)
  final int? organizationId;
  @override
  @JsonKey(name: 'GakunenCode', disallowNullValue: false)
  final String? gakunenCode;
  @override
  @JsonKey(name: 'GakunenName', disallowNullValue: false)
  final String? gakunenName;
  @override
  @JsonKey(name: 'GakunenRyakusho', disallowNullValue: false)
  final String? gakunenRyakusho;
  @override
  @JsonKey(name: 'KateiKbn', disallowNullValue: false)
  final String? kateiKbn;
  @override
  @JsonKey(name: 'ZaisekiAgeLowLimit', disallowNullValue: false)
  final int? zaisekiAgeLowLimit;
  @override
  @JsonKey(name: 'IsTantoGakunen', disallowNullValue: false)
  final bool? isTantoGakunen;
  @override
  @JsonKey(name: 'Id', disallowNullValue: false)
  final int? id;
  @override
  @JsonKey(name: 'Code', disallowNullValue: false)
  final String? code;
  @override
  @JsonKey(name: 'Name', disallowNullValue: false)
  final String? name;

  @override
  String toString() {
    return 'GakunenModel(organizationId: $organizationId, gakunenCode: $gakunenCode, gakunenName: $gakunenName, gakunenRyakusho: $gakunenRyakusho, kateiKbn: $kateiKbn, zaisekiAgeLowLimit: $zaisekiAgeLowLimit, isTantoGakunen: $isTantoGakunen, id: $id, code: $code, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GakunenModel &&
            const DeepCollectionEquality()
                .equals(other.organizationId, organizationId) &&
            const DeepCollectionEquality()
                .equals(other.gakunenCode, gakunenCode) &&
            const DeepCollectionEquality()
                .equals(other.gakunenName, gakunenName) &&
            const DeepCollectionEquality()
                .equals(other.gakunenRyakusho, gakunenRyakusho) &&
            const DeepCollectionEquality().equals(other.kateiKbn, kateiKbn) &&
            const DeepCollectionEquality()
                .equals(other.zaisekiAgeLowLimit, zaisekiAgeLowLimit) &&
            const DeepCollectionEquality()
                .equals(other.isTantoGakunen, isTantoGakunen) &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.code, code) &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(organizationId),
      const DeepCollectionEquality().hash(gakunenCode),
      const DeepCollectionEquality().hash(gakunenName),
      const DeepCollectionEquality().hash(gakunenRyakusho),
      const DeepCollectionEquality().hash(kateiKbn),
      const DeepCollectionEquality().hash(zaisekiAgeLowLimit),
      const DeepCollectionEquality().hash(isTantoGakunen),
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(code),
      const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$$_GakunenModelCopyWith<_$_GakunenModel> get copyWith =>
      __$$_GakunenModelCopyWithImpl<_$_GakunenModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GakunenModelToJson(
      this,
    );
  }
}

abstract class _GakunenModel extends GakunenModel {
  const factory _GakunenModel(
      {@JsonKey(name: 'OrganizationId', disallowNullValue: false)
          final int? organizationId,
      @JsonKey(name: 'GakunenCode', disallowNullValue: false)
          final String? gakunenCode,
      @JsonKey(name: 'GakunenName', disallowNullValue: false)
          final String? gakunenName,
      @JsonKey(name: 'GakunenRyakusho', disallowNullValue: false)
          final String? gakunenRyakusho,
      @JsonKey(name: 'KateiKbn', disallowNullValue: false)
          final String? kateiKbn,
      @JsonKey(name: 'ZaisekiAgeLowLimit', disallowNullValue: false)
          final int? zaisekiAgeLowLimit,
      @JsonKey(name: 'IsTantoGakunen', disallowNullValue: false)
          final bool? isTantoGakunen,
      @JsonKey(name: 'Id', disallowNullValue: false)
          final int? id,
      @JsonKey(name: 'Code', disallowNullValue: false)
          final String? code,
      @JsonKey(name: 'Name', disallowNullValue: false)
          final String? name}) = _$_GakunenModel;
  const _GakunenModel._() : super._();

  factory _GakunenModel.fromJson(Map<String, dynamic> json) =
      _$_GakunenModel.fromJson;

  @override
  @JsonKey(name: 'OrganizationId', disallowNullValue: false)
  int? get organizationId;
  @override
  @JsonKey(name: 'GakunenCode', disallowNullValue: false)
  String? get gakunenCode;
  @override
  @JsonKey(name: 'GakunenName', disallowNullValue: false)
  String? get gakunenName;
  @override
  @JsonKey(name: 'GakunenRyakusho', disallowNullValue: false)
  String? get gakunenRyakusho;
  @override
  @JsonKey(name: 'KateiKbn', disallowNullValue: false)
  String? get kateiKbn;
  @override
  @JsonKey(name: 'ZaisekiAgeLowLimit', disallowNullValue: false)
  int? get zaisekiAgeLowLimit;
  @override
  @JsonKey(name: 'IsTantoGakunen', disallowNullValue: false)
  bool? get isTantoGakunen;
  @override
  @JsonKey(name: 'Id', disallowNullValue: false)
  int? get id;
  @override
  @JsonKey(name: 'Code', disallowNullValue: false)
  String? get code;
  @override
  @JsonKey(name: 'Name', disallowNullValue: false)
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$_GakunenModelCopyWith<_$_GakunenModel> get copyWith =>
      throw _privateConstructorUsedError;
}
