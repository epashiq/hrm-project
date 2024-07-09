import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String buttonText;
  final void Function() ontap;
  const CardWidget({super.key, required this.buttonText, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [],
        gradient: const LinearGradient(colors: [
          Color(0XFFe2e1e6ff),
          Color(0XFFffffffff),
          Color(0XFFdddce0ff),
        ]),
        borderRadius: BorderRadius.circular(20),
      ),
      height: 200,
      width: MediaQuery.sizeOf(context).width,
      child: TextButton(onPressed: ontap, child: Text(buttonText)),
    );
  }
}
