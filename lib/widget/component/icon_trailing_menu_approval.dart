import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mgp_mobile_app/widget/theme/constants.dart';

class IconTrailingMenuApproval extends StatelessWidget {
  const IconTrailingMenuApproval({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(-15, 0),
      child: ShaderMask(
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
        child: SvgPicture.asset("assets/icons/arrow_ios.svg",
          height: 15,
          width: 15,
          color: kPrimaryColor,
        ),
      ),
    );
  }
}