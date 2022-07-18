import 'package:flutter/material.dart';

class CardMenuApproval extends StatelessWidget {
  final Widget child;
  const CardMenuApproval({
    Key? key,
    required this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SizedBox(
        width: double.infinity,
        child: Card(
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(25),
            side: const BorderSide(
              width: 0.4, color: Colors.grey
            )
          ),
          elevation: 8.0,
          margin: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 6.0),
          child: Container(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: child,
          ),
        )
      )
    );
  }
}