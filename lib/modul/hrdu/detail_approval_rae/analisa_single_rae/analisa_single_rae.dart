import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:mgp_mobile_app/widget/theme/appbar_theme_color.dart';
import 'package:mgp_mobile_app/widget/theme/constants.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_rae/analisa_single_rae/body_file.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_rae/analisa_single_rae/body_gambar.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_rae/analisa_single_rae/body_informasi_umum.dart';
import 'package:mgp_mobile_app/model/hrdu/rae/analisa_single_rae.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/mgp_api_hrdu.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class DetailAnalisaSingleRAEView extends StatefulWidget {
  const DetailAnalisaSingleRAEView({Key? key, required this.idRaeDetail}) : super(key: key);
  final String idRaeDetail;
  @override
  _DetailAnalisaSingleRAEViewState createState() => _DetailAnalisaSingleRAEViewState();
}

class _DetailAnalisaSingleRAEViewState extends State<DetailAnalisaSingleRAEView> with SingleTickerProviderStateMixin {
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
          title: Text("Analisa Barang Jadi RAE",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18.sp
            ),
          ),
          flexibleSpace: const AppBarThemeColor(),
        ),
        body: Column(
          children: <Widget>[
            Material(
              elevation: 2,
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: getProportionateScreenWidth(1).w,
                      color: const Color.fromRGBO(0, 0, 0, 0.08)
                    )
                  )
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: getProportionateScreenHeight(40).h,
                  child: TabBar(
                    controller: controller,
                    indicatorColor: kPrimaryColor,
                    labelStyle: TextStyle(
                      fontSize: 14.sp,
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
            SizedBox(height: getProportionateScreenHeight(5).h),
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