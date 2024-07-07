import 'package:flutter/material.dart';
import 'package:hrm_project/view/widgets/button_widget.dart';

class AddHolidayPage extends StatefulWidget {
  const AddHolidayPage({super.key});

  @override
  State<AddHolidayPage> createState() => _AddHolidayPageState();
}

class _AddHolidayPageState extends State<AddHolidayPage> {
  TextEditingController holidayController = TextEditingController();
  TextEditingController holidayNameController = TextEditingController();
  TextEditingController descreptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Public Holiday ',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Leave From Date',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              onTap: () {},
              controller: holidayController,
              decoration: InputDecoration(
                  hintText: 'Please Select Date',
                  prefixIcon: const Icon(Icons.calendar_month),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Colors.black))),
            ),
            const SizedBox(
              height: 30,
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Holiday Name',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: holidayNameController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Colors.black))),
            ),
            const SizedBox(
              height: 30,
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Descreption',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: holidayNameController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Colors.black))),
            ),
            const SizedBox(
              height: 30,
            ),
            ButtonWidget(btnText: 'Add Holiday', onTap: () {}, width: 150)
          ],
        ),
      ),
    );
  }
}
