import 'package:deli_meals/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String btnText;
  VoidCallback onPressed;
  CustomButton({required this.btnText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: CustomText(
        text: btnText,
      ),
    );
  }
}
