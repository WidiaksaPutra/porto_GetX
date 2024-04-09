import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/marketing/rae/mixin_rae.dart';
import 'package:mgp_mobile_app/model/hrdu/rae/rekapitulasi.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_rae/summary_biaya/summary_biaya_bahan_lainnya/alat_bantu_on-site/alat_bantu_on-site.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_rae/summary_biaya/summary_biaya_bahan_lainnya/biaya_overhead/biaya_overhead.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_rae/summary_biaya/summary_biaya_bahan_lainnya/biaya_overhead_kantor/biaya_overhead_kantor.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_rae/summary_biaya/summary_biaya_bahan_lainnya/factory_supply/factory_supply.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_rae/summary_biaya/summary_biaya_bahan_lainnya/finishing/finishing.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_rae/summary_biaya/summary_biaya_bahan_lainnya/labour_cost/labour_cost.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_rae/summary_biaya/summary_biaya_bahan_lainnya/labour_cost_on-site/labour_cost_on-site.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_rae/summary_biaya/summary_biaya_bahan_lainnya/machine_process/labour_cost.dart';
import 'package:mgp_mobile_app/widget/component/card_expansion_detail.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_format_currency.dart';
import 'package:mgp_mobile_app/widget/component/card_item_expansion_detail.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class Body extends StatelessWidget with RaeRekapitulasi{
  final String idRae;
  Body({Key? key, required this.idRae}) : super(key: key);
  late Future<Rekapitulasi> futureSumaryRekapitulasi = fetchDataRaeRekapitulasi(idRaeDetail: idRae);

  @override
  Widget build(BuildContext context) {

    late List subTotalFactorySupply = [];
    num totalFactorySupply = 0;
    late List subTotalLabourCost = [];
    num totalLabourCost = 0;
    late List subTotalMachineProcess = [];
    num totalMachineProcess = 0;
    late List subTotalBiayaOverhead = [];
    num totalBiayaOverhead = 0;
    late List<String> listNamaFinishingBarangJadi = [];
    num totalBahanPenunjangFinishing = 0;
    num totalSubkonFinishing = 0;
    num totalLabourCostFinishing = 0;
    num totalLabourCostOnSite = 0;
    num totalBiayaOverheadKantor = 0;
    num totalAlatBantuOnsite = 0;
    late List listHardwood = [];
    late List listPlywood = [];
    late final listSubTotalOverheadKantor;
    late List unitPriceAlatBantuOnSite = [];
    num countHardPly1 = 0;
    late num unitPrice;
    late num totalPenunjangProduksi;
    late num totalFinishing;
    late List listUnitPraceOverheadKantor = [];

    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: FutureBuilder(
              future: futureSumaryRekapitulasi,
              builder: (BuildContext context, AsyncSnapshot<Rekapitulasi> snapshot) {
                if (snapshot.hasData) {
                  var rekapitulasi = snapshot.data;
                  listSubTotalOverheadKantor = List.generate(rekapitulasi!.data.length, (_) => []);
                  late List subTotalBiayaOverheadKantor = [];
                  num totalHardwood;
                  num totalPlywood;
                  num subTotalHardwood;
                  num subTotalPlywood;
                  num plusUnitPrace1 = 0;
                  num unitPraceOverheadKantor = 0;

                  for(int i = 0 ; i<rekapitulasi.data.length ; i++){
                    if (rekapitulasi.data[i].analisaFinTpFs!.isNotEmpty) {
                      for (var j = 0; j < rekapitulasi.data[i].analisaFinTpFs!.length; j++) {
                        num subTotal = double.parse(rekapitulasi.data[i].analisaFinTpFs![j].qty.toString()) * double.parse(rekapitulasi.data[i].analisaFinTpFs![j].unitPrice.toString()) * double.parse(rekapitulasi.data[i].analisaFinTpFs![j].konstanta.toString());
                        subTotalFactorySupply.add(subTotal);
                        totalFactorySupply = totalFactorySupply + subTotal.round();
                      }
                    }
                    if (rekapitulasi.data[i].analisaFinTpLc!.isNotEmpty) {
                      for (var j = 0; j < rekapitulasi.data[i].analisaFinTpLc!.length; j++) {
                        num subTotal = double.parse(rekapitulasi.data[i].analisaFinTpLc![j].qty.toString()) * double.parse(rekapitulasi.data[i].analisaFinTpLc![j].unitPrice.toString()) * double.parse(rekapitulasi.data[i].analisaFinTpLc![j].konstanta.toString());
                        subTotalLabourCost.add(subTotal);
                        totalLabourCost = totalLabourCost + subTotal.round();
                      }
                    }
                    if (rekapitulasi.data[i].analisaFinTpMp!.isNotEmpty) {
                      for (var j = 0; j < rekapitulasi.data[i].analisaFinTpMp!.length; j++) {
                        num subTotal = double.parse(rekapitulasi.data[i].analisaFinTpMp![j].qty.toString()) * double.parse(rekapitulasi.data[i].analisaFinTpMp![j].unitPrice.toString()) * double.parse(rekapitulasi.data[i].analisaFinTpMp![j].konstanta.toString());
                        subTotalMachineProcess.add(subTotal);
                        totalMachineProcess = totalMachineProcess + subTotal.round();
                      }
                    } 
                    if (rekapitulasi.data[i].analisaFinTpBop!.isNotEmpty) {
                      for (var j = 0; j < rekapitulasi.data[i].analisaFinTpBop!.length; j++) {
                        num subTotal = double.parse(rekapitulasi.data[i].analisaFinTpBop![j].qty.toString()) * double.parse(rekapitulasi.data[i].analisaFinTpBop![j].unitPrice.toString()) * double.parse(rekapitulasi.data[i].analisaFinTpBop![j].konstanta.toString());
                        subTotalBiayaOverhead.add(subTotal);
                        totalBiayaOverhead = totalBiayaOverhead + subTotal.round();
                      }
                    }
                    listNamaFinishingBarangJadi.clear;
                    if (rekapitulasi.data[i].analisaFinFnBp!.isNotEmpty) {//analisa_fin_fn_bp
                      for (var j = 0; j < rekapitulasi.data[i].analisaFinFnBp!.length; j++) {
                        if(!listNamaFinishingBarangJadi.contains(rekapitulasi.data[i].analisaFinFnBp![j].namaFinishingBarangJadi.toString()) && rekapitulasi.data[i].analisaFinFnBp![j].namaFinishingBarangJadi.toString() != "-"){
                          listNamaFinishingBarangJadi.add(rekapitulasi.data[i].analisaFinFnBp![j].namaFinishingBarangJadi.toString());
                        }
                      }
                    }
                    if (rekapitulasi.data[i].analisaFinFnSc!.isNotEmpty) {//analisa_fin_fn_sc
                      for (var j = 0; j < rekapitulasi.data[i].analisaFinFnSc!.length; j++) {
                        if(!listNamaFinishingBarangJadi.contains(rekapitulasi.data[i].analisaFinFnSc![j].namaFinishingBarangJadi.toString()) && rekapitulasi.data[i].analisaFinFnSc![j].namaFinishingBarangJadi.toString() != "-"){
                          listNamaFinishingBarangJadi.add(rekapitulasi.data[i].analisaFinFnSc![j].namaFinishingBarangJadi.toString());
                        }
                      }
                    }
                    if (rekapitulasi.data[i].analisaFinFnLc!.isNotEmpty) {//analisa_fin_fn_lc
                      for (var j = 0; j < rekapitulasi.data[i].analisaFinFnLc!.length; j++) {
                        if(!listNamaFinishingBarangJadi.contains(rekapitulasi.data[i].analisaFinFnLc![j].namaFinishingBarangJadi.toString()) && rekapitulasi.data[i].analisaFinFnLc![j].namaFinishingBarangJadi.toString() != "-"){
                          listNamaFinishingBarangJadi.add(rekapitulasi.data[i].analisaFinFnLc![j].namaFinishingBarangJadi.toString());
                        }
                      }
                    }

                    for(int j = 0 ; j < listNamaFinishingBarangJadi.length ; j++){
                      if(listNamaFinishingBarangJadi[j].toString() != "-"){
                        if (rekapitulasi.data[i].analisaFinFnBp!.isNotEmpty) {//analisa_fin_fn_bp
                          for (var k = 0; k < rekapitulasi.data[i].analisaFinFnBp!.length; k++) {
                            if(listNamaFinishingBarangJadi[j].toString().contains(rekapitulasi.data[i].analisaFinFnBp![k].namaFinishingBarangJadi.toString())){
                              num subTotal = double.parse(rekapitulasi.data[i].analisaFinFnBp![k].qty.toString()) * double.parse(rekapitulasi.data[i].analisaFinFnBp![k].unitPrice.toString()) * double.parse(rekapitulasi.data[i].analisaFinFnBp![k].konstanta.toString());
                              totalBahanPenunjangFinishing = totalBahanPenunjangFinishing + subTotal.round();
                            }
                          }
                        }
                        // print(totalBahanPenunjangFinishing);
                        if (rekapitulasi.data[i].analisaFinFnSc!.isNotEmpty) {//analisa_fin_fn_sc
                          for (var k = 0; k < rekapitulasi.data[i].analisaFinFnSc!.length; k++) {
                            if(listNamaFinishingBarangJadi[j].toString().contains(rekapitulasi.data[i].analisaFinFnSc![k].namaFinishingBarangJadi.toString())){
                              num subTotal = double.parse(rekapitulasi.data[i].analisaFinFnSc![k].qty.toString()) * double.parse(rekapitulasi.data[i].analisaFinFnSc![k].unitPrice.toString()) * double.parse(rekapitulasi.data[i].analisaFinFnSc![k].konstanta.toString());
                              totalSubkonFinishing = totalSubkonFinishing + subTotal.round();
                            }
                          }
                        }
                        // print(totalSubkonFinishing);
                        if (rekapitulasi.data[i].analisaFinFnLc!.isNotEmpty) {//analisa_fin_fn_lc
                          for (var k = 0; k < rekapitulasi.data[i].analisaFinFnLc!.length; k++) {
                            if(listNamaFinishingBarangJadi[j].toString().contains(rekapitulasi.data[i].analisaFinFnLc![k].namaFinishingBarangJadi.toString())){
                              num subTotal = double.parse(rekapitulasi.data[i].analisaFinFnLc![k].qty.toString()) * double.parse(rekapitulasi.data[i].analisaFinFnLc![k].unitPrice.toString()) * double.parse(rekapitulasi.data[i].analisaFinFnLc![k].konstanta.toString());
                              totalLabourCostFinishing = totalLabourCostFinishing + subTotal.round();
                            }
                          }
                        }
                        // print(totalLabourCostFinishing);
                      }
                    }

                    totalHardwood = 0;
                    if (rekapitulasi.data[i].analisaHardwood!.isNotEmpty) {
                      int lengAnalisaHardwood = rekapitulasi.data[i].analisaHardwood!.length;
                      for (int j = 0; j < lengAnalisaHardwood; j++) {
                        num volume = (double.parse(rekapitulasi.data[i].analisaHardwood![j].tRaw.toString()) * double.parse(rekapitulasi.data[i].analisaHardwood![j].wRaw.toString()) * double.parse(rekapitulasi.data[i].analisaHardwood![j].lRaw.toString()) * double.parse(rekapitulasi.data[i].analisaHardwood![j].qtyRaw.toString()))/1000000;
                        volume = (volume < 0.000001) ? 0.000001 : volume;
                        subTotalHardwood = volume * double.parse(rekapitulasi.data[i].analisaHardwood![j].hargaSatuan.toString()) * double.parse(rekapitulasi.data[i].analisaHardwood![j].konstanta.toString());
                        totalHardwood = totalHardwood + subTotalHardwood;
                      }
                    }
                    listHardwood.add(totalHardwood);

                    totalPlywood = 0;
                    if (rekapitulasi.data[i].analisaPlywood!.isNotEmpty) {
                      int lengAnalisaPlywood = rekapitulasi.data[i].analisaPlywood!.length;
                      for (int j = 0; j < lengAnalisaPlywood; j++) {
                        subTotalPlywood = double.parse(rekapitulasi.data[i].analisaPlywood![j].unitPrice.toString()) * double.parse(rekapitulasi.data[i].analisaPlywood![j].qtyRaw.toString());
                        totalPlywood = totalPlywood + subTotalPlywood.round();
                      }
                    }
                    listPlywood.add(totalPlywood);

                    num countHardPly = listHardwood[i] + listPlywood[i];
                    countHardPly1 = countHardPly1 + listHardwood[i] + listPlywood[i];
                    // print("h ${listHardwood[i]}");
                    // print("p ${listPlywood[i]}");
                    // print("total HP ${countHardPly}");
                    unitPriceAlatBantuOnSite.add(countHardPly);
                    if (rekapitulasi.data[i].analisaAlatBantuOnsite!.isNotEmpty) {
                      int lengAnalisaAlatBantuOnsite = rekapitulasi.data[i].analisaAlatBantuOnsite!.length;
                      for (int j = 0; j < lengAnalisaAlatBantuOnsite; j++) {
                        num totalPrice = unitPriceAlatBantuOnSite[i] * double.parse(rekapitulasi.data[i].analisaAlatBantuOnsite![j].qty.toString()) * 
                        double.parse(rekapitulasi.data[i].analisaAlatBantuOnsite![j].konstanta.toString());
                        totalAlatBantuOnsite = totalAlatBantuOnsite + totalPrice.roundToDouble();
                      }
                    }
                    
                    if (rekapitulasi.data[i].analisaLabourCostOnsite!.isNotEmpty) {
                      for (var j = 0; j < rekapitulasi.data[i].analisaLabourCostOnsite!.length; j++) {
                        num subTotal = double.parse(rekapitulasi.data[i].analisaLabourCostOnsite![j].unitPrice.toString()) * double.parse(rekapitulasi.data[i].analisaLabourCostOnsite![j].konstanta.toString()) * double.parse(rekapitulasi.data[i].analisaLabourCostOnsite![j].qty.toString());
                        totalLabourCostOnSite = totalLabourCostOnSite + subTotal.round();
                      }
                    }

                    totalPenunjangProduksi = totalFactorySupply + totalLabourCost + totalMachineProcess + totalBiayaOverhead;
                    totalFinishing = totalBahanPenunjangFinishing + totalSubkonFinishing + totalLabourCostFinishing;
                    num unitPrice1 = countHardPly1 + totalPenunjangProduksi + totalFinishing + totalAlatBantuOnsite + totalLabourCostOnSite;
                    plusUnitPrace1 = unitPraceOverheadKantor + plusUnitPrace1;
                    unitPraceOverheadKantor = unitPrice1 - plusUnitPrace1;
                    listUnitPraceOverheadKantor.add(unitPraceOverheadKantor);
                    if (rekapitulasi.data[i].analisaBiayaOverheadKantor!.isNotEmpty) {
                      for (var j = 0; j < rekapitulasi.data[i].analisaBiayaOverheadKantor!.length; j++) {
                        num subTotal = double.parse(rekapitulasi.data[i].analisaBiayaOverheadKantor![j].qty.toString()) * listUnitPraceOverheadKantor[i] * double.parse(rekapitulasi.data[i].analisaBiayaOverheadKantor![j].konstanta.toString());
                        // print(subTotal);
                        subTotalBiayaOverheadKantor.add(subTotal);
                        totalBiayaOverheadKantor = totalBiayaOverheadKantor + subTotal;
                      }
                      listSubTotalOverheadKantor[i].addAll(subTotalBiayaOverheadKantor);
                      subTotalBiayaOverheadKantor.clear();
                    }           
                  }
                  // print(rekapitulasi.data.length);
                  // print(listSubTotalOverheadKantor);

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                      CardExpansionDetail(
                        label: "Factory Supply",
                        children: <Widget> [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                            child: CardItemExpansionDetail(
                              child: ListTile(
                                contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0), vertical: getProportionateScreenHeight(10.0)),
                                subtitle: CardFieldItemFormatCurrency(
                                  label: "Total Price (Rp)",
                                  contentData: totalFactorySupply.toString(),
                                  flexLeftRow: 12,
                                  flexRightRow: 20,
                                ),
                                onTap: (){
                                  Get.to(FactorySupply(idRae: idRae));
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: getProportionateScreenHeight(10)),
                        ]
                      ),
                      CardExpansionDetail(
                        label: "Labour Cost",
                        children: <Widget> [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                            child: CardItemExpansionDetail(
                              child: ListTile(
                                contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0), vertical: getProportionateScreenHeight(10.0)),
                                subtitle: CardFieldItemFormatCurrency(
                                  label: "Total Price (Rp)",
                                  contentData: totalLabourCost.toString(),
                                  flexLeftRow: 12,
                                  flexRightRow: 20,
                                ),
                                onTap: (){
                                  Get.to(LabourCost(idRae: idRae));
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: getProportionateScreenHeight(10)),
                        ]
                      ),
                      // CardExpansionDetail(
                      //   label: "Machine Process",
                      //   children: <Widget> [
                      //     Padding(
                      //       padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                      //       child: CardItemExpansionDetail(
                      //         child: ListTile(
                      //           contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0), vertical: getProportionateScreenHeight(10.0)),
                      //           subtitle: CardFieldItemFormatCurrency(
                      //             label: "Total Price (Rp)",
                      //             contentData: totalMachineProcess.toString(),
                      //             flexLeftRow: 12,
                      //             flexRightRow: 20,
                      //           ),
                      //           onTap: (){
                      //             Get.to(MachineProcess(futureRekapitulasi: futureRekapitulasi,));
                      //           },
                      //         ),
                      //       ),
                      //     ),
                      //     SizedBox(height: getProportionateScreenHeight(10)),
                      //   ]
                      // ),
                      // CardExpansionDetail(
                      //   label: "Biaya Overhead",
                      //   children: <Widget> [
                      //     Padding(
                      //       padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                      //       child: CardItemExpansionDetail(
                      //         child: ListTile(
                      //           contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0), vertical: getProportionateScreenHeight(10.0)),
                      //           subtitle: CardFieldItemFormatCurrency(
                      //             label: "Total Price (Rp)",
                      //             contentData: totalBiayaOverhead.toString(),
                      //             flexLeftRow: 12,
                      //             flexRightRow: 20,
                      //           ),
                      //           onTap: (){
                      //             Get.to(BiayaOverhead(futureRekapitulasi: futureRekapitulasi,));
                      //           },
                      //         ),
                      //       ),
                      //     ),
                      //     SizedBox(height: getProportionateScreenHeight(10)),
                      //   ]
                      // ),
                      // CardExpansionDetail(
                      //   label: "Finishing",
                      //   children: <Widget> [
                      //     Padding(
                      //       padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                      //       child: CardItemExpansionDetail(
                      //         child: ListTile(
                      //           contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0), vertical: getProportionateScreenHeight(10.0)),
                      //           subtitle: CardFieldItemFormatCurrency(
                      //             label: "Total Price (Rp)",
                      //             contentData: totalFinishing.toString(),
                      //             flexLeftRow: 12,
                      //             flexRightRow: 20,
                      //           ),
                      //           onTap: (){
                      //             Get.to(Finishing(futureRekapitulasi: futureRekapitulasi));
                      //           },
                      //         ),
                      //       ),
                      //     ),
                      //     SizedBox(height: getProportionateScreenHeight(10)),
                      //   ]
                      // ),
                      // CardExpansionDetail(
                      //   label: "Alat Bantu On-Site",
                      //   children: <Widget> [
                      //     Padding(
                      //       padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                      //       child: CardItemExpansionDetail(
                      //         child: ListTile(
                      //           contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0), vertical: getProportionateScreenHeight(10.0)),
                      //           subtitle: CardFieldItemFormatCurrency(
                      //             label: "Total Price (Rp)",
                      //             contentData: totalAlatBantuOnsite.toString(),
                      //             flexLeftRow: 12,
                      //             flexRightRow: 20,
                      //           ),
                      //           onTap: (){
                      //             Get.to(AlatBantuOnSite(futureRekapitulasi: futureRekapitulasi,));
                      //           },
                      //         ),
                      //       ),
                      //     ),
                      //     SizedBox(height: getProportionateScreenHeight(10)),
                      //   ]
                      // ),
                      // CardExpansionDetail(
                      //   label: "Labour Cost On-Site",
                      //   children: <Widget> [
                      //     Padding(
                      //       padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                      //       child: CardItemExpansionDetail(
                      //         child: ListTile(
                      //           contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0), vertical: getProportionateScreenHeight(10.0)),
                      //           subtitle: CardFieldItemFormatCurrency(
                      //             label: "Total Price (Rp)",
                      //             contentData: totalLabourCostOnSite.toString(),
                      //             flexLeftRow: 12,
                      //             flexRightRow: 20,
                      //           ),
                      //           onTap: (){
                      //             Get.to(LabourCostOnSite(futureRekapitulasi: futureRekapitulasi,));
                      //           },
                      //         ),
                      //       ),
                      //     ),
                      //     SizedBox(height: getProportionateScreenHeight(10)),
                      //   ]
                      // ),
                      // CardExpansionDetail(
                      //   label: "Biaya Overhead Kantor",
                      //   children: <Widget> [
                      //     Padding(
                      //       padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                      //       child: CardItemExpansionDetail(
                      //         child: ListTile(
                      //           contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0), vertical: getProportionateScreenHeight(10.0)),
                      //           subtitle: CardFieldItemFormatCurrency(
                      //             label: "Total Price (Rp)",
                      //             contentData: totalBiayaOverheadKantor.toString(),
                      //             flexLeftRow: 12,
                      //             flexRightRow: 20,
                      //           ),
                      //           onTap: (){
                      //             Get.to(BiayaOverheadKantor(futureRekapitulasi: futureRekapitulasi, listSubTotalOverheadKantor: listSubTotalOverheadKantor, totalBiayaOverheadKantor: totalBiayaOverheadKantor, unitPrice: listUnitPraceOverheadKantor));
                      //           },
                      //         ),
                      //       ),
                      //     ),
                      //     SizedBox(height: getProportionateScreenHeight(10)),
                      //   ]
                      // ),
                    ],
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
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