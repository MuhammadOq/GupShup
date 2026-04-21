// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'call_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CallModelImpl _$$CallModelImplFromJson(Map<String, dynamic> json) =>
    _$CallModelImpl(
      callId: json['callId'] as String,
      callerId: json['callerId'] as String,
      receiverIds: (json['receiverIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      type: $enumDecode(_$CallTypeEnumMap, json['type']),
      status: $enumDecode(_$CallStatusEnumMap, json['status']),
      timestamp: DateTime.parse(json['timestamp'] as String),
      durationInSeconds: (json['durationInSeconds'] as num?)?.toInt(),
      channelName: json['channelName'] as String,
    );

Map<String, dynamic> _$$CallModelImplToJson(_$CallModelImpl instance) =>
    <String, dynamic>{
      'callId': instance.callId,
      'callerId': instance.callerId,
      'receiverIds': instance.receiverIds,
      'type': _$CallTypeEnumMap[instance.type]!,
      'status': _$CallStatusEnumMap[instance.status]!,
      'timestamp': instance.timestamp.toIso8601String(),
      'durationInSeconds': instance.durationInSeconds,
      'channelName': instance.channelName,
    };

const _$CallTypeEnumMap = {
  CallType.voice: 'voice',
  CallType.video: 'video',
};

const _$CallStatusEnumMap = {
  CallStatus.ringing: 'ringing',
  CallStatus.ongoing: 'ongoing',
  CallStatus.ended: 'ended',
  CallStatus.missed: 'missed',
};
