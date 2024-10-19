import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hrm_project/model/employee_model.dart';
import 'package:hrm_project/view/utils/snackbar_utils.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class AddEmployeeProvider with ChangeNotifier {
  TextEditingController dateController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  final dobController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  final joiningDateController = TextEditingController();
  String? department;
  String? designation;
  File? photo;
  String? imageUrl;
  final ImagePicker picker = ImagePicker();
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

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

  // Future<void> addEmployee() async {
  //   try {
  //     String? imageUrl = await uploadImage();

  //     if (imageUrl == null) {
  //       throw Exception('Image upload failed');
  //     }

  //     final employee = {
  //       'name': nameController.text,
  //       'email': emailController.text,
  //       'phone': phoneController.text,
  //       'address': addressController.text,
  //       'dob': dobController.text,
  //       'joiningDate': joiningDateController.text,
  //       'country': countryController.text,
  //       'state': stateController.text,
  //       'city': cityController.text,
  //       'department': department ?? '',
  //       'designation': designation ?? '',
  //       'imageUrl': imageUrl,
  //     };

  //     final docRef =
  //         await FirebaseFirestore.instance.collection('Employee').add(employee);
  //     await docRef.update({'id': docRef.id});

  //     SnackBarUtils.showMessage('Employee added successfully!');
  //     clearForm();
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print(e.toString());
  //     }
  //     SnackBarUtils.showMessage('Failed to add employee: ${e.toString()}');
  //   } finally {
  //     notifyListeners();
  //   }
  // }

  // Future addEmployee() async {
  //   try {
  //     String? imageUrl = await uploadImage();
  //     await FirebaseFirestore.instance
  //         .collection('Employee')
  //         .doc(emailController.text)
  //         .set({
  //       'name': nameController.text,
  //       'email': emailController.text,
  //       'phone': phoneController.text,
  //       'address': addressController.text,
  //       'Date Of Birth': dobController.text,
  //       'joiningDate': joiningDateController.text,
  //       'country': countryController.text,
  //       'state': stateController.text,
  //       'city': cityController.text,
  //       'department': department,
  //       'designation': designation,
  //       'photoUrl': imageUrl,
  //     });
  //     SnackBarUtils.showMessage('Employee added successfully!');
  //   } catch (e) {
  //     log(e.toString());
  //     SnackBarUtils.showMessage('Failed to add employee: ${e.toString()}');
  //   }
  //   notifyListeners();
  //   clearForm();
  // }

  Future addEmployee() async {
    try {
      String? imageUrl = await uploadImage();

      if (imageUrl == null) {
        SnackBarUtils.showMessage('Failed to upload image. Please try again.');
        return;
      }

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
        'photoUrl': imageUrl, // Set the photo URL here
      });

      SnackBarUtils.showMessage('Employee added successfully!');
    } catch (e) {
      log(e.toString());
      SnackBarUtils.showMessage('Failed to add employee: ${e.toString()}');
    } finally {
      notifyListeners();
      clearForm();
    }
  }

  Future<EmployeeModel?> getEmployee(String employeeId) async {
    final CollectionReference employeesCollection =
        FirebaseFirestore.instance.collection('Employee');
    try {
      DocumentSnapshot doc = await employeesCollection.doc(employeeId).get();
      if (doc.exists) {
        var employee =
            EmployeeModel.fromJson(doc.data() as Map<String, dynamic>);
        populateForm(employee);
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

  void populateForm(EmployeeModel employee) {
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
    imageUrl = employee.imageUrl;

    notifyListeners();
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
    photo = null;
    notifyListeners();
  }

  Future<void> editEmployee(
      String documentId,
      String newName,
      String newEmail,
      String newPhone,
      String newAddress,
      String newDob,
      String newJoiningDate,
      String newCountry,
      String newState,
      String newCity,
      String? newDepartment,
      String? newDesignation) async {
    // Validate inputs
    if (newName.isEmpty ||
        newEmail.isEmpty ||
        newPhone.isEmpty ||
        newAddress.isEmpty ||
        newDob.isEmpty ||
        newJoiningDate.isEmpty ||
        newCountry.isEmpty ||
        newState.isEmpty ||
        newCity.isEmpty) {
      log('Invalid input data');
      SnackBarUtils.showMessage('Please fill in all fields.');
      return; // Exit early if validation fails
    }

    try {
      await FirebaseFirestore.instance
          .collection('Employee') // Collection name
          .doc(documentId) // Use document ID passed as a parameter
          .update({
        'name': newName,
        'email': newEmail,
        'phone': newPhone,
        'address': newAddress,
        'Date Of Birth': newDob,
        'joiningDate': newJoiningDate,
        'country': newCountry,
        'state': newState,
        'city': newCity,
        'department': department,
        'designation': designation,
      });

      log('Employee updated successfully'); // Log success message
      SnackBarUtils.showMessage('Employee updated successfully!');
    } catch (error) {
      log('Failed to update employee: $error'); // Log error message if the update fails
      SnackBarUtils.showMessage('Failed to update employee: $error');
    }
  }

  Future<void> deleteEmployee(BuildContext context, String documentId) async {
    try {
      await FirebaseFirestore.instance
          .collection('Employee')
          .doc(documentId)
          .delete();
      SnackBarUtils.showMessage('Employee deleted successfully!');
    } catch (e) {
      log(e.toString());
      SnackBarUtils.showMessage('Deleting employee failed: ${e.toString()}');
    }
    notifyListeners();
  }

  Future<void> pickImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      photo = File(pickedFile.path);
      notifyListeners();
    } else {
      SnackBarUtils.showMessage('No image picked');
    }
  }

  Future<void> pickImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      photo = File(pickedFile.path);
      notifyListeners();
    } else {
      SnackBarUtils.showMessage('No image picked');
    }
  }

  Future<String?> uploadImage() async {
    if (photo == null) return null;
    try {
      final fileName = basename(photo!.path);
      final destination = 'images/$fileName';
      final ref = firebase_storage.FirebaseStorage.instance.ref(destination);
      Uint8List uint8list = await photo!.readAsBytes();
      await ref.putData(uint8list);
      final downloadUrl = await ref.getDownloadURL();
      SnackBarUtils.showMessage('Image uploaded successfully: $downloadUrl');
      return downloadUrl; // Corrected this line
    } catch (e) {
      log(e.toString());
      SnackBarUtils.showMessage('Image upload failed: ${e.toString()}');
      return null; // Added return statement for failure case
    }
  }

  Future<String?> getImageUrl() async {
    try {
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('Employee image')
          .child('${emailController.text}.jpg');
      final imageUrl = storageRef.getDownloadURL();
      return imageUrl;
    } catch (e) {
      SnackBarUtils.showMessage('cannot get employee images!!');
      return null;
    }
  }

  Future<void> saveImageUrlToFirestore(
      String employeeId, String imageUrl) async {
    await FirebaseFirestore.instance
        .collection('Employee')
        .doc(employeeId)
        .update({'photo Url': imageUrl});
  }

  Future<void> showImagePickerOptions(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Gallery'),
                onTap: () {
                  pickImageFromGallery(); // Ensure this function returns void
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera),
                title: const Text('Camera'),
                onTap: () {
                  pickImageFromCamera(); // Ensure this function returns void
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
