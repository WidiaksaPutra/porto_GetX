import 'package:flutter/material.dart';

class ButtonAlert extends StatelessWidget {
  const ButtonAlert({Key? key, required this.label, required this.color, required this.onClicked}) : super(key: key);
  final String label;
  final Color color;
  final VoidCallback onClicked;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 56,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              color: color
            )
          )
        ),
        onPressed: onClicked,
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: color,
          ),
        ),
      ),
    );
  }
}