import 'package:country_state_city_pro/country_state_city_pro.dart';
import 'package:flutter/material.dart';
import 'package:hrm_project/controller/provider/add_employee_provider.dart';

class AddEmployeePage extends StatefulWidget {
  const AddEmployeePage({super.key});

  @override
  State<AddEmployeePage> createState() => _AddEmployeePageState();
}

class _AddEmployeePageState extends State<AddEmployeePage> {
  String? deptValue;
  String? desVAlue;
  final countryProvider = TextEditingController();
  final cityProvider = TextEditingController();
  final stateProvider = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final dateProvider = AddEmployeeProvider();
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
              const CircleAvatar(
                radius: 50,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    hintText: 'Employee Name', prefixIcon: Icon(Icons.person)),
              ),
              TextFormField(
                decoration: const InputDecoration(
                    hintText: 'Email', prefixIcon: Icon(Icons.mail)),
              ),
              TextFormField(
                decoration: const InputDecoration(
                    hintText: 'Phone', prefixIcon: Icon(Icons.call)),
              ),
              TextFormField(
                decoration: const InputDecoration(
                    hintText: 'Address', prefixIcon: Icon(Icons.location_city)),
              ),
              TextFormField(
                controller: dateProvider.dateController,
                onTap: () {
                  dateProvider.setDate(context);
                },
                decoration: const InputDecoration(
                    hintText: 'Date Of Birth',
                    prefixIcon: Icon(Icons.calendar_month)),
              ),
              TextFormField(
                controller: dateProvider.dateController,
                onTap: () {
                  setState(() {
                    dateProvider.setDate(context);
                  });
                },
                decoration: const InputDecoration(
                    hintText: 'Joining Date',
                    prefixIcon: Icon(Icons.calendar_month)),
              ),
              CountryStateCityPicker(
                  country: countryProvider,
                  state: stateProvider,
                  city: cityProvider,
                  dialogColor: Colors.grey.shade200,
                  textFieldDecoration: InputDecoration(
                      fillColor: Colors.blueGrey.shade100,
                      filled: true,
                      suffixIcon: const Icon(Icons.arrow_downward_rounded),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide.none))),
              DropdownButtonFormField(
                  value: deptValue,
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
                      deptValue = value!;
                    });
                  }),
              DropdownButtonFormField(
                  value: desVAlue,
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
                      desVAlue = value!;
                    });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
