// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'awareness_bunrui_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AwarenessBunruiModel _$AwarenessBunruiModelFromJson(Map<String, dynamic> json) {
  return _AwarenessBunruiModel.fromJson(json);
}

/// @nodoc
mixin _$AwarenessBunruiModel {
  @JsonKey(name: 'Id', disallowNullValue: false)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Code', disallowNullValue: false)
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'Name', disallowNullValue: false)
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'ShortName', disallowNullValue: false)
  String? get shortName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AwarenessBunruiModelCopyWith<AwarenessBunruiModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AwarenessBunruiModelCopyWith<$Res> {
  factory $AwarenessBunruiModelCopyWith(AwarenessBunruiModel value,
          $Res Function(AwarenessBunruiModel) then) =
      _$AwarenessBunruiModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'Id', disallowNullValue: false) int? id,
      @JsonKey(name: 'Code', disallowNullValue: false) String? code,
      @JsonKey(name: 'Name', disallowNullValue: false) String? name,
      @JsonKey(name: 'ShortName', disallowNullValue: false) String? shortName});
}

/// @nodoc
class _$AwarenessBunruiModelCopyWithImpl<$Res>
    implements $AwarenessBunruiModelCopyWith<$Res> {
  _$AwarenessBunruiModelCopyWithImpl(this._value, this._then);

  final AwarenessBunruiModel _value;
  // ignore: unused_field
  final $Res Function(AwarenessBunruiModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? name = freezed,
    Object? shortName = freezed,
  }) {
    return _then(_value.copyWith(
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
      shortName: shortName == freezed
          ? _value.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_AwarenessBunruiModelCopyWith<$Res>
    implements $AwarenessBunruiModelCopyWith<$Res> {
  factory _$$_AwarenessBunruiModelCopyWith(_$_AwarenessBunruiModel value,
          $Res Function(_$_AwarenessBunruiModel) then) =
      __$$_AwarenessBunruiModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'Id', disallowNullValue: false) int? id,
      @JsonKey(name: 'Code', disallowNullValue: false) String? code,
      @JsonKey(name: 'Name', disallowNullValue: false) String? name,
      @JsonKey(name: 'ShortName', disallowNullValue: false) String? shortName});
}

/// @nodoc
class __$$_AwarenessBunruiModelCopyWithImpl<$Res>
    extends _$AwarenessBunruiModelCopyWithImpl<$Res>
    implements _$$_AwarenessBunruiModelCopyWith<$Res> {
  __$$_AwarenessBunruiModelCopyWithImpl(_$_AwarenessBunruiModel _value,
      $Res Function(_$_AwarenessBunruiModel) _then)
      : super(_value, (v) => _then(v as _$_AwarenessBunruiModel));

  @override
  _$_AwarenessBunruiModel get _value => super._value as _$_AwarenessBunruiModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? name = freezed,
    Object? shortName = freezed,
  }) {
    return _then(_$_AwarenessBunruiModel(
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
      shortName: shortName == freezed
          ? _value.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AwarenessBunruiModel extends _AwarenessBunruiModel {
  const _$_AwarenessBunruiModel(
      {@JsonKey(name: 'Id', disallowNullValue: false) this.id,
      @JsonKey(name: 'Code', disallowNullValue: false) this.code,
      @JsonKey(name: 'Name', disallowNullValue: false) this.name,
      @JsonKey(name: 'ShortName', disallowNullValue: false) this.shortName})
      : super._();

  factory _$_AwarenessBunruiModel.fromJson(Map<String, dynamic> json) =>
      _$$_AwarenessBunruiModelFromJson(json);

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
  @JsonKey(name: 'ShortName', disallowNullValue: false)
  final String? shortName;

  @override
  String toString() {
    return 'AwarenessBunruiModel(id: $id, code: $code, name: $name, shortName: $shortName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AwarenessBunruiModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.code, code) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.shortName, shortName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(code),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(shortName));

  @JsonKey(ignore: true)
  @override
  _$$_AwarenessBunruiModelCopyWith<_$_AwarenessBunruiModel> get copyWith =>
      __$$_AwarenessBunruiModelCopyWithImpl<_$_AwarenessBunruiModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AwarenessBunruiModelToJson(
      this,
    );
  }
}

abstract class _AwarenessBunruiModel extends AwarenessBunruiModel {
  const factory _AwarenessBunruiModel(
      {@JsonKey(name: 'Id', disallowNullValue: false)
          final int? id,
      @JsonKey(name: 'Code', disallowNullValue: false)
          final String? code,
      @JsonKey(name: 'Name', disallowNullValue: false)
          final String? name,
      @JsonKey(name: 'ShortName', disallowNullValue: false)
          final String? shortName}) = _$_AwarenessBunruiModel;
  const _AwarenessBunruiModel._() : super._();

  factory _AwarenessBunruiModel.fromJson(Map<String, dynamic> json) =
      _$_AwarenessBunruiModel.fromJson;

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
  @JsonKey(name: 'ShortName', disallowNullValue: false)
  String? get shortName;
  @override
  @JsonKey(ignore: true)
  _$$_AwarenessBunruiModelCopyWith<_$_AwarenessBunruiModel> get copyWith =>
      throw _privateConstructorUsedError;
}
