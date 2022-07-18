import 'package:flutter/material.dart';
import 'package:mgp_mobile_app/profile/component/informasi_akun/body.dart';

class InformasiAkunView extends StatefulWidget {
  const InformasiAkunView({Key? key}) : super(key: key);

  @override
  _InformasiAkunViewState createState() => _InformasiAkunViewState();
}

class _InformasiAkunViewState extends State<InformasiAkunView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Informasi Akun"),
        centerTitle: true,
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