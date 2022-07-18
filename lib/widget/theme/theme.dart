import 'package:mgp_mobile_app/widget/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    borderRadius: BorderRadius.circular(15),
    borderSide: const BorderSide(color: kTextColor),
    gapPadding: 10,
  );
  return InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.auto,
    contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
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
    toolbarTextStyle: const TextTheme(
      headline6: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
        fontFamily: "Poppins"
      ),
    ).bodyText2, titleTextStyle: const TextTheme(
      headline6: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
        fontFamily: "Poppins"
      ),
    ).headline6,
  );
}
