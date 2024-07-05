// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leave_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LeaveModelImpl _$$LeaveModelImplFromJson(Map<String, dynamic> json) =>
    _$LeaveModelImpl(
      id: json['id'] as String,
      leaveFrom: DateTime.parse(json['leaveFrom'] as String),
      leaveTo: DateTime.parse(json['leaveTo'] as String),
      reason: json['reason'] as String,
      days: json['days'] as String,
      leaveType: json['leaveType'] as String,
    );

Map<String, dynamic> _$$LeaveModelImplToJson(_$LeaveModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'leaveFrom': instance.leaveFrom.toIso8601String(),
      'leaveTo': instance.leaveTo.toIso8601String(),
      'reason': instance.reason,
      'days': instance.days,
      'leaveType': instance.leaveType,
    };
