import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/model/hrdu/peluang/analisa_single_peluang_baku.dart';
import 'package:mgp_mobile_app/model/hrdu/peluang/analisa_single_peluang_fin.dart';
import 'package:mgp_mobile_app/model/hrdu/peluang/analisa_single_peluang_penunjang.dart';
import 'package:mgp_mobile_app/model/hrdu/peluang/analisa_single_peluang_umum.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_peluang/analisa_bahan_baku/analisa_bahan_baku.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_peluang/analisa_finishing/analisa_finishing.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_peluang/analisa_penunjang_produksi/analisa_penunjang_produksi.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/mgp_api_hrdu.dart';
import 'package:mgp_mobile_app/widget/component/card_expansion_detail.dart';
import 'package:mgp_mobile_app/widget/component/card_field_analisa.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_total.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mgp_mobile_app/widget/component/card_detail.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_text.dart';
import 'package:mgp_mobile_app/widget/component/card_field_total_analisa.dart';
import 'package:mgp_mobile_app/widget/component/card_field_total_analisa_item.dart';
import 'package:mgp_mobile_app/widget/component/card_item_expansion_detail.dart';
import 'package:mgp_mobile_app/widget/component/skeleton.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class BodyInformasi extends StatefulWidget {
  final Future<AnalisaSingleRegplgBaku> futureAnalisaSinglePeluangBaku;
  final Future<AnalisaSingleRegplgPenunjang> fetchAnalisaSinglePeluangPenunjang;
  final Future<AnalisaSingleRegplgFinishing> fetchAnalisaSinglePeluangFinishing;
  final String idBarangJadi;
  const BodyInformasi({Key? key, required this.idBarangJadi, required this.futureAnalisaSinglePeluangBaku, required this.fetchAnalisaSinglePeluangPenunjang, required this.fetchAnalisaSinglePeluangFinishing}) : super(key: key);

  @override
  _BodyInformasiState createState() => _BodyInformasiState();
}

class _BodyInformasiState extends State<BodyInformasi> {
  final formatCurrency = NumberFormat.currency(
    locale: 'ID',
    decimalDigits: 0,
    symbol: "Rp"
  );

  // late List<dynamic> informasiUmum = [];
  // Future<List<dynamic>> getInformasiUmum() async{
  //   informasiUmum.add(widget.futureAnalisaSinglePeluangUmum);
  //   informasiUmum.add(widget.futureAnalisaSinglePeluangBaku);
  //   informasiUmum.add(widget.fetchAnalisaSinglePeluangPenunjang);
  //   informasiUmum.add(widget.fetchAnalisaSinglePeluangFinishing);
  //   return informasiUmum;
  // }

  // late List<dynamic> analisaInformasiUmum = [];
  AnalisaSingleRegplgUmum? futureInformasiUmumAnalisaSinglePeluangUmum;
  AnalisaSingleRegplgBaku? futureInformasiUmumAnalisaSinglePeluangBaku;
  AnalisaSingleRegplgPenunjang? fetchInformasiUmumAnalisaSinglePeluangPenunjang;
  AnalisaSingleRegplgFinishing? fetchInformasiUmumAnalisaSinglePeluangFinishing;

  Future<AnalisaSingleRegplgUmum> getInformasiUmumAnalisaSinglePeluangUmum() async{
    return futureInformasiUmumAnalisaSinglePeluangUmum = await MGPAPI().fetchAnalisaSinglePeluangUmum(idBarangJadi: widget.idBarangJadi);
  }
  Future<AnalisaSingleRegplgBaku> getInformasiUmumAnalisaSinglePeluangBaku() async{
    return futureInformasiUmumAnalisaSinglePeluangBaku = await MGPAPI().fetchAnalisaSinglePeluangBaku(idBarangJadi: widget.idBarangJadi);
  }
  Future<AnalisaSingleRegplgPenunjang> getInformasiUmumAnalisaSinglePeluangPenunjang() async{
    return fetchInformasiUmumAnalisaSinglePeluangPenunjang = await MGPAPI().fetchAnalisaSinglePeluangPenunjang(idBarangJadi: widget.idBarangJadi);
  }
  Future<AnalisaSingleRegplgFinishing> getInformasiUmumAnalisaSinglePeluangFinishing() async{
    return fetchInformasiUmumAnalisaSinglePeluangFinishing =  await MGPAPI().fetchAnalisaSinglePeluangFinishing(idBarangJadi: widget.idBarangJadi);
  }

  late Future<AnalisaSingleRegplgUmum> futures1 = getInformasiUmumAnalisaSinglePeluangUmum();
  late Future<AnalisaSingleRegplgBaku> futures2 = getInformasiUmumAnalisaSinglePeluangBaku();
  late Future<AnalisaSingleRegplgPenunjang> futures3 = getInformasiUmumAnalisaSinglePeluangPenunjang();
  late Future<AnalisaSingleRegplgFinishing> futures4 = getInformasiUmumAnalisaSinglePeluangFinishing();

  Future<dynamic> getAnalisaInformasiUmum() async {
    var responses = await Future.wait([
      futures1, futures2, futures3, futures4,
    ]);
    return "${responses[0]}, ${responses[1]}, ${responses[2]}, ${responses[3]}";
  }

  final formatDecimal = NumberFormat("###.######", "id_ID");
  final decimalFormat = NumberFormat("###", "id_ID");
  late List subTotalHargaRAE = [];
  late List subTotalHargaPrelim = [];
  late List totalHargaPrelim = [];
  late String grandTotal;
  late String grandTotalPrelim;
  late String grandTotalHargaRAE;
  final List<String> errors = [];
  late String totalAnalisaBahanBaku;
  late String totalAnalisaPenunjanProduksi;
  late String totalAnalisaFinishing;
  late String totalAnalisaAlatBantuOnSite;
  late String totalAnalisaLabourCostOnSite;
  late String totalAnalisaBiayaOverheadKantor;
  late String totalLuasHardwood;
  late String totalVolumeHardwood;
  late String totalLuasPlywood;
  late String totalVolumePlywood;
  List namaSummaryBiaya = [
    "Analisa Bahan Baku",
    "Analisa Penunjang Produksi",
    "Analisa Finishing",
  ];
  late List totalSummaryBiaya = [];
  late List subTotalHardwood = [];
  late List subTotalPlywood = [];
  late List listLuaslHardwood = [];
  late List listLuasPlywood = [];
  late List listVolumeHardwood = [];
  late List listVolumePlywood = [];
  late List<String> listNamaFinishingBarangJadi = [];

  @override
  void initState() {
    initializeDateFormatting();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15).w),
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: FutureBuilder(
              future: getAnalisaInformasiUmum(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var analisaSinglePeluang = snapshot.data;
                  num totalHardwood = 0;
                  num totalPlywood = 0;
                  num totalFactorySupply = 0;
                  num totalLabourCost = 0;
                  num totalMachineProcess = 0;
                  num totalBiayaOverhead = 0;
                  num totalBahanPenunjangFinishing = 0;
                  num totalSubkonFinishing = 0;
                  num totalLabourCostFinishing = 0;
                  num totalAlatBantuOnSite = 0;
                  num totalLabourCostOnSite = 0;
                  num totalBiayaOverheadKantor = 0;
                  num luasHardwood = 0;
                  num luasPlywood = 0;
                  num volumeHardwood = 0;
                  num volumePlywood = 0;
               
                  if (futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaHardwood!.isNotEmpty) {
                    for (var i = 0; i < futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaHardwood!.length; i++) {
                      num volume = (double.parse(futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaHardwood![i].tRaw.toString()) * double.parse(futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaHardwood![i].wRaw.toString()) * double.parse(futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaHardwood![i].lRaw.toString()) * double.parse(futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaHardwood![i].qtyRaw.toString()))/1000000;
                      volumeHardwood = volumeHardwood + volume;
                      listVolumeHardwood.add(volume);
                      num subTotal = volume * double.parse(futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaHardwood![i].hargaSatuan.toString()) * double.parse(futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaHardwood![i].koefisien.toString());
                      subTotalHardwood.add(subTotal);
                      totalHardwood = totalHardwood + subTotal.round();
                      if (futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaHardwood![i].namaTipeSisi.toString() == "4 Sisi (2TL + 2WL)") {
                        num tPlusW = (double.parse(futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaHardwood![i].tFinal.toString()) + double.parse(futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaHardwood![i].wFinal.toString()));
                        num luas = (tPlusW * 2 * double.parse(futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaHardwood![i].qtyFinal.toString()) * double.parse(futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaHardwood![i].lFinal.toString()))/10000;
                        listLuaslHardwood.add(formatDecimal.format(luas));
                        luasHardwood = luasHardwood + luas;
                      } else if (futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaHardwood![i].namaTipeSisi.toString() == "3 Sisi Opsi (2TL + WL)") {
                        num tPlusWPlusT = (double.parse(futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaHardwood![i].tFinal.toString()) + double.parse(futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaHardwood![i].wFinal.toString()) + double.parse(futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaHardwood![i].tFinal.toString()));
                        num luas = (tPlusWPlusT * double.parse(futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaHardwood![i].qtyFinal.toString()) * double.parse(futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaHardwood![i].lFinal.toString()))/10000;
                        listLuaslHardwood.add(formatDecimal.format(luas));
                        luasHardwood = luasHardwood + luas;
                      } else if (futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaHardwood![i].namaTipeSisi.toString() == "3 Sisi Opsi 2 (TL + 2WL)") {
                        num tPlusWPlusW = (double.parse(futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaHardwood![i].tFinal.toString()) + double.parse(futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaHardwood![i].wFinal.toString()) + double.parse(futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaHardwood![i].wFinal.toString()));
                        num luas = (tPlusWPlusW * double.parse(futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaHardwood![i].qtyFinal.toString()) * double.parse(futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaHardwood![i].lFinal.toString()))/10000;
                        listLuaslHardwood.add(formatDecimal.format(luas));
                        luasHardwood = luasHardwood + luas;
                      } else if (futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaHardwood![i].namaTipeSisi.toString() == "2 Sisi Opsi 1 (TL + WL)") {
                        num tPlusW = (double.parse(futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaHardwood![i].tFinal.toString()) + double.parse(futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaHardwood![i].wFinal.toString()));
                        num luas = (tPlusW * double.parse(futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaHardwood![i].qtyFinal.toString()) * double.parse(futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaHardwood![i].lFinal.toString()))/10000;
                        listLuaslHardwood.add(formatDecimal.format(luas));
                        luasHardwood = luasHardwood + luas;
                      } else if (futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaHardwood![i].namaTipeSisi.toString() == "2 Sisi Opsi 2 (2TL)") {
                        num tPlusT = (double.parse(futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaHardwood![i].tFinal.toString()) + double.parse(futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaHardwood![i].tFinal.toString()));
                        num luas = (tPlusT * double.parse(futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaHardwood![i].qtyFinal.toString()) * double.parse(futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaHardwood![i].lFinal.toString()))/10000;
                        listLuaslHardwood.add(formatDecimal.format(luas));
                        luasHardwood = luasHardwood + luas;
                      } else if (futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaHardwood![i].namaTipeSisi.toString() == "2 Sisi Opsi 3 (2WL)") {
                        num wPlusW = (double.parse(futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaHardwood![i].wFinal.toString()) + double.parse(futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaHardwood![i].wFinal.toString()));
                        num luas = (wPlusW * double.parse(futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaHardwood![i].qtyFinal.toString()) * double.parse(futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaHardwood![i].lFinal.toString()))/10000;
                        listLuaslHardwood.add(formatDecimal.format(luas));
                        luasHardwood = luasHardwood + luas;
                      } else if (futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaHardwood![i].namaTipeSisi.toString() == "1 Sisi Opsi 1 (TL)") {
                        num luas = (double.parse(futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaHardwood![i].tFinal.toString()) * double.parse(futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaHardwood![i].qtyFinal.toString()) * double.parse(futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaHardwood![i].lFinal.toString()))/10000;
                        listLuaslHardwood.add(formatDecimal.format(luas));
                        luasHardwood = luasHardwood + luas;
                      } else if (futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaHardwood![i].namaTipeSisi.toString() == "1 Sisi Opsi 1 (WL)") {
                        num luas = (double.parse(futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaHardwood![i].wFinal.toString()) * double.parse(futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaHardwood![i].qtyFinal.toString()) * double.parse(futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaHardwood![i].lFinal.toString()))/10000;
                        listLuaslHardwood.add(formatDecimal.format(luas));
                        luasHardwood = luasHardwood + luas;
                      } else {
                        num luas = 0;
                        listLuaslHardwood.add(formatDecimal.format(luas));
                        luasHardwood = luasHardwood + luas;
                      }
                    }
                  }
                  if (futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaPlywood!.isNotEmpty) {
                    for (var i = 0; i < futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaPlywood!.length; i++) {
                      num volume = (double.parse(futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaPlywood![i].tRaw.toString()) * double.parse(futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaPlywood![i].wRaw.toString()) * double.parse(futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaPlywood![i].lRaw.toString()) * double.parse(futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaPlywood![i].qtyRaw.toString()))/1000000;
                      volumePlywood = volumePlywood + volume;
                      listVolumePlywood.add(volume);
                      num subTotal = double.parse(futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaPlywood![i].hargaSatuan.toString()) * double.parse(futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaPlywood![i].koefisien.toString()) * double.parse(futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaPlywood![i].qtyRaw.toString());
                      subTotalPlywood.add(subTotal);
                      totalPlywood = totalPlywood + subTotal.round();
                      if (futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaPlywood![i].namaTipeSisi.toString() == "4 Sisi (2TL + 2WL)") {
                        num tPlusW = (double.parse(futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaPlywood![i].tRaw.toString()) + double.parse(futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaPlywood![i].wRaw.toString()));
                        num luas = (tPlusW * 2 * double.parse(futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaPlywood![i].qtyRaw.toString()) * double.parse(futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaPlywood![i].lRaw.toString()))/10000;
                        listLuasPlywood.add(formatDecimal.format(luas));
                        luasPlywood = luasPlywood + luas;
                      } else if (futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaPlywood![i].namaTipeSisi.toString() == "3 Sisi Opsi (2TL + WL)") {
                        num tPlusWPlusT = (double.parse(futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaPlywood![i].tRaw.toString()) + double.parse(futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaPlywood![i].wRaw.toString()) + double.parse(futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaPlywood![i].tRaw.toString()));
                        num luas = (tPlusWPlusT * double.parse(futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaPlywood![i].qtyRaw.toString()) * double.parse(futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaPlywood![i].lRaw.toString()))/10000;
                        listLuasPlywood.add(formatDecimal.format(luas));
                        luasPlywood = luasPlywood + luas;
                      } else if (futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaPlywood![i].namaTipeSisi.toString() == "3 Sisi Opsi 2 (TL + 2WL)") {
                        num tPlusWPlusW = (double.parse(futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaPlywood![i].tRaw.toString()) + double.parse(futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaPlywood![i].wRaw.toString()) + double.parse(futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaPlywood![i].wRaw.toString()));
                        num luas = (tPlusWPlusW * double.parse(futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaPlywood![i].qtyRaw.toString()) * double.parse(futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaPlywood![i].lRaw.toString()))/10000;
                        listLuasPlywood.add(formatDecimal.format(luas));
                        luasPlywood = luasPlywood + luas;
                      } else if (futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaPlywood![i].namaTipeSisi.toString() == "2 Sisi Opsi 1 (TL + WL)") {
                        num tPlusW = (double.parse(futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaPlywood![i].tRaw.toString()) + double.parse(futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaPlywood![i].wRaw.toString()));
                        num luas = (tPlusW * double.parse(futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaPlywood![i].qtyRaw.toString()) * double.parse(futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaPlywood![i].lRaw.toString()))/10000;
                        listLuasPlywood.add(formatDecimal.format(luas));
                        luasPlywood = luasPlywood + luas;
                      } else if (futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaPlywood![i].namaTipeSisi.toString() == "2 Sisi Opsi 2 (2TL)") {
                        num tPlusT = (double.parse(futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaPlywood![i].tRaw.toString()) + double.parse(futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaPlywood![i].tRaw.toString()));
                        num luas = (tPlusT * double.parse(futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaPlywood![i].qtyRaw.toString()) * double.parse(futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaPlywood![i].lRaw.toString()))/10000;
                        listLuasPlywood.add(formatDecimal.format(luas));
                        luasPlywood = luasPlywood + luas;
                      } else if (futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaPlywood![i].namaTipeSisi.toString() == "2 Sisi Opsi 3 (2WL)") {
                        num wPlusW = (double.parse(futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaPlywood![i].wRaw.toString()) + double.parse(futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaPlywood![i].wRaw.toString()));
                        num luas = (wPlusW * double.parse(futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaPlywood![i].qtyRaw.toString()) * double.parse(futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaPlywood![i].lRaw.toString()))/10000;
                        listLuasPlywood.add(formatDecimal.format(luas));
                        luasPlywood = luasPlywood + luas;
                      } else if (futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaPlywood![i].namaTipeSisi.toString() == "1 Sisi Opsi 1 (TL)") {
                        num luas = (double.parse(futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaPlywood![i].tRaw.toString()) * double.parse(futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaPlywood![i].qtyRaw.toString()) * double.parse(futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaPlywood![i].lRaw.toString()))/10000;
                        listLuasPlywood.add(formatDecimal.format(luas));
                        luasPlywood = luasPlywood + luas;
                      } else if (futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaPlywood![i].namaTipeSisi.toString() == "1 Sisi Opsi 1 (WL)") {
                        num luas = (double.parse(futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaPlywood![i].wRaw.toString()) * double.parse(futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaPlywood![i].qtyRaw.toString()) * double.parse(futureInformasiUmumAnalisaSinglePeluangBaku!.data!.analisaHardwood![i].lRaw.toString()))/10000;
                        listLuasPlywood.add(formatDecimal.format(luas));
                        luasPlywood = luasPlywood + luas;
                      } else {
                        num luas = 0;
                        listLuasPlywood.add(formatDecimal.format(luas));
                        luasPlywood = luasPlywood + luas;
                      }
                    }
                  }
                  if (fetchInformasiUmumAnalisaSinglePeluangPenunjang!.data!.analisaFinTpFs!.isNotEmpty) {
                    for (var i = 0; i < fetchInformasiUmumAnalisaSinglePeluangPenunjang!.data!.analisaFinTpFs!.length; i++) {
                      num subTotal = double.parse(fetchInformasiUmumAnalisaSinglePeluangPenunjang!.data!.analisaFinTpFs![i].hargaSatuan.toString()) * double.parse(fetchInformasiUmumAnalisaSinglePeluangPenunjang!.data!.analisaFinTpFs![i].koefisien.toString()) * double.parse(fetchInformasiUmumAnalisaSinglePeluangPenunjang!.data!.analisaFinTpFs![i].qty.toString());
                      totalFactorySupply = totalFactorySupply + subTotal.round();
                    }
                  }
                  if (fetchInformasiUmumAnalisaSinglePeluangPenunjang!.data!.analisaFinTpLc!.isNotEmpty) {
                    for (var i = 0; i < fetchInformasiUmumAnalisaSinglePeluangPenunjang!.data!.analisaFinTpLc!.length; i++) {
                      num subTotal = double.parse(fetchInformasiUmumAnalisaSinglePeluangPenunjang!.data!.analisaFinTpLc![i].hargaSatuan.toString()) * double.parse(fetchInformasiUmumAnalisaSinglePeluangPenunjang!.data!.analisaFinTpLc![i].koefisien.toString()) * double.parse(fetchInformasiUmumAnalisaSinglePeluangPenunjang!.data!.analisaFinTpLc![i].qty.toString());
                      totalLabourCost = totalLabourCost + subTotal.round();
                    }
                  }
                  if (fetchInformasiUmumAnalisaSinglePeluangPenunjang!.data!.analisaFinTpMp!.isNotEmpty) {
                    for (var i = 0; i < fetchInformasiUmumAnalisaSinglePeluangPenunjang!.data!.analisaFinTpMp!.length; i++) {
                      num subTotal = double.parse(fetchInformasiUmumAnalisaSinglePeluangPenunjang!.data!.analisaFinTpMp![i].hargaSatuan.toString()) * double.parse(fetchInformasiUmumAnalisaSinglePeluangPenunjang!.data!.analisaFinTpMp![i].koefisien.toString()) * double.parse(fetchInformasiUmumAnalisaSinglePeluangPenunjang!.data!.analisaFinTpMp![i].qty.toString());
                      totalMachineProcess = totalMachineProcess + subTotal.round();
                    }
                  }
                  if (fetchInformasiUmumAnalisaSinglePeluangPenunjang!.data!.analisaFinTpBop!.isNotEmpty) {
                    for (var i = 0; i < fetchInformasiUmumAnalisaSinglePeluangPenunjang!.data!.analisaFinTpBop!.length; i++) {
                      num subTotal = double.parse(fetchInformasiUmumAnalisaSinglePeluangPenunjang!.data!.analisaFinTpBop![i].hargaSatuan.toString()) * double.parse(fetchInformasiUmumAnalisaSinglePeluangPenunjang!.data!.analisaFinTpBop![i].koefisien.toString()) * double.parse(fetchInformasiUmumAnalisaSinglePeluangPenunjang!.data!.analisaFinTpBop![i].qty.toString());
                      totalBiayaOverhead = totalBiayaOverhead + subTotal.round();
                    }
                  }

                  listNamaFinishingBarangJadi.clear;
                  if (fetchInformasiUmumAnalisaSinglePeluangFinishing!.data!.analisaFinFnBp!.isNotEmpty) {//analisa_fin_fn_bp
                    for (var i = 0; i < fetchInformasiUmumAnalisaSinglePeluangFinishing!.data!.analisaFinFnBp!.length; i++) {
                      if(!listNamaFinishingBarangJadi.contains(fetchInformasiUmumAnalisaSinglePeluangFinishing!.data!.analisaFinFnBp![i].namaFinishingBarangJadi.toString()) && fetchInformasiUmumAnalisaSinglePeluangFinishing!.data!.analisaFinFnBp![i].namaFinishingBarangJadi.toString() != "-"){
                        listNamaFinishingBarangJadi.add(fetchInformasiUmumAnalisaSinglePeluangFinishing!.data!.analisaFinFnBp![i].namaFinishingBarangJadi.toString());
                      }
                    }
                  }
                  if (fetchInformasiUmumAnalisaSinglePeluangFinishing!.data!.analisaFinFnSc!.isNotEmpty) {//analisa_fin_fn_sc
                    for (var i = 0; i < fetchInformasiUmumAnalisaSinglePeluangFinishing!.data!.analisaFinFnSc!.length; i++) {
                      if(!listNamaFinishingBarangJadi.contains(fetchInformasiUmumAnalisaSinglePeluangFinishing!.data!.analisaFinFnSc![i].namaFinishingBarangJadi.toString()) && fetchInformasiUmumAnalisaSinglePeluangFinishing!.data!.analisaFinFnSc![i].namaFinishingBarangJadi.toString() != "-"){
                        listNamaFinishingBarangJadi.add(fetchInformasiUmumAnalisaSinglePeluangFinishing!.data!.analisaFinFnSc![i].namaFinishingBarangJadi.toString());
                      }
                    }
                  }
                  if (fetchInformasiUmumAnalisaSinglePeluangFinishing!.data!.analisaFinFnLc!.isNotEmpty) {//analisa_fin_fn_lc
                    for (var i = 0; i < fetchInformasiUmumAnalisaSinglePeluangFinishing!.data!.analisaFinFnLc!.length; i++) {
                      if(!listNamaFinishingBarangJadi.contains(fetchInformasiUmumAnalisaSinglePeluangFinishing!.data!.analisaFinFnLc![i].namaFinishingBarangJadi.toString()) && fetchInformasiUmumAnalisaSinglePeluangFinishing!.data!.analisaFinFnLc![i].namaFinishingBarangJadi.toString() != "-"){
                        listNamaFinishingBarangJadi.add(fetchInformasiUmumAnalisaSinglePeluangFinishing!.data!.analisaFinFnLc![i].namaFinishingBarangJadi.toString());
                      }
                    }
                  }

                  for(int j = 0 ; j < listNamaFinishingBarangJadi.length ; j++){
                    if(listNamaFinishingBarangJadi[j].toString() != "-"){
                      if (fetchInformasiUmumAnalisaSinglePeluangFinishing!.data!.analisaFinFnBp!.isNotEmpty) {//analisa_fin_fn_bp
                        for (var i = 0; i < fetchInformasiUmumAnalisaSinglePeluangFinishing!.data!.analisaFinFnBp!.length; i++) {
                          if(listNamaFinishingBarangJadi[j].toString().contains(fetchInformasiUmumAnalisaSinglePeluangFinishing!.data!.analisaFinFnBp![i].namaFinishingBarangJadi.toString())){
                            num subTotal = double.parse(fetchInformasiUmumAnalisaSinglePeluangFinishing!.data!.analisaFinFnBp![i].qty.toString()) * double.parse(fetchInformasiUmumAnalisaSinglePeluangFinishing!.data!.analisaFinFnBp![i].hargaSatuan.toString()) * double.parse(fetchInformasiUmumAnalisaSinglePeluangFinishing!.data!.analisaFinFnBp![i].koefisien.toString());
                            totalBahanPenunjangFinishing = totalBahanPenunjangFinishing + subTotal.round();
                          }
                        }
                      }
                      // print(totalBahanPenunjangFinishing);
                      if (fetchInformasiUmumAnalisaSinglePeluangFinishing!.data!.analisaFinFnSc!.isNotEmpty) {//analisa_fin_fn_sc
                        for (var i = 0; i < fetchInformasiUmumAnalisaSinglePeluangFinishing!.data!.analisaFinFnSc!.length; i++) {
                          if(listNamaFinishingBarangJadi[j].toString().contains(fetchInformasiUmumAnalisaSinglePeluangFinishing!.data!.analisaFinFnSc![i].namaFinishingBarangJadi.toString())){
                            num subTotal = double.parse(fetchInformasiUmumAnalisaSinglePeluangFinishing!.data!.analisaFinFnSc![i].qty.toString()) * double.parse(fetchInformasiUmumAnalisaSinglePeluangFinishing!.data!.analisaFinFnSc![i].hargaSatuan.toString()) * double.parse(fetchInformasiUmumAnalisaSinglePeluangFinishing!.data!.analisaFinFnSc![i].koefisien.toString());
                            totalSubkonFinishing = totalSubkonFinishing + subTotal.round();
                          }
                        }
                      }
                      // print(totalSubkonFinishing);
                      if (fetchInformasiUmumAnalisaSinglePeluangFinishing!.data!.analisaFinFnLc!.isNotEmpty) {//analisa_fin_fn_lc
                        for (var i = 0; i < fetchInformasiUmumAnalisaSinglePeluangFinishing!.data!.analisaFinFnLc!.length; i++) {
                          if(listNamaFinishingBarangJadi[j].toString().contains(fetchInformasiUmumAnalisaSinglePeluangFinishing!.data!.analisaFinFnLc![i].namaFinishingBarangJadi.toString())){
                            num subTotal = double.parse(fetchInformasiUmumAnalisaSinglePeluangFinishing!.data!.analisaFinFnLc![i].qty.toString()) * double.parse(fetchInformasiUmumAnalisaSinglePeluangFinishing!.data!.analisaFinFnLc![i].hargaSatuan.toString()) * double.parse(fetchInformasiUmumAnalisaSinglePeluangFinishing!.data!.analisaFinFnLc![i].koefisien.toString());
                            totalLabourCostFinishing = totalLabourCostFinishing + subTotal.round();
                          }
                        }
                      }
                      // print(totalLabourCostFinishing);
                    }
                  }

                  num totalBahanBaku = totalHardwood + totalPlywood;
                  num totalPenunjangProduksi = totalFactorySupply + totalLabourCost + totalMachineProcess + totalBiayaOverhead;
                  num totalFinishing = totalBahanPenunjangFinishing + totalSubkonFinishing + totalLabourCostFinishing;
                  num totals = totalBahanBaku + totalPenunjangProduksi + totalFinishing + totalAlatBantuOnSite + totalLabourCostOnSite + totalBiayaOverheadKantor;
                  totalAnalisaBahanBaku = totalBahanBaku.toString();
                  totalSummaryBiaya.add(totalAnalisaBahanBaku);
                  totalAnalisaPenunjanProduksi = totalPenunjangProduksi.toString();
                  totalSummaryBiaya.add(totalAnalisaPenunjanProduksi);
                  totalAnalisaFinishing = totalFinishing.toString();
                  totalSummaryBiaya.add(totalAnalisaFinishing);
                  grandTotal = totals.toString();
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CardDetail(
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15).w),
                          title: Column(
                            children: <Widget>[
                              CardFieldItemText(
                                label: "Kode Barang Jadi",
                                contentData: futureInformasiUmumAnalisaSinglePeluangUmum!.data!.kodeItem,
                                flexLeftRow: 14,
                                flexRightRow: 20,
                              ),
                              SizedBox(height: getProportionateScreenHeight(5).h),
                              CardFieldItemText(
                                label: "Nama Barang Jadi",
                                contentData: futureInformasiUmumAnalisaSinglePeluangUmum!.data!.namaItem,
                                flexLeftRow: 14,
                                flexRightRow: 20,
                              ),
                              SizedBox(height: getProportionateScreenHeight(5).h),
                              CardFieldItemText(
                                label: "Sumber Barang Jadi",
                                contentData: futureInformasiUmumAnalisaSinglePeluangUmum!.data!.namaKelompok,
                                flexLeftRow: 14,
                                flexRightRow: 20,
                              ),
                              SizedBox(height: getProportionateScreenHeight(5).h),
                              CardFieldItemText(
                                label: "Satuan Jual",
                                contentData: futureInformasiUmumAnalisaSinglePeluangUmum!.data!.namaSatuan,
                                flexLeftRow: 14,
                                flexRightRow: 20,
                              ),
                              SizedBox(height: getProportionateScreenHeight(5).h),
                              CardFieldItemUrlLauncher(
                                label: "Link Referensi",
                                linkReferensi: futureInformasiUmumAnalisaSinglePeluangUmum!.data!.linkReferensi,
                                flexLeftRow: 14,
                                flexRightRow: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                      CardExpansionDetail(
                        label: "Uraian",
                        children: <Widget> [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
                            child: CardItemExpansionDetail(
                              child: SizedBox(
                                width: double.infinity,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w, vertical: getProportionateScreenHeight(10).h),
                                  child: (futureInformasiUmumAnalisaSinglePeluangUmum!.data!.uraian != null)
                                  ? Html(
                                    data: futureInformasiUmumAnalisaSinglePeluangUmum!.data!.uraian
                                  )
                                  :  Text("-",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.sp
                                    ),
                                    textAlign: TextAlign.left,
                                  )
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: getProportionateScreenHeight(10).h),
                        ],
                      ),
                      CardFieldAnalisa(
                        label: "Analisa Bahan Baku",
                        onTap: () {
                          Get.to(AnalisaBahanBakuView(analisaSinglePeluangBaku: widget.futureAnalisaSinglePeluangBaku));
                        },
                      ),
                      CardFieldAnalisa(
                        label: "Analisa Penunjang Produksi",
                        onTap: () {
                          Get.to(AnalisaPenunjangProduksiView(analisaSingleRegplgPenunjang: widget.fetchAnalisaSinglePeluangPenunjang));
                        },
                      ),
                      CardFieldAnalisa(
                        label: "Analisa Finshing",
                        onTap: () {
                          Get.to(AnalisaFinishingView(analisaSingleRegplgFinishing: widget.fetchAnalisaSinglePeluangFinishing));
                        },
                      ),
                      CardFieldTotalAnalisa(
                        child: ListView.builder(
                          itemCount: namaSummaryBiaya.length,
                          itemBuilder: (context, index){
                            return CardFieldTotalAnalisaItem(
                              label: namaSummaryBiaya[index],
                              total: totalSummaryBiaya[index],
                            );
                          },
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                        ),
                      ),
                      CardFieldGrandTotalAnalisa(
                        child: ListTile(
                          title: Column(
                            children: [
                              CardFieldItemTotal(
                                label: "Grand Total",
                                total: grandTotal,
                                flexLeftRow: 15,
                                flexRightRow: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: getProportionateScreenHeight(10).h),
                    ],
                  );
                } else {
                  return Center(
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: getProportionateScreenHeight(5).h),
                        Skeleton(height: getProportionateScreenHeight(200).h, width: double.infinity),
                        SizedBox(height: getProportionateScreenHeight(5).h),
                        Skeleton(height: getProportionateScreenHeight(85).h, width: double.infinity),
                        SizedBox(height: getProportionateScreenHeight(5).h),
                        Skeleton(height: getProportionateScreenHeight(85).h, width: double.infinity),
                        SizedBox(height: getProportionateScreenHeight(5).h),
                        Skeleton(height: getProportionateScreenHeight(85).h, width: double.infinity),
                        SizedBox(height: getProportionateScreenHeight(5).h),
                        Skeleton(height: getProportionateScreenHeight(85).h, width: double.infinity),
                        SizedBox(height: getProportionateScreenHeight(5).h),
                        Skeleton(height: getProportionateScreenHeight(85).h, width: double.infinity),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}