import 'package:flutter/material.dart';

class CardCatatanApproval extends StatelessWidget {
  final Widget child;
  const CardCatatanApproval({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.symmetric(horizontal: 1.0, vertical: 3.0),
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(25),
        side: const BorderSide(
          width: 0.4, color: Colors.grey
        )
      ),
      child: child,
    );
  }
}