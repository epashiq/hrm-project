import 'package:flutter/material.dart';
import 'package:hrm_project/controller/provider/attendance_provider.dart';
import 'package:hrm_project/view/widgets/button_widget.dart';

class AttendencePage extends StatefulWidget {
  const AttendencePage({super.key});

  @override
  State<AttendencePage> createState() => _AttendencePageState();
}

class _AttendencePageState extends State<AttendencePage> {
  final attendanceProvider = AttendanceProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Employee in out ',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Text(
                'Manual in out',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonWidget(
                    btnText: 'in',
                    onTap: () {
                      attendanceProvider.puncInTime.add(DateTime.now());
                      setState(() {});
                    },
                    width: 100),
                const SizedBox(
                  width: 10,
                ),
                ButtonWidget(
                    btnText: 'out',
                    onTap: () {
                      if (attendanceProvider.puncInTime.length >
                          attendanceProvider.puncOutTime.length) {
                        attendanceProvider.puncOutTime.add(DateTime.now());
                      }
                    },
                    width: 100),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Center(
              child: Text(
                'Employee in out List ',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Expanded(
                child: ListView.builder(
              itemCount: attendanceProvider.puncInTime.length,
              itemBuilder: (context, index) {
                return ListTile(
                    title: Text('\n' +
                        'Punch in : ${attendanceProvider.formateWorkingHours(attendanceProvider.puncInTime[index])}'),
                    subtitle: index < attendanceProvider.puncOutTime.length
                        ? Text('\n' +
                            'punch out : ${attendanceProvider.puncOutTime[index]}')
                        : const Text('Punch out : N/A'));
              },
            )),
            Text(
                'Total Working Hours : ${attendanceProvider.calculateWorkingHours()}')
          ],
        ),
      ),
    );
  }
}
