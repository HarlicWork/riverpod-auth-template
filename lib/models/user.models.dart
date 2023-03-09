import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.models.freezed.dart';
part 'user.models.g.dart';

@freezed
class UserData with _$UserData {
  const factory UserData({
    required String id,
    required String name,
    required String email,
    required String password,
    required int age,
  }) = _UserData;

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
