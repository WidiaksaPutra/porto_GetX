import 'package:flutter/material.dart';

class CardDetail extends StatelessWidget {
  final Widget child;
  const CardDetail({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      margin: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 6.0),
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(25),
        side: const BorderSide(
          width: 0.4, color: Colors.grey
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: child,
      ),
    );
  }
}