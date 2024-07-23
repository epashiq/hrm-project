import 'package:flutter/material.dart';
import 'package:hrm_project/view/pages/add_employee_page.dart';
import 'package:hrm_project/view/pages/add_holiday_page.dart';
import 'package:hrm_project/view/pages/apply_leave_page.dart';
import 'package:hrm_project/view/pages/attendence_page.dart';
import 'package:hrm_project/view/pages/map_page.dart';
import 'package:hrm_project/view/widgets/card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFfafafaff),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  const CircleAvatar(
                    radius: 20,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text('data'),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MapApp(),
                            ));
                      },
                      icon: const Icon(Icons.location_city))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              CardWidget(
                  buttonText: 'Add employe',
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddEmployeePage(),
                        ));
                  }),
              const SizedBox(
                height: 20,
              ),
              CardWidget(
                  buttonText: 'Leave',
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ApplyLeavePage(),
                        ));
                  }),
              const SizedBox(
                height: 20,
              ),
              CardWidget(
                  buttonText: 'Attendence',
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AttendencePage(),
                        ));
                  }),
              const SizedBox(
                height: 20,
              ),
              CardWidget(
                  buttonText: 'Add Public Holiday',
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddHolidayPage(),
                        ));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
