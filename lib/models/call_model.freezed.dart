// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'call_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CallModel _$CallModelFromJson(Map<String, dynamic> json) {
  return _CallModel.fromJson(json);
}

/// @nodoc
mixin _$CallModel {
  String get callId => throw _privateConstructorUsedError;
  String get callerId => throw _privateConstructorUsedError;
  List<String> get receiverIds => throw _privateConstructorUsedError;
  CallType get type => throw _privateConstructorUsedError;
  CallStatus get status => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  int? get durationInSeconds => throw _privateConstructorUsedError;
  String get channelName => throw _privateConstructorUsedError;

  /// Serializes this CallModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CallModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CallModelCopyWith<CallModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CallModelCopyWith<$Res> {
  factory $CallModelCopyWith(CallModel value, $Res Function(CallModel) then) =
      _$CallModelCopyWithImpl<$Res, CallModel>;
  @useResult
  $Res call(
      {String callId,
      String callerId,
      List<String> receiverIds,
      CallType type,
      CallStatus status,
      DateTime timestamp,
      int? durationInSeconds,
      String channelName});
}

/// @nodoc
class _$CallModelCopyWithImpl<$Res, $Val extends CallModel>
    implements $CallModelCopyWith<$Res> {
  _$CallModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CallModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? callId = null,
    Object? callerId = null,
    Object? receiverIds = null,
    Object? type = null,
    Object? status = null,
    Object? timestamp = null,
    Object? durationInSeconds = freezed,
    Object? channelName = null,
  }) {
    return _then(_value.copyWith(
      callId: null == callId
          ? _value.callId
          : callId // ignore: cast_nullable_to_non_nullable
              as String,
      callerId: null == callerId
          ? _value.callerId
          : callerId // ignore: cast_nullable_to_non_nullable
              as String,
      receiverIds: null == receiverIds
          ? _value.receiverIds
          : receiverIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CallType,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CallStatus,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      durationInSeconds: freezed == durationInSeconds
          ? _value.durationInSeconds
          : durationInSeconds // ignore: cast_nullable_to_non_nullable
              as int?,
      channelName: null == channelName
          ? _value.channelName
          : channelName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CallModelImplCopyWith<$Res>
    implements $CallModelCopyWith<$Res> {
  factory _$$CallModelImplCopyWith(
          _$CallModelImpl value, $Res Function(_$CallModelImpl) then) =
      __$$CallModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String callId,
      String callerId,
      List<String> receiverIds,
      CallType type,
      CallStatus status,
      DateTime timestamp,
      int? durationInSeconds,
      String channelName});
}

/// @nodoc
class __$$CallModelImplCopyWithImpl<$Res>
    extends _$CallModelCopyWithImpl<$Res, _$CallModelImpl>
    implements _$$CallModelImplCopyWith<$Res> {
  __$$CallModelImplCopyWithImpl(
      _$CallModelImpl _value, $Res Function(_$CallModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CallModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? callId = null,
    Object? callerId = null,
    Object? receiverIds = null,
    Object? type = null,
    Object? status = null,
    Object? timestamp = null,
    Object? durationInSeconds = freezed,
    Object? channelName = null,
  }) {
    return _then(_$CallModelImpl(
      callId: null == callId
          ? _value.callId
          : callId // ignore: cast_nullable_to_non_nullable
              as String,
      callerId: null == callerId
          ? _value.callerId
          : callerId // ignore: cast_nullable_to_non_nullable
              as String,
      receiverIds: null == receiverIds
          ? _value._receiverIds
          : receiverIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CallType,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CallStatus,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      durationInSeconds: freezed == durationInSeconds
          ? _value.durationInSeconds
          : durationInSeconds // ignore: cast_nullable_to_non_nullable
              as int?,
      channelName: null == channelName
          ? _value.channelName
          : channelName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CallModelImpl implements _CallModel {
  const _$CallModelImpl(
      {required this.callId,
      required this.callerId,
      required final List<String> receiverIds,
      required this.type,
      required this.status,
      required this.timestamp,
      this.durationInSeconds,
      required this.channelName})
      : _receiverIds = receiverIds;

  factory _$CallModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CallModelImplFromJson(json);

  @override
  final String callId;
  @override
  final String callerId;
  final List<String> _receiverIds;
  @override
  List<String> get receiverIds {
    if (_receiverIds is EqualUnmodifiableListView) return _receiverIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_receiverIds);
  }

  @override
  final CallType type;
  @override
  final CallStatus status;
  @override
  final DateTime timestamp;
  @override
  final int? durationInSeconds;
  @override
  final String channelName;

  @override
  String toString() {
    return 'CallModel(callId: $callId, callerId: $callerId, receiverIds: $receiverIds, type: $type, status: $status, timestamp: $timestamp, durationInSeconds: $durationInSeconds, channelName: $channelName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CallModelImpl &&
            (identical(other.callId, callId) || other.callId == callId) &&
            (identical(other.callerId, callerId) ||
                other.callerId == callerId) &&
            const DeepCollectionEquality()
                .equals(other._receiverIds, _receiverIds) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.durationInSeconds, durationInSeconds) ||
                other.durationInSeconds == durationInSeconds) &&
            (identical(other.channelName, channelName) ||
                other.channelName == channelName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      callId,
      callerId,
      const DeepCollectionEquality().hash(_receiverIds),
      type,
      status,
      timestamp,
      durationInSeconds,
      channelName);

  /// Create a copy of CallModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CallModelImplCopyWith<_$CallModelImpl> get copyWith =>
      __$$CallModelImplCopyWithImpl<_$CallModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CallModelImplToJson(
      this,
    );
  }
}

abstract class _CallModel implements CallModel {
  const factory _CallModel(
      {required final String callId,
      required final String callerId,
      required final List<String> receiverIds,
      required final CallType type,
      required final CallStatus status,
      required final DateTime timestamp,
      final int? durationInSeconds,
      required final String channelName}) = _$CallModelImpl;

  factory _CallModel.fromJson(Map<String, dynamic> json) =
      _$CallModelImpl.fromJson;

  @override
  String get callId;
  @override
  String get callerId;
  @override
  List<String> get receiverIds;
  @override
  CallType get type;
  @override
  CallStatus get status;
  @override
  DateTime get timestamp;
  @override
  int? get durationInSeconds;
  @override
  String get channelName;

  /// Create a copy of CallModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CallModelImplCopyWith<_$CallModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
