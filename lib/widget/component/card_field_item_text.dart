import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class CardFieldItemText extends StatelessWidget {
  final String label;
  final String? contentData;
  final int flexLeftRow;
  final int flexRightRow;
  const CardFieldItemText({
    Key? key,
    required this.label,
    required this.contentData,
    required this.flexLeftRow, 
    required this.flexRightRow
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: flexLeftRow,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: getProportionateScreenWidth(0.0).w),
                child: Text(label,
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
        Expanded(
          flex: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: getProportionateScreenWidth(10).w, right: getProportionateScreenWidth(10).w),
                child: const Text(":",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: flexRightRow,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: getProportionateScreenWidth(0.0).w),
                child: (contentData != null)
                ? Text(contentData.toString(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.sp
                  ),
                  textAlign: TextAlign.left,
                )
                : const Text("-",
                  style: TextStyle(
                    color: Colors.black
                  ),
                  textAlign: TextAlign.left,
                )
              ),
            ],
          ),
        )
      ],
    );
  }
}

class CardFieldItemText2 extends StatelessWidget {
  final String label;
  final String? contentData, contentData2;
  final int flexLeftRow;
  final int flexRightRow;
  const CardFieldItemText2({
    Key? key,
    required this.label,
    required this.contentData,
    required this.flexLeftRow, 
    required this.flexRightRow,
    required this.contentData2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: flexLeftRow,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: getProportionateScreenWidth(0.0).w),
                child: Text(label,
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
        Expanded(
          flex: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: getProportionateScreenWidth(10).w, right: getProportionateScreenWidth(10).w),
                child: const Text(":",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: flexRightRow,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: getProportionateScreenWidth(0.0).w),
                child: (contentData != null)
                ? Text(contentData.toString(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.sp
                  ),
                  textAlign: TextAlign.left,
                )
                : Text(contentData2.toString(),
                  style: const TextStyle(
                    color: Colors.black
                  ),
                  textAlign: TextAlign.left,
                )
              ),
            ],
          ),
        )
      ],
    );
  }
}