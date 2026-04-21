// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatModelImpl _$$ChatModelImplFromJson(Map<String, dynamic> json) =>
    _$ChatModelImpl(
      chatId: json['chatId'] as String,
      type: $enumDecode(_$ChatTypeEnumMap, json['type']),
      participants: (json['participants'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      lastMessage: json['lastMessage'] as String?,
      lastMessageTime: json['lastMessageTime'] == null
          ? null
          : DateTime.parse(json['lastMessageTime'] as String),
      unreadCount: (json['unreadCount'] as num?)?.toInt() ?? 0,
      groupName: json['groupName'] as String?,
      groupIcon: json['groupIcon'] as String?,
      admins: (json['admins'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      inviteLink: json['inviteLink'] as String?,
      isArchived: json['isArchived'] as bool? ?? false,
    );

Map<String, dynamic> _$$ChatModelImplToJson(_$ChatModelImpl instance) =>
    <String, dynamic>{
      'chatId': instance.chatId,
      'type': _$ChatTypeEnumMap[instance.type]!,
      'participants': instance.participants,
      'lastMessage': instance.lastMessage,
      'lastMessageTime': instance.lastMessageTime?.toIso8601String(),
      'unreadCount': instance.unreadCount,
      'groupName': instance.groupName,
      'groupIcon': instance.groupIcon,
      'admins': instance.admins,
      'inviteLink': instance.inviteLink,
      'isArchived': instance.isArchived,
    };

const _$ChatTypeEnumMap = {
  ChatType.individual: 'individual',
  ChatType.group: 'group',
  ChatType.channel: 'channel',
};
