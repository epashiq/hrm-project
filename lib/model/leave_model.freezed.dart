// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leave_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LeaveModel _$LeaveModelFromJson(Map<String, dynamic> json) {
  return _LeaveModel.fromJson(json);
}

/// @nodoc
mixin _$LeaveModel {
  String get id => throw _privateConstructorUsedError;
  DateTime get leaveFrom => throw _privateConstructorUsedError;
  DateTime get leaveTo => throw _privateConstructorUsedError;
  String get reason => throw _privateConstructorUsedError;
  String get days => throw _privateConstructorUsedError;
  String get leaveType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LeaveModelCopyWith<LeaveModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeaveModelCopyWith<$Res> {
  factory $LeaveModelCopyWith(
          LeaveModel value, $Res Function(LeaveModel) then) =
      _$LeaveModelCopyWithImpl<$Res, LeaveModel>;
  @useResult
  $Res call(
      {String id,
      DateTime leaveFrom,
      DateTime leaveTo,
      String reason,
      String days,
      String leaveType});
}

/// @nodoc
class _$LeaveModelCopyWithImpl<$Res, $Val extends LeaveModel>
    implements $LeaveModelCopyWith<$Res> {
  _$LeaveModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? leaveFrom = null,
    Object? leaveTo = null,
    Object? reason = null,
    Object? days = null,
    Object? leaveType = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      leaveFrom: null == leaveFrom
          ? _value.leaveFrom
          : leaveFrom // ignore: cast_nullable_to_non_nullable
              as DateTime,
      leaveTo: null == leaveTo
          ? _value.leaveTo
          : leaveTo // ignore: cast_nullable_to_non_nullable
              as DateTime,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      days: null == days
          ? _value.days
          : days // ignore: cast_nullable_to_non_nullable
              as String,
      leaveType: null == leaveType
          ? _value.leaveType
          : leaveType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LeaveModelImplCopyWith<$Res>
    implements $LeaveModelCopyWith<$Res> {
  factory _$$LeaveModelImplCopyWith(
          _$LeaveModelImpl value, $Res Function(_$LeaveModelImpl) then) =
      __$$LeaveModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      DateTime leaveFrom,
      DateTime leaveTo,
      String reason,
      String days,
      String leaveType});
}

/// @nodoc
class __$$LeaveModelImplCopyWithImpl<$Res>
    extends _$LeaveModelCopyWithImpl<$Res, _$LeaveModelImpl>
    implements _$$LeaveModelImplCopyWith<$Res> {
  __$$LeaveModelImplCopyWithImpl(
      _$LeaveModelImpl _value, $Res Function(_$LeaveModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? leaveFrom = null,
    Object? leaveTo = null,
    Object? reason = null,
    Object? days = null,
    Object? leaveType = null,
  }) {
    return _then(_$LeaveModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      leaveFrom: null == leaveFrom
          ? _value.leaveFrom
          : leaveFrom // ignore: cast_nullable_to_non_nullable
              as DateTime,
      leaveTo: null == leaveTo
          ? _value.leaveTo
          : leaveTo // ignore: cast_nullable_to_non_nullable
              as DateTime,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      days: null == days
          ? _value.days
          : days // ignore: cast_nullable_to_non_nullable
              as String,
      leaveType: null == leaveType
          ? _value.leaveType
          : leaveType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LeaveModelImpl implements _LeaveModel {
  _$LeaveModelImpl(
      {required this.id,
      required this.leaveFrom,
      required this.leaveTo,
      required this.reason,
      required this.days,
      required this.leaveType});

  factory _$LeaveModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeaveModelImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime leaveFrom;
  @override
  final DateTime leaveTo;
  @override
  final String reason;
  @override
  final String days;
  @override
  final String leaveType;

  @override
  String toString() {
    return 'LeaveModel(id: $id, leaveFrom: $leaveFrom, leaveTo: $leaveTo, reason: $reason, days: $days, leaveType: $leaveType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeaveModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.leaveFrom, leaveFrom) ||
                other.leaveFrom == leaveFrom) &&
            (identical(other.leaveTo, leaveTo) || other.leaveTo == leaveTo) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.days, days) || other.days == days) &&
            (identical(other.leaveType, leaveType) ||
                other.leaveType == leaveType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, leaveFrom, leaveTo, reason, days, leaveType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeaveModelImplCopyWith<_$LeaveModelImpl> get copyWith =>
      __$$LeaveModelImplCopyWithImpl<_$LeaveModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeaveModelImplToJson(
      this,
    );
  }
}

abstract class _LeaveModel implements LeaveModel {
  factory _LeaveModel(
      {required final String id,
      required final DateTime leaveFrom,
      required final DateTime leaveTo,
      required final String reason,
      required final String days,
      required final String leaveType}) = _$LeaveModelImpl;

  factory _LeaveModel.fromJson(Map<String, dynamic> json) =
      _$LeaveModelImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get leaveFrom;
  @override
  DateTime get leaveTo;
  @override
  String get reason;
  @override
  String get days;
  @override
  String get leaveType;
  @override
  @JsonKey(ignore: true)
  _$$LeaveModelImplCopyWith<_$LeaveModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
