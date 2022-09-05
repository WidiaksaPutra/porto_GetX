import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:mgp_mobile_app/widget/theme/constants.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class ButtonLogin extends StatelessWidget {
  final Function()? onClicked;
  final bool isLoading;
  const ButtonLogin({
    Key? key,
    required this.onClicked,
    required this.isLoading
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: getProportionateScreenHeight(50).h,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            kPrimaryColor,
            kSecondaryColor,
          ]
        ),
        borderRadius: BorderRadius.circular(5).r,
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
        ),
        onPressed: onClicked,
        child: isLoading
        ? Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: getProportionateScreenWidth(25).w,
              height: getProportionateScreenHeight(25).h,
              child: const CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
            SizedBox(width: getProportionateScreenWidth(24).w),
            Text("Loading ...",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.sp,
                color: Colors.white 
              ),
            )
          ],
        )
        : Text("Login",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.sp,
            color: Colors.white,
          ),
        )
      ),
    );
  }
}