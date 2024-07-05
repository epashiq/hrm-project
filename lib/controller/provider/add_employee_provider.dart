// import 'dart:developer';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:hrm_project/model/employee_model.dart';
// import 'package:hrm_project/view/utils/snackbar_utils.dart';

// class AddEmployeeProvider with ChangeNotifier {
//   TextEditingController dateController = TextEditingController();
//   TextEditingController nameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController phoneController = TextEditingController();
//   TextEditingController addressController = TextEditingController();
//   TextEditingController dobController = TextEditingController();
//   TextEditingController countryController = TextEditingController();
//   TextEditingController stateController = TextEditingController();
//   TextEditingController cityController = TextEditingController();
//   String? department;
//   String? designation;

//   Future<void> setDob(BuildContext context) async {
//     final DateTime currentDate = DateTime.now();
//     final DateTime? selectedDate = await showDatePicker(
//         context: context,
//         firstDate: DateTime(currentDate.year - 10),
//         lastDate: currentDate,
//         initialDate: currentDate);
//     if (selectedDate != null) {
//       dobController.text = formatDate(selectedDate);
//     }
//     notifyListeners();
//   }

//   Future<void> setJoiningDate(BuildContext context) async {
//     final DateTime currentDate = DateTime.now();
//     final DateTime? selectedDate = await showDatePicker(
//         context: context,
//         firstDate: DateTime(currentDate.year - 10),
//         lastDate: currentDate,
//         initialDate: currentDate);
//     if (selectedDate != null) {
//       dateController.text = formatDate(selectedDate);
//     }
//     notifyListeners();
//   }

//   String formatDate(DateTime date) {
//     return '${date.day}-${date.month}-${date.year}';
//   }

//   Future<void> addEmployee() async {
//     try {
//       await FirebaseFirestore.instance
//           .collection('Employee')
//           .doc(emailController.text)
//           .set({
//         'name': nameController.text,
//         'email': emailController.text,
//         'phone': phoneController.text,
//         'address': addressController.text,
//         'Date Of Birth': dobController.text,
//         'country': countryController.text, // Fixed
//         'state': stateController.text, // Fixed
//         'city': cityController.text, // Fixed
//         'department': department,
//         'designation': designation,
//       });
//       SnackBarUtils.showMessage('Employee added successfully!');
//     } catch (e) {
//       log(e.toString());
//       SnackBarUtils.showMessage('Failed to add employee: ${e.toString()}');
//     }
//     notifyListeners();
//     clearForm();
//   }

//   void clearForm() {
//     nameController.clear();
//     emailController.clear();
//     phoneController.clear();
//     addressController.clear();
//     dobController.clear();
//     dateController.clear();
//     countryController.clear();
//     stateController.clear();
//     cityController.clear();
//     department = null;
//     designation = null;
//     notifyListeners();
//   }

//   Future<EmployeeModel?> getEmployee(String employeeId) async {
//     final CollectionReference employeesCollection =
//         FirebaseFirestore.instance.collection('employees');
//     try {
//       DocumentSnapshot doc = await employeesCollection.doc(employeeId).get();

//       if (doc.exists) {
//         return EmployeeModel.fromJson(doc.data() as Map<String, dynamic>);
//       } else {
//         log('Employee not found');
//         return null;
//       }
//     } catch (e) {
//       log('Error fetching employee: $e');
//       return null;
//     }
//   }
// }

import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hrm_project/model/employee_model.dart';
import 'package:hrm_project/view/utils/snackbar_utils.dart';

class AddEmployeeProvider with ChangeNotifier {
  TextEditingController dateController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController joiningDateController = TextEditingController();
  String? department;
  String? designation;

  Future<void> setDob(BuildContext context) async {
    final DateTime currentDate = DateTime.now();
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      firstDate: DateTime(currentDate.year - 10),
      lastDate: currentDate,
      initialDate: currentDate,
    );
    if (selectedDate != null) {
      dobController.text = formatDate(selectedDate);
    }
    notifyListeners();
  }

  Future<void> setJoiningDate(BuildContext context) async {
    final DateTime currentDate = DateTime.now();
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      firstDate: DateTime(currentDate.year - 10),
      lastDate: currentDate,
      initialDate: currentDate,
    );
    if (selectedDate != null) {
      joiningDateController.text = formatDate(selectedDate);
    }
    notifyListeners();
  }

  String formatDate(DateTime date) {
    return '${date.day}-${date.month}-${date.year}';
  }

  Future<void> addEmployee() async {
    try {
      await FirebaseFirestore.instance
          .collection('Employee')
          .doc(emailController.text)
          .set({
        'name': nameController.text,
        'email': emailController.text,
        'phone': phoneController.text,
        'address': addressController.text,
        'Date Of Birth': dobController.text,
        'joiningDate': joiningDateController.text,
        'country': countryController.text,
        'state': stateController.text,
        'city': cityController.text,
        'department': department,
        'designation': designation,
      });
      SnackBarUtils.showMessage('Employee added successfully!');
    } catch (e) {
      log(e.toString());
      SnackBarUtils.showMessage('Failed to add employee: ${e.toString()}');
    }
    notifyListeners();
    clearForm();
  }
  // Future<void> addEmployee() async {
  //   final docRef = FirebaseFirestore.instance.collection('employees').doc();
  //   final employee = EmployeeModel(
  //     id: docRef.id,
  //     name: nameController.text,
  //     email: emailController.text,
  //     phone: phoneController.text,
  //     address: addressController.text,
  //     dob: DateTime.parse(dobController.text),
  //     joiningDate: DateTime.parse(joiningDateController.text),
  //     country: countryController.text,
  //     state: stateController.text,
  //     city: cityController.text,
  //     department: department!,
  //     designation: designation!,
  //   );

  //   await docRef.set(employee.toJson());
  //   notifyListeners();
  // }
  Future<EmployeeModel?> getEmployee(String employeeId) async {
    final CollectionReference employeesCollection =
        FirebaseFirestore.instance.collection('employees');
    try {
      DocumentSnapshot doc = await employeesCollection.doc(employeeId).get();

      if (doc.exists) {
        var employee =
            EmployeeModel.fromJson(doc.data() as Map<String, dynamic>);
        nameController.text = employee.name;
        emailController.text = employee.email;
        phoneController.text = employee.phone;
        addressController.text = employee.address;
        dobController.text = employee.dob.toString();
        joiningDateController.text = employee.joiningDate.toString();
        countryController.text = employee.country;
        cityController.text = employee.city;
        stateController.text = employee.state;
        department = employee.department;
        designation = employee.designation;
        notifyListeners();
        return employee;
      } else {
        log('Employee not found');
        return null;
      }
    } catch (e) {
      log('Error fetching employee: $e');
      return null;
    }
  }

  void clearForm() {
    nameController.clear();
    emailController.clear();
    phoneController.clear();
    addressController.clear();
    dobController.clear();
    dateController.clear();
    joiningDateController.clear();
    countryController.clear();
    stateController.clear();
    cityController.clear();
    department = null;
    designation = null;
    notifyListeners();
  }

  Future<void> editEmployee() async {
    try {
      await FirebaseFirestore.instance
          .collection('Employee')
          .doc(emailController.text)
          .update({
        'name': nameController.text,
        'email': emailController.text,
        'phone': phoneController.text,
        'address': addressController.text,
        'Date Of Birth': dobController.text,
        'joiningDate': joiningDateController.text,
        'country': countryController.text,
        'state': stateController.text,
        'city': cityController.text,
        'department': department,
        'designation': designation,
      });
    } catch (e) {
      SnackBarUtils.showMessage('failed');
    }
    notifyListeners();
  }

  Future<void> deleteEmployee(BuildContext context, String documentId) async {
    try {
      await FirebaseFirestore.instance
          .collection('Employee')
          .doc(documentId)
          .delete();
    } catch (e) {
      log(e.toString());
      SnackBarUtils.showMessage('deleting employee failed');
    }
  }
}
