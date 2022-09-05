import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class CardExpansionDetailPrelim extends StatelessWidget {
  const CardExpansionDetailPrelim({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 12,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget> [
              Padding(
                padding: const EdgeInsets.only(left: 0),
                child: Text("Qty",
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
          flex: 20,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget> [
              Padding(
                padding: const EdgeInsets.only(left: 0),
                child: Text("-",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}