import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class CardFieldItemPercent extends StatefulWidget {
  final String label;
  final String? labelValue;
  final String total;
  final int flexLeftRow;
  final int flexRightRow;
  const CardFieldItemPercent({
    Key? key,
    required this.label,
    required this.labelValue,
    required this.total,
    required this.flexLeftRow,
    required this.flexRightRow,
  }) : super(key: key);

  @override
  State<CardFieldItemPercent> createState() => _CardFieldItemPercentState();
}

class _CardFieldItemPercentState extends State<CardFieldItemPercent> {
  final formatCurrency = NumberFormat.currency(
    locale: 'ID',
    decimalDigits: 0,
    symbol: "Rp"
  );
  final formatDecimal = NumberFormat("###.###", "id_ID");
  
  @override
  void initState() {
    initializeDateFormatting();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: widget.flexLeftRow,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 0.0),
                child: (widget.labelValue != null)
                ? Text(widget.label+
                  " ("+
                  formatDecimal.format(
                    double.parse(widget.labelValue.toString())
                  ) 
                  +"%)",
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14
                  ),
                  textAlign: TextAlign.left,
                )
                : Text(widget.label+
                  " (0%)",
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14
                  ),
                  textAlign: TextAlign.left,
                )
              ),
            ],
          ),
        ),
        Expanded(
          flex: widget.flexRightRow,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 0),
                child: Text(
                  formatCurrency.format(
                      double.parse(widget.total
                    )
                  ),
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}