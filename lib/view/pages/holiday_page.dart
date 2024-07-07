import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HolidayPage extends StatefulWidget {
  const HolidayPage({super.key});

  @override
  State<HolidayPage> createState() => _HolidayPageState();
}

class _HolidayPageState extends State<HolidayPage> {
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
      // body: StreamBuilder(
      //   stream: FirebaseFirestore.instance.collection('Holiday').snapshots(),
      //   builder: (context, snapshot) {
      //     if(snapshot.connectionState)
      //   },
      // ),
    );
  }
}
