import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class ButtonAlert extends StatelessWidget {
  const ButtonAlert({Key? key, required this.label, required this.color, required this.onClicked}) : super(key: key);
  final String label;
  final Color color;
  final VoidCallback onClicked;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: getProportionateScreenHeight(56).h,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20).r,
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
          ),
        ),
      ),
    );
  }
}