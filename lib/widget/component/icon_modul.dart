import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:mgp_mobile_app/widget/theme/constants.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class BoxIconModul extends StatelessWidget {
  final String icon;
  const BoxIconModul({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(5)),
      child: Container(
        width: getProportionateScreenWidth(160),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: colorCardItem,
            width: getProportionateScreenWidth(2),
          ),
          boxShadow: const [
            BoxShadow(
              color: colorCardItem,
              offset: Offset(
                0.0,
                0.0,
              ),
              blurRadius: 1.0,
              spreadRadius: 0.1,
            ),
            BoxShadow(
              color: Colors.white,
              offset: Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10.0), vertical: getProportionateScreenHeight(10.0)),
          child: SvgPicture.asset(icon,
            height: getProportionateScreenHeight(50),
            width: getProportionateScreenWidth(50),
            color: kPrimaryColor,
          ),
        ),
      ),
    );
  }
}

class TextIconModul extends StatelessWidget {
  final String label;
  const TextIconModul({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(label,
        style: TextStyle(
          fontSize: 14,
          fontFamily: "Poppins",
          color: Colors.black,
          fontWeight: FontWeight.w600
        ),
      ),
    );
  }
}