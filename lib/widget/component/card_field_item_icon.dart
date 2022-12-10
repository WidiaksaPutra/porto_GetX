import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class CardFieldItemIcon extends StatelessWidget {
  final String label;
  final bool? status;
  final int flexLeftRow;
  final int flexRightRow;
  const CardFieldItemIcon({
    Key? key,
    required this.label,
    required this.status,
    required this.flexLeftRow,
    required this.flexRightRow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: flexLeftRow,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 0),
                child: Text(label,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(5)),
                child: Text(":",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: flexRightRow,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: getProportionateScreenWidth(5)),
                child: (status != null)
                ? SvgPicture.asset(
                  "assets/icons/verify_icon.svg",
                  height: getProportionateScreenHeight(25),
                  width: getProportionateScreenWidth(25),
                )
                : SvgPicture.asset(
                  "assets/icons/reject_icon.svg",
                  height: getProportionateScreenHeight(25),
                  width: getProportionateScreenWidth(25),
                )
              ),
            ],
          ),
        ),
      ],
    );
  }
}