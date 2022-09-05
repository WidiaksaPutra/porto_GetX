import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class BottomNavigationBox extends StatelessWidget {
  final Widget child;
  const BottomNavigationBox({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(getProportionateScreenWidth(0).w, getProportionateScreenHeight(-15).h),
            blurRadius: 20.r,
            color: const Color(0xFFDADADA).withOpacity(0.15.r),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(20).r,
          topRight: const Radius.circular(20).r,
        ),
        border: Border.all(
          width: getProportionateScreenWidth(0.4).w,
          color: Colors.grey
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(                                           
          topLeft: const Radius.circular(20.0).r,                                            
          topRight: const Radius.circular(20.0).r,                                           
        ),
        child: SizedBox(
          height: getProportionateScreenHeight(85).h,
          width: double.infinity,
          child: child
        ),
      ),
    );
  }
}

class BottomNavigationItem {
  String label;
  String icon;
  BottomNavigationItem(this.label, this.icon);
}