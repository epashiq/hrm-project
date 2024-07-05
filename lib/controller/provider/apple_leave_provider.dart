import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hrm_project/view/utils/snackbar_utils.dart';

class ApplyLeaveProvider with ChangeNotifier {
  TextEditingController applyFromController = TextEditingController();
  TextEditingController applyToController = TextEditingController();
  TextEditingController noOfController = TextEditingController();
  TextEditingController reasonToController = TextEditingController();
  String? leaveValue;

  Future<void> setFromDate(BuildContext context) async {
    final DateTime currentDate = DateTime.now();
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      firstDate: DateTime(currentDate.year - 10),
      lastDate: currentDate,
      initialDate: currentDate,
    );
    if (selectedDate != null) {
      applyFromController.text = formatDate(selectedDate);
    }
    notifyListeners();
  }

  Future<void> setToDate(BuildContext context) async {
    final DateTime currentDate = DateTime.now();
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      firstDate: DateTime(currentDate.year - 10),
      lastDate: currentDate,
      initialDate: currentDate,
    );
    if (selectedDate != null) {
      applyToController.text = formatDate(selectedDate);
    }
    notifyListeners();
  }

  String formatDate(DateTime date) {
    return '${date.day}-${date.month}-${date.year}';
  }

  Future<void> addLeave() async {
    try {
      await FirebaseFirestore.instance
          .collection('Leave')
          .doc(noOfController.text)
          .set({
        'apply From': applyFromController.text,
        'apply To': applyToController.text,
        'reason': reasonToController.text,
        'no of days': noOfController.text
      });
      SnackBarUtils.showMessage('leave added success');
    } catch (e) {
      SnackBarUtils.showMessage('leave added failed');
    }
  }
}
