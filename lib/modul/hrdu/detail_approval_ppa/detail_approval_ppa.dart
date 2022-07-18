import 'package:flutter/material.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_ppa/body.dart';

class DetailPPAView extends StatelessWidget {
  const DetailPPAView({Key? key, required this.noPPA}) : super(key: key);
  final String noPPA;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail PPA"),
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
        child: Body(noPPA: noPPA)
      ),
    );
  }
}