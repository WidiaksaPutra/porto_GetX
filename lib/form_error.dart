import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class FormError extends StatelessWidget {
  const FormError({Key? key,
    required this.errors,
  }) : super(key: key);

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Column(
          children: List.generate(
            errors.length, (index) => formErrorText(error: errors[index])
          ),
        ),
        // SizedBox(height: getProportionateScreenHeight(5)),
      ],
    );
  }

  Row formErrorText({required String error}) {
    return Row(
      children: [
        SvgPicture.asset(
          "assets/icons/Error.svg",
          height: getProportionateScreenHeight(14),
          width: getProportionateScreenWidth(14),
        ),
        SizedBox(
          width: getProportionateScreenWidth(10),
        ),
        Text(error),
      ],
    );
  }
}