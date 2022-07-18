import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TextStatus extends StatelessWidget {
  final String label;
  final String iconPath;
  const TextStatus({Key? key, required this.label, required this.iconPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget> [
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: SvgPicture.asset(iconPath,
            height: 20,
            width: 20,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 0.0),
          child: Text(label,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.right
          )
        ),
      ],
    );
  }
}