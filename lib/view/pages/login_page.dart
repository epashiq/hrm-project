import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hrm_project/controller/provider/auth_provider.dart';
import 'package:hrm_project/view/pages/home_page.dart';
import 'package:hrm_project/view/pages/sign_up_page.dart';
import 'package:hrm_project/view/widgets/button_widget.dart';
import 'package:hrm_project/view/widgets/elevated_button_widget.dart';

class LoginPage extends ConsumerWidget {
  LoginPage({super.key});

  final emailController = TextEditingController();

  final passController = TextEditingController();

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
            Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: Offset(0, 5),
                ),
              ]),
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0XFFffffffff),
                    prefixIcon: const Icon(Icons.mail),
                    hintText: 'email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none,
                    )),
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
                  offset: Offset(0, 5),
                ),
              ]),
              child: TextFormField(
                controller: passController,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0XFFffffffff),
                    prefixIcon: const Icon(
                      Icons.remove_red_eye,
                      color: Colors.black,
                    ),
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
                btnText: 'Login',
                onTap: () {
                  ref.read(authProvider.notifier).loginWithEmailAndPassword(
                      emailController.text, passController.text, context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ));
                },
                emailController: emailController,
                passController: passController),
            
            const SizedBox(
              height: 20,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Forgot Password',
                style: TextStyle(fontSize: 15, color: Colors.blue),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ButtonWidget(
                btnText: 'Sign Up',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpPage(),
                      ));
                })
           
          ],
        ),
      ),
    );
  }
}
