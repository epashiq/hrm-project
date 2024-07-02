// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EmployeeModelImpl _$$EmployeeModelImplFromJson(Map<String, dynamic> json) =>
    _$EmployeeModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      address: json['address'] as String,
      dob: DateTime.parse(json['dob'] as String),
      joiningDate: DateTime.parse(json['joiningDate'] as String),
      country: json['country'] as String,
      state: json['state'] as String,
      city: json['city'] as String,
      department: json['department'] as String,
      designation: json['designation'] as String,
    );

Map<String, dynamic> _$$EmployeeModelImplToJson(_$EmployeeModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'address': instance.address,
      'dob': instance.dob.toIso8601String(),
      'joiningDate': instance.joiningDate.toIso8601String(),
      'country': instance.country,
      'state': instance.state,
      'city': instance.city,
      'department': instance.department,
      'designation': instance.designation,
    };
