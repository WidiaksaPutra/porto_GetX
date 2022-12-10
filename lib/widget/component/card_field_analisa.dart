import 'package:flutter/material.dart';

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
      color: colorCardItem,
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(25),
        side: BorderSide(
          width: getProportionateScreenWidth(0.4), 
          color: Colors.grey,
        ),
      ),
      elevation: 3.0,
      margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(3.0), vertical: getProportionateScreenHeight(6.0)),
      child: Padding(
        padding: EdgeInsets.only(top: getProportionateScreenHeight(5), bottom: getProportionateScreenHeight(5)),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15.0)),
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
              height: getProportionateScreenHeight(30),
              width: getProportionateScreenWidth(30),
            ),
          ),
          title: Transform.translate(
            offset: Offset(getProportionateScreenWidth(-16), getProportionateScreenHeight(0)),
            child: Text(label,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 14, 
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