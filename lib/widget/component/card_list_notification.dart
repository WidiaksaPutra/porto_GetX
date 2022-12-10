import 'package:flutter/material.dart';

import 'package:mgp_mobile_app/widget/theme/size_config.dart';

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
      margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10.0), vertical: getProportionateScreenHeight(6.0)),
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