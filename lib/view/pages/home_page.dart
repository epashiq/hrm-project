import 'package:flutter/material.dart';
import 'package:hrm_project/view/pages/add_employee_page.dart';
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
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            const Row(
              children: [
                CircleAvatar(
                  radius: 20,
                ),
                SizedBox(
                  width: 10,
                ),
                Text('data')
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
            CardWidget(buttonText: 'Leave', ontap: () {}),
            const SizedBox(
              height: 20,
            ),
            CardWidget(buttonText: 'Attendence', ontap: () {}),
          ],
        ),
      ),
    );
  }
}
