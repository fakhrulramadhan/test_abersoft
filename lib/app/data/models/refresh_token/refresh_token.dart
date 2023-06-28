// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'refresh_token.freezed.dart';
part 'refresh_token.g.dart';

@freezed
class RefreshToken with _$RefreshToken {
  factory RefreshToken(
      {@JsonKey(name: 'token') dynamic token,
      @JsonKey(name: 'refresh_token') dynamic refreshToken}) = _RefreshToken;

  factory RefreshToken.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenFromJson(json);
}
