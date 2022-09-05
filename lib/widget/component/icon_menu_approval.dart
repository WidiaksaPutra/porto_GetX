import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mgp_mobile_app/widget/theme/constants.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class IconMenuApproval extends StatelessWidget {
  const IconMenuApproval({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
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
        height: getProportionateScreenHeight(30).h,
        width: getProportionateScreenWidth(30).w,
        color: kPrimaryColor,
      ),
    );
  }
}