import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class CardFieldTotalAnalisaItem extends StatefulWidget {
  final String label;
  final String total;
  const CardFieldTotalAnalisaItem({Key? key, required this.label, required this.total}) : super(key: key);

  @override
  State<CardFieldTotalAnalisaItem> createState() => _CardFieldTotalAnalisaItemState();
}

class _CardFieldTotalAnalisaItemState extends State<CardFieldTotalAnalisaItem> {
  final formatCurrency = NumberFormat.currency(
    locale: 'ID',
    decimalDigits: 1,
    symbol: "Rp"
  );
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0), vertical: getProportionateScreenHeight(10.0)),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                flex: 15,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: Text(widget.label.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 0),
                      child: Text(
                        formatCurrency.format(
                          double.parse(
                            widget.total.toString()
                          )
                        ),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}