import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mgp_mobile_app/widget/theme/constants.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class CardFieldAnalisa extends StatelessWidget {
  final String label;
  final Function()? onTap;
  const CardFieldAnalisa({Key? key, required this.label, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(25.r),
        side: BorderSide(
          width: getProportionateScreenWidth(0.4).w, color: Colors.grey
        ),
      ),
      elevation: 3.0,
      margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(3.0).w, vertical: getProportionateScreenHeight(6.0).h),
      child: Padding(
        padding: EdgeInsets.only(top: getProportionateScreenHeight(5).h, bottom: getProportionateScreenHeight(5).h),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15.0).w),
          leading: ShaderMask(
            shaderCallback: (Rect bounds) {
              return const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color> [
                  kPrimaryColor,
                  kSecondaryColor,
                ],
                tileMode: TileMode.mirror,
              ).createShader(bounds);
            },
            child: SvgPicture.asset("assets/icons/akun_informasi_menu.svg",
              color: kPrimaryColor,
              height: getProportionateScreenHeight(30).h,
              width: getProportionateScreenWidth(30).w,
            ),
          ),
          title: Transform.translate(
            offset: Offset(getProportionateScreenWidth(-16).w, getProportionateScreenHeight(0).h),
            child: Text(label,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 14.sp 
              ),
              textAlign: TextAlign.left,
            ),
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}