import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/modul/hrdu/history_analisa_barang_jadi/body.dart';
import 'package:mgp_mobile_app/modul/hrdu/homepage_hrdu/homepage_hrdu.dart';
import 'package:mgp_mobile_app/widget/theme/appbar_theme_color.dart';

class HistoryAnalisaBarangJadiView extends StatefulWidget {
  const HistoryAnalisaBarangJadiView({Key? key}) : super(key: key);

  @override
  _HistoryAnalisaBarangJadiViewState createState() => _HistoryAnalisaBarangJadiViewState();
}

class _HistoryAnalisaBarangJadiViewState extends State<HistoryAnalisaBarangJadiView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("History Analisa Barang Jadi"),
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
      body: const BodyHistory(),
    );
  }
}