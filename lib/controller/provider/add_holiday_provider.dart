import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hrm_project/model/holiday_model.dart';
import 'package:hrm_project/view/utils/snackbar_utils.dart';

class AddHolidayProvider with ChangeNotifier {
  TextEditingController holidayNameController = TextEditingController();
  TextEditingController descreptionController = TextEditingController();
  TextEditingController holidayController = TextEditingController();
  Future<void> setHolidayDate(BuildContext context) async {
    final DateTime currentDate = DateTime.now();
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      firstDate: DateTime(currentDate.year - 10),
      lastDate: currentDate,
      initialDate: currentDate,
    );
    if (selectedDate != null) {
      holidayController.text = formatDate(selectedDate);
    }
    notifyListeners();
  }

  String formatDate(DateTime date) {
    return '${date.day}-${date.month}-${date.year}';
  }

  Future<void> addHoliday() async {
    try {
      FirebaseFirestore.instance
          .collection('Holiday')
          .doc(holidayController.text)
          .set({
        'leave from date': holidayController.text,
        'holiday name': holidayNameController.text,
        'descreption': descreptionController.text,
      });
      SnackBarUtils.showMessage('Add holiday succesfully');
    } catch (e) {
      SnackBarUtils.showMessage('Add holiday failed');
    }
  }

  Future<HolidayModel?> getHoliday(String holidayId) async {
    final CollectionReference holidayCollection =
        FirebaseFirestore.instance.collection('Holiday');
    try {
      DocumentSnapshot document = await holidayCollection.doc(holidayId).get();
      if (document.exists) {
        var holiday =
            HolidayModel.fromJson(document.data() as Map<String, dynamic>);
        holidayController.text = holiday.holidayDate.toString();
        holidayNameController.text = holiday.holidayName;
        descreptionController.text = holiday.descreption;
        notifyListeners();
        return holiday;
      } else {
        log('leave not found');
        return null;
      }
    } catch (e) {
      SnackBarUtils.showMessage('failed');
      return null;
    }
  }
}
