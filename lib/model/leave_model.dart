import 'package:freezed_annotation/freezed_annotation.dart';
part 'leave_model.freezed.dart';
part 'leave_model.g.dart';


@freezed
class LeaveModel with _$LeaveModel{
  factory LeaveModel({
     required String id,
    required DateTime leaveFrom,
    required DateTime leaveTo,
    required String reason,
    required String days,
    required String leaveType ,
  })= _LeaveModel;
  factory LeaveModel.fromJson(Map<String, dynamic> json) =>
      _$LeaveModelFromJson(json);
}