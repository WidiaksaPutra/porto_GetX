import 'package:flutter/material.dart';

import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class CardFieldItemPercentList extends StatefulWidget {
  final String label;
  final String? labelValue;
  final String total;
  final int flexLeftRow;
  final int flexRightRow;
  const CardFieldItemPercentList({
    Key? key,
    required this.label,
    required this.labelValue,
    required this.total,
    required this.flexLeftRow,
    required this.flexRightRow,
  }) : super(key: key);

  @override
  State<CardFieldItemPercentList> createState() => _CardFieldItemPercentListState();
}

class _CardFieldItemPercentListState extends State<CardFieldItemPercentList> {
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
                padding: EdgeInsets.only(left: getProportionateScreenWidth(0.0)),
                child: (widget.labelValue != null)
                ? Text(widget.label+
                  " ("+
                  formatDecimal.format(
                    double.parse(widget.labelValue.toString())
                  ) 
                  +"%)",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.left,
                )
                : Text(widget.label+
                  " (0%)",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
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
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: getProportionateScreenWidth(10), right: getProportionateScreenWidth(10)),
                child: const Text(":",
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
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 0),
                child: Text(
                  formatCurrency.format(
                      double.parse(widget.total
                    )
                  ),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}