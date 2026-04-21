// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'other_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScheduledMessageModelImpl _$$ScheduledMessageModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ScheduledMessageModelImpl(
      messageId: json['messageId'] as String,
      senderId: json['senderId'] as String,
      chatId: json['chatId'] as String,
      content: json['content'] as String,
      type: $enumDecode(_$MessageTypeEnumMap, json['type']),
      scheduledTime: DateTime.parse(json['scheduledTime'] as String),
      isSent: json['isSent'] as bool? ?? false,
    );

Map<String, dynamic> _$$ScheduledMessageModelImplToJson(
        _$ScheduledMessageModelImpl instance) =>
    <String, dynamic>{
      'messageId': instance.messageId,
      'senderId': instance.senderId,
      'chatId': instance.chatId,
      'content': instance.content,
      'type': _$MessageTypeEnumMap[instance.type]!,
      'scheduledTime': instance.scheduledTime.toIso8601String(),
      'isSent': instance.isSent,
    };

const _$MessageTypeEnumMap = {
  MessageType.text: 'text',
  MessageType.image: 'image',
  MessageType.video: 'video',
  MessageType.audio: 'audio',
  MessageType.document: 'document',
  MessageType.location: 'location',
  MessageType.contact: 'contact',
  MessageType.sticker: 'sticker',
  MessageType.gif: 'gif',
  MessageType.poll: 'poll',
};

_$PollModelImpl _$$PollModelImplFromJson(Map<String, dynamic> json) =>
    _$PollModelImpl(
      pollId: json['pollId'] as String,
      question: json['question'] as String,
      options:
          (json['options'] as List<dynamic>).map((e) => e as String).toList(),
      votes: (json['votes'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(
                k, (e as List<dynamic>).map((e) => e as String).toList()),
          ) ??
          const {},
      creatorId: json['creatorId'] as String,
    );

Map<String, dynamic> _$$PollModelImplToJson(_$PollModelImpl instance) =>
    <String, dynamic>{
      'pollId': instance.pollId,
      'question': instance.question,
      'options': instance.options,
      'votes': instance.votes,
      'creatorId': instance.creatorId,
    };

_$SafeZoneModelImpl _$$SafeZoneModelImplFromJson(Map<String, dynamic> json) =>
    _$SafeZoneModelImpl(
      zoneId: json['zoneId'] as String,
      name: json['name'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      radius: (json['radius'] as num).toDouble(),
      isActive: json['isActive'] as bool? ?? true,
    );

Map<String, dynamic> _$$SafeZoneModelImplToJson(_$SafeZoneModelImpl instance) =>
    <String, dynamic>{
      'zoneId': instance.zoneId,
      'name': instance.name,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'radius': instance.radius,
      'isActive': instance.isActive,
    };
