// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Token _$TokenFromJson(Map<String, dynamic> json) {
  return _Token.fromJson(json);
}

/// @nodoc
mixin _$Token {
  String get access_token => throw _privateConstructorUsedError;
  String? get token_type => throw _privateConstructorUsedError;
  int? get expires_in => throw _privateConstructorUsedError;
  String? get TenantId => throw _privateConstructorUsedError;
  String? get LoginId => throw _privateConstructorUsedError;
  String? get Dantai => throw _privateConstructorUsedError;
  String? get UserName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TokenCopyWith<Token> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenCopyWith<$Res> {
  factory $TokenCopyWith(Token value, $Res Function(Token) then) =
      _$TokenCopyWithImpl<$Res>;
  $Res call(
      {String access_token,
      String? token_type,
      int? expires_in,
      String? TenantId,
      String? LoginId,
      String? Dantai,
      String? UserName});
}

/// @nodoc
class _$TokenCopyWithImpl<$Res> implements $TokenCopyWith<$Res> {
  _$TokenCopyWithImpl(this._value, this._then);

  final Token _value;
  // ignore: unused_field
  final $Res Function(Token) _then;

  @override
  $Res call({
    Object? access_token = freezed,
    Object? token_type = freezed,
    Object? expires_in = freezed,
    Object? TenantId = freezed,
    Object? LoginId = freezed,
    Object? Dantai = freezed,
    Object? UserName = freezed,
  }) {
    return _then(_value.copyWith(
      access_token: access_token == freezed
          ? _value.access_token
          : access_token // ignore: cast_nullable_to_non_nullable
              as String,
      token_type: token_type == freezed
          ? _value.token_type
          : token_type // ignore: cast_nullable_to_non_nullable
              as String?,
      expires_in: expires_in == freezed
          ? _value.expires_in
          : expires_in // ignore: cast_nullable_to_non_nullable
              as int?,
      TenantId: TenantId == freezed
          ? _value.TenantId
          : TenantId // ignore: cast_nullable_to_non_nullable
              as String?,
      LoginId: LoginId == freezed
          ? _value.LoginId
          : LoginId // ignore: cast_nullable_to_non_nullable
              as String?,
      Dantai: Dantai == freezed
          ? _value.Dantai
          : Dantai // ignore: cast_nullable_to_non_nullable
              as String?,
      UserName: UserName == freezed
          ? _value.UserName
          : UserName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_TokenCopyWith<$Res> implements $TokenCopyWith<$Res> {
  factory _$$_TokenCopyWith(_$_Token value, $Res Function(_$_Token) then) =
      __$$_TokenCopyWithImpl<$Res>;
  @override
  $Res call(
      {String access_token,
      String? token_type,
      int? expires_in,
      String? TenantId,
      String? LoginId,
      String? Dantai,
      String? UserName});
}

/// @nodoc
class __$$_TokenCopyWithImpl<$Res> extends _$TokenCopyWithImpl<$Res>
    implements _$$_TokenCopyWith<$Res> {
  __$$_TokenCopyWithImpl(_$_Token _value, $Res Function(_$_Token) _then)
      : super(_value, (v) => _then(v as _$_Token));

  @override
  _$_Token get _value => super._value as _$_Token;

  @override
  $Res call({
    Object? access_token = freezed,
    Object? token_type = freezed,
    Object? expires_in = freezed,
    Object? TenantId = freezed,
    Object? LoginId = freezed,
    Object? Dantai = freezed,
    Object? UserName = freezed,
  }) {
    return _then(_$_Token(
      access_token: access_token == freezed
          ? _value.access_token
          : access_token // ignore: cast_nullable_to_non_nullable
              as String,
      token_type: token_type == freezed
          ? _value.token_type
          : token_type // ignore: cast_nullable_to_non_nullable
              as String?,
      expires_in: expires_in == freezed
          ? _value.expires_in
          : expires_in // ignore: cast_nullable_to_non_nullable
              as int?,
      TenantId: TenantId == freezed
          ? _value.TenantId
          : TenantId // ignore: cast_nullable_to_non_nullable
              as String?,
      LoginId: LoginId == freezed
          ? _value.LoginId
          : LoginId // ignore: cast_nullable_to_non_nullable
              as String?,
      Dantai: Dantai == freezed
          ? _value.Dantai
          : Dantai // ignore: cast_nullable_to_non_nullable
              as String?,
      UserName: UserName == freezed
          ? _value.UserName
          : UserName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Token implements _Token {
  const _$_Token(
      {required this.access_token,
      this.token_type,
      this.expires_in,
      this.TenantId,
      this.LoginId,
      this.Dantai,
      this.UserName});

  factory _$_Token.fromJson(Map<String, dynamic> json) =>
      _$$_TokenFromJson(json);

  @override
  final String access_token;
  @override
  final String? token_type;
  @override
  final int? expires_in;
  @override
  final String? TenantId;
  @override
  final String? LoginId;
  @override
  final String? Dantai;
  @override
  final String? UserName;

  @override
  String toString() {
    return 'Token(access_token: $access_token, token_type: $token_type, expires_in: $expires_in, TenantId: $TenantId, LoginId: $LoginId, Dantai: $Dantai, UserName: $UserName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Token &&
            const DeepCollectionEquality()
                .equals(other.access_token, access_token) &&
            const DeepCollectionEquality()
                .equals(other.token_type, token_type) &&
            const DeepCollectionEquality()
                .equals(other.expires_in, expires_in) &&
            const DeepCollectionEquality().equals(other.TenantId, TenantId) &&
            const DeepCollectionEquality().equals(other.LoginId, LoginId) &&
            const DeepCollectionEquality().equals(other.Dantai, Dantai) &&
            const DeepCollectionEquality().equals(other.UserName, UserName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(access_token),
      const DeepCollectionEquality().hash(token_type),
      const DeepCollectionEquality().hash(expires_in),
      const DeepCollectionEquality().hash(TenantId),
      const DeepCollectionEquality().hash(LoginId),
      const DeepCollectionEquality().hash(Dantai),
      const DeepCollectionEquality().hash(UserName));

  @JsonKey(ignore: true)
  @override
  _$$_TokenCopyWith<_$_Token> get copyWith =>
      __$$_TokenCopyWithImpl<_$_Token>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TokenToJson(
      this,
    );
  }
}

abstract class _Token implements Token {
  const factory _Token(
      {required final String access_token,
      final String? token_type,
      final int? expires_in,
      final String? TenantId,
      final String? LoginId,
      final String? Dantai,
      final String? UserName}) = _$_Token;

  factory _Token.fromJson(Map<String, dynamic> json) = _$_Token.fromJson;

  @override
  String get access_token;
  @override
  String? get token_type;
  @override
  int? get expires_in;
  @override
  String? get TenantId;
  @override
  String? get LoginId;
  @override
  String? get Dantai;
  @override
  String? get UserName;
  @override
  @JsonKey(ignore: true)
  _$$_TokenCopyWith<_$_Token> get copyWith =>
      throw _privateConstructorUsedError;
}
