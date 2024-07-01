import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ButtonWidget extends ConsumerWidget {
  final String btnText;
  final void Function() onTap;
  final double? width;
  final double? height;
  final TextEditingController? emailController;
  final TextEditingController? passController;

  const ButtonWidget({
    Key? key,
    required this.btnText,
    required this.onTap,
    this.width,
    this.height,
    this.emailController,
    this.passController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFFb2bbc2),
            Color(0xFFb7c0c7),
            Color(0xFF8d95a1),
            Color(0xFF656d78),
            Color(0xFF313247),
            Color(0xFF21283b),
            Color(0xFF42485c),
          ],
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      width: width ,
      height: height,
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
        ),
      ),
    );
  }
}
