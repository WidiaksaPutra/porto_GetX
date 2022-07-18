import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/modul/hrdu/approval_mutasi_antar_gudang/body.dart';
import 'package:mgp_mobile_app/modul/hrdu/homepage_hrdu/homepage_hrdu.dart';
import 'package:mgp_mobile_app/widget/theme/appbar_theme_color.dart';

class MutasiAntarGudangView extends StatefulWidget {
  const MutasiAntarGudangView({Key? key}) : super(key: key);

  @override
  _MutasiAntarGudangViewState createState() => _MutasiAntarGudangViewState();
}

class _MutasiAntarGudangViewState extends State<MutasiAntarGudangView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Approval Mutasi Antar Gudang"),
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