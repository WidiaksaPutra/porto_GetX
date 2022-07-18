import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mgp_mobile_app/widget/theme/constants.dart';

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
        height: 30,
        width: 30,
        color: kPrimaryColor,
      ),
    );
  }
}