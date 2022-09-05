import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class CardFieldItemHtml extends StatelessWidget {
  final String label;
  final String? htmlUraian;
  final int flexLeftRow;
  final int flexRightRow;
  const CardFieldItemHtml({
    Key? key,
    required this.label,
    required this.htmlUraian,
    required this.flexLeftRow,
    required this.flexRightRow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: flexLeftRow,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 0),
                child: Text(label,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.sp
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(5).w),
                child: Text(":",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.sp
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: flexRightRow,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: getProportionateScreenWidth(5).w),
                child: (htmlUraian != null)
                ? Html(data: htmlUraian)
                : Text("-",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.sp
                  ),
                  textAlign: TextAlign.left,
                )
              ),
            ],
          ),
        ),
      ],
    );
  }
}