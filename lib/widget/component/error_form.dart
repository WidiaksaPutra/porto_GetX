import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FormErrors extends StatelessWidget {
  const FormErrors({Key? key,
    required this.errors,
  }) : super(key: key);

  final String errors;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SvgPicture.asset(
          "assets/icons/Error.svg",
          height: 14,
          width: 14,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(errors),
      ],
    );
  }

  Row formErrorText({required String error}) {
    return Row(
      children: [
        SvgPicture.asset(
          "assets/icons/Error.svg",
          height: 14,
          width: 14,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(error),
      ],
    );
  }
}