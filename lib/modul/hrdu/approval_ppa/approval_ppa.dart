import 'package:flutter/material.dart';
import 'package:mgp_mobile_app/modul/hrdu/approval_ppa/body.dart';

class PPAView extends StatefulWidget {
  const PPAView({Key? key}) : super(key: key);

  @override
  _PPAViewState createState() => _PPAViewState();
}

class _PPAViewState extends State<PPAView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Approval PPA"),
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