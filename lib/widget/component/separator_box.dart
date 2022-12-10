import 'package:flutter/material.dart';

import 'package:mgp_mobile_app/widget/theme/constants.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class SeparatorBox extends StatelessWidget {
  const SeparatorBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: getProportionateScreenHeight(15),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: getProportionateScreenWidth(2),
            color: colorCardItem
          ),
          bottom: BorderSide(
            width: getProportionateScreenWidth(2),
            color: colorCardItem
          )
        )
      ),
    );
  }
}