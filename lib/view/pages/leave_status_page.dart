import 'package:flutter/material.dart';

class LeaveStatusPage extends StatefulWidget {
  const LeaveStatusPage({super.key});

  @override
  State<LeaveStatusPage> createState() => _LeaveStatusPageState();
}

class _LeaveStatusPageState extends State<LeaveStatusPage> {
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
    );
  }
}
