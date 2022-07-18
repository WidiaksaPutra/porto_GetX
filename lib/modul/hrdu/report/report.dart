import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/main_page/main_page.dart';
import 'package:mgp_mobile_app/widget/theme/appbar_theme_color.dart';
import 'package:mgp_mobile_app/modul/hrdu/report/body.dart';

class ReportView extends StatefulWidget {
  const ReportView({Key? key}) : super(key: key);

  @override
  _ReportViewState createState() => _ReportViewState();
}

class _ReportViewState extends State<ReportView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Report"),
        leading: GestureDetector(
          onTap: () {
            Get.offAll(const MainPage());
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