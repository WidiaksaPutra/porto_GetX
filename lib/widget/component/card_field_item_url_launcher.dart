import 'package:flutter/material.dart';

import 'package:mgp_mobile_app/widget/theme/size_config.dart';
import 'package:url_launcher/url_launcher.dart';

class CardFieldItemUrlLauncher extends StatelessWidget {
  final String label;
  final String? linkReferensi;
  final int flexLeftRow;
  final int flexRightRow;
  const CardFieldItemUrlLauncher({
    Key? key,
    required this.label,
    required this.linkReferensi,
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
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
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
                padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(5)),
                child: const Text(":",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
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
                padding: EdgeInsets.only(left: getProportionateScreenWidth(5)),
                child: (linkReferensi != null && linkReferensi.toString() != "")
                ? InkWell(
                  child: const Text("Lihat Referensi",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  onTap: () {
                    launch(linkReferensi.toString());
                  },
                )
                : const Text("-",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
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