import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class CardDetail extends StatelessWidget {
  final Widget child;
  const CardDetail({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(3.0).w, vertical: getProportionateScreenHeight(6.0).h),
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(25.r),
        side: BorderSide(
          width: getProportionateScreenWidth(0.4).w, color: Colors.grey
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: getProportionateScreenHeight(10).h, bottom: getProportionateScreenHeight(10).h),
        child: child,
      ),
    );
  }
}