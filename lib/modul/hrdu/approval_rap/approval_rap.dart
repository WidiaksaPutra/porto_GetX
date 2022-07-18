import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/modul/hrdu/approval_rap/body.dart';
import 'package:mgp_mobile_app/modul/hrdu/homepage_hrdu/homepage_hrdu.dart';
import 'package:mgp_mobile_app/widget/theme/appbar_theme_color.dart';

class RencanaAnggaranProduksiView extends StatefulWidget {
  const RencanaAnggaranProduksiView({Key? key}) : super(key: key);

  @override
  _RencanaAnggaranProduksiViewState createState() => _RencanaAnggaranProduksiViewState();
}

class _RencanaAnggaranProduksiViewState extends State<RencanaAnggaranProduksiView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Approval Rencana Anggaran Produksi"),
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