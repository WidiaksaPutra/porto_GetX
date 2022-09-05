import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:mgp_mobile_app/widget/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: const Color.fromRGBO(249, 249, 249, 1),
    fontFamily: "Poppins",
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15.r),
    borderSide: const BorderSide(color: kTextColor),
    gapPadding: 10,
  );
  return InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.auto,
    contentPadding: EdgeInsets.fromLTRB(getProportionateScreenWidth(20).w, getProportionateScreenHeight(20).h, getProportionateScreenWidth(20).w, getProportionateScreenHeight(20).h),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}

TextTheme textTheme() {
  return const TextTheme(
    bodyText1: TextStyle(color: kTextColor),
    bodyText2: TextStyle(color: kTextColor),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: Colors.blue[600],
    elevation: 0,
    iconTheme: const IconThemeData(color: Colors.white),
    systemOverlayStyle: SystemUiOverlayStyle.light,
    toolbarTextStyle: TextTheme(
      headline6: TextStyle(
        color: Colors.white,
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
        fontFamily: "Poppins"
      ),
    ).bodyText2, titleTextStyle: TextTheme(
      headline6: TextStyle(
        color: Colors.white,
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
        fontFamily: "Poppins"
      ),
    ).headline6,
  );
}
