import 'package:freezed_annotation/freezed_annotation.dart';
import 'enums.dart';

part 'other_models.freezed.dart';
part 'other_models.g.dart';

@freezed
class ScheduledMessageModel with _$ScheduledMessageModel {
  const factory ScheduledMessageModel({
    required String messageId,
    required String senderId,
    required String chatId,
    required String content,
    required MessageType type,
    required DateTime scheduledTime,
    @Default(false) bool isSent,
  }) = _ScheduledMessageModel;

  factory ScheduledMessageModel.fromJson(Map<String, dynamic> json) => _$ScheduledMessageModelFromJson(json);
}

@freezed
class PollModel with _$PollModel {
  const factory PollModel({
    required String pollId,
    required String question,
    required List<String> options,
    @Default({}) Map<String, List<String>> votes, // Option index -> List of UIDs
    required String creatorId,
  }) = _PollModel;

  factory PollModel.fromJson(Map<String, dynamic> json) => _$PollModelFromJson(json);
}

@freezed
class SafeZoneModel with _$SafeZoneModel {
  const factory SafeZoneModel({
    required String zoneId,
    required String name,
    required double latitude,
    required double longitude,
    required double radius,
    @Default(true) bool isActive,
  }) = _SafeZoneModel;

  factory SafeZoneModel.fromJson(Map<String, dynamic> json) => _$SafeZoneModelFromJson(json);
}
