// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'refresh_token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RefreshToken _$RefreshTokenFromJson(Map<String, dynamic> json) {
  return _RefreshToken.fromJson(json);
}

/// @nodoc
mixin _$RefreshToken {
  @JsonKey(name: 'token')
  dynamic get token => throw _privateConstructorUsedError;
  @JsonKey(name: 'refresh_token')
  dynamic get refreshToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RefreshTokenCopyWith<RefreshToken> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RefreshTokenCopyWith<$Res> {
  factory $RefreshTokenCopyWith(
          RefreshToken value, $Res Function(RefreshToken) then) =
      _$RefreshTokenCopyWithImpl<$Res, RefreshToken>;
  @useResult
  $Res call(
      {@JsonKey(name: 'token') dynamic token,
      @JsonKey(name: 'refresh_token') dynamic refreshToken});
}

/// @nodoc
class _$RefreshTokenCopyWithImpl<$Res, $Val extends RefreshToken>
    implements $RefreshTokenCopyWith<$Res> {
  _$RefreshTokenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
    Object? refreshToken = freezed,
  }) {
    return _then(_value.copyWith(
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as dynamic,
      refreshToken: freezed == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RefreshTokenCopyWith<$Res>
    implements $RefreshTokenCopyWith<$Res> {
  factory _$$_RefreshTokenCopyWith(
          _$_RefreshToken value, $Res Function(_$_RefreshToken) then) =
      __$$_RefreshTokenCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'token') dynamic token,
      @JsonKey(name: 'refresh_token') dynamic refreshToken});
}

/// @nodoc
class __$$_RefreshTokenCopyWithImpl<$Res>
    extends _$RefreshTokenCopyWithImpl<$Res, _$_RefreshToken>
    implements _$$_RefreshTokenCopyWith<$Res> {
  __$$_RefreshTokenCopyWithImpl(
      _$_RefreshToken _value, $Res Function(_$_RefreshToken) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
    Object? refreshToken = freezed,
  }) {
    return _then(_$_RefreshToken(
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as dynamic,
      refreshToken: freezed == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RefreshToken implements _RefreshToken {
  _$_RefreshToken(
      {@JsonKey(name: 'token') this.token,
      @JsonKey(name: 'refresh_token') this.refreshToken});

  factory _$_RefreshToken.fromJson(Map<String, dynamic> json) =>
      _$$_RefreshTokenFromJson(json);

  @override
  @JsonKey(name: 'token')
  final dynamic token;
  @override
  @JsonKey(name: 'refresh_token')
  final dynamic refreshToken;

  @override
  String toString() {
    return 'RefreshToken(token: $token, refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RefreshToken &&
            const DeepCollectionEquality().equals(other.token, token) &&
            const DeepCollectionEquality()
                .equals(other.refreshToken, refreshToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(token),
      const DeepCollectionEquality().hash(refreshToken));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RefreshTokenCopyWith<_$_RefreshToken> get copyWith =>
      __$$_RefreshTokenCopyWithImpl<_$_RefreshToken>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RefreshTokenToJson(
      this,
    );
  }
}

abstract class _RefreshToken implements RefreshToken {
  factory _RefreshToken(
          {@JsonKey(name: 'token') final dynamic token,
          @JsonKey(name: 'refresh_token') final dynamic refreshToken}) =
      _$_RefreshToken;

  factory _RefreshToken.fromJson(Map<String, dynamic> json) =
      _$_RefreshToken.fromJson;

  @override
  @JsonKey(name: 'token')
  dynamic get token;
  @override
  @JsonKey(name: 'refresh_token')
  dynamic get refreshToken;
  @override
  @JsonKey(ignore: true)
  _$$_RefreshTokenCopyWith<_$_RefreshToken> get copyWith =>
      throw _privateConstructorUsedError;
}
