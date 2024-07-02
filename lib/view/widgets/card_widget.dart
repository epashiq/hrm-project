import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String buttonText;
  final void Function() ontap;
  const CardWidget({super.key,required this.buttonText,required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: MediaQuery.sizeOf(context).width,
      color: Colors.grey,
      child: TextButton(onPressed: ontap, child:  Text(buttonText)),
    );
  }
}
