import 'package:freezed_annotation/freezed_annotation.dart';
import 'enums.dart';

part 'chat_model.freezed.dart';
part 'chat_model.g.dart';

@freezed
class ChatModel with _$ChatModel {
  const factory ChatModel({
    required String chatId,
    required ChatType type,
    required List<String> participants,
    String? lastMessage,
    DateTime? lastMessageTime,
    @Default(0) int unreadCount,
    String? groupName,
    String? groupIcon,
    @Default([]) List<String> admins,
    String? inviteLink,
    @Default(false) bool isArchived,
  }) = _ChatModel;

  factory ChatModel.fromJson(Map<String, dynamic> json) => _$ChatModelFromJson(json);
}
