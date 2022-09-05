import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:mgp_mobile_app/widget/theme/constants.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class CardExpansionDetail extends StatelessWidget {
  final String label;
  final List<Widget> children;
  const CardExpansionDetail({Key? key, required this.label, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(3.0).w, vertical: getProportionateScreenHeight(6.0).h),
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(25.r),
        side: BorderSide(
          width: getProportionateScreenWidth(0.4).w, color: Colors.grey
        )
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.r),
        child: ExpansionTile(
          title: Text(
            label,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 14.sp
            ),
          ),
          iconColor: kPrimaryColor,
          collapsedIconColor: kPrimaryColor,
          children: children
        )
      )
    ); 
  }
}