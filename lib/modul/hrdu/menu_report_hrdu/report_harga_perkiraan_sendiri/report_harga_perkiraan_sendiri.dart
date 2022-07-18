import 'package:flutter/material.dart';
import 'package:mgp_mobile_app/modul/hrdu/menu_report_hrdu/report_harga_perkiraan_sendiri/body.dart';
import 'package:mgp_mobile_app/widget/theme/appbar_theme_color.dart';

class HargaPerkiraanSendiriView extends StatelessWidget {
  const HargaPerkiraanSendiriView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Harga Perkiraan Sendiri"),
        flexibleSpace: const AppBarThemeColor(),
      ),
      body: const Body(),
    );
  }
}