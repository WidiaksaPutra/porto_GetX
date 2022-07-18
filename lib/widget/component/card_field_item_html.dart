import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

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
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14
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
            children: const <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Text(":",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14
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
                padding: const EdgeInsets.only(left: 5),
                child: (htmlUraian != null)
                ? Html(data: htmlUraian)
                : const Text("-",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14
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