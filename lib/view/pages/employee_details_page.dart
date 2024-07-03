import 'package:flutter/material.dart';
import 'package:hrm_project/controller/provider/add_employee_provider.dart';
import 'package:hrm_project/model/employee_model.dart';
import 'package:provider/provider.dart';

class EmployeeDetailsPage extends StatefulWidget {
  const EmployeeDetailsPage({super.key});

  @override
  State<EmployeeDetailsPage> createState() => _EmployeeDetailsPageState();
}

class _EmployeeDetailsPageState extends State<EmployeeDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final addEmployeeProvider = Provider.of<AddEmployeeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee Details'),
        centerTitle: true,
      ),
      body: FutureBuilder<EmployeeModel?>(
        future: addEmployeeProvider.getEmployee('employeeId'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: LinearProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text('Employee not found'));
          } else {
            EmployeeModel employee = snapshot.data!;
            return SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const CircleAvatar(radius: 50),
                  const SizedBox(height: 20),
                  Text('Name: ${employee.name}'),
                  Text('Email: ${employee.email}'),
                  Text('Phone: ${employee.phone}'),
                  Text('Address: ${employee.address}'),
                  Text('Dob: ${employee.dob}'),
                  Text('Joining Date: ${employee.joiningDate}'),
                  Text(' Country: ${employee.country}'),
                  Text(' city: ${employee.city}'),
                  Text(' State: ${employee.address}'),
                  Text('Department: ${employee.department}'),
                  Text('designation: ${employee.designation}'),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
