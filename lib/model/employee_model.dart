import 'package:freezed_annotation/freezed_annotation.dart';
part 'employee_model.freezed.dart';
part 'employee_model.g.dart';

@freezed
class EmployeeModel with _$EmployeeModel{
   factory EmployeeModel({
    required String id,
    required String name,
    required String email,
    required String phone,
    required String address,
    required DateTime dob,
    required DateTime joiningDate,
    required String country,
    required String state,
    required String city,
    required String department,
    required String designation,
  }) = _EmployeeModel;
  factory EmployeeModel.fromJson(Map<String, dynamic> json) =>
      _$EmployeeModelFromJson(json);
}