
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hrm_project/view/pages/home_page.dart';
import 'package:hrm_project/view/utils/snackbar_utils.dart';
// part 'auth_provider.g.dart';

// @riverpod
// class Auth extends _$Auth {
//   @override
//   void build() {}
//   Future<void> loginWithEmailAndPassword(
//       String email, String password, BuildContext context) async {
//     try {
//       await FirebaseAuth.instance
//           .signInWithEmailAndPassword(email: email, password: password);
//       Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => const HomePage(),
//           ));
//     } catch (e) {
//       SnackBarUtils.showMessage('enter a valid mail');
//     }
//   }

//   Future<void> signInWithEmailAndPassword(
//       String email, String password, BuildContext context) async {
//     try {
//       await FirebaseAuth.instance
//           .createUserWithEmailAndPassword(email: email, password: password);
//       FirebaseFirestore.instance
//           .collection('auth')
//           .doc(email)
//           .set({email: email, password: password});
//     } catch (e) {
//       SnackBarUtils.showMessage('enter a valid mail');
//     }
//   }
// }

class AuthProvider with ChangeNotifier{
   Future<void> loginWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ));
    } catch (e) {
      SnackBarUtils.showMessage('enter a valid mail');
    }
  }

  Future<void> signInWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      FirebaseFirestore.instance
          .collection('auth')
          .doc(email)
          .set({email: email, password: password});
    } catch (e) {
      SnackBarUtils.showMessage('enter a valid mail');
    }
  }
}