import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/main_page/main_page.dart';
import 'package:mgp_mobile_app/widget/theme/appbar_theme_color.dart';

class DashboardHRDUView extends StatefulWidget {
  const DashboardHRDUView({Key? key}) : super(key: key);

  @override
  _DashboardHRDUViewState createState() => _DashboardHRDUViewState();
}

class _DashboardHRDUViewState extends State<DashboardHRDUView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hi,Welcome!"),
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
    );
  }
}