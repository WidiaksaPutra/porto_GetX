import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mgp_mobile_app/widget/theme/constants.dart';

import 'package:mgp_mobile_app/widget/theme/size_config.dart';
import 'package:sizer/sizer.dart';

class ButtonApproval extends StatelessWidget {
  const ButtonApproval({Key? key, required this.label, required this.color, required this.onClicked}) : super(key: key);
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
          backgroundColor: color,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
        ),
        onPressed: onClicked,
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.sp,
            color: Colors.white,
            overflow: TextOverflow.ellipsis
          ),
        ),
      ),
    );
  }
}

class IconApproval extends StatelessWidget {
  const IconApproval({Key? key, required this.color, required this.onClicked}) : super(key: key);
  final Color color;
  final VoidCallback onClicked;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.only(top:getProportionateScreenHeight(10), bottom: getProportionateScreenHeight(10)),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: color,
          shape: const CircleBorder(),
        ),
        onPressed: onClicked,
        child: Icon(Icons.check, size: 20.sp, color: colorCardItem)
      ),
    );
  }
}

// Padding(
//           padding: EdgeInsets.only(right: getProportionateScreenWidth(5)),
//           child: SvgPicture.asset("assets/icons/verify_icon_detail.svg",
//             height: getProportionateScreenHeight(20),
//             width: getProportionateScreenWidth(20),
//           ),
//         ),