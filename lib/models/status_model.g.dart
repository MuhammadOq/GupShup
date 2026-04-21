// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StatusModelImpl _$$StatusModelImplFromJson(Map<String, dynamic> json) =>
    _$StatusModelImpl(
      statusId: json['statusId'] as String,
      uid: json['uid'] as String,
      imageUrl: json['imageUrl'] as String,
      caption: json['caption'] as String?,
      timestamp: DateTime.parse(json['timestamp'] as String),
      viewers: (json['viewers'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$StatusModelImplToJson(_$StatusModelImpl instance) =>
    <String, dynamic>{
      'statusId': instance.statusId,
      'uid': instance.uid,
      'imageUrl': instance.imageUrl,
      'caption': instance.caption,
      'timestamp': instance.timestamp.toIso8601String(),
      'viewers': instance.viewers,
    };
