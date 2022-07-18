import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/modul/hrdu/approval_sales_order/body.dart';
import 'package:mgp_mobile_app/modul/hrdu/homepage_hrdu/homepage_hrdu.dart';
import 'package:mgp_mobile_app/widget/theme/appbar_theme_color.dart';

class SalesOrderView extends StatefulWidget {
  const SalesOrderView({Key? key}) : super(key: key);

  @override
  _SalesOrderViewState createState() => _SalesOrderViewState();
}

class _SalesOrderViewState extends State<SalesOrderView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Approval Sales Order"),
        leading: GestureDetector(
          onTap: () {
            Get.to(const HomePageHRDU(
              selectedIndexPage: 1,
            ));
          },
          child: const Icon(
            Icons.arrow_back
          ),
        ),
        flexibleSpace: const AppBarThemeColor(),
      ),
      body: const Body(),
    );
  }
}