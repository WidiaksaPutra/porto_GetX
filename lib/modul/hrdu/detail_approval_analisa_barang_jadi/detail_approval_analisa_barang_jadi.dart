import 'package:flutter/material.dart';
import 'package:mgp_mobile_app/model/hrdu/analisa_barang_jadi/detail_analisa_barang_jadi_model.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_analisa_barang_jadi/body_file.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_analisa_barang_jadi/body_gambar.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_analisa_barang_jadi/body_informasi_umum.dart';
import 'package:mgp_mobile_app/widget/theme/appbar_theme_color.dart';
import 'package:mgp_mobile_app/widget/theme/constants.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu.dart';

class DetailAnalisaBarangJadiView extends StatefulWidget {
  const DetailAnalisaBarangJadiView({
    Key? key,
    required this.idItemBuaso,
    required this.statusMenu,
  }) : super(key: key);
  final String idItemBuaso;
  final String statusMenu;

  @override
  _DetailAnalisaBarangJadiViewState createState() => _DetailAnalisaBarangJadiViewState();
}

class _DetailAnalisaBarangJadiViewState extends State<DetailAnalisaBarangJadiView> with SingleTickerProviderStateMixin {
  late TabController controller;
  String title = "Approval";
  late Future<DetailRegabj> futureAnalisaBarangJadi;

  @override
  void initState() {
    futureAnalisaBarangJadi = MGPAPI().fetchAnalisaBarangJadi(idItemBuaso: widget.idItemBuaso);
    super.initState();
    controller = TabController(length: 3, vsync: this);
    controller.addListener(() { 
      setState(() {
        if (controller.index == 0) {
          title = "Informasi Umum";
        } else if (controller.index == 1) {
          title = "Gambar";
        } else {
          title = "File";
        }
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Analisa Barang Jadi",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18
            ),
          ),
          flexibleSpace: const AppBarThemeColor(),
        ),
        body: Column(
          children: <Widget>[
            Material(
              elevation: 2,
              child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: Color.fromRGBO(0, 0, 0, 0.08)
                    )
                  )
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: TabBar(
                    controller: controller,
                    indicatorColor: kPrimaryColor,
                    labelStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Poppins"
                    ),
                    labelColor: kPrimaryColor,
                    unselectedLabelColor: const Color.fromRGBO(0, 0, 0, 0.61),
                    tabs: const <Widget>[
                      Tab(text: "Informasi"),
                      Tab(text: "Gambar"),
                      Tab(text: "File"),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Expanded(
              child: TabBarView(
                controller: controller,
                children: <Widget>[
                  BodyInformasi(futureAnalisaBarangJadi: futureAnalisaBarangJadi, statusMenu: widget.statusMenu),
                  BodyGambar(futureAnalisaBarangJadi: futureAnalisaBarangJadi),
                  BodyFile(futureAnalisaBarangJadi: futureAnalisaBarangJadi),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}