import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/modul/hrdu/approval_surat_perjanjian_kerja/body.dart';
import 'package:mgp_mobile_app/modul/hrdu/homepage_hrdu/homepage_hrdu.dart';
import 'package:mgp_mobile_app/widget/theme/appbar_theme_color.dart';

class SuratPerjanjianKerjaView extends StatefulWidget {
  const SuratPerjanjianKerjaView({Key? key}) : super(key: key);

  @override
  _SuratPerjanjianKerjaViewState createState() => _SuratPerjanjianKerjaViewState();
}

class _SuratPerjanjianKerjaViewState extends State<SuratPerjanjianKerjaView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Approval Surat Perjanjian Kerja"),
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