import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardFieldItemDate extends StatelessWidget {
  final String label;
  final DateTime? date;
  final int flexLeftRow;
  final int flexRightRow;
  const CardFieldItemDate({
    Key? key,
    required this.label,
    required this.date,
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 0.0),
                child: Text(label,
                  style: const TextStyle(
                    color: Colors.black
                  ),
                  textAlign: TextAlign.left,
                )
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
          flex: flexRightRow,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 0.0),
                child: (date != null)
                ? Text(
                  DateFormat(
                    'EEEE, dd MMMM yyyy', 'id').format(
                      DateTime.parse(date.toString()
                    )
                  ).toString(),
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
        )
      ],
    );
  }
}