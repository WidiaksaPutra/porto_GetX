import 'package:flutter/material.dart';
import 'package:mgp_mobile_app/modul/hrdu/approval_kegiatan/body.dart';

class KegiatanView extends StatefulWidget {
  const KegiatanView({Key? key}) : super(key: key);

  @override
  _KegiatanViewState createState() => _KegiatanViewState();
}

class _KegiatanViewState extends State<KegiatanView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Approval Kegiatan"),
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
        child: const Body()
      ),
    );
  }
}