import 'package:flutter/material.dart';

import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class CardGambar extends StatelessWidget {
  final String imageLink;
  final Function()? onTap;
  const CardGambar({
    Key? key,
    required this.imageLink,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 8.0,
      margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(3.0), vertical: getProportionateScreenHeight(6.0)),
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(25)
      ),
      child: GestureDetector(
        child: Image.network(
          imageLink,
          fit: BoxFit.fill,
        ),
        onTap: onTap,
      ),
    );
  }
}