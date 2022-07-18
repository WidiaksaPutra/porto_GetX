import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/modul/hrdu/approval_delivery_order/body.dart';
import 'package:mgp_mobile_app/modul/hrdu/homepage_hrdu/homepage_hrdu.dart';
import 'package:mgp_mobile_app/widget/theme/appbar_theme_color.dart';

class DeliveryOrderView extends StatefulWidget {
  const DeliveryOrderView({Key? key}) : super(key: key);

  @override
  _DeliveryOrderViewState createState() => _DeliveryOrderViewState();
}

class _DeliveryOrderViewState extends State<DeliveryOrderView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Approval Delivery Order"),
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