import 'package:flutter/material.dart';

class ButtonApproval extends StatelessWidget {
  const ButtonApproval({Key? key, required this.label, required this.color, required this.onClicked}) : super(key: key);
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
          backgroundColor: color,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
        ),
        onPressed: onClicked,
        child: Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}