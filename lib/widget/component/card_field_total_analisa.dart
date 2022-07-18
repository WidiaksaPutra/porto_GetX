import 'package:flutter/material.dart';
import 'package:mgp_mobile_app/widget/theme/constants.dart';

class CardFieldTotalAnalisa extends StatelessWidget {
  final Widget child;
  const CardFieldTotalAnalisa({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: colorCardItem,
      margin: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 6.0),
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(25),
        side: BorderSide(
          width: 0.8,
          color: Colors.grey[300]!
        )
      ),
      child: child,
    );
  }
}

class CardFieldGrandTotalAnalisa extends StatelessWidget {
  final Widget child;
  const CardFieldGrandTotalAnalisa({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: colorCardItem,
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(25),
        side: BorderSide(
          width: 0.8,
          color: Colors.grey[350]!
        )
      ),
      child: child,
    );
  }
}