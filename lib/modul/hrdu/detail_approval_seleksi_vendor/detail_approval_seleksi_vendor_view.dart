import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_seleksi_vendor/body.dart';
import 'package:mgp_mobile_app/widget/theme/appbar_theme_color.dart';

class DetailSeleksiVendorView extends StatelessWidget {
  const DetailSeleksiVendorView({
    Key? key,
    required this.noSeleksiVendor,
    required this.statusMenu,
  }) : super(key: key);
  final String noSeleksiVendor;
  final String statusMenu;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Seleksi Vendor"),
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back
          ),
        ),
        flexibleSpace: const AppBarThemeColor(),
      ),
      body: Body(noSeleksiVendor: noSeleksiVendor, statusMenu: statusMenu),
    );
  }
}