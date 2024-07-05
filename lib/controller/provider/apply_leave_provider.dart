import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hrm_project/model/leave_model.dart';
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
        'leave status': leaveValue,
        'apply From': applyFromController.text,
        'apply To': applyToController.text,
        'reason': reasonToController.text,
        'no of days': noOfController.text
      });
      SnackBarUtils.showMessage('leave added success');
    } catch (e) {
      SnackBarUtils.showMessage('leave added failed');
    }
    notifyListeners();
  }

  Future<LeaveModel?> getLeaveStatus(String leaveId) async {
    final CollectionReference leaveCollection =
        FirebaseFirestore.instance.collection('Leave');
    try {
      DocumentSnapshot document = await leaveCollection.doc(leaveId).get();
      if (document.exists) {
        var leaveStatus =
            LeaveModel.fromJson(document.data() as Map<String, dynamic>);
        applyFromController.text = leaveStatus.leaveFrom.toString();
        applyToController.text = leaveStatus.leaveTo.toString();
        reasonToController.text = leaveStatus.reason;
        noOfController.text = leaveStatus.days;
        leaveValue = leaveStatus.leaveType;
        notifyListeners();
        return leaveStatus;
      } else {
        log('leave not found');
        return null;
      }
    } catch (e) {
      SnackBarUtils.showMessage('get leave status failed');
      return null;
    }
  }
}
