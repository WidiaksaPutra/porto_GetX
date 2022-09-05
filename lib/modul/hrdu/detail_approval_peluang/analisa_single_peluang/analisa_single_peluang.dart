import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:mgp_mobile_app/model/hrdu/peluang/analisa_single_peluang_baku.dart';
import 'package:mgp_mobile_app/model/hrdu/peluang/analisa_single_peluang_fin.dart';
import 'package:mgp_mobile_app/model/hrdu/peluang/analisa_single_peluang_gambar.dart';
import 'package:mgp_mobile_app/model/hrdu/peluang/analisa_single_peluang_penunjang.dart';
import 'package:mgp_mobile_app/model/hrdu/peluang/analisa_single_peluang_umum.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_peluang/analisa_single_peluang/body_file.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_peluang/analisa_single_peluang/body_gambar.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_peluang/analisa_single_peluang/build_informasi_umum_copy.dart';
import 'package:mgp_mobile_app/widget/theme/appbar_theme_color.dart';
import 'package:mgp_mobile_app/widget/theme/constants.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/mgp_api_hrdu.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class DetailAnalisaSinglePeluangView extends StatefulWidget {
  const DetailAnalisaSinglePeluangView({Key? key, required this.idBarangJadi}) : super(key: key);
  final String idBarangJadi;
  @override
  _DetailAnalisaSinglePeluangViewState createState() => _DetailAnalisaSinglePeluangViewState();
}

class _DetailAnalisaSinglePeluangViewState extends State<DetailAnalisaSinglePeluangView> with SingleTickerProviderStateMixin {
  late TabController controller;
  String title = "Approval";
  late Future<AnalisaSingleRegplgUmum> futureUmum;
  late Future<AnalisaSingleRegplgBaku> futureBuku;
  late Future<AnalisaSingleRegplgPenunjang> futurePenunjang;
  late Future<AnalisaSingleRegplgFinishing> futureFinishing;

  late Future<AnalisaSingleRegplgGambar> futureGambar_File;

  @override
  void initState() {
    futureUmum = MGPAPI().fetchAnalisaSinglePeluangUmum(idBarangJadi: widget.idBarangJadi);
    futureBuku = MGPAPI().fetchAnalisaSinglePeluangBaku(idBarangJadi: widget.idBarangJadi);
    futurePenunjang = MGPAPI().fetchAnalisaSinglePeluangPenunjang(idBarangJadi: widget.idBarangJadi);
    futureFinishing = MGPAPI().fetchAnalisaSinglePeluangFinishing(idBarangJadi: widget.idBarangJadi);

    futureGambar_File = MGPAPI().fetchAnalisaSinglePeluangGambar(idBarangJadi: widget.idBarangJadi);

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
          title: Text("Analisa Barang Jadi Peluang",
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
                  BodyInformasi(idBarangJadi: widget.idBarangJadi, futureAnalisaSinglePeluangBaku: futureBuku, fetchAnalisaSinglePeluangPenunjang: futurePenunjang, fetchAnalisaSinglePeluangFinishing: futureFinishing),
                  // BodyInformasi(futureAnalisaSinglePeluangUmum: futureUmum, futureAnalisaSinglePeluangBaku: futureBuku, fetchAnalisaSinglePeluangPenunjang: futurePenunjang, fetchAnalisaSinglePeluangFinishing: futureFinishing),
                  BodyGambar(futureAnalisaSingleGambar: futureGambar_File),
                  BodyFile(futureAnalisaSingleFile: futureGambar_File),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}