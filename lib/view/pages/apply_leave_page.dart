import 'package:flutter/material.dart';
import 'package:hrm_project/controller/provider/apple_leave_provider.dart';
import 'package:hrm_project/view/widgets/button_widget.dart';

class ApplyLeavePage extends StatefulWidget {
  const ApplyLeavePage({super.key});

  @override
  State<ApplyLeavePage> createState() => _ApplyLeavePageState();
}

class _ApplyLeavePageState extends State<ApplyLeavePage> {
  final applyLeaveProvider = ApplyLeaveProvider();
  String? leaveValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Apply Leave'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          DropdownButtonFormField(
              value: applyLeaveProvider.leaveValue,
              hint: const Text('Select Leave Type'),
              items: ['sick Leave', 'Personal leave']
                  .map<DropdownMenuItem<String>>(
                      (String value) => DropdownMenuItem(
                            child: Text(value),
                            value: value,
                          ))
                  .toList(),
              onChanged: (String? value) {
                setState(() {});
              }),
          const SizedBox(
            height: 10,
          ),
          const Text('Leave From Date'),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: applyLeaveProvider.applyFromController,
            decoration: InputDecoration(
                hintText: 'Please Select Date',
                prefixIcon: const Icon(Icons.calendar_month),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(color: Colors.black))),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text('Leave To Date'),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: applyLeaveProvider.applyToController,
            decoration: InputDecoration(
                hintText: 'Please Select Date',
                prefixIcon: const Icon(Icons.calendar_month),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(color: Colors.black))),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text('no of days'),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: applyLeaveProvider.noOfController,
            decoration: InputDecoration(
                hintText: '0',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(color: Colors.black))),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text('reason'),
          SizedBox(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: TextFormField(
              controller: applyLeaveProvider.reasonToController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Colors.black))),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ButtonWidget(btnText: 'Apply Leave', onTap: () {
            applyLeaveProvider.addLeave();
          }, width: 200)
        ],
      ),
    );
  }
}
