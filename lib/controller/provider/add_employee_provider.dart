import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hrm_project/model/employee_model.dart';
import 'package:hrm_project/view/utils/snackbar_utils.dart';

class AddEmployeeProvider with ChangeNotifier {
  final dateController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final dobController = TextEditingController();
  final countryController = TextEditingController();
  final stateController = TextEditingController();
  final cityController = TextEditingController();
  String? department;
  String? designation;
  Future<void> setDob(BuildContext context) async {
    final DateTime currentDate = DateTime.now();
    final DateTime? selectedDate = await showDatePicker(
        context: context,
        firstDate: DateTime(currentDate.year - 10),
        lastDate: currentDate,
        initialDate: currentDate);
    if (selectedDate != null) {
      dobController.text = formateDate(selectedDate);
    }
    notifyListeners();
  }

  Future<void> setJoiningDate(BuildContext context) async {
    final DateTime currentDate = DateTime.now();
    final DateTime? selectedDate = await showDatePicker(
        context: context,
        firstDate: DateTime(currentDate.year - 10),
        lastDate: currentDate,
        initialDate: currentDate);
    if (selectedDate != null) {
      dateController.text = formateDate(selectedDate);
    }
    notifyListeners();
  }

  String formateDate(DateTime date) {
    return '${date.day}-${date.month}-${date.year}';
  }

  Future<void> addEmployee(BuildContext context) async {
    try {
      await FirebaseFirestore.instance.collection('Employee').add({
        'name': nameController.text,
        'email': emailController.text,
        'phone': phoneController.text,
        'address': addressController.text,
        'Date Of Birth': dobController.text,
        'country': countryController.text,
        'state': stateController.text,
        'city': cityController.text,
        'department': department,
        'designation': designation,
      });
      SnackBarUtils.showMessage('Employee added successfully!');
    } catch (e) {
      SnackBarUtils.showMessage('Employee added failed');
    }
    notifyListeners();

    void clearForm() {
      nameController.clear();
      emailController.clear();
      phoneController.clear();
      addressController.clear();
      dobController.clear();
      dateController.clear();
      countryController.clear();
      stateController.clear();
      cityController.clear();
      department = null;
      designation = null;
      notifyListeners();
    }
  }

  Future<EmployeeModel?> getEmployee(String employeeId) async {
    final CollectionReference employeesCollection =
        FirebaseFirestore.instance.collection('employees');
    try {
      DocumentSnapshot doc = await employeesCollection.doc(employeeId).get();

      if (doc.exists) {
        return EmployeeModel.fromJson(doc.data() as Map<String, dynamic>);
      } else {
        log('Employee not found');
        return null;
      }
    } catch (e) {
      log('Error fetching employee: $e');
      return null;
    }
  }
}
