import 'package:flutter/material.dart';

import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class TextMenuApproval extends StatelessWidget {
  final String label;
  const TextMenuApproval({
    Key? key,
    required this.label
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(getProportionateScreenWidth(-15), getProportionateScreenHeight(0)),
      child: Text(label,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w800,
          fontSize: 14, 
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}
