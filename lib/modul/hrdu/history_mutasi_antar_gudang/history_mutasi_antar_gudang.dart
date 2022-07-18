import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/modul/hrdu/history_mutasi_antar_gudang/body_history.dart';
import 'package:mgp_mobile_app/modul/hrdu/homepage_hrdu/homepage_hrdu.dart';
import 'package:mgp_mobile_app/widget/theme/appbar_theme_color.dart';

class HistoryMutasiAntarGudangView extends StatefulWidget {
  const HistoryMutasiAntarGudangView({Key? key}) : super(key: key);

  @override
  _HistoryMutasiAntarGudangViewState createState() => _HistoryMutasiAntarGudangViewState();
}

class _HistoryMutasiAntarGudangViewState extends State<HistoryMutasiAntarGudangView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("History Mutasi Antar Gudang"),
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