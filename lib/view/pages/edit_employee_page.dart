import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_state_city_pro/country_state_city_pro.dart';
import 'package:flutter/material.dart';
import 'package:hrm_project/controller/provider/add_employee_provider.dart';
import 'package:hrm_project/view/pages/employee_details_page.dart';
import 'package:hrm_project/view/widgets/button_widget.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EditEmployeePage extends StatefulWidget {
  final String documentId;
  final Map<String, dynamic> employeeData;

  const EditEmployeePage({
    super.key,
    required this.documentId,
    required this.employeeData,
  });

  @override
  State<EditEmployeePage> createState() => _EditEmployeePageState();
}

class _EditEmployeePageState extends State<EditEmployeePage> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController addressController;
  late TextEditingController dobController;
  late TextEditingController joiningDateController;
  late TextEditingController countryController;
  late TextEditingController stateController;
  late TextEditingController cityController;

  String? selectedDesignation;
  String? selectedDepartment;

  @override
  void initState() {
    super.initState();
    final addEmployeeProvider =
        Provider.of<AddEmployeeProvider>(context, listen: false);
    addEmployeeProvider.getEmployee(widget.documentId);

    // Initialize controllers with existing employee data
    nameController = TextEditingController(text: widget.employeeData['name']);
    emailController = TextEditingController(text: widget.employeeData['email']);
    phoneController = TextEditingController(text: widget.employeeData['phone']);
    addressController =
        TextEditingController(text: widget.employeeData['address']);
    dobController = TextEditingController(text: widget.employeeData['dob']);
    joiningDateController =
        TextEditingController(text: widget.employeeData['joiningDate']);
    countryController =
        TextEditingController(text: widget.employeeData['country']);
    stateController = TextEditingController(text: widget.employeeData['state']);
    cityController = TextEditingController(text: widget.employeeData['city']);

    selectedDesignation = widget.employeeData['designation'];
    selectedDepartment = widget.employeeData['department'];
  }

  @override
  void dispose() {
    // Dispose controllers to free resources
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    dobController.dispose();
    joiningDateController.dispose();
    countryController.dispose();
    stateController.dispose();
    cityController.dispose();
    super.dispose();
  }

  // Method to update employee data in Firebase Firestore
  Future<void> updateEmployee() async {
    final String newName = nameController.text.trim();
    final String newEmail = emailController.text.trim();
    final String newPhone = phoneController.text.trim();
    final String newAddress = addressController.text.trim();
    final String newDob = dobController.text.trim();
    final String newJoiningDate = joiningDateController.text.trim();
    final String newCountry = countryController.text.trim();
    final String newState = stateController.text.trim();
    final String newCity = cityController.text.trim();

    try {
      await FirebaseFirestore.instance
          .collection('Employee')
          .doc(widget
              .documentId) // Using documentId to update the correct employee
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
        'department': selectedDepartment,
        'designation': selectedDesignation
      });
      log('Employee updated successfully');
      Navigator.pop(context);
    } catch (e) {
      log('Failed to update employee: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to update employee')),
      );
    }
  }

  // Method to display a date picker
  void _pickDate(TextEditingController controller) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        controller.text = DateFormat('yyyy-MM-dd').format(pickedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Employee'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
            ),
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: 'Employee Name',
                prefixIcon: Icon(Icons.person),
              ),
            ),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: 'Email',
                prefixIcon: Icon(Icons.mail),
              ),
            ),
            TextFormField(
              controller: phoneController,
              decoration: const InputDecoration(
                hintText: 'Phone',
                prefixIcon: Icon(Icons.call),
              ),
            ),
            TextFormField(
              controller: addressController,
              decoration: const InputDecoration(
                hintText: 'Address',
                prefixIcon: Icon(Icons.location_city),
              ),
            ),
            TextFormField(
              controller: dobController,
              onTap: () {
                _pickDate(dobController);
              },
              decoration: const InputDecoration(
                hintText: 'Date Of Birth',
                prefixIcon: Icon(Icons.calendar_month),
              ),
              readOnly: true,
            ),
            TextFormField(
              controller: joiningDateController,
              onTap: () {
                _pickDate(joiningDateController);
              },
              decoration: const InputDecoration(
                hintText: 'Joining Date',
                prefixIcon: Icon(Icons.calendar_month),
              ),
              readOnly: true,
            ),
            CountryStateCityPicker(
              country: countryController,
              state: stateController,
              city: cityController,
              dialogColor: Colors.grey.shade200,
              textFieldDecoration: InputDecoration(
                fillColor: Colors.blueGrey.shade100,
                filled: true,
                suffixIcon: const Icon(Icons.arrow_downward_rounded),
                border: const OutlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
            DropdownButtonFormField<String>(
              value: selectedDepartment,
              hint: const Text('Select Department'),
              items: ['IT', 'Finance', 'Sales', 'Accounting', 'Marketing']
                  .map((String value) => DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      ))
                  .toList(),
              onChanged: (String? value) {
                selectedDepartment = value;
              },
            ),
            DropdownButtonFormField<String>(
              value: selectedDesignation,
              hint: const Text('Select Designation'),
              items:
                  ['Developer', 'Tester', 'Manager', 'Director', 'Accountant']
                      .map((String value) => DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          ))
                      .toList(),
              onChanged: (String? value) {
                selectedDesignation = value;
              },
            ),
            const SizedBox(height: 20),
            ButtonWidget(
              btnText: 'Edit',
              onTap: () async {
                await updateEmployee();
              },
              width: MediaQuery.sizeOf(context).width,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EmployeeDetailsPage(),
                  ),
                );
              },
              child: const Text('View'),
            ),
          ],
        ),
      ),
    );
  }
}
