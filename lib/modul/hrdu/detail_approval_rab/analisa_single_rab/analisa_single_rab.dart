import 'package:flutter/material.dart';
import 'package:mgp_mobile_app/model/hrdu/rab/analisa_single_rab.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_rab/analisa_single_rab/body_file.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_rab/analisa_single_rab/body_gambar.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_rab/analisa_single_rab/body_informasi_umum.dart';
import 'package:mgp_mobile_app/widget/theme/appbar_theme_color.dart';
import 'package:mgp_mobile_app/widget/theme/constants.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu.dart';

class DetailAnalisaSingleRABView extends StatefulWidget {
  const DetailAnalisaSingleRABView({
    Key? key,
    required this.idRabDetail,
    required this.title,
  }) : super(key: key);
  final String idRabDetail;
  final String title;
  @override
  _DetailAnalisaSingleRABViewState createState() => _DetailAnalisaSingleRABViewState();
}

class _DetailAnalisaSingleRABViewState extends State<DetailAnalisaSingleRABView> with SingleTickerProviderStateMixin {
  late TabController controller;
  String title = "Approval";
  late Future<AnalisaSingleRegrab> future;

  @override
  void initState() {
    future = MGPAPI().fetchAnalisaSingleRAB(idRabDetail: widget.idRabDetail);
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
          title: Text(widget.title,
            style: const TextStyle(
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
                  BodyInformasi(futureAnalisaSingleRab: future),
                  BodyGambar(futureAnalisaSingleRab: future),
                  BodyFile(futureAnalisaSingleRab: future),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}