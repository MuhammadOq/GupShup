import 'package:freezed_annotation/freezed_annotation.dart';
import 'enums.dart';

part 'call_model.freezed.dart';
part 'call_model.g.dart';

@freezed
class CallModel with _$CallModel {
  const factory CallModel({
    required String callId,
    required String callerId,
    required List<String> receiverIds,
    required CallType type,
    required CallStatus status,
    required DateTime timestamp,
    int? durationInSeconds,
    required String channelName,
  }) = _CallModel;

  factory CallModel.fromJson(Map<String, dynamic> json) => _$CallModelFromJson(json);
}
