import 'package:flutter/material.dart';
import 'package:mgp_mobile_app/widget/theme/appbar_theme_color.dart';
import 'package:mgp_mobile_app/widget/theme/constants.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_rae/analisa_single_rae/body_file.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_rae/analisa_single_rae/body_gambar.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_rae/analisa_single_rae/body_informasi_umum.dart';
import 'package:mgp_mobile_app/model/hrdu/rae/analisa_single_rae.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu.dart';

class DetailAnalisaSinglePeluangView extends StatefulWidget {
  const DetailAnalisaSinglePeluangView({Key? key, required this.idRaeDetail}) : super(key: key);
  final String idRaeDetail;
  @override
  _DetailAnalisaSinglePeluangViewState createState() => _DetailAnalisaSinglePeluangViewState();
}

class _DetailAnalisaSinglePeluangViewState extends State<DetailAnalisaSinglePeluangView> with SingleTickerProviderStateMixin {
  late TabController controller;
  String title = "Approval";
  late Future<AnalisaSingleRegrae> future;

  @override
  void initState() {
    future = MGPAPI().fetchAnalisaSingleRAE(idRaeDetail: widget.idRaeDetail);
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
          title: const Text("Analisa Barang Jadi RAE",
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
                  BodyInformasi(futureAnalisaSingleRae: future),
                  BodyGambar(futureAnalisaSingleRae: future),
                  BodyFile(futureAnalisaSingleRae: future),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}