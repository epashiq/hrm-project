// import 'dart:developer';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:hrm_project/controller/provider/add_employee_provider.dart';
// import 'package:hrm_project/view/pages/edit_employee_page.dart';

// class EmployeeDetailsPage extends StatelessWidget {
//   const EmployeeDetailsPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Employee Details'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: StreamBuilder(
//           stream: FirebaseFirestore.instance.collection('Employee').snapshots(),
//           builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             } else if (snapshot.hasError) {
//               log(snapshot.error.toString());
//               return Center(
//                 child: Text('Error: ${snapshot.error}'),
//               );
//             } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//               return const Center(
//                 child: Text('No employees found.'),
//               );
//             } else {
//               return ListView.builder(
//                 itemCount: snapshot.data!.docs.length,
//                 itemBuilder: (context, index) {
//                   var data =
//                       snapshot.data!.docs[index].data() as Map<String, dynamic>;

//                   return Card(
//                     color: (const Color(0xFF313247)),
//                     margin: const EdgeInsets.all(8.0),
//                     child: Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Center(
//                             child: CircleAvatar(
//                               radius: 50,
//                               backgroundImage: data['imageUrl'] != null
//                                   ? NetworkImage(data['imageUrl'])
//                                   : null,
//                               child: data['imageUrl'] == null
//                                   ? const Icon(Icons.person, size: 50)
//                                   : null, // Display an icon if there is no image
//                             ),
//                           ),
//                           Text(
//                             'Name: ${data['name'] ?? 'N/A'}',
//                             style: const TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white),
//                           ),
//                           const SizedBox(height: 8),
//                           Text(
//                             'Email: ${data['email'] ?? 'N/A'}',
//                             style: const TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white),
//                           ),
//                           Text(
//                             'Address: ${data['address'] ?? 'N/A'}',
//                             style: const TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white),
//                           ),
//                           Text(
//                             'Date Of Birth: ${data['Date Of Birth'] ?? 'N/A'}',
//                             style: const TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white),
//                           ),
//                           Text(
//                             'Joining Date: ${data['joiningDate'] ?? 'N/A'}',
//                             style: const TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white),
//                           ),
//                           Text(
//                             'City: ${data['city'] ?? 'N/A'}',
//                             style: const TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white),
//                           ),
//                           Text(
//                             'State: ${data['state'] ?? 'N/A'}',
//                             style: const TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white),
//                           ),
//                           Text(
//                             'Country: ${data['country'] ?? 'N/A'}',
//                             style: const TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white),
//                           ),
//                           Text(
//                             'phone: ${data['phone'] ?? 'N/A'}',
//                             style: const TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white),
//                           ),
//                           Text(
//                             'department: ${data['department'] ?? 'N/A'}',
//                             style: const TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white),
//                           ),
//                           Text(
//                             'designation: ${data['designation'] ?? 'N/A'}',
//                             style: const TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white),
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             children: [
//                               IconButton(
//                                   onPressed: () {
//                                     Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                           builder: (context) =>
//                                               EditEmployeePage(
//                                             documentId:
//                                                 snapshot.data!.docs[index].id,
//                                           ),
//                                         ));
//                                   },
//                                   icon: const Icon(
//                                     Icons.edit,
//                                     color: Colors.white,
//                                   )),
//                               IconButton(
//                                   onPressed: () {
//                                     AddEmployeeProvider().deleteEmployee(
//                                         context, snapshot.data!.docs[index].id);
//                                   },
//                                   icon: const Icon(Icons.delete,
//                                       color: Colors.white))
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
// }

import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hrm_project/controller/provider/add_employee_provider.dart';
import 'package:hrm_project/view/pages/edit_employee_page.dart';

class EmployeeDetailsPage extends StatelessWidget {
  const EmployeeDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F1D36), // Dark background color
      appBar: AppBar(
        title: const Text('Employee Details'),
        backgroundColor: const Color(0xFF3E3B60), // AppBar color
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Employee').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              log(snapshot.error.toString());
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return const Center(
                child: Text('No employees found.',
                    style: TextStyle(color: Colors.white)),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  var data =
                      snapshot.data!.docs[index].data() as Map<String, dynamic>;

                  return Card(
                    color: const Color(0xFF2D2A4A), // Card color
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    elevation: 8, // Enhanced elevation
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.grey[300],
                              backgroundImage: (data['photoUrl'] != null &&
                                      data['photoUrl'] != '')
                                  ? NetworkImage(data['photoUrl'])
                                  : null,
                              child: (data['photoUrl'] == null ||
                                      data['photoUrl'] == '')
                                  ? const Icon(Icons.person, size: 50)
                                  : null,
                            ),
                          ),
                          const SizedBox(height: 16),
                          _buildInfoRow('Name', data['name']),
                          _buildInfoRow('Email', data['email']),
                          _buildInfoRow('Address', data['address']),
                          _buildInfoRow('Date Of Birth', data['Date Of Birth']),
                          _buildInfoRow('Joining Date', data['joiningDate']),
                          _buildInfoRow('City', data['city']),
                          _buildInfoRow('State', data['state']),
                          _buildInfoRow('Country', data['country']),
                          _buildInfoRow('Phone', data['phone']),
                          _buildInfoRow('Department', data['department']),
                          _buildInfoRow('Designation', data['designation']),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton.icon(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EditEmployeePage(
                                        documentId:
                                            snapshot.data!.docs[index].id,
                                            employeeData: data,
                                      ),
                                    ),
                                  );
                                },
                                icon: const Icon(Icons.edit),
                                label: const Text('Edit'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color(0xFF6C63FF), // Button color
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              ElevatedButton.icon(
                                onPressed: () {
                                  AddEmployeeProvider().deleteEmployee(
                                      context, snapshot.data!.docs[index].id);
                                },
                                icon: const Icon(Icons.delete),
                                label: const Text('Delete'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }

  // Helper function to build info rows
  Widget _buildInfoRow(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$label:',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            ),
          ),
          Flexible(
            child: Text(
              value ?? 'N/A',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
