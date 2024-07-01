import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hrm_project/controller/provider/auth_provider.dart';
import 'package:hrm_project/view/pages/login_page.dart';
import 'package:hrm_project/view/widgets/elevated_button_widget.dart';

class SignUpPage extends ConsumerWidget {
  SignUpPage({super.key});

  final emailController = TextEditingController();

  final passController = TextEditingController();
  final confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Color(0XFFfafafaff),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Create an Account',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: const Offset(0, 5),
                ),
              ]),
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.mail),
                    filled: true,
                    fillColor: const Color(0XFFffffffff),
                    hintText: 'email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide.none)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: const Offset(0, 5),
                ),
              ]),
              child: TextFormField(
                controller: passController,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.remove_red_eye),
                    filled: true,
                    fillColor: const Color(0XFFffffffff),
                    hintText: 'password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide.none)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButtonWidget(
                btnText: 'Sign Up',
                onTap: () {
                  ref.read(authProvider.notifier).signInWithEmailAndPassword(
                      emailController.text, passController.text, context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ));
                },
                emailController: emailController,
                passController: passController)
          ],
        ),
      ),
    );
  }
}
