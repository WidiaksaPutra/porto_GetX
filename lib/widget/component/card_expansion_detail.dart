import 'package:flutter/material.dart';
import 'package:mgp_mobile_app/widget/theme/constants.dart';

class CardExpansionDetail extends StatelessWidget {
  final String label;
  final List<Widget> children;
  const CardExpansionDetail({Key? key, required this.label, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      margin: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 6.0),
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(25),
        side: const BorderSide(
          width: 0.4, color: Colors.grey
        )
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: ExpansionTile(
          title: Text(
            label,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 14
            ),
          ),
          iconColor: kPrimaryColor,
          collapsedIconColor: kPrimaryColor,
          children: children
        )
      )
    ); 
  }
}