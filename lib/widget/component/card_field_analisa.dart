import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mgp_mobile_app/widget/theme/constants.dart';

class CardFieldAnalisa extends StatelessWidget {
  final String label;
  final Function()? onTap;
  const CardFieldAnalisa({Key? key, required this.label, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(25),
        side: const BorderSide(
          width: 0.4, color: Colors.grey
        ),
      ),
      elevation: 3.0,
      margin: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 6.0),
      child: Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 5),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
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
              height: 30,
              width: 30,
            ),
          ),
          title: Transform.translate(
            offset: const Offset(-16, 0),
            child: Text(label,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 14 
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