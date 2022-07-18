import 'package:flutter/material.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_kegiatan/body.dart';

class DetailKegiatanView extends StatelessWidget {
  const DetailKegiatanView({Key? key, required this.noKegiatan}) : super(key: key);
  final String noKegiatan;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Kegiatan"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Color(0xFF2E7D32),Color(0xFFFFFFFF)]
          ),
        ),
        child: Body(noKegiatan: noKegiatan)
      ),
    );
  }
}