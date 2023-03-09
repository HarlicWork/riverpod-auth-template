import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response.model.freezed.dart';
part 'login_response.model.g.dart';


@freezed
class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    required String token,
    required String message,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}
