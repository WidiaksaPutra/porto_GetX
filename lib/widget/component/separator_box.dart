import 'package:flutter/material.dart';
import 'package:mgp_mobile_app/widget/theme/constants.dart';

class SeparatorBox extends StatelessWidget {
  const SeparatorBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 15,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 2,
            color: colorBorderSeparator
          ),
          bottom: BorderSide(
            width: 2,
            color: colorBorderSeparator
          )
        )
      ),
    );
  }
}