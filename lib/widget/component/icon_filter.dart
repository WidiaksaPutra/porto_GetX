import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mgp_mobile_app/widget/theme/constants.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class IconFilter extends StatelessWidget {
  const IconFilter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(5).w),
      child: Container(
        width: getProportionateScreenWidth(50).w,
        height: getProportionateScreenHeight(50).h,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(194, 194, 194, 0.4),
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: colorCardItem,
            width: getProportionateScreenWidth(2).w,
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
          padding: const EdgeInsets.all(10.0),
          child: SvgPicture.asset("assets/icons/sliders.svg",
            height: getProportionateScreenHeight(40).h,
            width: getProportionateScreenWidth(40).w,
            color: kPrimaryColor,
          ),
        ),
      ),
    );
  }
}