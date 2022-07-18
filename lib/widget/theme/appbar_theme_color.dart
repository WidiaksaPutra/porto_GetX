import 'package:flutter/material.dart';
import 'package:mgp_mobile_app/widget/theme/constants.dart';

class AppBarThemeColor extends StatelessWidget {
  const AppBarThemeColor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: <Color> [
            kPrimaryColor,
            kSecondaryColor,
          ]
        ),
      ),
    );
  }
}