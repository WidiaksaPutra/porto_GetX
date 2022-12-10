import 'package:flutter/material.dart';

import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class CardFieldItemTotal extends StatefulWidget {
  final String label;
  final String total;
  final int flexLeftRow;
  final int flexRightRow;
  const CardFieldItemTotal({
    Key? key,
    required this.label,
    required this.total,
    required this.flexLeftRow,
    required this.flexRightRow,
  }) : super(key: key);

  @override
  State<CardFieldItemTotal> createState() => _CardFieldItemTotalState();
}

class _CardFieldItemTotalState extends State<CardFieldItemTotal> {
  final formatCurrency = NumberFormat.currency(
    locale: 'ID',
    decimalDigits: 1,
    symbol: "Rp"
  );
  
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
                padding: EdgeInsets.only(left: getProportionateScreenWidth(0.0)),
                child: Text(widget.label,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
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
                    fontSize: 14,
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