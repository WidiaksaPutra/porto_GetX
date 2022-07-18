import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardFieldItemFormatDecimal extends StatefulWidget {
  final String label;
  final String? contentData;
  final int flexLeftRow;
  final int flexRightRow;
  const CardFieldItemFormatDecimal({
    Key? key,
    required this.label,
    required this.contentData,
    required this.flexLeftRow,
    required this.flexRightRow,
  }) : super(key: key);

  @override
  State<CardFieldItemFormatDecimal> createState() => _CardFieldItemFormatDecimalState();
}

class _CardFieldItemFormatDecimalState extends State<CardFieldItemFormatDecimal> {
  final formatDecimal = NumberFormat("###.###", "id_ID");
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: widget.flexLeftRow,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget> [
              Padding(
                padding: const EdgeInsets.only(left: 0),
                child: Text(widget.label,
                  style: const TextStyle(
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
            children: const <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Text(":",
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
          flex: widget.flexRightRow,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget> [
              Padding(
                padding: const EdgeInsets.only(left: 0.0),
                child: (widget.contentData != null)
                ? Text(
                  formatDecimal.format(
                    double.parse(widget.contentData.toString()
                    )
                  ),
                  style: const TextStyle(
                    color: Colors.black
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
        ),
      ],
    );
  }
}