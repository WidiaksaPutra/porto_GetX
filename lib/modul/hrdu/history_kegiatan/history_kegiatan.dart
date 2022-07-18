import 'package:flutter/material.dart';
import 'package:mgp_mobile_app/modul/hrdu/history_kegiatan/body.dart';

class HistoryKegiatanView extends StatelessWidget {
  const HistoryKegiatanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("History Kegiatan"),
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
        child: const BodyHistory()
      ),
    );
  }
}