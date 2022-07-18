import 'package:flutter/material.dart';
import 'package:mgp_mobile_app/model/hrdu/rap/analisa_single_rap.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_rap/analisa_single_rap/body_file.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_rap/analisa_single_rap/body_gambar.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_rap/analisa_single_rap/body_informasi_umum.dart';
import 'package:mgp_mobile_app/widget/theme/appbar_theme_color.dart';
import 'package:mgp_mobile_app/widget/theme/constants.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu.dart';

class DetailAnalisaSingleRAPView extends StatefulWidget {
  const DetailAnalisaSingleRAPView({Key? key, required this.idRapDetail}) : super(key: key);
  final String idRapDetail;
  @override
  _DetailAnalisaSingleRAPViewState createState() => _DetailAnalisaSingleRAPViewState();
}

class _DetailAnalisaSingleRAPViewState extends State<DetailAnalisaSingleRAPView> with SingleTickerProviderStateMixin {
  late TabController controller;
  String title = "Approval";
  late Future<AnalisaSingleRegrap> future;

  @override
  void initState() {
    future = MGPAPI().fetchAnalisaSingleRAP(idRapDetail: widget.idRapDetail);
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
          title: const Text("Analisa Barang Jadi RAP",
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
                  BodyInformasi(futureAnalisaSingleRap: future),
                  BodyGambar(futureAnalisaSingleRap: future),
                  BodyFile(futureAnalisaSingleRap: future),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}