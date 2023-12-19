import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;

  PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Text(text),
      color: Theme.of(context).primaryColor,
      textColor: Colors.white,
    );
  }
}
