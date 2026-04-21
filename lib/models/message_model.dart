import 'package:freezed_annotation/freezed_annotation.dart';
import 'enums.dart';

part 'message_model.freezed.dart';
part 'message_model.g.dart';

@freezed
class MessageModel with _$MessageModel {
  const factory MessageModel({
    required String messageId,
    required String senderId,
    required String chatId,
    required String content,
    required MessageType type,
    required DateTime timestamp,
    @Default(MessageStatus.sending) MessageStatus status,
    String? replyToId,
    @Default({}) Map<String, String> reactions,
    @Default(false) bool isStarred,
    @Default(false) bool isDeleted,
    Map<String, dynamic>? metadata, // For location, contacts, etc.
  }) = _MessageModel;

  factory MessageModel.fromJson(Map<String, dynamic> json) => _$MessageModelFromJson(json);
}
