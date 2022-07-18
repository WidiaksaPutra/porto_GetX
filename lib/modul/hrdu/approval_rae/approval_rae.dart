import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/modul/hrdu/homepage_hrdu/homepage_hrdu.dart';
import 'package:mgp_mobile_app/widget/theme/appbar_theme_color.dart';
import 'package:mgp_mobile_app/modul/hrdu/approval_rae/body.dart';

class RencanaAnggaranEstimasiView extends StatefulWidget {
  const RencanaAnggaranEstimasiView({Key? key}) : super(key: key);

  @override
  _RencanaAnggaranEstimasiViewState createState() => _RencanaAnggaranEstimasiViewState();
}

class _RencanaAnggaranEstimasiViewState extends State<RencanaAnggaranEstimasiView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Approval Rencana Anggaran Estimasi"),
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