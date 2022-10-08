import 'package:flutter/material.dart';

class FlutterTextButton extends StatelessWidget {
  final String buttonText;
  final Function onTap;
  final double buttonWidth;
  final double buttonHeight;
  final double textSize;

  const FlutterTextButton({
    Key? key,
    required this.buttonText,
    required this.onTap,
    this.buttonHeight = 45.00,
    this.buttonWidth = 300.00,
    this.textSize = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        minimumSize: Size(buttonWidth, buttonHeight),
      ),
      onPressed: () {
        onTap();
      },
      child: Text(
        buttonText,
        style: TextStyle(
          fontSize: textSize,
        ),
      ),
    );
  }
}
