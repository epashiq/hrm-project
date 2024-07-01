import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hrm_project/controller/provider/auth_provider.dart';
import 'package:hrm_project/view/pages/login_page.dart';

class SignUpPage extends ConsumerWidget {
  SignUpPage({super.key});

  final emailController = TextEditingController();

  final passController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                  hintText: 'email',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5))),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: passController,
              decoration: InputDecoration(
                  hintText: 'password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5))),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
                onPressed: () {
                  ref.read(authProvider.notifier).signInWithEmailAndPassword(
                      emailController.text, passController.text, context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  LoginPage(),
                      ));
                },
                child: const Text('submit')),
          ],
        ),
      ),
    );
  }
}
