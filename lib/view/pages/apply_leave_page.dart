import 'package:flutter/material.dart';
import 'package:hrm_project/controller/provider/apply_leave_provider.dart';
import 'package:hrm_project/view/pages/leave_status_page.dart';
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
        title: const Text(
          'Apply Leave',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              DropdownButtonFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Colors.black)),
                  ),
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
                    setState(() {
                      leaveValue = value;
                      applyLeaveProvider.leaveValue = value;
                    });
                  }),
              const SizedBox(
                height: 10,
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Leave From Date',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                onTap: () {
                  applyLeaveProvider.setFromDate(context);
                },
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
              const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Leave To Date',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  )),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                onTap: () {
                  applyLeaveProvider.setToDate(context);
                },
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
              const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'no of days',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  )),
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
              const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'reason',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  )),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 100,
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
              ButtonWidget(
                  btnText: 'Apply Leave',
                  onTap: () {
                    applyLeaveProvider.addLeave();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LeaveStatusPage(),
                        ));
                  },
                  width: 150)
            ],
          ),
        ),
      ),
    );
  }
}
