import 'package:flutter/material.dart';
import 'package:mgp_mobile_app/widget/theme/constants.dart';

import 'package:mgp_mobile_app/widget/theme/size_config.dart';
import 'package:sizer/sizer.dart';

class ButtonAlert extends StatelessWidget {
  const ButtonAlert({Key? key, required this.label, required this.color, required this.onClicked}) : super(key: key);
  final String label;
  final Color color;
  final VoidCallback onClicked;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.only(top:getProportionateScreenHeight(10), bottom: getProportionateScreenHeight(10)),
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              color: color
            )
          )
        ),
        onPressed: onClicked,
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.sp,
            color: color,
            overflow: TextOverflow.ellipsis
          ),
        ),
      ),
    );
  }
}

class IconAlert extends StatelessWidget {
  const IconAlert({Key? key, required this.color, required this.onClicked}) : super(key: key);
  final Color color;
  final VoidCallback onClicked;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.only(top:getProportionateScreenHeight(10), bottom: getProportionateScreenHeight(10)),
      child: TextButton(
        style: TextButton.styleFrom(
          shape: CircleBorder(side: BorderSide(color: color))
        ),
        onPressed: onClicked,
        child: Icon(Icons.close, size: 20.sp, color: rejectButtonColor)
      ),
    );
  }
}