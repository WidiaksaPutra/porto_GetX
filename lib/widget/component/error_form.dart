import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

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
          height: getProportionateScreenHeight(14).h,
          width: getProportionateScreenWidth(14).w,
        ),
        SizedBox(
          width: getProportionateScreenWidth(10).w,
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
          height: getProportionateScreenHeight(14).h,
          width: getProportionateScreenWidth(14).w,
        ),
        SizedBox(
          width: getProportionateScreenWidth(10).w,
        ),
        Text(error),
      ],
    );
  }
}