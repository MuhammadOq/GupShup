// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'other_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ScheduledMessageModel _$ScheduledMessageModelFromJson(
    Map<String, dynamic> json) {
  return _ScheduledMessageModel.fromJson(json);
}

/// @nodoc
mixin _$ScheduledMessageModel {
  String get messageId => throw _privateConstructorUsedError;
  String get senderId => throw _privateConstructorUsedError;
  String get chatId => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  MessageType get type => throw _privateConstructorUsedError;
  DateTime get scheduledTime => throw _privateConstructorUsedError;
  bool get isSent => throw _privateConstructorUsedError;

  /// Serializes this ScheduledMessageModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ScheduledMessageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ScheduledMessageModelCopyWith<ScheduledMessageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduledMessageModelCopyWith<$Res> {
  factory $ScheduledMessageModelCopyWith(ScheduledMessageModel value,
          $Res Function(ScheduledMessageModel) then) =
      _$ScheduledMessageModelCopyWithImpl<$Res, ScheduledMessageModel>;
  @useResult
  $Res call(
      {String messageId,
      String senderId,
      String chatId,
      String content,
      MessageType type,
      DateTime scheduledTime,
      bool isSent});
}

/// @nodoc
class _$ScheduledMessageModelCopyWithImpl<$Res,
        $Val extends ScheduledMessageModel>
    implements $ScheduledMessageModelCopyWith<$Res> {
  _$ScheduledMessageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ScheduledMessageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messageId = null,
    Object? senderId = null,
    Object? chatId = null,
    Object? content = null,
    Object? type = null,
    Object? scheduledTime = null,
    Object? isSent = null,
  }) {
    return _then(_value.copyWith(
      messageId: null == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as String,
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      chatId: null == chatId
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MessageType,
      scheduledTime: null == scheduledTime
          ? _value.scheduledTime
          : scheduledTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isSent: null == isSent
          ? _value.isSent
          : isSent // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScheduledMessageModelImplCopyWith<$Res>
    implements $ScheduledMessageModelCopyWith<$Res> {
  factory _$$ScheduledMessageModelImplCopyWith(
          _$ScheduledMessageModelImpl value,
          $Res Function(_$ScheduledMessageModelImpl) then) =
      __$$ScheduledMessageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String messageId,
      String senderId,
      String chatId,
      String content,
      MessageType type,
      DateTime scheduledTime,
      bool isSent});
}

/// @nodoc
class __$$ScheduledMessageModelImplCopyWithImpl<$Res>
    extends _$ScheduledMessageModelCopyWithImpl<$Res,
        _$ScheduledMessageModelImpl>
    implements _$$ScheduledMessageModelImplCopyWith<$Res> {
  __$$ScheduledMessageModelImplCopyWithImpl(_$ScheduledMessageModelImpl _value,
      $Res Function(_$ScheduledMessageModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScheduledMessageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messageId = null,
    Object? senderId = null,
    Object? chatId = null,
    Object? content = null,
    Object? type = null,
    Object? scheduledTime = null,
    Object? isSent = null,
  }) {
    return _then(_$ScheduledMessageModelImpl(
      messageId: null == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as String,
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      chatId: null == chatId
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MessageType,
      scheduledTime: null == scheduledTime
          ? _value.scheduledTime
          : scheduledTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isSent: null == isSent
          ? _value.isSent
          : isSent // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScheduledMessageModelImpl implements _ScheduledMessageModel {
  const _$ScheduledMessageModelImpl(
      {required this.messageId,
      required this.senderId,
      required this.chatId,
      required this.content,
      required this.type,
      required this.scheduledTime,
      this.isSent = false});

  factory _$ScheduledMessageModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScheduledMessageModelImplFromJson(json);

  @override
  final String messageId;
  @override
  final String senderId;
  @override
  final String chatId;
  @override
  final String content;
  @override
  final MessageType type;
  @override
  final DateTime scheduledTime;
  @override
  @JsonKey()
  final bool isSent;

  @override
  String toString() {
    return 'ScheduledMessageModel(messageId: $messageId, senderId: $senderId, chatId: $chatId, content: $content, type: $type, scheduledTime: $scheduledTime, isSent: $isSent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScheduledMessageModelImpl &&
            (identical(other.messageId, messageId) ||
                other.messageId == messageId) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.chatId, chatId) || other.chatId == chatId) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.scheduledTime, scheduledTime) ||
                other.scheduledTime == scheduledTime) &&
            (identical(other.isSent, isSent) || other.isSent == isSent));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, messageId, senderId, chatId,
      content, type, scheduledTime, isSent);

  /// Create a copy of ScheduledMessageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ScheduledMessageModelImplCopyWith<_$ScheduledMessageModelImpl>
      get copyWith => __$$ScheduledMessageModelImplCopyWithImpl<
          _$ScheduledMessageModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScheduledMessageModelImplToJson(
      this,
    );
  }
}

abstract class _ScheduledMessageModel implements ScheduledMessageModel {
  const factory _ScheduledMessageModel(
      {required final String messageId,
      required final String senderId,
      required final String chatId,
      required final String content,
      required final MessageType type,
      required final DateTime scheduledTime,
      final bool isSent}) = _$ScheduledMessageModelImpl;

  factory _ScheduledMessageModel.fromJson(Map<String, dynamic> json) =
      _$ScheduledMessageModelImpl.fromJson;

  @override
  String get messageId;
  @override
  String get senderId;
  @override
  String get chatId;
  @override
  String get content;
  @override
  MessageType get type;
  @override
  DateTime get scheduledTime;
  @override
  bool get isSent;

  /// Create a copy of ScheduledMessageModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScheduledMessageModelImplCopyWith<_$ScheduledMessageModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PollModel _$PollModelFromJson(Map<String, dynamic> json) {
  return _PollModel.fromJson(json);
}

/// @nodoc
mixin _$PollModel {
  String get pollId => throw _privateConstructorUsedError;
  String get question => throw _privateConstructorUsedError;
  List<String> get options => throw _privateConstructorUsedError;
  Map<String, List<String>> get votes =>
      throw _privateConstructorUsedError; // Option index -> List of UIDs
  String get creatorId => throw _privateConstructorUsedError;

  /// Serializes this PollModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PollModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PollModelCopyWith<PollModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PollModelCopyWith<$Res> {
  factory $PollModelCopyWith(PollModel value, $Res Function(PollModel) then) =
      _$PollModelCopyWithImpl<$Res, PollModel>;
  @useResult
  $Res call(
      {String pollId,
      String question,
      List<String> options,
      Map<String, List<String>> votes,
      String creatorId});
}

/// @nodoc
class _$PollModelCopyWithImpl<$Res, $Val extends PollModel>
    implements $PollModelCopyWith<$Res> {
  _$PollModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PollModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pollId = null,
    Object? question = null,
    Object? options = null,
    Object? votes = null,
    Object? creatorId = null,
  }) {
    return _then(_value.copyWith(
      pollId: null == pollId
          ? _value.pollId
          : pollId // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      options: null == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<String>,
      votes: null == votes
          ? _value.votes
          : votes // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>>,
      creatorId: null == creatorId
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PollModelImplCopyWith<$Res>
    implements $PollModelCopyWith<$Res> {
  factory _$$PollModelImplCopyWith(
          _$PollModelImpl value, $Res Function(_$PollModelImpl) then) =
      __$$PollModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String pollId,
      String question,
      List<String> options,
      Map<String, List<String>> votes,
      String creatorId});
}

/// @nodoc
class __$$PollModelImplCopyWithImpl<$Res>
    extends _$PollModelCopyWithImpl<$Res, _$PollModelImpl>
    implements _$$PollModelImplCopyWith<$Res> {
  __$$PollModelImplCopyWithImpl(
      _$PollModelImpl _value, $Res Function(_$PollModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PollModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pollId = null,
    Object? question = null,
    Object? options = null,
    Object? votes = null,
    Object? creatorId = null,
  }) {
    return _then(_$PollModelImpl(
      pollId: null == pollId
          ? _value.pollId
          : pollId // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      options: null == options
          ? _value._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<String>,
      votes: null == votes
          ? _value._votes
          : votes // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>>,
      creatorId: null == creatorId
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PollModelImpl implements _PollModel {
  const _$PollModelImpl(
      {required this.pollId,
      required this.question,
      required final List<String> options,
      final Map<String, List<String>> votes = const {},
      required this.creatorId})
      : _options = options,
        _votes = votes;

  factory _$PollModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PollModelImplFromJson(json);

  @override
  final String pollId;
  @override
  final String question;
  final List<String> _options;
  @override
  List<String> get options {
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_options);
  }

  final Map<String, List<String>> _votes;
  @override
  @JsonKey()
  Map<String, List<String>> get votes {
    if (_votes is EqualUnmodifiableMapView) return _votes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_votes);
  }

// Option index -> List of UIDs
  @override
  final String creatorId;

  @override
  String toString() {
    return 'PollModel(pollId: $pollId, question: $question, options: $options, votes: $votes, creatorId: $creatorId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PollModelImpl &&
            (identical(other.pollId, pollId) || other.pollId == pollId) &&
            (identical(other.question, question) ||
                other.question == question) &&
            const DeepCollectionEquality().equals(other._options, _options) &&
            const DeepCollectionEquality().equals(other._votes, _votes) &&
            (identical(other.creatorId, creatorId) ||
                other.creatorId == creatorId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      pollId,
      question,
      const DeepCollectionEquality().hash(_options),
      const DeepCollectionEquality().hash(_votes),
      creatorId);

  /// Create a copy of PollModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PollModelImplCopyWith<_$PollModelImpl> get copyWith =>
      __$$PollModelImplCopyWithImpl<_$PollModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PollModelImplToJson(
      this,
    );
  }
}

abstract class _PollModel implements PollModel {
  const factory _PollModel(
      {required final String pollId,
      required final String question,
      required final List<String> options,
      final Map<String, List<String>> votes,
      required final String creatorId}) = _$PollModelImpl;

  factory _PollModel.fromJson(Map<String, dynamic> json) =
      _$PollModelImpl.fromJson;

  @override
  String get pollId;
  @override
  String get question;
  @override
  List<String> get options;
  @override
  Map<String, List<String>> get votes; // Option index -> List of UIDs
  @override
  String get creatorId;

  /// Create a copy of PollModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PollModelImplCopyWith<_$PollModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SafeZoneModel _$SafeZoneModelFromJson(Map<String, dynamic> json) {
  return _SafeZoneModel.fromJson(json);
}

/// @nodoc
mixin _$SafeZoneModel {
  String get zoneId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  double get radius => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;

  /// Serializes this SafeZoneModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SafeZoneModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SafeZoneModelCopyWith<SafeZoneModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SafeZoneModelCopyWith<$Res> {
  factory $SafeZoneModelCopyWith(
          SafeZoneModel value, $Res Function(SafeZoneModel) then) =
      _$SafeZoneModelCopyWithImpl<$Res, SafeZoneModel>;
  @useResult
  $Res call(
      {String zoneId,
      String name,
      double latitude,
      double longitude,
      double radius,
      bool isActive});
}

/// @nodoc
class _$SafeZoneModelCopyWithImpl<$Res, $Val extends SafeZoneModel>
    implements $SafeZoneModelCopyWith<$Res> {
  _$SafeZoneModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SafeZoneModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? zoneId = null,
    Object? name = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? radius = null,
    Object? isActive = null,
  }) {
    return _then(_value.copyWith(
      zoneId: null == zoneId
          ? _value.zoneId
          : zoneId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      radius: null == radius
          ? _value.radius
          : radius // ignore: cast_nullable_to_non_nullable
              as double,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SafeZoneModelImplCopyWith<$Res>
    implements $SafeZoneModelCopyWith<$Res> {
  factory _$$SafeZoneModelImplCopyWith(
          _$SafeZoneModelImpl value, $Res Function(_$SafeZoneModelImpl) then) =
      __$$SafeZoneModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String zoneId,
      String name,
      double latitude,
      double longitude,
      double radius,
      bool isActive});
}

/// @nodoc
class __$$SafeZoneModelImplCopyWithImpl<$Res>
    extends _$SafeZoneModelCopyWithImpl<$Res, _$SafeZoneModelImpl>
    implements _$$SafeZoneModelImplCopyWith<$Res> {
  __$$SafeZoneModelImplCopyWithImpl(
      _$SafeZoneModelImpl _value, $Res Function(_$SafeZoneModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SafeZoneModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? zoneId = null,
    Object? name = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? radius = null,
    Object? isActive = null,
  }) {
    return _then(_$SafeZoneModelImpl(
      zoneId: null == zoneId
          ? _value.zoneId
          : zoneId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      radius: null == radius
          ? _value.radius
          : radius // ignore: cast_nullable_to_non_nullable
              as double,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SafeZoneModelImpl implements _SafeZoneModel {
  const _$SafeZoneModelImpl(
      {required this.zoneId,
      required this.name,
      required this.latitude,
      required this.longitude,
      required this.radius,
      this.isActive = true});

  factory _$SafeZoneModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SafeZoneModelImplFromJson(json);

  @override
  final String zoneId;
  @override
  final String name;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final double radius;
  @override
  @JsonKey()
  final bool isActive;

  @override
  String toString() {
    return 'SafeZoneModel(zoneId: $zoneId, name: $name, latitude: $latitude, longitude: $longitude, radius: $radius, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SafeZoneModelImpl &&
            (identical(other.zoneId, zoneId) || other.zoneId == zoneId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.radius, radius) || other.radius == radius) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, zoneId, name, latitude, longitude, radius, isActive);

  /// Create a copy of SafeZoneModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SafeZoneModelImplCopyWith<_$SafeZoneModelImpl> get copyWith =>
      __$$SafeZoneModelImplCopyWithImpl<_$SafeZoneModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SafeZoneModelImplToJson(
      this,
    );
  }
}

abstract class _SafeZoneModel implements SafeZoneModel {
  const factory _SafeZoneModel(
      {required final String zoneId,
      required final String name,
      required final double latitude,
      required final double longitude,
      required final double radius,
      final bool isActive}) = _$SafeZoneModelImpl;

  factory _SafeZoneModel.fromJson(Map<String, dynamic> json) =
      _$SafeZoneModelImpl.fromJson;

  @override
  String get zoneId;
  @override
  String get name;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  double get radius;
  @override
  bool get isActive;

  /// Create a copy of SafeZoneModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SafeZoneModelImplCopyWith<_$SafeZoneModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
