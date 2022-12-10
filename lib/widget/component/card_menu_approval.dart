import 'package:flutter/material.dart';

import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class CardMenuApproval extends StatelessWidget {
  final Widget child;
  const CardMenuApproval({
    Key? key,
    required this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
      child: SizedBox(
        width: double.infinity,
        child: Card(
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(25),
            side: BorderSide(
              width: getProportionateScreenWidth(0.4), color: Colors.grey
            )
          ),
          elevation: 8.0,
          margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(3.0), vertical: getProportionateScreenHeight(6.0)),
          child: Container(
            padding: EdgeInsets.only(top: getProportionateScreenHeight(10), bottom: getProportionateScreenHeight(10)),
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