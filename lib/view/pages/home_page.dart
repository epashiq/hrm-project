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
      backgroundColor: const Color(0XFFF0F4F8), // Lighter background
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 30),
              Row(
                children: [
                  const CircleAvatar(
                    radius: 25, // Slightly larger avatar
                    backgroundImage: NetworkImage(
                        'https://example.com/profile_image.png'), // Placeholder for profile image
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Welcome, User', // More informative text
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MapPage()),
                      );
                    },
                    icon: const Icon(Icons.location_city, color: Colors.blue),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              _buildCard('Add Employee', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AddEmployeePage()),
                );
              }),
              const SizedBox(height: 20),
              _buildCard('Apply Leave', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ApplyLeavePage()),
                );
              }),
              const SizedBox(height: 20),
              _buildCard('Attendance', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AttendencePage()),
                );
              }),
              const SizedBox(height: 20),
              _buildCard('Add Public Holiday', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AddHolidayPage()),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard(String title, VoidCallback onTap) {
    return CardWidget(
      buttonText: title,
      ontap: onTap,
      // Card color
    );
  }
}
