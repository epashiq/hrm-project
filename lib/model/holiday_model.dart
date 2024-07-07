import 'package:freezed_annotation/freezed_annotation.dart';
part 'holiday_model.freezed.dart';
part 'holiday_model.g.dart';
@freezed
class HolidayModel with _$HolidayModel{
  factory HolidayModel({
     required String id,
    required DateTime holidayDate,
    required String holidayName,
    required String descreption,
  }) = _HolidayModel;
   factory HolidayModel.fromJson(Map<String, dynamic> json) =>
      _$HolidayModelFromJson(json);
}