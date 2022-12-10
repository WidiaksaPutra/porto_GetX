import 'package:flutter/material.dart';

import 'package:mgp_mobile_app/widget/theme/constants.dart';

class CardItemExpansionDetail extends StatelessWidget {
  final Widget child;
  const CardItemExpansionDetail({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: colorCardItem,
        borderRadius: BorderRadius.circular(15),
      ),
      child: child,
    );
  }
}