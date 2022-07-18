import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/modul/hrdu/approval_rab/body.dart';
import 'package:mgp_mobile_app/modul/hrdu/homepage_hrdu/homepage_hrdu.dart';
import 'package:mgp_mobile_app/widget/theme/appbar_theme_color.dart';

class RencanaAnggaranBiayaView extends StatefulWidget {
  const RencanaAnggaranBiayaView({Key? key}) : super(key: key);

  @override
  _RencanaAnggaranBiayaViewState createState() => _RencanaAnggaranBiayaViewState();
}

class _RencanaAnggaranBiayaViewState extends State<RencanaAnggaranBiayaView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Approval Rencana Anggaran Biaya"),
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