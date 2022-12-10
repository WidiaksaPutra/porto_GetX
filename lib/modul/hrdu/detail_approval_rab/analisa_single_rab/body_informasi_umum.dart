
import 'package:get/get.dart';
import 'package:mgp_mobile_app/model/hrdu/rab/analisa_single_rab.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_rab/analisa_alat_bantu_on_site/alat_bantu_on_site.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_rab/analisa_bahan_baku/analisa_bahan_baku.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_rab/analisa_biaya_overhead_kantor/biaya_overhead_kantor.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_rab/analisa_finishing/analisa_finishing.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_rab/analisa_labour_cost_on_site/analisa_labour_cost_on_site.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_rab/analisa_penunjang_produksi/analisa_penunjang_produksi.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_total.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mgp_mobile_app/widget/component/card_detail.dart';
import 'package:mgp_mobile_app/widget/component/card_field_analisa.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_text.dart';
import 'package:mgp_mobile_app/widget/component/card_field_total_analisa.dart';
import 'package:mgp_mobile_app/widget/component/card_field_total_analisa_item.dart';
import 'package:mgp_mobile_app/widget/component/skeleton.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class BodyInformasi extends StatefulWidget {
  final Future<AnalisaSingleRegrab> futureAnalisaSingleRab;
  const BodyInformasi({Key? key, required this.futureAnalisaSingleRab}) : super(key: key);

  @override
  _BodyInformasiState createState() => _BodyInformasiState();
}

class _BodyInformasiState extends State<BodyInformasi> {
  final formatCurrency = NumberFormat.currency(
    locale: 'ID',
    decimalDigits: 0,
    symbol: "Rp"
  );
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
    "Analisa Alat Bantu On-Site",
    "Analisa Labour Cost On-Site",
    "Analisa Biaya Overhead Kantor",
  ];
  late List totalSummaryBiaya = [];
  late List subTotalHardwood = [];
  late List subTotalPlywood = [];
  late List listLuaslHardwood = [];
  late List listLuasPlywood = [];
  late List listVolumeHardwood = [];
  late List listVolumePlywood = [];

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
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: FutureBuilder(
              future: widget.futureAnalisaSingleRab,
              builder: (BuildContext context, AsyncSnapshot<AnalisaSingleRegrab> snapshot) {
                if (snapshot.hasData) {
                  var analisaSingleRAE = snapshot.data;
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
                  if (analisaSingleRAE!.data!.analisaHardwood!.isNotEmpty) {
                    for (var i = 0; i < analisaSingleRAE.data!.analisaHardwood!.length; i++) {
                      num volume = (double.parse(analisaSingleRAE.data!.analisaHardwood![i].tRaw.toString()) * double.parse(analisaSingleRAE.data!.analisaHardwood![i].wRaw.toString()) * double.parse(analisaSingleRAE.data!.analisaHardwood![i].lRaw.toString()) * double.parse(analisaSingleRAE.data!.analisaHardwood![i].qtyRaw.toString()))/1000000;
                      volumeHardwood = volumeHardwood + volume;
                      listVolumeHardwood.add(volume);
                      num subTotal = volume * double.parse(analisaSingleRAE.data!.analisaHardwood![i].unitPrice.toString()) * double.parse(analisaSingleRAE.data!.analisaHardwood![i].konstanta.toString());
                      subTotalHardwood.add(subTotal);
                      totalHardwood = totalHardwood + subTotal.round();
                      if (analisaSingleRAE.data!.analisaHardwood![i].namaTipeSisi.toString() == "4 Sisi (2TL + 2WL)") {
                        num tPlusW = (double.parse(analisaSingleRAE.data!.analisaHardwood![i].tFinal.toString()) + double.parse(analisaSingleRAE.data!.analisaHardwood![i].wFinal.toString()));
                        num luas = (tPlusW * 2 * double.parse(analisaSingleRAE.data!.analisaHardwood![i].qtyFinal.toString()) * double.parse(analisaSingleRAE.data!.analisaHardwood![i].lFinal.toString()))/10000;
                        listLuaslHardwood.add(formatDecimal.format(luas));
                        luasHardwood = luasHardwood + luas;
                      } else if (analisaSingleRAE.data!.analisaHardwood![i].namaTipeSisi.toString() == "3 Sisi Opsi (2TL + WL)") {
                        num tPlusWPlusT = (double.parse(analisaSingleRAE.data!.analisaHardwood![i].tFinal.toString()) + double.parse(analisaSingleRAE.data!.analisaHardwood![i].wFinal.toString()) + double.parse(analisaSingleRAE.data!.analisaHardwood![i].tFinal.toString()));
                        num luas = (tPlusWPlusT * double.parse(analisaSingleRAE.data!.analisaHardwood![i].qtyFinal.toString()) * double.parse(analisaSingleRAE.data!.analisaHardwood![i].lFinal.toString()))/10000;
                        listLuaslHardwood.add(formatDecimal.format(luas));
                        luasHardwood = luasHardwood + luas;
                      } else if (analisaSingleRAE.data!.analisaHardwood![i].namaTipeSisi.toString() == "3 Sisi Opsi 2 (TL + 2WL)") {
                        num tPlusWPlusW = (double.parse(analisaSingleRAE.data!.analisaHardwood![i].tFinal.toString()) + double.parse(analisaSingleRAE.data!.analisaHardwood![i].wFinal.toString()) + double.parse(analisaSingleRAE.data!.analisaHardwood![i].wFinal.toString()));
                        num luas = (tPlusWPlusW * double.parse(analisaSingleRAE.data!.analisaHardwood![i].qtyFinal.toString()) * double.parse(analisaSingleRAE.data!.analisaHardwood![i].lFinal.toString()))/10000;
                        listLuaslHardwood.add(formatDecimal.format(luas));
                        luasHardwood = luasHardwood + luas;
                      } else if (analisaSingleRAE.data!.analisaHardwood![i].namaTipeSisi.toString() == "2 Sisi Opsi 1 (TL + WL)") {
                        num tPlusW = (double.parse(analisaSingleRAE.data!.analisaHardwood![i].tFinal.toString()) + double.parse(analisaSingleRAE.data!.analisaHardwood![i].wFinal.toString()));
                        num luas = (tPlusW * double.parse(analisaSingleRAE.data!.analisaHardwood![i].qtyFinal.toString()) * double.parse(analisaSingleRAE.data!.analisaHardwood![i].lFinal.toString()))/10000;
                        listLuaslHardwood.add(formatDecimal.format(luas));
                        luasHardwood = luasHardwood + luas;
                      } else if (analisaSingleRAE.data!.analisaHardwood![i].namaTipeSisi.toString() == "2 Sisi Opsi 2 (2TL)") {
                        num tPlusT = (double.parse(analisaSingleRAE.data!.analisaHardwood![i].tFinal.toString()) + double.parse(analisaSingleRAE.data!.analisaHardwood![i].tFinal.toString()));
                        num luas = (tPlusT * double.parse(analisaSingleRAE.data!.analisaHardwood![i].qtyFinal.toString()) * double.parse(analisaSingleRAE.data!.analisaHardwood![i].lFinal.toString()))/10000;
                        listLuaslHardwood.add(formatDecimal.format(luas));
                        luasHardwood = luasHardwood + luas;
                      } else if (analisaSingleRAE.data!.analisaHardwood![i].namaTipeSisi.toString() == "2 Sisi Opsi 3 (2WL)") {
                        num wPlusW = (double.parse(analisaSingleRAE.data!.analisaHardwood![i].wFinal.toString()) + double.parse(analisaSingleRAE.data!.analisaHardwood![i].wFinal.toString()));
                        num luas = (wPlusW * double.parse(analisaSingleRAE.data!.analisaHardwood![i].qtyFinal.toString()) * double.parse(analisaSingleRAE.data!.analisaHardwood![i].lFinal.toString()))/10000;
                        listLuaslHardwood.add(formatDecimal.format(luas));
                        luasHardwood = luasHardwood + luas;
                      } else if (analisaSingleRAE.data!.analisaHardwood![i].namaTipeSisi.toString() == "1 Sisi Opsi 1 (TL)") {
                        num luas = (double.parse(analisaSingleRAE.data!.analisaHardwood![i].tFinal.toString()) * double.parse(analisaSingleRAE.data!.analisaHardwood![i].qtyFinal.toString()) * double.parse(analisaSingleRAE.data!.analisaHardwood![i].lFinal.toString()))/10000;
                        listLuaslHardwood.add(formatDecimal.format(luas));
                        luasHardwood = luasHardwood + luas;
                      } else if (analisaSingleRAE.data!.analisaHardwood![i].namaTipeSisi.toString() == "1 Sisi Opsi 1 (WL)") {
                        num luas = (double.parse(analisaSingleRAE.data!.analisaHardwood![i].wFinal.toString()) * double.parse(analisaSingleRAE.data!.analisaHardwood![i].qtyFinal.toString()) * double.parse(analisaSingleRAE.data!.analisaHardwood![i].lFinal.toString()))/10000;
                        listLuaslHardwood.add(formatDecimal.format(luas));
                        luasHardwood = luasHardwood + luas;
                      } else {
                        num luas = 0;
                        listLuaslHardwood.add(formatDecimal.format(luas));
                        luasHardwood = luasHardwood + luas;
                      }
                    }
                  }
                  if (analisaSingleRAE.data!.analisaPlywood!.isNotEmpty) {
                    for (var i = 0; i < analisaSingleRAE.data!.analisaPlywood!.length; i++) {
                      num volume = (double.parse(analisaSingleRAE.data!.analisaPlywood![i].tRaw.toString()) * double.parse(analisaSingleRAE.data!.analisaPlywood![i].wRaw.toString()) * double.parse(analisaSingleRAE.data!.analisaPlywood![i].lRaw.toString()) * double.parse(analisaSingleRAE.data!.analisaPlywood![i].qtyRaw.toString()))/1000000;
                      volumePlywood = volumePlywood + volume;
                      listVolumePlywood.add(volume);
                      num subTotal = double.parse(analisaSingleRAE.data!.analisaPlywood![i].unitPrice.toString()) * double.parse(analisaSingleRAE.data!.analisaPlywood![i].konstanta.toString()) * double.parse(analisaSingleRAE.data!.analisaPlywood![i].qtyRaw.toString());
                      subTotalPlywood.add(subTotal);
                      totalPlywood = totalPlywood + subTotal.round();
                      if (analisaSingleRAE.data!.analisaPlywood![i].namaTipeSisi.toString() == "4 Sisi (2TL + 2WL)") {
                        num tPlusW = (double.parse(analisaSingleRAE.data!.analisaPlywood![i].tRaw.toString()) + double.parse(analisaSingleRAE.data!.analisaPlywood![i].wRaw.toString()));
                        num luas = (tPlusW * 2 * double.parse(analisaSingleRAE.data!.analisaPlywood![i].qtyRaw.toString()) * double.parse(analisaSingleRAE.data!.analisaPlywood![i].lRaw.toString()))/10000;
                        listLuasPlywood.add(formatDecimal.format(luas));
                        luasPlywood = luasPlywood + luas;
                      } else if (analisaSingleRAE.data!.analisaPlywood![i].namaTipeSisi.toString() == "3 Sisi Opsi (2TL + WL)") {
                        num tPlusWPlusT = (double.parse(analisaSingleRAE.data!.analisaPlywood![i].tRaw.toString()) + double.parse(analisaSingleRAE.data!.analisaPlywood![i].wRaw.toString()) + double.parse(analisaSingleRAE.data!.analisaPlywood![i].tRaw.toString()));
                        num luas = (tPlusWPlusT * double.parse(analisaSingleRAE.data!.analisaPlywood![i].qtyRaw.toString()) * double.parse(analisaSingleRAE.data!.analisaPlywood![i].lRaw.toString()))/10000;
                        listLuasPlywood.add(formatDecimal.format(luas));
                        luasPlywood = luasPlywood + luas;
                      } else if (analisaSingleRAE.data!.analisaPlywood![i].namaTipeSisi.toString() == "3 Sisi Opsi 2 (TL + 2WL)") {
                        num tPlusWPlusW = (double.parse(analisaSingleRAE.data!.analisaPlywood![i].tRaw.toString()) + double.parse(analisaSingleRAE.data!.analisaPlywood![i].wRaw.toString()) + double.parse(analisaSingleRAE.data!.analisaPlywood![i].wRaw.toString()));
                        num luas = (tPlusWPlusW * double.parse(analisaSingleRAE.data!.analisaPlywood![i].qtyRaw.toString()) * double.parse(analisaSingleRAE.data!.analisaPlywood![i].lRaw.toString()))/10000;
                        listLuasPlywood.add(formatDecimal.format(luas));
                        luasPlywood = luasPlywood + luas;
                      } else if (analisaSingleRAE.data!.analisaPlywood![i].namaTipeSisi.toString() == "2 Sisi Opsi 1 (TL + WL)") {
                        num tPlusW = (double.parse(analisaSingleRAE.data!.analisaPlywood![i].tRaw.toString()) + double.parse(analisaSingleRAE.data!.analisaPlywood![i].wRaw.toString()));
                        num luas = (tPlusW * double.parse(analisaSingleRAE.data!.analisaPlywood![i].qtyRaw.toString()) * double.parse(analisaSingleRAE.data!.analisaPlywood![i].lRaw.toString()))/10000;
                        listLuasPlywood.add(formatDecimal.format(luas));
                        luasPlywood = luasPlywood + luas;
                      } else if (analisaSingleRAE.data!.analisaPlywood![i].namaTipeSisi.toString() == "2 Sisi Opsi 2 (2TL)") {
                        num tPlusT = (double.parse(analisaSingleRAE.data!.analisaPlywood![i].tRaw.toString()) + double.parse(analisaSingleRAE.data!.analisaPlywood![i].tRaw.toString()));
                        num luas = (tPlusT * double.parse(analisaSingleRAE.data!.analisaPlywood![i].qtyRaw.toString()) * double.parse(analisaSingleRAE.data!.analisaPlywood![i].lRaw.toString()))/10000;
                        listLuasPlywood.add(formatDecimal.format(luas));
                        luasPlywood = luasPlywood + luas;
                      } else if (analisaSingleRAE.data!.analisaPlywood![i].namaTipeSisi.toString() == "2 Sisi Opsi 3 (2WL)") {
                        num wPlusW = (double.parse(analisaSingleRAE.data!.analisaPlywood![i].wRaw.toString()) + double.parse(analisaSingleRAE.data!.analisaPlywood![i].wRaw.toString()));
                        num luas = (wPlusW * double.parse(analisaSingleRAE.data!.analisaPlywood![i].qtyRaw.toString()) * double.parse(analisaSingleRAE.data!.analisaPlywood![i].lRaw.toString()))/10000;
                        listLuasPlywood.add(formatDecimal.format(luas));
                        luasPlywood = luasPlywood + luas;
                      } else if (analisaSingleRAE.data!.analisaPlywood![i].namaTipeSisi.toString() == "1 Sisi Opsi 1 (TL)") {
                        num luas = (double.parse(analisaSingleRAE.data!.analisaPlywood![i].tRaw.toString()) * double.parse(analisaSingleRAE.data!.analisaPlywood![i].qtyRaw.toString()) * double.parse(analisaSingleRAE.data!.analisaPlywood![i].lRaw.toString()))/10000;
                        listLuasPlywood.add(formatDecimal.format(luas));
                        luasPlywood = luasPlywood + luas;
                      } else if (analisaSingleRAE.data!.analisaPlywood![i].namaTipeSisi.toString() == "1 Sisi Opsi 1 (WL)") {
                        num luas = (double.parse(analisaSingleRAE.data!.analisaPlywood![i].wRaw.toString()) * double.parse(analisaSingleRAE.data!.analisaPlywood![i].qtyRaw.toString()) * double.parse(analisaSingleRAE.data!.analisaHardwood![i].lRaw.toString()))/10000;
                        listLuasPlywood.add(formatDecimal.format(luas));
                        luasPlywood = luasPlywood + luas;
                      } else {
                        num luas = 0;
                        listLuasPlywood.add(formatDecimal.format(luas));
                        luasPlywood = luasPlywood + luas;
                      }
                    }
                  }
                  if (analisaSingleRAE.data!.analisaFinTpFs!.isNotEmpty) {
                    for (var i = 0; i < analisaSingleRAE.data!.analisaFinTpFs!.length; i++) {
                      num subTotal = double.parse(analisaSingleRAE.data!.analisaFinTpFs![i].unitPrice.toString()) * double.parse(analisaSingleRAE.data!.analisaFinTpFs![i].konstanta.toString()) * double.parse(analisaSingleRAE.data!.analisaFinTpFs![i].qty.toString());
                      totalFactorySupply = totalFactorySupply + subTotal.round();
                    }
                  }
                  if (analisaSingleRAE.data!.analisaFinTpLc!.isNotEmpty) {
                    for (var i = 0; i < analisaSingleRAE.data!.analisaFinTpLc!.length; i++) {
                      num subTotal = double.parse(analisaSingleRAE.data!.analisaFinTpLc![i].unitPrice.toString()) * double.parse(analisaSingleRAE.data!.analisaFinTpLc![i].konstanta.toString()) * double.parse(analisaSingleRAE.data!.analisaFinTpLc![i].qty.toString());
                      totalLabourCost = totalLabourCost + subTotal.round();
                    }
                  }
                  if (analisaSingleRAE.data!.analisaFinTpMp!.isNotEmpty) {
                    for (var i = 0; i < analisaSingleRAE.data!.analisaFinTpMp!.length; i++) {
                      num subTotal = double.parse(analisaSingleRAE.data!.analisaFinTpMp![i].unitPrice.toString()) * double.parse(analisaSingleRAE.data!.analisaFinTpMp![i].konstanta.toString()) * double.parse(analisaSingleRAE.data!.analisaFinTpMp![i].qty.toString());
                      totalMachineProcess = totalMachineProcess + subTotal.round();
                    }
                  }
                  if (analisaSingleRAE.data!.analisaFinTpBop!.isNotEmpty) {
                    for (var i = 0; i < analisaSingleRAE.data!.analisaFinTpBop!.length; i++) {
                      num subTotal = double.parse(analisaSingleRAE.data!.analisaFinTpBop![i].unitPrice.toString()) * double.parse(analisaSingleRAE.data!.analisaFinTpBop![i].konstanta.toString()) * double.parse(analisaSingleRAE.data!.analisaFinTpBop![i].qty.toString());
                      totalBiayaOverhead = totalBiayaOverhead + subTotal.round();
                    }
                  }
                  if (analisaSingleRAE.data!.analisaFinFnBp!.isNotEmpty) {
                    for (var i = 0; i < analisaSingleRAE.data!.analisaFinFnBp!.length; i++) {
                      num subTotal = double.parse(analisaSingleRAE.data!.analisaFinFnBp![i].unitPrice.toString()) * double.parse(analisaSingleRAE.data!.analisaFinFnBp![i].konstanta.toString()) * double.parse(analisaSingleRAE.data!.analisaFinFnBp![i].qty.toString());
                      totalBahanPenunjangFinishing = totalBahanPenunjangFinishing+ subTotal.round();
                    }
                  }
                  if (analisaSingleRAE.data!.analisaFinFnSc!.isNotEmpty) {
                    for (var i = 0; i < analisaSingleRAE.data!.analisaFinFnSc!.length; i++) {
                      num subTotal = double.parse(analisaSingleRAE.data!.analisaFinFnSc![i].unitPrice.toString()) * double.parse(analisaSingleRAE.data!.analisaFinFnSc![i].konstanta.toString()) * double.parse(analisaSingleRAE.data!.analisaFinFnSc![i].qty.toString());
                      totalSubkonFinishing = totalSubkonFinishing + subTotal.round();
                    }
                  }
                  if (analisaSingleRAE.data!.analisaFinFnLc!.isNotEmpty) {
                    for (var i = 0; i < analisaSingleRAE.data!.analisaFinFnLc!.length; i++) {
                      num subTotal = double.parse(analisaSingleRAE.data!.analisaFinFnLc![i].unitPrice.toString()) * double.parse(analisaSingleRAE.data!.analisaFinFnLc![i].konstanta.toString()) * double.parse(analisaSingleRAE.data!.analisaFinFnLc![i].qty.toString());
                      totalLabourCostFinishing = totalLabourCostFinishing + subTotal.round();
                    }
                  }
                  if (analisaSingleRAE.data!.analisaAlatBantuOnsite!.isNotEmpty) {
                    for (var i = 0; i < analisaSingleRAE.data!.analisaAlatBantuOnsite!.length; i++) {
                      num subTotal = double.parse(analisaSingleRAE.data!.analisaAlatBantuOnsite![i].unitPrice.toString()) * double.parse(analisaSingleRAE.data!.analisaAlatBantuOnsite![i].konstanta.toString()) * double.parse(analisaSingleRAE.data!.analisaAlatBantuOnsite![i].qty.toString());
                      totalAlatBantuOnSite = totalAlatBantuOnSite + subTotal.round();
                    }
                  }
                  if (analisaSingleRAE.data!.analisaLabourCostOnsite!.isNotEmpty) {
                    for (var i = 0; i < analisaSingleRAE.data!.analisaLabourCostOnsite!.length; i++) {
                      num subTotal = double.parse(analisaSingleRAE.data!.analisaLabourCostOnsite![i].unitPrice.toString()) * double.parse(analisaSingleRAE.data!.analisaLabourCostOnsite![i].konstanta.toString()) * double.parse(analisaSingleRAE.data!.analisaLabourCostOnsite![i].qty.toString());
                      totalLabourCostOnSite = totalLabourCostOnSite + subTotal.round();
                    }
                  }
                  if (analisaSingleRAE.data!.analisaBiayaOverheadKantor!.isNotEmpty) {
                    for (var i = 0; i < analisaSingleRAE.data!.analisaBiayaOverheadKantor!.length; i++) {
                      num subTotal = double.parse(analisaSingleRAE.data!.analisaBiayaOverheadKantor![i].unitPrice.toString()) * double.parse(analisaSingleRAE.data!.analisaBiayaOverheadKantor![i].konstanta.toString()) * double.parse(analisaSingleRAE.data!.analisaBiayaOverheadKantor![i].qty.toString());
                      totalBiayaOverheadKantor = totalBiayaOverheadKantor + subTotal.round();
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
                  totalAnalisaAlatBantuOnSite = totalAlatBantuOnSite.toString();
                  totalSummaryBiaya.add(totalAnalisaAlatBantuOnSite);
                  totalAnalisaLabourCostOnSite = totalLabourCostOnSite.toString();
                  totalSummaryBiaya.add(totalAnalisaLabourCostOnSite);
                  totalAnalisaBiayaOverheadKantor = totalBiayaOverheadKantor.toString();
                  totalSummaryBiaya.add(totalAnalisaBiayaOverheadKantor);
                  grandTotal = totals.toString();
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CardDetail(
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
                          title: Column(
                            children: <Widget>[
                              CardFieldItemText(
                                label: "Kode Barang Jadi",
                                contentData: analisaSingleRAE.data!.kodeItem,
                                flexLeftRow: 14,
                                flexRightRow: 20,
                              ),
                              SizedBox(height: getProportionateScreenHeight(5)),
                              CardFieldItemText(
                                label: "Nama Barang Jadi",
                                contentData: analisaSingleRAE.data!.namaItem,
                                flexLeftRow: 14,
                                flexRightRow: 20,
                              ),
                              // SizedBox(height: getProportionateScreenHeight(5)),
                              // CardFieldItemText(
                              //   label: "Sumber Barang Jadi",
                              //   contentData: analisaSingleRAE.data!.namaKelompok,
                              //   flexLeftRow: 14,
                              //   flexRightRow: 20,
                              // ),
                              SizedBox(height: getProportionateScreenHeight(5)),
                              CardFieldItemText(
                                label: "Satuan Jual",
                                contentData: analisaSingleRAE.data!.namaSatuan,
                                flexLeftRow: 14,
                                flexRightRow: 20,
                              ),
                              // SizedBox(height: getProportionateScreenHeight(5)),
                              // CardFieldItemUrlLauncher(
                              //   label: "Link Referensi",
                              //   linkReferensi: analisaSingleRAE.data!.linkReferensi,
                              //   flexLeftRow: 14,
                              //   flexRightRow: 20,
                              // ),
                            ],
                          ),
                        ),
                      ),
                      // CardExpansionDetail(
                      //   label: "Uraian",
                      //   children: <Widget> [
                      //     Padding(
                      //       padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                      //       child: CardItemExpansionDetail(
                      //         child: SizedBox(
                      //           width: double.infinity,
                      //           child: Padding(
                      //             padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10), vertical: getProportionateScreenHeight(10)),
                      //             child: (analisaSingleRAE.data!.uraian != null)
                      //             ? Expanded(
                      //                 child: Html(
                      //                   data: analisaSingleRAE.data!.uraian
                      //                 )
                      //               )
                      //             : const Text("-",
                      //               style: TextStyle(
                      //                 color: Colors.black,
                      //                 fontSize: 14,
                      //               ),
                      //               textAlign: TextAlign.left,
                      //             )
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //     SizedBox(height: getProportionateScreenHeight(10)),
                      //   ],
                      // ),
                      CardFieldAnalisa(
                        label: "Analisa Bahan Baku",
                        onTap: () {
                          Get.to(AnalisaBahanBakuView(analisaSingleRegrab: widget.futureAnalisaSingleRab));
                        },
                      ),
                      CardFieldAnalisa(
                        label: "Analisa Penunjang Produksi",
                        onTap: () {
                          Get.to(AnalisaPenunjangProduksiView(analisaSingleRegrab: widget.futureAnalisaSingleRab));
                        },
                      ),
                      CardFieldAnalisa(
                        label: "Analisa Finishing",
                        onTap: () {
                          Get.to(AnalisaFinishingView(analisaSingleRegrab: widget.futureAnalisaSingleRab));
                        },
                      ),
                      CardFieldAnalisa(
                        label: "Analisa Alat Bantu On-Site",
                        onTap: () {
                          Get.to(AnalisaAlatBantuOnSiteView(analisaSingleRegrab: widget.futureAnalisaSingleRab));
                        },
                      ),
                      CardFieldAnalisa(
                        label: "Analisa Labour Cost On-Site",
                        onTap: () {
                          Get.to(AnalisaLabourCostOnSiteView(analisaSingleRegrab: widget.futureAnalisaSingleRab));
                        },
                      ),
                      CardFieldAnalisa(
                        label: "Analisa Biaya Overhead Kantor",
                        onTap: () {
                          Get.to(AnalisaBiayaOverheadKantorView(analisaSingleRegrab: widget.futureAnalisaSingleRab));
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
                      SizedBox(height: getProportionateScreenHeight(10)),
                    ],
                  );
                } else {
                  return Center(
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: getProportionateScreenHeight(5)),
                        Skeleton(height: getProportionateScreenHeight(200), width: double.infinity),
                        SizedBox(height: getProportionateScreenHeight(5)),
                        Skeleton(height: getProportionateScreenHeight(85), width: double.infinity),
                        SizedBox(height: getProportionateScreenHeight(5)),
                        Skeleton(height: getProportionateScreenHeight(85), width: double.infinity),
                        SizedBox(height: getProportionateScreenHeight(5)),
                        Skeleton(height: getProportionateScreenHeight(85), width: double.infinity),
                        SizedBox(height: getProportionateScreenHeight(5)),
                        Skeleton(height: getProportionateScreenHeight(85), width: double.infinity),
                        SizedBox(height: getProportionateScreenHeight(5)),
                        Skeleton(height: getProportionateScreenHeight(85), width: double.infinity),
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