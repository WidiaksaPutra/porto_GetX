import 'package:flutter/material.dart';

import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class BottomNavigationBox extends StatelessWidget {
  final Widget child;
  const BottomNavigationBox({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(getProportionateScreenWidth(0), getProportionateScreenHeight(-15)),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(20),
          topRight: const Radius.circular(20),
        ),
        border: Border.all(
          width: getProportionateScreenWidth(0.4),
          color: Colors.grey
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(                                           
          topLeft: const Radius.circular(20.0),                                            
          topRight: const Radius.circular(20.0),                                           
        ),
        child: SizedBox(
          height: getProportionateScreenHeight(85),
          width: double.infinity,
          child: child
        ),
      ),
    );
  }
}

class BottomNavigationItem {
  String label;
  String icon;
  BottomNavigationItem(this.label, this.icon);
}