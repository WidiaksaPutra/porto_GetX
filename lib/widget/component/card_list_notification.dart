import 'package:flutter/material.dart';

class CardListNotification extends StatelessWidget {
  final Widget child;
  const CardListNotification({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
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