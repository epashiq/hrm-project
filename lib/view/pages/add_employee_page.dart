// import 'package:country_state_city_pro/country_state_city_pro.dart';
import 'package:country_state_city_pro/country_state_city_pro.dart';
import 'package:flutter/material.dart';
import 'package:hrm_project/controller/provider/add_employee_provider.dart';
import 'package:hrm_project/view/pages/employee_details_page.dart';
import 'package:hrm_project/view/widgets/button_widget.dart';
import 'package:provider/provider.dart';

class AddEmployeePage extends StatefulWidget {
  const AddEmployeePage({super.key});

  @override
  State<AddEmployeePage> createState() => _AddEmployeePageState();
}

class _AddEmployeePageState extends State<AddEmployeePage> {
  String? deptValue;
  String? desValue;
  final countryProvider = TextEditingController();
  final cityProvider = TextEditingController();
  final stateProvider = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final addEmployeeProvider = Provider.of<AddEmployeeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Employee'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  addEmployeeProvider.showImagePickerOptions(context);
                },
                child: CircleAvatar(
                  radius: 50,
                  child: addEmployeeProvider.photo != null
                      ? ClipRRect(
                          child: Image.file(addEmployeeProvider.photo!),
                        )
                      : Container(
                          child: Icon(Icons.camera),
                        ),
                ),
              ),
              TextFormField(
                controller: addEmployeeProvider.nameController,
                decoration: const InputDecoration(
                    hintText: 'Employee Name', prefixIcon: Icon(Icons.person)),
              ),
              TextFormField(
                controller: addEmployeeProvider.emailController,
                decoration: const InputDecoration(
                    hintText: 'Email', prefixIcon: Icon(Icons.mail)),
              ),
              TextFormField(
                controller: addEmployeeProvider.phoneController,
                decoration: const InputDecoration(
                    hintText: 'Phone', prefixIcon: Icon(Icons.call)),
              ),
              TextFormField(
                controller: addEmployeeProvider.addressController,
                decoration: const InputDecoration(
                    hintText: 'Address', prefixIcon: Icon(Icons.location_city)),
              ),
              TextFormField(
                controller: addEmployeeProvider.dobController,
                onTap: () {
                  addEmployeeProvider.setDob(context);
                },
                decoration: const InputDecoration(
                    hintText: 'Date Of Birth',
                    prefixIcon: Icon(Icons.calendar_month)),
              ),
              TextFormField(
                controller: addEmployeeProvider.joiningDateController,
                onTap: () {
                  addEmployeeProvider.setJoiningDate(context);
                },
                decoration: const InputDecoration(
                    hintText: 'Joining Date',
                    prefixIcon: Icon(Icons.calendar_month)),
              ),
              CountryStateCityPicker(
                country: addEmployeeProvider.countryController,
                state: addEmployeeProvider.stateController,
                city: addEmployeeProvider.cityController,
                dialogColor: Colors.grey.shade200,
                textFieldDecoration: InputDecoration(
                  fillColor: Colors.blueGrey.shade100,
                  filled: true,
                  suffixIcon: const Icon(Icons.arrow_downward_rounded),
                  border: const OutlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
              DropdownButtonFormField(
                  value: addEmployeeProvider.department,
                  hint: const Text('Select Department'),
                  items: ['IT', 'Finance', 'Sales', 'Accounting', 'Marketing']
                      .map<DropdownMenuItem<String>>(
                          (String value) => DropdownMenuItem(
                                child: Text(value),
                                value: value,
                              ))
                      .toList(),
                  onChanged: (String? value) {
                    setState(() {
                      deptValue = value;
                      addEmployeeProvider.department = value;
                    });
                  }),
              DropdownButtonFormField(
                  value: addEmployeeProvider.designation,
                  hint: const Text('Select Designation'),
                  items: [
                    'Developer',
                    'Tester',
                    'Manager',
                    'Director',
                    'Accountant'
                  ]
                      .map<DropdownMenuItem<String>>(
                          (String value) => DropdownMenuItem(
                                child: Text(value),
                                value: value,
                              ))
                      .toList(),
                  onChanged: (String? value) {
                    setState(() {
                      desValue = value;
                      addEmployeeProvider.designation = value;
                    });
                  }),
              const SizedBox(
                height: 20,
              ),
              ButtonWidget(
                btnText: 'Add',
                onTap: () {
                  addEmployeeProvider.uploadImage();
                  addEmployeeProvider.addEmployee();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EmployeeDetailsPage(),
                      ));
                },
                width: MediaQuery.sizeOf(context).width,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EmployeeDetailsPage(),
                        ));
                  },
                  child: const Text('view'))
            ],
          ),
        ),
      ),
    );
  }
}
