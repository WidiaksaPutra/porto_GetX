import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:intl/intl.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class CardFieldItemFormatCurrency extends StatefulWidget {
  final String label;
  final String? contentData;
  final int flexLeftRow;
  final int flexRightRow;
  const CardFieldItemFormatCurrency({
    Key? key,
    required this.label,
    required this.contentData,
    required this.flexLeftRow,
    required this.flexRightRow,
  }) : super(key: key);

  @override
  State<CardFieldItemFormatCurrency> createState() => _CardFieldItemFormatCurrencyState();
}

class _CardFieldItemFormatCurrencyState extends State<CardFieldItemFormatCurrency> {
  final formatCurrency = NumberFormat.currency(
    locale: 'ID',
    decimalDigits: 0,
    symbol: "Rp"
  );
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
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: getProportionateScreenWidth(10).w, right: getProportionateScreenWidth(10).w),
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
            children: <Widget> [
              Padding(
                padding: EdgeInsets.only(left: getProportionateScreenWidth(0.0).w),
                child: (widget.contentData != null)
                ? Text(
                  formatCurrency.format(
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