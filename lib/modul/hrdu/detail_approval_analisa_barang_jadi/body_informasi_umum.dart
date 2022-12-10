import 'dart:convert';
import 'package:flutter_html/flutter_html.dart';

import 'package:get/get.dart';
import 'package:mgp_mobile_app/model/hrdu/analisa_barang_jadi/analisa_single_barang_jadi.dart';
import 'package:mgp_mobile_app/model/hrdu/analisa_barang_jadi/detail_analisa_barang_jadi_model.dart';
import 'package:mgp_mobile_app/modul/hrdu/approval_analisa_barang_jadi/approval_analisa_barang_jadi.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_analisa_barang_jadi/analisa_bahan_baku/analisa_bahan_baku.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_analisa_barang_jadi/analisa_finishing/analisa_finishing.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_analisa_barang_jadi/analisa_penunjang_produksi/analisa_penunjang_produksi.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/mgp_api_hrdu.dart';
import 'package:mgp_mobile_app/widget/component/alert_approval.dart';
import 'package:mgp_mobile_app/widget/component/button_pemeriksa.dart';
import 'package:mgp_mobile_app/widget/component/button_pengesah.dart';
import 'package:mgp_mobile_app/widget/component/card_expansion_detail.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_total.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mgp_mobile_app/widget/component/card_detail.dart';
import 'package:mgp_mobile_app/widget/component/card_field_analisa.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_text.dart';
import 'package:mgp_mobile_app/widget/component/card_field_total_analisa.dart';
import 'package:mgp_mobile_app/widget/component/card_field_total_analisa_item.dart';
import 'package:mgp_mobile_app/widget/component/card_item_expansion_detail.dart';
import 'package:mgp_mobile_app/widget/component/catatan_approval.dart';
import 'package:mgp_mobile_app/widget/component/error_form.dart';
import 'package:mgp_mobile_app/widget/component/field_catatan_approval.dart';
import 'package:mgp_mobile_app/widget/component/skeleton.dart';
import 'package:mgp_mobile_app/widget/theme/constants.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class BodyInformasi extends StatefulWidget {
  final Future<DetailRegabj> futureAnalisaBarangJadi;
  final String statusMenu;
  const BodyInformasi({
    Key? key,
    required this.futureAnalisaBarangJadi,
    required this.statusMenu,
  }) : super(key: key);

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
  late String totalLuasHardwood;
  late String totalVolumeHardwood;
  late String totalLuasPlywood;
  late String totalVolumePlywood;
  List namaSummaryBiaya = [
    "Analisa Bahan Baku",
    "Analisa Penunjang Produksi",
    "Analisa Finishing"
  ];
  late List totalSummaryBiaya = [];
  late List subTotalHardwood = [];
  late List subTotalPlywood = [];
  late List listLuaslHardwood = [];
  late List listLuasPlywood = [];
  late List listVolumeHardwood = [];
  late List listVolumePlywood = [];
  final _formKey = GlobalKey<FormState>();
  final _catatanTextEditingController = TextEditingController();
  bool visibilityPemeriksa = false;
  bool visibilityPengesah = false;
  bool catatanError = false;
  bool visibilityStatusMenu = false;
  bool isLoading = false;

  Future showAlertDialog(
    final String title,
    final String label,
    final Color color,
    final String noTransaksi,
    final String status,
    final String catatan,
  ) {
    return showDialog(
      context: context, 
      builder: (BuildContext context) {
        return AlertApproval(
          title: title,
          titleColor: color,
          contentApproval: label,
          labelButton: label,
          colorButton: color,
          onClicked: () async {
            Navigator.of(Get.overlayContext!, rootNavigator: true).pop();
            setState(() {
              isLoading = true;
            });
            final _postProses = await MGPAPI().postAnalisaBarangJadi(
              noTransaksi: noTransaksi,
              statusApproval: status,
              catatan: catatan,
              tglApproval: DateTime.now().toString(),
            );
            if (_postProses == "berhasil") {
              // Navigator.of(Get.overlayContext!, rootNavigator: true).pop();
              setState(() {
                Get.off(const AnalisaBarangJadiView());
                isLoading = false;
              });
            }
          }, isLoading: isLoading,
        );
      }
    );
  }

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
            child: Form(
              key: _formKey,
              child: FutureBuilder(
                future: widget.futureAnalisaBarangJadi,
                builder: (BuildContext context, AsyncSnapshot<DetailRegabj> snapshot) {
                  if (snapshot.hasData) {
                    var analisaBarangJadi = snapshot.data;
                    final parsed = json.decode(analisaBarangJadi!.data!.detail!.jsons.toString());
                    AnalisaSingleBarangJadi analisaBarangJadiParsed = AnalisaSingleBarangJadi.fromJson(parsed);
                    String status = analisaBarangJadi.data!.behavior.toString();
                    if (status == "V") {
                      visibilityPemeriksa = true;
                    } else {
                      visibilityPengesah = true;
                    }
                    if (widget.statusMenu == "Approval") {
                      visibilityStatusMenu = true;
                    } else {
                      visibilityStatusMenu = false;
                    }
                    num totalHardwood = 0;
                    num totalPlywood = 0;
                    num totalFactorySupply = 0;
                    num totalLabourCost = 0;
                    num totalMachineProcess = 0;
                    num totalBiayaOverhead = 0;
                    num totalBahanPenunjangFinishing = 0;
                    num totalSubkonFinishing = 0;
                    num totalLabourCostFinishing = 0;
                    num luasHardwood = 0;
                    num luasPlywood = 0;
                    num volumeHardwood = 0;
                    num volumePlywood = 0;
                    if (analisaBarangJadiParsed.analisaHardwood!.isNotEmpty) {
                      for (var i = 0; i < analisaBarangJadiParsed.analisaHardwood!.length; i++) {
                        num volume = (double.parse(analisaBarangJadiParsed.analisaHardwood![i]!.tRaw.toString()) * double.parse(analisaBarangJadiParsed.analisaHardwood![i]!.wRaw.toString()) * double.parse(analisaBarangJadiParsed.analisaHardwood![i]!.lRaw.toString()) * double.parse(analisaBarangJadiParsed.analisaHardwood![i]!.qtyRaw.toString()))/1000000;
                        volumeHardwood = volumeHardwood + volume;
                        listVolumeHardwood.add(volume);
                        num subTotal = volume * double.parse(analisaBarangJadiParsed.analisaHardwood![i]!.hargaSatuan.toString()) * double.parse(analisaBarangJadiParsed.analisaHardwood![i]!.koefisien.toString());
                        subTotalHardwood.add(subTotal);
                        totalHardwood = totalHardwood + subTotal;
                        if (analisaBarangJadiParsed.analisaHardwood![i]!.namaTipeSisi.toString() == "4 Sisi (2TL + 2WL)") {
                          num tPlusW = (double.parse(analisaBarangJadiParsed.analisaHardwood![i]!.tFinal.toString()) + double.parse(analisaBarangJadiParsed.analisaHardwood![i]!.wFinal.toString()));
                          num luas = (tPlusW * 2 * double.parse(analisaBarangJadiParsed.analisaHardwood![i]!.qtyFinal.toString()) * double.parse(analisaBarangJadiParsed.analisaHardwood![i]!.lFinal.toString()))/10000;
                          listLuaslHardwood.add(formatDecimal.format(luas));
                          luasHardwood = luasHardwood + luas;
                        } else if (analisaBarangJadiParsed.analisaHardwood![i]!.namaTipeSisi.toString() == "3 Sisi Opsi (2TL + WL)") {
                          num tPlusWPlusT = (double.parse(analisaBarangJadiParsed.analisaHardwood![i]!.tFinal.toString()) + double.parse(analisaBarangJadiParsed.analisaHardwood![i]!.wFinal.toString()) + double.parse(analisaBarangJadiParsed.analisaHardwood![i]!.tFinal.toString()));
                          num luas = (tPlusWPlusT * double.parse(analisaBarangJadiParsed.analisaHardwood![i]!.qtyFinal.toString()) * double.parse(analisaBarangJadiParsed.analisaHardwood![i]!.lFinal.toString()))/10000;
                          listLuaslHardwood.add(formatDecimal.format(luas));
                          luasHardwood = luasHardwood + luas;
                        } else if (analisaBarangJadiParsed.analisaHardwood![i]!.namaTipeSisi.toString() == "3 Sisi Opsi 2 (TL + 2WL)") {
                          num tPlusWPlusW = (double.parse(analisaBarangJadiParsed.analisaHardwood![i]!.tFinal.toString()) + double.parse(analisaBarangJadiParsed.analisaHardwood![i]!.wFinal.toString()) + double.parse(analisaBarangJadiParsed.analisaHardwood![i]!.wFinal.toString()));
                          num luas = (tPlusWPlusW * double.parse(analisaBarangJadiParsed.analisaHardwood![i]!.qtyFinal.toString()) * double.parse(analisaBarangJadiParsed.analisaHardwood![i]!.lFinal.toString()))/10000;
                          listLuaslHardwood.add(formatDecimal.format(luas));
                          luasHardwood = luasHardwood + luas;
                        } else if (analisaBarangJadiParsed.analisaHardwood![i]!.namaTipeSisi.toString() == "2 Sisi Opsi 1 (TL + WL)") {
                          num tPlusW = (double.parse(analisaBarangJadiParsed.analisaHardwood![i]!.tFinal.toString()) + double.parse(analisaBarangJadiParsed.analisaHardwood![i]!.wFinal.toString()));
                          num luas = (tPlusW * double.parse(analisaBarangJadiParsed.analisaHardwood![i]!.qtyFinal.toString()) * double.parse(analisaBarangJadiParsed.analisaHardwood![i]!.lFinal.toString()))/10000;
                          listLuaslHardwood.add(formatDecimal.format(luas));
                          luasHardwood = luasHardwood + luas;
                        } else if (analisaBarangJadiParsed.analisaHardwood![i]!.namaTipeSisi.toString() == "2 Sisi Opsi 2 (2TL)") {
                          num tPlusT = (double.parse(analisaBarangJadiParsed.analisaHardwood![i]!.tFinal.toString()) + double.parse(analisaBarangJadiParsed.analisaHardwood![i]!.tFinal.toString()));
                          num luas = (tPlusT * double.parse(analisaBarangJadiParsed.analisaHardwood![i]!.qtyFinal.toString()) * double.parse(analisaBarangJadiParsed.analisaHardwood![i]!.lFinal.toString()))/10000;
                          listLuaslHardwood.add(formatDecimal.format(luas));
                          luasHardwood = luasHardwood + luas;
                        } else if (analisaBarangJadiParsed.analisaHardwood![i]!.namaTipeSisi.toString() == "2 Sisi Opsi 3 (2WL)") {
                          num wPlusW = (double.parse(analisaBarangJadiParsed.analisaHardwood![i]!.wFinal.toString()) + double.parse(analisaBarangJadiParsed.analisaHardwood![i]!.wFinal.toString()));
                          num luas = (wPlusW * double.parse(analisaBarangJadiParsed.analisaHardwood![i]!.qtyFinal.toString()) * double.parse(analisaBarangJadiParsed.analisaHardwood![i]!.lFinal.toString()))/10000;
                          listLuaslHardwood.add(formatDecimal.format(luas));
                          luasHardwood = luasHardwood + luas;
                        } else if (analisaBarangJadiParsed.analisaHardwood![i]!.namaTipeSisi.toString() == "1 Sisi Opsi 1 (TL)") {
                          num luas = (double.parse(analisaBarangJadiParsed.analisaHardwood![i]!.tFinal.toString()) * double.parse(analisaBarangJadiParsed.analisaHardwood![i]!.qtyFinal.toString()) * double.parse(analisaBarangJadiParsed.analisaHardwood![i]!.lFinal.toString()))/10000;
                          listLuaslHardwood.add(formatDecimal.format(luas));
                          luasHardwood = luasHardwood + luas;
                        } else if (analisaBarangJadiParsed.analisaHardwood![i]!.namaTipeSisi.toString() == "1 Sisi Opsi 1 (WL)") {
                          num luas = (double.parse(analisaBarangJadiParsed.analisaHardwood![i]!.wFinal.toString()) * double.parse(analisaBarangJadiParsed.analisaHardwood![i]!.qtyFinal.toString()) * double.parse(analisaBarangJadiParsed.analisaHardwood![i]!.lFinal.toString()))/10000;
                          listLuaslHardwood.add(formatDecimal.format(luas));
                          luasHardwood = luasHardwood + luas;
                        } else {
                          num luas = 0;
                          listLuaslHardwood.add(formatDecimal.format(luas));
                          luasHardwood = luasHardwood + luas;
                        }
                      }
                    }
                    if (analisaBarangJadiParsed.analisaPlywood!.isNotEmpty) {
                      for (var i = 0; i < analisaBarangJadiParsed.analisaPlywood!.length; i++) {
                        num volume = (double.parse(analisaBarangJadiParsed.analisaPlywood![i]!.tRaw.toString()) * double.parse(analisaBarangJadiParsed.analisaPlywood![i]!.wRaw.toString()) * double.parse(analisaBarangJadiParsed.analisaPlywood![i]!.lRaw.toString()) * double.parse(analisaBarangJadiParsed.analisaPlywood![i]!.qtyRaw.toString()))/1000000;
                        volumePlywood = volumePlywood + volume;
                        listVolumePlywood.add(volume);
                        num subTotal = double.parse(analisaBarangJadiParsed.analisaPlywood![i]!.hargaSatuan.toString()) * double.parse(analisaBarangJadiParsed.analisaPlywood![i]!.koefisien.toString()) * double.parse(analisaBarangJadiParsed.analisaPlywood![i]!.qtyRaw.toString());
                        subTotalPlywood.add(subTotal);
                        totalPlywood = totalPlywood + subTotal;
                        if (analisaBarangJadiParsed.analisaPlywood![i]!.namaTipeSisi.toString() == "4 Sisi (2TL + 2WL)") {
                          num tPlusW = (double.parse(analisaBarangJadiParsed.analisaPlywood![i]!.tRaw.toString()) + double.parse(analisaBarangJadiParsed.analisaPlywood![i]!.wRaw.toString()));
                          num luas = (tPlusW * 2 * double.parse(analisaBarangJadiParsed.analisaPlywood![i]!.qtyRaw.toString()) * double.parse(analisaBarangJadiParsed.analisaPlywood![i]!.lRaw.toString()))/10000;
                          listLuasPlywood.add(formatDecimal.format(luas));
                          luasPlywood = luasPlywood + luas;
                        } else if (analisaBarangJadiParsed.analisaPlywood![i]!.namaTipeSisi.toString() == "3 Sisi Opsi (2TL + WL)") {
                          num tPlusWPlusT = (double.parse(analisaBarangJadiParsed.analisaPlywood![i]!.tRaw.toString()) + double.parse(analisaBarangJadiParsed.analisaPlywood![i]!.wRaw.toString()) + double.parse(analisaBarangJadiParsed.analisaPlywood![i]!.tRaw.toString()));
                          num luas = (tPlusWPlusT * double.parse(analisaBarangJadiParsed.analisaPlywood![i]!.qtyRaw.toString()) * double.parse(analisaBarangJadiParsed.analisaPlywood![i]!.lRaw.toString()))/10000;
                          listLuasPlywood.add(formatDecimal.format(luas));
                          luasPlywood = luasPlywood + luas;
                        } else if (analisaBarangJadiParsed.analisaPlywood![i]!.namaTipeSisi.toString() == "3 Sisi Opsi 2 (TL + 2WL)") {
                          num tPlusWPlusW = (double.parse(analisaBarangJadiParsed.analisaPlywood![i]!.tRaw.toString()) + double.parse(analisaBarangJadiParsed.analisaPlywood![i]!.wRaw.toString()) + double.parse(analisaBarangJadiParsed.analisaPlywood![i]!.wRaw.toString()));
                          num luas = (tPlusWPlusW * double.parse(analisaBarangJadiParsed.analisaPlywood![i]!.qtyRaw.toString()) * double.parse(analisaBarangJadiParsed.analisaPlywood![i]!.lRaw.toString()))/10000;
                          listLuasPlywood.add(formatDecimal.format(luas));
                          luasPlywood = luasPlywood + luas;
                        } else if (analisaBarangJadiParsed.analisaPlywood![i]!.namaTipeSisi.toString() == "2 Sisi Opsi 1 (TL + WL)") {
                          num tPlusW = (double.parse(analisaBarangJadiParsed.analisaPlywood![i]!.tRaw.toString()) + double.parse(analisaBarangJadiParsed.analisaPlywood![i]!.wRaw.toString()));
                          num luas = (tPlusW * double.parse(analisaBarangJadiParsed.analisaPlywood![i]!.qtyRaw.toString()) * double.parse(analisaBarangJadiParsed.analisaPlywood![i]!.lRaw.toString()))/10000;
                          listLuasPlywood.add(formatDecimal.format(luas));
                          luasPlywood = luasPlywood + luas;
                        } else if (analisaBarangJadiParsed.analisaPlywood![i]!.namaTipeSisi.toString() == "2 Sisi Opsi 2 (2TL)") {
                          num tPlusT = (double.parse(analisaBarangJadiParsed.analisaPlywood![i]!.tRaw.toString()) + double.parse(analisaBarangJadiParsed.analisaPlywood![i]!.tRaw.toString()));
                          num luas = (tPlusT * double.parse(analisaBarangJadiParsed.analisaPlywood![i]!.qtyRaw.toString()) * double.parse(analisaBarangJadiParsed.analisaPlywood![i]!.lRaw.toString()))/10000;
                          listLuasPlywood.add(formatDecimal.format(luas));
                          luasPlywood = luasPlywood + luas;
                        } else if (analisaBarangJadiParsed.analisaPlywood![i]!.namaTipeSisi.toString() == "2 Sisi Opsi 3 (2WL)") {
                          num wPlusW = (double.parse(analisaBarangJadiParsed.analisaPlywood![i]!.wRaw.toString()) + double.parse(analisaBarangJadiParsed.analisaPlywood![i]!.wRaw.toString()));
                          num luas = (wPlusW * double.parse(analisaBarangJadiParsed.analisaPlywood![i]!.qtyRaw.toString()) * double.parse(analisaBarangJadiParsed.analisaPlywood![i]!.lRaw.toString()))/10000;
                          listLuasPlywood.add(formatDecimal.format(luas));
                          luasPlywood = luasPlywood + luas;
                        } else if (analisaBarangJadiParsed.analisaPlywood![i]!.namaTipeSisi.toString() == "1 Sisi Opsi 1 (TL)") {
                          num luas = (double.parse(analisaBarangJadiParsed.analisaPlywood![i]!.tRaw.toString()) * double.parse(analisaBarangJadiParsed.analisaPlywood![i]!.qtyRaw.toString()) * double.parse(analisaBarangJadiParsed.analisaPlywood![i]!.lRaw.toString()))/10000;
                          listLuasPlywood.add(formatDecimal.format(luas));
                          luasPlywood = luasPlywood + luas;
                        } else if (analisaBarangJadiParsed.analisaPlywood![i]!.namaTipeSisi.toString() == "1 Sisi Opsi 1 (WL)") {
                          num luas = (double.parse(analisaBarangJadiParsed.analisaPlywood![i]!.wRaw.toString()) * double.parse(analisaBarangJadiParsed.analisaPlywood![i]!.qtyRaw.toString()) * double.parse(analisaBarangJadiParsed.analisaHardwood![i]!.lRaw.toString()))/10000;
                          listLuasPlywood.add(formatDecimal.format(luas));
                          luasPlywood = luasPlywood + luas;
                        } else {
                          num luas = 0;
                          listLuasPlywood.add(formatDecimal.format(luas));
                          luasPlywood = luasPlywood + luas;
                        }
                      }
                    }
                    if (analisaBarangJadiParsed.analisaFinTpFs!.isNotEmpty) {
                      for (var i = 0; i < analisaBarangJadiParsed.analisaFinTpFs!.length; i++) {
                        num subTotal = double.parse(analisaBarangJadiParsed.analisaFinTpFs![i]!.hargaSatuan.toString()) * double.parse(analisaBarangJadiParsed.analisaFinTpFs![i]!.koefisien.toString()) * double.parse(analisaBarangJadiParsed.analisaFinTpFs![i]!.qty.toString());
                        totalFactorySupply = totalFactorySupply + subTotal;
                      }
                    }
                    if (analisaBarangJadiParsed.analisaFinTpLc!.isNotEmpty) {
                      for (var i = 0; i < analisaBarangJadiParsed.analisaFinTpLc!.length; i++) {
                        num subTotal = double.parse(analisaBarangJadiParsed.analisaFinTpLc![i]!.hargaSatuan.toString()) * double.parse(analisaBarangJadiParsed.analisaFinTpLc![i]!.koefisien.toString()) * double.parse(analisaBarangJadiParsed.analisaFinTpLc![i]!.qty.toString());
                        totalLabourCost = totalLabourCost + subTotal;
                      }
                    }
                    if (analisaBarangJadiParsed.analisaFinTpMp!.isNotEmpty) {
                      for (var i = 0; i < analisaBarangJadiParsed.analisaFinTpMp!.length; i++) {
                        num subTotal = double.parse(analisaBarangJadiParsed.analisaFinTpMp![i]!.hargaSatuan.toString()) * double.parse(analisaBarangJadiParsed.analisaFinTpMp![i]!.koefisien.toString()) * double.parse(analisaBarangJadiParsed.analisaFinTpMp![i]!.qty.toString());
                        totalMachineProcess = totalMachineProcess + subTotal;
                      }
                    }
                    if (analisaBarangJadiParsed.analisaFinTpBop!.isNotEmpty) {
                      for (var i = 0; i < analisaBarangJadiParsed.analisaFinTpBop!.length; i++) {
                        num subTotal = double.parse(analisaBarangJadiParsed.analisaFinTpBop![i]!.hargaSatuan.toString()) * double.parse(analisaBarangJadiParsed.analisaFinTpBop![i]!.koefisien.toString()) * double.parse(analisaBarangJadiParsed.analisaFinTpBop![i]!.qty.toString());
                        totalBiayaOverhead = totalBiayaOverhead + subTotal;
                      }
                    }
                    if (analisaBarangJadiParsed.analisaFinFnBp!.isNotEmpty) {
                      for (var i = 0; i < analisaBarangJadiParsed.analisaFinFnBp!.length; i++) {
                        num subTotal = double.parse(analisaBarangJadiParsed.analisaFinFnBp![i]!.hargaSatuan.toString()) * double.parse(analisaBarangJadiParsed.analisaFinFnBp![i]!.koefisien.toString()) * double.parse(analisaBarangJadiParsed.analisaFinFnBp![i]!.qty.toString());
                        totalBahanPenunjangFinishing = totalBahanPenunjangFinishing+ subTotal;
                      }
                    }
                    if (analisaBarangJadiParsed.analisaFinFnSc!.isNotEmpty) {
                      for (var i = 0; i < analisaBarangJadiParsed.analisaFinFnSc!.length; i++) {
                        num subTotal = double.parse(analisaBarangJadiParsed.analisaFinFnSc![i]!.hargaSatuan.toString()) * double.parse(analisaBarangJadiParsed.analisaFinFnSc![i]!.koefisien.toString()) * double.parse(analisaBarangJadiParsed.analisaFinFnSc![i]!.qty.toString());
                        totalSubkonFinishing = totalSubkonFinishing + subTotal;
                      }
                    }
                    if (analisaBarangJadiParsed.analisaFinFnLc!.isNotEmpty) {
                      for (var i = 0; i < analisaBarangJadiParsed.analisaFinFnLc!.length; i++) {
                        num subTotal = double.parse(analisaBarangJadiParsed.analisaFinFnLc![i]!.hargaSatuan.toString()) * double.parse(analisaBarangJadiParsed.analisaFinFnLc![i]!.koefisien.toString()) * double.parse(analisaBarangJadiParsed.analisaFinFnLc![i]!.qty.toString());
                        totalLabourCostFinishing = totalLabourCostFinishing + subTotal;
                      }
                    }
                    num totalBahanBaku = totalHardwood + totalPlywood;
                    num totalPenunjangProduksi = totalFactorySupply + totalLabourCost + totalMachineProcess + totalBiayaOverhead;
                    num totalFinishing = totalBahanPenunjangFinishing + totalSubkonFinishing + totalLabourCostFinishing;
                    num totals = totalBahanBaku + totalPenunjangProduksi + totalFinishing;
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
                            contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
                            title: Column(
                              children: <Widget>[
                                CardFieldItemText(
                                  label: "Kode Barang Jadi",
                                  contentData: analisaBarangJadi.data!.detail!.kodeItem,
                                  flexLeftRow: 14,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5)),
                                CardFieldItemText(
                                  label: "Nama Barang Jadi",
                                  contentData: analisaBarangJadi.data!.detail!.namaItem,
                                  flexLeftRow: 14,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5)),
                                CardFieldItemText(
                                  label: "Sumber Barang Jadi",
                                  contentData: analisaBarangJadi.data!.detail!.namaKelompok,
                                  flexLeftRow: 14,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5)),
                                CardFieldItemText(
                                  label: "Satuan Jual",
                                  contentData: analisaBarangJadi.data!.detail!.namaSatuan,
                                  flexLeftRow: 14,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5)),
                                CardFieldItemUrlLauncher(
                                  label: "Link Referensi",
                                  linkReferensi: analisaBarangJadi.data!.detail!.linkReferensi,
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
                              padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                              child: CardItemExpansionDetail(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10), vertical: getProportionateScreenHeight(10)),
                                  child: (analisaBarangJadi.data!.detail!.uraian != null)
                                  ? Html(
                                    data: analisaBarangJadi.data!.detail!.uraian
                                  )
                                  : Text("-",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                    textAlign: TextAlign.left,
                                  )
                                ),
                              ),
                            ),
                            SizedBox(height: getProportionateScreenHeight(10)),
                          ],
                        ),
                        CardFieldAnalisa(
                          label: "Analisa Bahan Baku",
                          onTap: () {
                            Get.to(AnalisaBahanBakuView(futureAnalisaBarangJadi: widget.futureAnalisaBarangJadi));
                          },
                        ),
                        CardFieldAnalisa(
                          label: "Analisa Penunjang Produksi",
                          onTap: () {
                            Get.to(AnalisaPenunjangProduksiView(futureAnalisaBarangJadi: widget.futureAnalisaBarangJadi));
                          },
                        ),
                        CardFieldAnalisa(
                          label: "Analisa Finishing",
                          onTap: () {
                            Get.to(AnalisaFinishingView(futureAnalisaBarangJadi: widget.futureAnalisaBarangJadi));
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
                        if (analisaBarangJadi.data!.approval!.isNotEmpty)...[
                          CardExpansionDetail(
                            label: "Catatan Approval",
                            children: <Widget> [
                              ListView.separated(
                                separatorBuilder: (context, index) => SizedBox(
                                  height: getProportionateScreenHeight(10),
                                ),
                                itemCount: analisaBarangJadi.data!.approval!.length,
                                itemBuilder: (context, index){
                                  return FieldCatatanApproval(
                                    index: index,
                                    statusApproval: analisaBarangJadi.data!.approval![index]!.statusApproval,
                                    namaKaryawan: analisaBarangJadi.data!.approval![index]!.namaKaryawan,
                                    catatanApproval: analisaBarangJadi.data!.approval![index]!.catatan,
                                    tglApproval: analisaBarangJadi.data!.approval![index]!.tglApproval,
                                  );
                                },
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                              ),
                              SizedBox(height: getProportionateScreenHeight(10)),
                            ]
                          ),
                        ],
                        Visibility(
                          visible: visibilityStatusMenu,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10), horizontal: getProportionateScreenWidth(3)),
                            child: CatatanApproval(
                              controller: _catatanTextEditingController,
                              onChanged: (value) {
                                if (value!.isNotEmpty) {
                                  setState(() {
                                    catatanError = false;
                                  });
                                }
                                return; 
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  setState(() {
                                    catatanError = true;
                                  });
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        Visibility(
                          visible: catatanError,
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: getProportionateScreenHeight(5)),
                              const FormErrors(errors: kCatatanError),
                              SizedBox(height: getProportionateScreenHeight(8)),
                            ],
                          )
                        ),
                        Visibility(
                          visible: visibilityStatusMenu,
                          child: SizedBox(height: getProportionateScreenHeight(10))
                        ),
                        Visibility(
                          visible: visibilityStatusMenu,
                          child: ButtonPemeriksa(
                            visibilityPemeriksa: visibilityPemeriksa,
                            onClickedRevise: () {
                              if (_formKey.currentState!.validate()) {
                                if (_catatanTextEditingController.text != "") {
                                  showAlertDialog(
                                    "REVISE Analisa Barang Jadi",
                                    "REVISE",
                                    reviseButtonColor,
                                    analisaBarangJadi.data!.detail!.idItemBuaso.toString(),
                                    "REV",
                                    _catatanTextEditingController.text,
                                  );
                                }
                              }
                            },
                            onClickedReject: () {
                              if (_formKey.currentState!.validate()) {
                                if (_catatanTextEditingController.text != "") {
                                  showAlertDialog(
                                    "REJECT Analisa Barang Jadi",
                                    "REJECT",
                                    rejectButtonColor,
                                    analisaBarangJadi.data!.detail!.idItemBuaso.toString(),
                                    "REJ",
                                    _catatanTextEditingController.text,
                                  );
                                }
                              }
                            },
                            onClickedVerify: () {
                              if (_formKey.currentState!.validate()) {
                                if (_catatanTextEditingController.text != "") {
                                  showAlertDialog(
                                    "VERIFY Analisa Barang Jadi",
                                    "VERIFY",
                                    verifyButtonColor,
                                    analisaBarangJadi.data!.detail!.idItemBuaso.toString(),
                                    "VER",
                                    _catatanTextEditingController.text,
                                  );
                                }
                              }
                            }, isLoading: isLoading,
                          ),
                        ),
                        Visibility(
                          visible: visibilityStatusMenu,
                          child: ButtonPengesah(
                            visibilityPengesah: visibilityPengesah,
                            onClickedReject: () {
                              if (_formKey.currentState!.validate()) {
                                if (_catatanTextEditingController.text != "") {
                                  showAlertDialog(
                                    "REJECT Analisa Barang Jadi",
                                    "REJECT",
                                    rejectButtonColor,
                                    analisaBarangJadi.data!.detail!.idItemBuaso.toString(),
                                    "REJ",
                                    _catatanTextEditingController.text,
                                  );
                                }
                              }
                            },
                            onClickedApprove: () {
                              if (_formKey.currentState!.validate()) {
                                if (_catatanTextEditingController.text != "") {
                                  showAlertDialog(
                                    "APPROVE Analisa Barang Jadi",
                                    "APPROVE",
                                    reviseButtonColor,
                                    analisaBarangJadi.data!.detail!.idItemBuaso.toString(),
                                    "APP",
                                    _catatanTextEditingController.text,
                                  );
                                }
                              }
                            }, isLoading: isLoading,
                          ),
                        ),
                        SizedBox(height: getProportionateScreenHeight(30)),
                      ],
                    );
                  } else {
                    return Center(
                      child: Column(
                        children:  <Widget>[
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
      ),
    );
  }
}