// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'holiday_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HolidayModelImpl _$$HolidayModelImplFromJson(Map<String, dynamic> json) =>
    _$HolidayModelImpl(
      id: json['id'] as String,
      holidayDate: DateTime.parse(json['holidayDate'] as String),
      holidayName: json['holidayName'] as String,
      descreption: json['descreption'] as String,
    );

Map<String, dynamic> _$$HolidayModelImplToJson(_$HolidayModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'holidayDate': instance.holidayDate.toIso8601String(),
      'holidayName': instance.holidayName,
      'descreption': instance.descreption,
    };
