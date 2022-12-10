import 'package:flutter/material.dart';

import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class CardCatatanApproval extends StatelessWidget {
  final Widget child;
  const CardCatatanApproval({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(1.0), vertical: getProportionateScreenHeight(3.0)),
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(25),
        side: BorderSide(
          width: getProportionateScreenWidth(0.4), color: Colors.grey
        )
      ),
      child: child,
    );
  }
}