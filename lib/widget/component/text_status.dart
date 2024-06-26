import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class TextStatus extends StatelessWidget {
  final String label;
  final String iconPath;
  const TextStatus({Key? key, required this.label, required this.iconPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget> [
        Padding(
          padding: EdgeInsets.only(right: getProportionateScreenWidth(5)),
          child: SvgPicture.asset(iconPath,
            height: getProportionateScreenHeight(20),
            width: getProportionateScreenWidth(20),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: getProportionateScreenWidth(0.0)),
          child: Text(label,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.right
          )
        ),
      ],
    );
  }
}