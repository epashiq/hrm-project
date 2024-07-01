import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ElevatedButtonWidget extends ConsumerWidget {
  final String btnText;
  final void Function() onTap;
  final TextEditingController? emailController;
  final TextEditingController? passController;
  const ElevatedButtonWidget(
      {super.key,
      required this.btnText,
      required this.onTap,
      required this.emailController,
      required this.passController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        colors: [
          Color(0xFFb2bbc2),
          Color(0xFFb7c0c7),
          Color(0xFF8d95a1),
          Color(0xFF656d78),
          Color(0xFF313247),
          Color(0xFF21283b),
          Color(0xFF42485c),
        ],
      )),
      width: MediaQuery.sizeOf(context).width,
      height: 55,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 5,
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          onPressed: onTap,
          child: Text(
            btnText,
            style: const TextStyle(color: Colors.white),
          )),
    );
  }
}
