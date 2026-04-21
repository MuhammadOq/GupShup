import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String uid,
    required String phoneNumber,
    String? displayName,
    String? photoUrl,
    String? about,
    @Default(true) bool isOnline,
    DateTime? lastSeen,
    String? pushToken,
    @Default([]) List<String> blockedUsers,
    @Default({}) Map<String, dynamic> privacySettings,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}
