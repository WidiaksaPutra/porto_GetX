import 'package:flutter/material.dart';
import 'package:mgp_mobile_app/shared/theme_color.dart';

class IndexBarChart extends StatelessWidget {
  const IndexBarChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        rowIndexBarDiagram(verifyButtonColor, "test"),
        rowIndexBarDiagram(defaultPurpleColor, "test"),
        rowIndexBarDiagram(defaultBlueColor, "test"),
        rowIndexBarDiagram(reviseButtonColor, "test"),
      ],
    );
  }

  Widget rowIndexBarDiagram(Color colors, String text){
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 4.0),
          child: SizedBox(
            height: 15,
            width: 15,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: colors,
              )
            ),
          ),
        ),
        Text(text, style: const TextStyle(inherit: false, color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15)),
      ],
    );
  }
}