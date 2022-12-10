import 'package:mgp_mobile_app/model/hrdu/rae/detail_rae_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mgp_mobile_app/model/hrdu/rae/rekapitulasi.dart';
import 'package:mgp_mobile_app/widget/component/card_expansion_detail.dart';
import 'package:mgp_mobile_app/widget/component/card_item_expansion_detail.dart';
import 'package:mgp_mobile_app/widget/component/highlight_item_name.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class BodyFinihing extends StatelessWidget {
  final Future<Rekapitulasi> futureRekapitulasi;
  final String namaFinishing;
  BodyFinihing({Key? key, required this.futureRekapitulasi, required this.namaFinishing}) : super(key: key);
  final formatCurrency = NumberFormat.currency(
    locale: 'ID',
    decimalDigits: 1,
    symbol: "Rp"
  );

  final formatDecimal = NumberFormat("###.######", "id_ID");
  final decimalFormat = NumberFormat("###", "id_ID");

  late String grandTotalBahanPenunjangFinishing;
  late String grandTotalLabourCost;
  late String grandTotalMachineProcess;
  
  final List<int> indexanalisaFinFnBp = [];
  final List<int> indexanalisaFinFnSc = [];
  final List<int> indexanalisaFinFnLc = [];

  late final listSubTotalBahanPenunjangFinishing;
  late final listKodeBahanPenunjangFinishing;
  late final listQtyBahanPenunjangFinishing;
  late final listKonstantaBahanPenunjangFinishing;
  late final indexSubTotalBahanPenunjangFinishing;

  late final listSubTotalLabourCost;
  late final listKodeLabourCost;
  late final listQtyLabourCost;
  late final listKonstantaLabourCost;
  late final indexSubTotalLabourCost;

  late final listSubTotalMachineProcess;
  late final listKodeMachineProcess;
  late final listQtyMachineProcess;
  late final listKonstantaMachineProcess;
  late final indexSubTotalMachineProcess;

  // late final listSubTotalLuaslHardwood;
  // late final listSubTotalLuaslPlywood;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: FutureBuilder(
              future: futureRekapitulasi,
              builder: (BuildContext context, AsyncSnapshot<Rekapitulasi> snapshot) {
                if (snapshot.hasData) {
                 var rekapitulasi = snapshot.data;
                  num totalBahanPenunjangFinishing = 0;
                  num totalLabourCost = 0;
                  num totalMachineProcess = 0;
                  // num luasHardwood = 0;
                  // num luasPlywood = 0;
                  indexanalisaFinFnBp.clear();
                  indexanalisaFinFnSc.clear();
                  indexanalisaFinFnLc.clear();
                  
                  int lengRekapitulasi = rekapitulasi!.data.length;
                  
                  late List SubBahanPenunjangFinishing = [];
                  late List KodeBahanPenunjangFinishing = [];
                  late List QtyBahanPenunjangFinishing = [];
                  late List KonstantaBahanPenunjangFinishing = [];
                  listSubTotalBahanPenunjangFinishing = List.generate(lengRekapitulasi, (_) => []);
                  listKodeBahanPenunjangFinishing = List.generate(lengRekapitulasi, (_) => []);
                  listQtyBahanPenunjangFinishing = List.generate(lengRekapitulasi, (_) => []);
                  listKonstantaBahanPenunjangFinishing = List.generate(lengRekapitulasi, (_) => []);
                  indexSubTotalBahanPenunjangFinishing = List.generate(lengRekapitulasi, (_) => []);
                  
                  late List SubLabourCost = [];
                  late List KodeLabourCost = [];
                  late List QtyLabourCost = [];
                  late List KonstantaLabourCost = [];
                  listSubTotalLabourCost = List.generate(lengRekapitulasi, (_) => []);
                  listKodeLabourCost = List.generate(lengRekapitulasi, (_) => []);
                  listQtyLabourCost = List.generate(lengRekapitulasi, (_) => []);
                  listKonstantaLabourCost = List.generate(lengRekapitulasi, (_) => []);
                  indexSubTotalLabourCost = List.generate(lengRekapitulasi, (_) => []);

                  late List SubMachineProcess = [];
                  late List KodeMachineProcess = [];
                  late List QtyMachineProcess = [];
                  late List KonstantaMachineProcess = [];
                  listSubTotalMachineProcess = List.generate(lengRekapitulasi, (_) => []);
                  listKodeMachineProcess = List.generate(lengRekapitulasi, (_) => []);
                  listQtyMachineProcess = List.generate(lengRekapitulasi, (_) => []);
                  listKonstantaMachineProcess = List.generate(lengRekapitulasi, (_) => []);
                  indexSubTotalMachineProcess = List.generate(lengRekapitulasi, (_) => []);

                  // late List listLuaslHardwood = [];
                  // listSubTotalLuaslHardwood = List.generate(lengRekapitulasi, (_) => []);
                  // late List listLuasPlywood = [];
                  // listSubTotalLuaslPlywood = List.generate(lengRekapitulasi, (_) => []);

                  // for(int i = 0 ; i< lengRekapitulasi ; i++){

                  //   if (rekapitulasi.data[i].analisaFinFnBp!.isNotEmpty) {//analisa_fin_fn_bp
                  //     int lengAnalisaFinFnBp = rekapitulasi.data[i].analisaFinFnBp!.length;
                  //     for (var j = 0; j < lengAnalisaFinFnBp; j++) {
                  //       if(namaFinishing.toString().contains(rekapitulasi.data[i].analisaFinFnBp![j].namaFinishingBarangJadi.toString())){
                  //         indexanalisaFinFnBp.add(j);
                  //         num subTotal = double.parse(rekapitulasi.data[i].analisaFinFnBp![j].qty.toString()) * double.parse(rekapitulasi.data[i].analisaFinFnBp![j].unitPrice.toString()) * double.parse(rekapitulasi.data[i].analisaFinFnBp![j].konstanta.toString());
                  //         SubBahanPenunjangFinishing.add(subTotal);
                  //         totalBahanPenunjangFinishing = totalBahanPenunjangFinishing + subTotal.round();
                  //       }
                  //     }
                  //     indexSubTotalBahanPenunjangFinishing[i].addAll(indexanalisaFinFnBp);
                  //     listSubTotalBahanPenunjangFinishing[i].addAll(SubBahanPenunjangFinishing);

                  //     indexanalisaFinFnBp.clear();
                  //     SubBahanPenunjangFinishing.clear();
                  //   }
                  // }

                  late int hiFinFnBp, hjFinFnBp;
                  late double hasilSubTotalFinFnBp;
                  late double hasilQtyFinFnBp;
                  late int lenganalisaFinFnBp;
                  late int lenganalisaFinFnBp2;

                  late int hiFinFnSc, hjFinFnSc;
                  late double hasilSubTotalFinFnSc;
                  late double hasilQtyFinFnSc;
                  late int lenganalisaFinFnSc;
                  late int lenganalisaFinFnSc2;

                  late int hiFinFnLc, hjFinFnLc;
                  late double hasilSubTotalFinFnLc;
                  late double hasilQtyFinFnLc;
                  late int lenganalisaFinFnLc;
                  late int lenganalisaFinFnLc2;

                  for(int loop = 0 ; loop < 2 ; loop++){
                    for(int ki = 0 ; ki<lengRekapitulasi ; ki++){
                      
                      lenganalisaFinFnBp = rekapitulasi.data[ki].analisaFinFnBp!.length;
                      if (rekapitulasi.data[ki].analisaFinFnBp!.isNotEmpty) {
                        for (int kj = 0; kj < lenganalisaFinFnBp; kj++) {
                          if(namaFinishing.toString().contains(rekapitulasi.data[ki].analisaFinFnBp![kj].namaFinishingBarangJadi.toString())){
                            if(loop == 0){
                              indexanalisaFinFnBp.add(kj);
                              num subTotal = double.parse(rekapitulasi.data[ki].analisaFinFnBp![kj].qty.toString()) * double.parse(rekapitulasi.data[ki].analisaFinFnBp![kj].unitPrice.toString()) * double.parse(rekapitulasi.data[ki].analisaFinFnBp![kj].konstanta.toString());
                              SubBahanPenunjangFinishing.add(subTotal);
                              KodeBahanPenunjangFinishing.add(rekapitulasi.data[ki].analisaFinFnBp![kj].kodeItem.toString());
                              QtyBahanPenunjangFinishing.add(double.parse(rekapitulasi.data[ki].analisaFinFnBp![kj].qty.toString()));
                              KonstantaBahanPenunjangFinishing.add(rekapitulasi.data[ki].analisaFinFnBp![kj].konstanta.toString());
                              totalBahanPenunjangFinishing = totalBahanPenunjangFinishing + subTotal.round();
                              // print(SubBahanPenunjangFinishing);
                            }
                            else{
                              hasilSubTotalFinFnBp = 0.0;
                              hasilQtyFinFnBp = 0.0;
                              bool validateStart = false; 
                              for(int i = ki ; i<listKodeBahanPenunjangFinishing.length ; i++){
                                if (rekapitulasi.data[i].analisaFinFnBp!.isNotEmpty) {
                                  for (int j = kj; j < listKodeBahanPenunjangFinishing[i].length; j++) {
                                    if(listKodeBahanPenunjangFinishing[i][j] == listKodeBahanPenunjangFinishing[ki][kj] && listKonstantaBahanPenunjangFinishing[i][j] == listKonstantaBahanPenunjangFinishing[ki][kj]){
                                      if(i == ki && j == kj){
                                        validateStart = true;
                                        hiFinFnBp = i;
                                        hjFinFnBp = j;
                                        hasilSubTotalFinFnBp = hasilSubTotalFinFnBp + listSubTotalBahanPenunjangFinishing[i][j];
                                        hasilQtyFinFnBp = hasilQtyFinFnBp + listQtyBahanPenunjangFinishing[i][j];
                                      }
                                      else{
                                        hasilSubTotalFinFnBp = hasilSubTotalFinFnBp + listSubTotalBahanPenunjangFinishing[i][j];
                                        hasilQtyFinFnBp = hasilQtyFinFnBp + listQtyBahanPenunjangFinishing[i][j];
                                        listQtyBahanPenunjangFinishing[i][j] = 0.0;
                                        listSubTotalBahanPenunjangFinishing[i][j] = 0.0;
                                      }            
                                    }
                                  }
                                }
                                if(i == listKodeBahanPenunjangFinishing.length-1 && validateStart == true){
                                  listQtyBahanPenunjangFinishing[hiFinFnBp][hjFinFnBp] = hasilQtyFinFnBp;
                                  listSubTotalBahanPenunjangFinishing[hiFinFnBp][hjFinFnBp] = hasilSubTotalFinFnBp.roundToDouble();
                                }
                              }
                            }
                          }
                        }
                        if(loop == 0){
                          listSubTotalBahanPenunjangFinishing[ki].addAll(SubBahanPenunjangFinishing);
                          listKodeBahanPenunjangFinishing[ki].addAll(KodeBahanPenunjangFinishing);
                          listQtyBahanPenunjangFinishing[ki].addAll(QtyBahanPenunjangFinishing);
                          listKonstantaBahanPenunjangFinishing[ki].addAll(KonstantaBahanPenunjangFinishing);
                          indexSubTotalBahanPenunjangFinishing[ki].addAll(indexanalisaFinFnBp);
                          
                          SubBahanPenunjangFinishing.clear();
                          KodeBahanPenunjangFinishing.clear();
                          QtyBahanPenunjangFinishing.clear();
                          KonstantaBahanPenunjangFinishing.clear();
                          indexanalisaFinFnBp.clear();
                        }
                      }

                      lenganalisaFinFnSc = rekapitulasi.data[ki].analisaFinFnSc!.length;
                      if (rekapitulasi.data[ki].analisaFinFnSc!.isNotEmpty) {
                        for (int kj = 0; kj < lenganalisaFinFnSc; kj++) {
                          if(namaFinishing.toString().contains(rekapitulasi.data[ki].analisaFinFnSc![kj].namaFinishingBarangJadi.toString())){
                            if(loop == 0){
                              indexanalisaFinFnSc.add(kj);
                              num subTotal = double.parse(rekapitulasi.data[ki].analisaFinFnSc![kj].qty.toString()) * double.parse(rekapitulasi.data[ki].analisaFinFnSc![kj].unitPrice.toString()) * double.parse(rekapitulasi.data[ki].analisaFinFnSc![kj].konstanta.toString());
                              SubLabourCost.add(subTotal);
                              KodeLabourCost.add(rekapitulasi.data[ki].analisaFinFnSc![kj].kodeItem.toString());
                              QtyLabourCost.add(double.parse(rekapitulasi.data[ki].analisaFinFnSc![kj].qty.toString()));
                              KonstantaLabourCost.add(rekapitulasi.data[ki].analisaFinFnSc![kj].konstanta.toString());
                              totalLabourCost = totalLabourCost + subTotal.round();
                            }
                            else{
                              hasilSubTotalFinFnSc = 0.0;
                              hasilQtyFinFnSc = 0.0;
                              bool validateStart = false; 
                              for(int i = ki ; i<listKodeLabourCost.length ; i++){
                                if (rekapitulasi.data[i].analisaFinFnSc!.isNotEmpty) {
                                  for (int j = kj; j < listKodeLabourCost[i].length; j++) {
                                    if(listKodeLabourCost[i][j] == listKodeLabourCost[ki][kj] && listKonstantaLabourCost[i][j] == listKonstantaLabourCost[ki][kj]){
                                      if(i == ki && j == kj){
                                        validateStart = true;
                                        hiFinFnSc = i;
                                        hjFinFnSc = j;
                                        hasilSubTotalFinFnSc = hasilSubTotalFinFnSc + listSubTotalLabourCost[i][j];
                                        hasilQtyFinFnSc = hasilQtyFinFnSc + listQtyLabourCost[i][j];
                                      }
                                      else{
                                        hasilSubTotalFinFnSc = hasilSubTotalFinFnSc + listSubTotalLabourCost[i][j];
                                        hasilQtyFinFnSc = hasilQtyFinFnSc + listQtyLabourCost[i][j];
                                        listQtyLabourCost[i][j] = 0.0;
                                        listSubTotalLabourCost[i][j] = 0.0;
                                      }            
                                    }
                                  }
                                }
                                if(i == listKodeLabourCost.length-1 && validateStart == true){
                                  listQtyLabourCost[hiFinFnSc][hjFinFnSc] = hasilQtyFinFnSc;
                                  listSubTotalLabourCost[hiFinFnSc][hjFinFnSc] = hasilSubTotalFinFnSc.roundToDouble();
                                }
                              }
                            }
                          }
                        }
                        if(loop == 0){
                          listSubTotalLabourCost[ki].addAll(SubLabourCost);
                          listKodeLabourCost[ki].addAll(KodeLabourCost);
                          listQtyLabourCost[ki].addAll(QtyLabourCost);
                          listKonstantaLabourCost[ki].addAll(KonstantaLabourCost);
                          indexSubTotalLabourCost[ki].addAll(indexanalisaFinFnSc);

                          SubLabourCost.clear();
                          KodeLabourCost.clear();
                          QtyLabourCost.clear();
                          KonstantaLabourCost.clear();
                          indexanalisaFinFnSc.clear();
                        }
                      }

                      lenganalisaFinFnLc = rekapitulasi.data[ki].analisaFinFnLc!.length;
                      if (rekapitulasi.data[ki].analisaFinFnLc!.isNotEmpty) {
                        for (int kj = 0; kj < lenganalisaFinFnLc; kj++) {
                          if(namaFinishing.toString().contains(rekapitulasi.data[ki].analisaFinFnLc![kj].namaFinishingBarangJadi.toString())){
                            if(loop == 0){
                              indexanalisaFinFnLc.add(kj);
                              num subTotal = double.parse(rekapitulasi.data[ki].analisaFinFnLc![kj].qty.toString()) * double.parse(rekapitulasi.data[ki].analisaFinFnLc![kj].unitPrice.toString()) * double.parse(rekapitulasi.data[ki].analisaFinFnLc![kj].konstanta.toString());
                              SubMachineProcess.add(subTotal);
                              KodeMachineProcess.add(rekapitulasi.data[ki].analisaFinFnLc![kj].kodeItem.toString());
                              QtyMachineProcess.add(double.parse(rekapitulasi.data[ki].analisaFinFnLc![kj].qty.toString()));
                              KonstantaMachineProcess.add(rekapitulasi.data[ki].analisaFinFnLc![kj].konstanta.toString());
                              totalMachineProcess = totalMachineProcess + subTotal.round();
                            }
                            else{
                              hasilSubTotalFinFnLc = 0.0;
                              hasilQtyFinFnLc = 0.0;
                              bool validateStart = false;
                              // print(ki);
                              // print(kj);
                              for(int i = ki ; i<listKodeMachineProcess.length ; i++){
                                if (rekapitulasi.data[i].analisaFinFnLc!.isNotEmpty) {
                                  // print(listKodeMachineProcess);
                                  for (int j = kj; j < listKodeMachineProcess[i].length; j++) {
                                    // print("a: ${listKodeMachineProcess[i][j]}");
                                    // print("b: ${listKodeMachineProcess[ki][kj]}");
                                    if(listKodeMachineProcess[i][j] == listKodeMachineProcess[ki][kj] && listKonstantaMachineProcess[i][j] == listKonstantaMachineProcess[ki][kj]){                                      
                                      // print("a: ${listKodeMachineProcess[i][j]}");
                                      if(validateStart == false){
                                        validateStart = true;
                                        hiFinFnLc = i;
                                        hjFinFnLc = j;
                                        hasilSubTotalFinFnLc = hasilSubTotalFinFnLc + listSubTotalMachineProcess[i][j];
                                        hasilQtyFinFnLc = hasilQtyFinFnLc + listQtyMachineProcess[i][j];
                                      }
                                      else{
                                        hasilSubTotalFinFnLc = hasilSubTotalFinFnLc + listSubTotalMachineProcess[i][j];
                                        hasilQtyFinFnLc = hasilQtyFinFnLc + listQtyMachineProcess[i][j];
                                        listQtyMachineProcess[i][j] = 0.0;
                                        listSubTotalMachineProcess[i][j] = 0.0;
                                      }           
                                    }
                                  }
                                }
                                if(validateStart == true){
                                  listQtyMachineProcess[hiFinFnLc][hjFinFnLc] = hasilQtyFinFnLc;
                                  listSubTotalMachineProcess[hiFinFnLc][hjFinFnLc] = hasilSubTotalFinFnLc.roundToDouble();
                                }
                              }
                            }
                          }
                        }
                        if(loop == 0){
                          listSubTotalMachineProcess[ki].addAll(SubMachineProcess);
                          listKodeMachineProcess[ki].addAll(KodeMachineProcess);
                          listQtyMachineProcess[ki].addAll(QtyMachineProcess);
                          listKonstantaMachineProcess[ki].addAll(KonstantaMachineProcess);
                          indexSubTotalMachineProcess[ki].addAll(indexanalisaFinFnLc);

                          SubMachineProcess.clear();
                          KodeMachineProcess.clear();
                          QtyMachineProcess.clear();
                          KonstantaMachineProcess.clear();
                          indexanalisaFinFnLc.clear();
                        }
                      }
                    }
                  }
                  
                  // for(int loop = 0 ; loop < 2 ; loop++){
                  //   for(int ki = 0 ; ki<lengRekapitulasi ; ki++){
                  // lenganalisaFinFnLc = rekapitulasi.data[ki].analisaFinFnLc!.length;
                  //     if (rekapitulasi.data[ki].analisaFinFnLc!.isNotEmpty) {
                  //       for (int kj = 0; kj < lenganalisaFinFnLc; kj++) {
                  //         if(namaFinishing.toString().contains(rekapitulasi.data[ki].analisaFinFnLc![kj].namaFinishingBarangJadi.toString())){
                  //           if(loop == 0){
                  //             indexanalisaFinFnLc.add(kj);
                  //             num subTotal = double.parse(rekapitulasi.data[ki].analisaFinFnLc![kj].qty.toString()) * double.parse(rekapitulasi.data[ki].analisaFinFnLc![kj].unitPrice.toString()) * double.parse(rekapitulasi.data[ki].analisaFinFnLc![kj].konstanta.toString());
                  //             SubMachineProcess.add(subTotal);
                  //             KodeMachineProcess.add(rekapitulasi.data[ki].analisaFinFnLc![kj].kodeItem.toString());
                  //             QtyMachineProcess.add(double.parse(rekapitulasi.data[ki].analisaFinFnLc![kj].qty.toString()));
                  //             KonstantaMachineProcess.add(rekapitulasi.data[ki].analisaFinFnLc![kj].konstanta.toString());
                  //             totalMachineProcess = totalMachineProcess + subTotal.round();
                  //           }
                  //           else{
                  //             hasilSubTotalFinFnLc = 0.0;
                  //             hasilQtyFinFnLc = 0.0;
                  //             bool validateStart = false;
                  //             for(int i = 0; i<listKodeMachineProcess.length ; i++){
                  //               if (rekapitulasi.data[i].analisaFinFnLc!.isNotEmpty) {
                  //                 lenganalisaFinFnLc = rekapitulasi.data[i].analisaFinFnLc!.length;
                  //                 for (int j = 0; j < listKodeMachineProcess[i].length; j++) {
                  //                   print(listKodeMachineProcess[i][j]);
                  //                   if(listKodeMachineProcess[i][j] == listKodeMachineProcess[ki][kj] && listKonstantaMachineProcess[i][j] == listKonstantaMachineProcess[ki][kj]){
                  //                     print("---");
                  //                     // print(listKodeMachineProcess[i][j]);
                  //                     // print(indexSubTotalMachineProcess[i][j]);
                                      
                  //                     if(validateStart == false){
                  //                       validateStart = true;
                  //                       hiFinFnLc = i;
                  //                       hjFinFnLc = j;
                  //                       hasilSubTotalFinFnLc = hasilSubTotalFinFnLc + listSubTotalMachineProcess[i][j];
                  //                       hasilQtyFinFnLc = hasilQtyFinFnLc + listQtyMachineProcess[i][j];
                  //                     }
                  //                     else{
                  //                       hasilSubTotalFinFnLc = hasilSubTotalFinFnLc + listSubTotalMachineProcess[i][j];
                  //                       hasilQtyFinFnLc = hasilQtyFinFnLc + listQtyMachineProcess[i][j];
                  //                       listQtyMachineProcess[i][j] = 0.0;
                  //                       listSubTotalMachineProcess[i][j] = 0.0;
                  //                     }           
                  //                   }
                  //                 }
                  //               }
                  //               if(validateStart = true){
                  //                 listQtyMachineProcess[hiFinFnLc][hjFinFnLc] = hasilQtyFinFnLc;
                  //                 listSubTotalMachineProcess[hiFinFnLc][hjFinFnLc] = hasilSubTotalFinFnLc.roundToDouble();
                  //               }
                  //             }
                  //           }
                  //         }
                  //       }
                  //       if(loop == 0){
                  //         listSubTotalMachineProcess[ki].addAll(SubMachineProcess);
                  //         listKodeMachineProcess[ki].addAll(KodeMachineProcess);
                  //         listQtyMachineProcess[ki].addAll(QtyMachineProcess);
                  //         listKonstantaMachineProcess[ki].addAll(KonstantaMachineProcess);
                  //         indexSubTotalMachineProcess[ki].addAll(indexanalisaFinFnLc);

                  //         SubMachineProcess.clear();
                  //         KodeMachineProcess.clear();
                  //         QtyMachineProcess.clear();
                  //         KonstantaMachineProcess.clear();
                  //         indexanalisaFinFnLc.clear();
                  //       }
                  //     }
                  //   }
                  // }


                    // if (rekapitulasi.data[i].analisaHardwood!.isNotEmpty) {
                    //   int lengAnalisaHardwood = rekapitulasi.data[i].analisaHardwood!.length;
                    //   for (var j = 0; j < lengAnalisaHardwood; j++) {
                    //     if(rekapitulasi.data[i].analisaHardwood![j].namaFinishingBarangJadi.toString().contains(namaFinishing.toString())){
                    //       if (rekapitulasi.data[i].analisaHardwood![j].namaTipeSisi.toString() == "4 Sisi (2TL + 2WL)") {
                    //         num tPlusW = (double.parse(rekapitulasi.data[i].analisaHardwood![j].tFinal.toString()) + double.parse(rekapitulasi.data[i].analisaHardwood![j].wFinal.toString()));
                    //         num luas = (tPlusW * 2 * double.parse(rekapitulasi.data[i].analisaHardwood![j].qtyFinal.toString()) * double.parse(rekapitulasi.data[i].analisaHardwood![j].lFinal.toString()))/10000;
                    //         listLuaslHardwood.add(luas);
                    //         luasHardwood = luasHardwood + luas;
                    //       } else if (rekapitulasi.data[i].analisaHardwood![j].namaTipeSisi.toString() == "3 Sisi Opsi 1 (2TL + WL)") {
                    //         num tPlusWPlusT = (double.parse(rekapitulasi.data[i].analisaHardwood![j].tFinal.toString()) + double.parse(rekapitulasi.data[i].analisaHardwood![j].wFinal.toString()) + double.parse(rekapitulasi.data[i].analisaHardwood![j].tFinal.toString()));
                    //         num luas = (tPlusWPlusT * double.parse(rekapitulasi.data[i].analisaHardwood![j].qtyFinal.toString()) * double.parse(rekapitulasi.data[i].analisaHardwood![j].lFinal.toString()))/10000;
                    //         listLuaslHardwood.add(luas);
                    //         luasHardwood = luasHardwood + luas;
                    //       } else if (rekapitulasi.data[i].analisaHardwood![j].namaTipeSisi.toString() == "3 Sisi Opsi 2 (TL + 2WL)") {
                    //         num tPlusWPlusW = (double.parse(rekapitulasi.data[i].analisaHardwood![j].tFinal.toString()) + double.parse(rekapitulasi.data[i].analisaHardwood![j].wFinal.toString()) + double.parse(rekapitulasi.data[i].analisaHardwood![j].wFinal.toString()));
                    //         num luas = (tPlusWPlusW * double.parse(rekapitulasi.data[i].analisaHardwood![j].qtyFinal.toString()) * double.parse(rekapitulasi.data[i].analisaHardwood![j].lFinal.toString()))/10000;
                    //         listLuaslHardwood.add(luas);
                    //         luasHardwood = luasHardwood + luas;
                    //       } else if (rekapitulasi.data[i].analisaHardwood![j].namaTipeSisi.toString() == "2 Sisi Opsi 1 (TL + WL)") {
                    //         num tPlusW = (double.parse(rekapitulasi.data[i].analisaHardwood![j].tFinal.toString()) + double.parse(rekapitulasi.data[i].analisaHardwood![j].wFinal.toString()));
                    //         num luas = (tPlusW * double.parse(rekapitulasi.data[i].analisaHardwood![j].qtyFinal.toString()) * double.parse(rekapitulasi.data[i].analisaHardwood![j].lFinal.toString()))/10000;
                    //         listLuaslHardwood.add(luas);
                    //         luasHardwood = luasHardwood + luas;
                    //       } else if (rekapitulasi.data[i].analisaHardwood![j].namaTipeSisi.toString() == "2 Sisi Opsi 2 (2TL)") {
                    //         num tPlusT = (double.parse(rekapitulasi.data[i].analisaHardwood![j].tFinal.toString()) + double.parse(rekapitulasi.data[i].analisaHardwood![j].tFinal.toString()));
                    //         num luas = (tPlusT * double.parse(rekapitulasi.data[i].analisaHardwood![j].qtyFinal.toString()) * double.parse(rekapitulasi.data[i].analisaHardwood![j].lFinal.toString()))/10000;
                    //         listLuaslHardwood.add(luas);
                    //         luasHardwood = luasHardwood + luas;
                    //       } else if (rekapitulasi.data[i].analisaHardwood![j].namaTipeSisi.toString() == "2 Sisi Opsi 3 (2WL)") {
                    //         num wPlusW = (double.parse(rekapitulasi.data[i].analisaHardwood![j].wFinal.toString()) + double.parse(rekapitulasi.data[i].analisaHardwood![j].wFinal.toString()));
                    //         num luas = (wPlusW * double.parse(rekapitulasi.data[i].analisaHardwood![j].qtyFinal.toString()) * double.parse(rekapitulasi.data[i].analisaHardwood![j].lFinal.toString()))/10000;
                    //         listLuaslHardwood.add(luas);
                    //         luasHardwood = luasHardwood + luas;
                    //       } else if (rekapitulasi.data[i].analisaHardwood![j].namaTipeSisi.toString() == "1 Sisi Opsi 1 (TL)") {
                    //         num luas = (double.parse(rekapitulasi.data[i].analisaHardwood![j].tFinal.toString()) * double.parse(rekapitulasi.data[i].analisaHardwood![j].qtyFinal.toString()) * double.parse(rekapitulasi.data[i].analisaHardwood![j].lFinal.toString()))/10000;
                    //         listLuaslHardwood.add(luas);
                    //         luasHardwood = luasHardwood + luas;
                    //       } else if (rekapitulasi.data[i].analisaHardwood![j].namaTipeSisi.toString() == "1 Sisi Opsi 2 (WL)") {
                    //         num luas = (double.parse(rekapitulasi.data[i].analisaHardwood![j].wFinal.toString()) * double.parse(rekapitulasi.data[i].analisaHardwood![j].qtyFinal.toString()) * double.parse(rekapitulasi.data[i].analisaHardwood![j].lFinal.toString()))/10000;
                    //         listLuaslHardwood.add(luas);
                    //         luasHardwood = luasHardwood + luas;
                    //       } else {
                    //         num luas = 0;
                    //         listLuaslHardwood.add(luas);
                    //         luasHardwood = luasHardwood + luas;
                    //       }
                    //     }
                    //   }
                    //   listSubTotalLuaslHardwood[i].addAll(listLuaslHardwood);
                    //   listLuaslHardwood.clear();
                    // }

                    // if (rekapitulasi.data[i].analisaPlywood!.isNotEmpty) {
                    //   int lengAnalisaPlywood = rekapitulasi.data[i].analisaPlywood!.length;
                    //   for (var j = 0; j < lengAnalisaPlywood; j++) {
                    //     if(rekapitulasi.data[i].analisaPlywood![j].namaFinishingBarangJadi.toString().contains(namaFinishing.toString())){
                    //       if (rekapitulasi.data[i].analisaPlywood![j].namaTipeSisi.toString() == "4 Sisi (2TL + 2WL)") {
                    //         num tPlusW = (double.parse(rekapitulasi.data[i].analisaPlywood![j].tRaw.toString()) + double.parse(rekapitulasi.data[i].analisaPlywood![j].wRaw.toString()));
                    //         num luas = (tPlusW * 2 * double.parse(rekapitulasi.data[i].analisaPlywood![j].qtyRaw.toString()) * double.parse(rekapitulasi.data[i].analisaPlywood![j].lRaw.toString()))/10000;
                    //         listLuasPlywood.add(luas);
                    //         luasPlywood = luasPlywood + luas;
                    //       } else if (rekapitulasi.data[i].analisaPlywood![j].namaTipeSisi.toString() == "3 Sisi Opsi 1 (2TL + WL)") {
                    //         num tPlusWPlusT = (double.parse(rekapitulasi.data[i].analisaPlywood![j].tRaw.toString()) + double.parse(rekapitulasi.data[i].analisaPlywood![j].wRaw.toString()) + double.parse(rekapitulasi.data[i].analisaPlywood![j].tRaw.toString()));
                    //         num luas = (tPlusWPlusT * double.parse(rekapitulasi.data[i].analisaPlywood![j].qtyRaw.toString()) * double.parse(rekapitulasi.data[i].analisaPlywood![j].lRaw.toString()))/10000;
                    //         listLuasPlywood.add(luas);
                    //         luasPlywood = luasPlywood + luas;
                    //       } else if (rekapitulasi.data[i].analisaPlywood![j].namaTipeSisi.toString() == "3 Sisi Opsi 2 (TL + 2WL)") {
                    //         num tPlusWPlusW = (double.parse(rekapitulasi.data[i].analisaPlywood![j].tRaw.toString()) + double.parse(rekapitulasi.data[i].analisaPlywood![j].wRaw.toString()) + double.parse(rekapitulasi.data[i].analisaPlywood![j].wRaw.toString()));
                    //         num luas = (tPlusWPlusW * double.parse(rekapitulasi.data[i].analisaPlywood![j].qtyRaw.toString()) * double.parse(rekapitulasi.data[i].analisaPlywood![j].lRaw.toString()))/10000;
                    //         listLuasPlywood.add(luas);
                    //         luasPlywood = luasPlywood + luas;
                    //       } else if (rekapitulasi.data[i].analisaPlywood![j].namaTipeSisi.toString() == "2 Sisi Opsi 1 (TL + WL)") {
                    //         num tPlusW = (double.parse(rekapitulasi.data[i].analisaPlywood![j].tRaw.toString()) + double.parse(rekapitulasi.data[i].analisaPlywood![j].wRaw.toString()));
                    //         num luas = (tPlusW * double.parse(rekapitulasi.data[i].analisaPlywood![j].qtyRaw.toString()) * double.parse(rekapitulasi.data[i].analisaPlywood![j].lRaw.toString()))/10000;
                    //         listLuasPlywood.add(luas);
                    //         luasPlywood = luasPlywood + luas;
                    //       } else if (rekapitulasi.data[i].analisaPlywood![j].namaTipeSisi.toString() == "2 Sisi Opsi 2 (2TL)") {
                    //         num tPlusT = (double.parse(rekapitulasi.data[i].analisaPlywood![j].tRaw.toString()) + double.parse(rekapitulasi.data[i].analisaPlywood![j].tRaw.toString()));
                    //         num luas = (tPlusT * double.parse(rekapitulasi.data[i].analisaPlywood![j].qtyRaw.toString()) * double.parse(rekapitulasi.data[i].analisaPlywood![j].lRaw.toString()))/10000;
                    //         listLuasPlywood.add(luas);
                    //         luasPlywood = luasPlywood + luas;
                    //       } else if (rekapitulasi.data[i].analisaPlywood![j].namaTipeSisi.toString() == "2 Sisi Opsi 3 (2WL)") {
                    //         num wPlusW = (double.parse(rekapitulasi.data[i].analisaPlywood![j].wRaw.toString()) + double.parse(rekapitulasi.data[i].analisaPlywood![j].wRaw.toString()));
                    //         num luas = (wPlusW * double.parse(rekapitulasi.data[i].analisaPlywood![j].qtyRaw.toString()) * double.parse(rekapitulasi.data[i].analisaPlywood![j].lRaw.toString()))/10000;
                    //         listLuasPlywood.add(luas);
                    //         luasPlywood = luasPlywood + luas;
                    //       } else if (rekapitulasi.data[i].analisaPlywood![j].namaTipeSisi.toString() == "1 Sisi Opsi 1 (TL)") {
                    //         num luas = (double.parse(rekapitulasi.data[i].analisaPlywood![j].tRaw.toString()) * double.parse(rekapitulasi.data[i].analisaPlywood![j].qtyRaw.toString()) * double.parse(rekapitulasi.data[i].analisaPlywood![j].lRaw.toString()))/10000;
                    //         listLuasPlywood.add(luas);
                    //         luasPlywood = luasPlywood + luas;
                    //       } else if (rekapitulasi.data[i].analisaPlywood![j].namaTipeSisi.toString() == "1 Sisi Opsi 2 (WL)") {
                    //         num luas = (double.parse(rekapitulasi.data[i].analisaPlywood![j].wRaw.toString()) * double.parse(rekapitulasi.data[i].analisaPlywood![j].qtyRaw.toString()) * double.parse(rekapitulasi.data[i].analisaPlywood![j].lRaw.toString()))/10000;
                    //         listLuasPlywood.add(luas);
                    //         luasPlywood = luasPlywood + luas;
                    //       } else {
                    //         num luas = 0;
                    //         listLuasPlywood.add(luas);
                    //         luasPlywood = luasPlywood + luas;
                    //       }
                    //     }
                    //   }
                    //   listSubTotalLuaslPlywood[i].addAll(listLuasPlywood);
                    //   listLuasPlywood.clear();
                    // }
                                
                  // num totalLuasPermukaan = luasHardwood + luasPlywood;
                  grandTotalBahanPenunjangFinishing = totalBahanPenunjangFinishing.toString();
                  grandTotalLabourCost = totalLabourCost.toString();
                  grandTotalMachineProcess = totalMachineProcess.toString();

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                      // CardExpansionDetail(
                      //   label: "Total Luas Permukaan",
                      //   children: <Widget> [
                      //     Padding(
                      //       padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                      //       child: CardItemExpansionDetail(
                      //         child: SizedBox(
                      //           width: double.infinity,
                      //           child: Padding(
                      //             padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10), vertical: getProportionateScreenHeight(10)),
                      //             child: Text(
                      //               "${totalLuasPermukaan.toString()} (m2)",
                      //               style: const TextStyle(
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
                      CardExpansionDetail(
                        label: "List Item Bahan Penunjang Finishing",
                        children: <Widget> [
                          for(int i = 0 ; i < rekapitulasi.data.length ; i++)...[
                            if(rekapitulasi.data[i].analisaFinFnBp!.isNotEmpty)...[
                              ListView.builder(
                                itemCount: indexSubTotalBahanPenunjangFinishing[i].length, 
                                itemBuilder: (context, index){
                                  return Column(
                                    children: [
                                      if(rekapitulasi.data[i].analisaFinFnBp![indexSubTotalBahanPenunjangFinishing[i][index]].namaFinishingBarangJadi.toString().contains(namaFinishing.toString()))...[
                                        if(listSubTotalBahanPenunjangFinishing[i][index] != 0.0)...[
                                          Padding(
                                            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                                            child: CardItemExpansionDetail(
                                              child: ListTile(
                                                contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0), vertical: getProportionateScreenHeight(10.0)),
                                                title: HighlightItemName(
                                                  child: Text(
                                                    listKodeBahanPenunjangFinishing[i][index].toString(),
                                                    // rekapitulasi.data[i].analisaFinFnBp![indexSubTotalBahanPenunjangFinishing[i][index]].kodeItem.toString(),
                                                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14,),
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                subtitle: Padding(
                                                  padding: EdgeInsets.only(top: getProportionateScreenHeight(15)),
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: <Widget>[
                                                      Row(
                                                        children: <Widget>[
                                                          Expanded(
                                                            flex: 12,
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              children: const <Widget>[
                                                                Padding(
                                                                  padding: EdgeInsets.only(left: 0),
                                                                  child: Text("Item Bahan Penunjang Finishing",
                                                                    style: TextStyle(
                                                                      color: Colors.black,
                                                                    ),
                                                                    textAlign: TextAlign.left,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 0,
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: <Widget>[
                                                                Padding(
                                                                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                                                                  child: const Text(":",
                                                                    style: TextStyle(
                                                                      color: Colors.black,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 20,
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              children: <Widget>[
                                                                Padding(
                                                                  padding: const EdgeInsets.only(left: 0),
                                                                  child: Text(rekapitulasi.data[i].analisaFinFnBp![indexSubTotalBahanPenunjangFinishing[i][index]].namaItem.toString(),
                                                                    style: const TextStyle(
                                                                      color: Colors.black,
                                                                    ),
                                                                    textAlign: TextAlign.left,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: getProportionateScreenHeight(10)),
                                                      Row(
                                                        children: <Widget>[
                                                          Expanded(
                                                            flex: 12,
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              children: const <Widget>[
                                                                Padding(
                                                                  padding: EdgeInsets.only(left: 0),
                                                                  child: Text("Qty.",
                                                                    style: TextStyle(
                                                                      color: Colors.black,
                                                                    ),
                                                                    textAlign: TextAlign.left,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 0,
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: <Widget>[
                                                                Padding(
                                                                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                                                                  child: const Text(":",
                                                                    style: TextStyle(
                                                                      color: Colors.black,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 20,
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              children: <Widget>[
                                                                Padding(
                                                                  padding: const EdgeInsets.only(left: 0),
                                                                  child: Text(
                                                                    formatDecimal.format(
                                                                      double.parse(
                                                                        listQtyBahanPenunjangFinishing[i][index].toString(),
                                                                        // rekapitulasi.data[i].analisaFinFnBp![indexSubTotalBahanPenunjangFinishing[i][index]].qty.toString()
                                                                      )
                                                                    )+" "+
                                                                    rekapitulasi.data[i].analisaFinFnBp![indexSubTotalBahanPenunjangFinishing[i][index]].namaSatuan.toString(),
                                                                    style: const TextStyle(
                                                                      color: Colors.black,
                                                                    ),
                                                                    textAlign: TextAlign.left,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: getProportionateScreenHeight(10)),
                                                      Row(
                                                        children: <Widget>[
                                                          Expanded(
                                                            flex: 12,
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              children: const <Widget>[
                                                                Padding(
                                                                  padding: EdgeInsets.only(left: 0),
                                                                  child: Text("Unit Price",
                                                                    style: TextStyle(
                                                                      color: Colors.black,
                                                                    ),
                                                                    textAlign: TextAlign.left,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 0,
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: <Widget>[
                                                                Padding(
                                                                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                                                                  child: const Text(":",
                                                                    style: TextStyle(
                                                                      color: Colors.black,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 20,
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              children: <Widget>[
                                                                Padding(
                                                                  padding: const EdgeInsets.only(left: 0),
                                                                  child: Text(
                                                                    formatCurrency.format(
                                                                      double.parse(rekapitulasi.data[i].analisaFinFnBp![indexSubTotalBahanPenunjangFinishing[i][index]].unitPrice.toString())
                                                                    ),
                                                                    style: const TextStyle(
                                                                      color: Colors.black,
                                                                    ),
                                                                    textAlign: TextAlign.left,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: getProportionateScreenHeight(10)),
                                                      Row(
                                                        children: <Widget>[
                                                          Expanded(
                                                            flex: 12,
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              children: const <Widget>[
                                                                Padding(
                                                                  padding: EdgeInsets.only(left: 0),
                                                                  child: Text("Konst.",
                                                                    style: TextStyle(
                                                                      color: Colors.black,
                                                                    ),
                                                                    textAlign: TextAlign.left,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 0,
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: <Widget>[
                                                                Padding(
                                                                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                                                                  child: const Text(":",
                                                                    style: TextStyle(
                                                                      color: Colors.black,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 20,
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              children: <Widget>[
                                                                Padding(
                                                                  padding: const EdgeInsets.only(left: 0),
                                                                  child: Text(
                                                                    formatDecimal.format(
                                                                      double.parse(
                                                                        listKonstantaBahanPenunjangFinishing[i][index].toString(),
                                                                        // rekapitulasi.data[i].analisaFinFnBp![indexSubTotalBahanPenunjangFinishing[i][index]].konstanta.toString()
                                                                      )
                                                                    ),
                                                                    style: const TextStyle(
                                                                      color: Colors.black,
                                                                    ),
                                                                    textAlign: TextAlign.left,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: getProportionateScreenHeight(10)),
                                                      Row(
                                                        children: <Widget>[
                                                          Expanded(
                                                            flex: 12,
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              children: const <Widget>[
                                                                Padding(
                                                                  padding: EdgeInsets.only(left: 0),
                                                                  child: Text("Total Price (Rp)",
                                                                    style: TextStyle(
                                                                      color: Colors.black,
                                                                    ),
                                                                    textAlign: TextAlign.left,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 0,
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: <Widget>[
                                                                Padding(
                                                                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                                                                  child: const Text(":",
                                                                    style: TextStyle(
                                                                      color: Colors.black,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 20,
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              children: <Widget>[
                                                                Padding(
                                                                  padding: const EdgeInsets.only(left: 0),
                                                                  child: Text(
                                                                    formatCurrency.format(
                                                                      double.parse(listSubTotalBahanPenunjangFinishing[i][index].toString())
                                                                    ),
                                                                    style: const TextStyle(
                                                                      color: Colors.black,
                                                                    ),
                                                                    textAlign: TextAlign.left,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: getProportionateScreenHeight(10)),
                                        ]
                                      ],
                                    ],
                                  );
                                },
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                              ),    
                            ]
                          ],
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                            child: CardItemExpansionDetail(
                              child: ListTile(
                                title: Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Expanded(
                                          flex: 4,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: const <Widget>[
                                              Padding(
                                                padding: EdgeInsets.only(left: 0),
                                                child: Text("Grand Total",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14,
                                                  ),
                                                  textAlign: TextAlign.left,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 6,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(right: 0),
                                                child: Text(
                                                  formatCurrency.format(
                                                      double.parse(grandTotalBahanPenunjangFinishing
                                                    )
                                                  ),
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14,
                                                  ),
                                                  textAlign: TextAlign.right,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: getProportionateScreenHeight(10)),
                        ]
                      ),

                      CardExpansionDetail(
                        label: "List Item Subkon Finishing",
                        children: <Widget> [
                          for(int i = 0 ; i < rekapitulasi.data.length ; i++)...[
                            if(rekapitulasi.data[i].analisaFinFnSc!.isNotEmpty)...[
                              ListView.builder(
                                itemCount: indexSubTotalLabourCost[i].length,
                                itemBuilder: (context, index){
                                  return Column(
                                    children: [
                                      if(namaFinishing.toString().contains(rekapitulasi.data[i].analisaFinFnSc![indexSubTotalLabourCost[i][index]].namaFinishingBarangJadi.toString()))...[
                                        if(listSubTotalLabourCost[i][index] != 0.0)...[  
                                          Padding(
                                            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                                            child: CardItemExpansionDetail(
                                              child: ListTile(
                                                contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0), vertical: getProportionateScreenHeight(10.0)),
                                                title: HighlightItemName(
                                                  child: Text(
                                                    listKodeLabourCost[i][index].toString(),
                                                    // rekapitulasi.data[i].analisaFinFnSc![indexSubTotalLabourCost[i][index]].kodeItem.toString(),
                                                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14,),
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                subtitle: Padding(
                                                  padding: EdgeInsets.only(top: getProportionateScreenHeight(15)),
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: <Widget>[
                                                      Row(
                                                        children: <Widget>[
                                                          Expanded(
                                                            flex: 12,
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              children: const <Widget>[
                                                                Padding(
                                                                  padding: EdgeInsets.only(left: 0),
                                                                  child: Text("Item Subkon Finishing",
                                                                    style: TextStyle(
                                                                      color: Colors.black,
                                                                    ),
                                                                    textAlign: TextAlign.left,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 0,
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: <Widget>[
                                                                Padding(
                                                                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                                                                  child: const Text(":",
                                                                    style: TextStyle(
                                                                      color: Colors.black,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 20,
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              children: <Widget>[
                                                                Padding(
                                                                  padding: const EdgeInsets.only(left: 0),
                                                                  child: Text(rekapitulasi.data[i].analisaFinFnSc![indexSubTotalLabourCost[i][index]].namaItem.toString(),
                                                                    style: const TextStyle(
                                                                      color: Colors.black,
                                                                    ),
                                                                    textAlign: TextAlign.left,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: getProportionateScreenHeight(10)),
                                                      Row(
                                                        children: <Widget>[
                                                          Expanded(
                                                            flex: 12,
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              children: const <Widget>[
                                                                Padding(
                                                                  padding: EdgeInsets.only(left: 0),
                                                                  child: Text("Qty.",
                                                                    style: TextStyle(
                                                                      color: Colors.black,
                                                                    ),
                                                                    textAlign: TextAlign.left,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 0,
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: <Widget>[
                                                                Padding(
                                                                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                                                                  child: const Text(":",
                                                                    style: TextStyle(
                                                                      color: Colors.black,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 20,
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              children: <Widget>[
                                                                Padding(
                                                                  padding: const EdgeInsets.only(left: 0),
                                                                  child: Text(
                                                                    formatDecimal.format(
                                                                      double.parse(
                                                                        listQtyLabourCost[i][index].toString(),
                                                                        // rekapitulasi.data[i].analisaFinFnSc![indexSubTotalLabourCost[i][index]].qty.toString()
                                                                      )
                                                                    )+" "+
                                                                    rekapitulasi.data[i].analisaFinFnSc![indexSubTotalLabourCost[i][index]].namaSatuan.toString(),
                                                                    style: const TextStyle(
                                                                      color: Colors.black,
                                                                    ),
                                                                    textAlign: TextAlign.left,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: getProportionateScreenHeight(10)),
                                                      Row(
                                                        children: <Widget>[
                                                          Expanded(
                                                            flex: 12,
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              children: const <Widget>[
                                                                Padding(
                                                                  padding: EdgeInsets.only(left: 0),
                                                                  child: Text("Unit Price",
                                                                    style: TextStyle(
                                                                      color: Colors.black,
                                                                    ),
                                                                    textAlign: TextAlign.left,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 0,
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: <Widget>[
                                                                Padding(
                                                                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                                                                  child: const Text(":",
                                                                    style: TextStyle(
                                                                      color: Colors.black,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 20,
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              children: <Widget>[
                                                                Padding(
                                                                  padding: const EdgeInsets.only(left: 0),
                                                                  child: Text(
                                                                    formatCurrency.format(
                                                                      double.parse(rekapitulasi.data[i].analisaFinFnSc![indexSubTotalLabourCost[i][index]].unitPrice.toString())
                                                                    ),
                                                                    style: const TextStyle(
                                                                      color: Colors.black,
                                                                    ),
                                                                    textAlign: TextAlign.left,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: getProportionateScreenHeight(10)),
                                                      Row(
                                                        children: <Widget>[
                                                          Expanded(
                                                            flex: 12,
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              children: const <Widget>[
                                                                Padding(
                                                                  padding: EdgeInsets.only(left: 0),
                                                                  child: Text("Konst.",
                                                                    style: TextStyle(
                                                                      color: Colors.black,
                                                                    ),
                                                                    textAlign: TextAlign.left,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 0,
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: <Widget>[
                                                                Padding(
                                                                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                                                                  child: const Text(":",
                                                                    style: TextStyle(
                                                                      color: Colors.black,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 20,
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              children: <Widget>[
                                                                Padding(
                                                                  padding: const EdgeInsets.only(left: 0),
                                                                  child: Text(
                                                                    formatDecimal.format(
                                                                      double.parse(
                                                                        listKonstantaLabourCost[i][index].toString(),
                                                                        // rekapitulasi.data[i].analisaFinFnSc![indexSubTotalLabourCost[i][index]].konstanta.toString()
                                                                      )
                                                                    ),
                                                                    style: const TextStyle(
                                                                      color: Colors.black,
                                                                    ),
                                                                    textAlign: TextAlign.left,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: getProportionateScreenHeight(10)),
                                                      Row(
                                                        children: <Widget>[
                                                          Expanded(
                                                            flex: 12,
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              children: const <Widget>[
                                                                Padding(
                                                                  padding: EdgeInsets.only(left: 0),
                                                                  child: Text("Total Price (Rp)",
                                                                    style: TextStyle(
                                                                      color: Colors.black,
                                                                    ),
                                                                    textAlign: TextAlign.left,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 0,
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: <Widget>[
                                                                Padding(
                                                                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                                                                  child: const Text(":",
                                                                    style: TextStyle(
                                                                      color: Colors.black,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 20,
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              children: <Widget>[
                                                                Padding(
                                                                  padding: const EdgeInsets.only(left: 0),
                                                                  child: Text(
                                                                    formatCurrency.format(
                                                                      double.parse(listSubTotalLabourCost[i][index].toString())
                                                                    ),
                                                                    style: const TextStyle(
                                                                      color: Colors.black,
                                                                    ),
                                                                    textAlign: TextAlign.left,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: getProportionateScreenHeight(10)),
                                        ]
                                      ],
                                    ],
                                  );
                                },
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                              ),
                            ]
                          ],
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                            child: CardItemExpansionDetail(
                              child: ListTile(
                                title: Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Expanded(
                                          flex: 4,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: const <Widget>[
                                              Padding(
                                                padding: EdgeInsets.only(left: 0),
                                                child: Text("Grand Total",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14,
                                                  ),
                                                  textAlign: TextAlign.left,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 6,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(right: 0),
                                                child: Text(
                                                  formatCurrency.format(
                                                      double.parse(grandTotalLabourCost
                                                    )
                                                  ),
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14,
                                                  ),
                                                  textAlign: TextAlign.right,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: getProportionateScreenHeight(10)),
                        ]
                      ),
                     
                      CardExpansionDetail(
                        label: "List Item Labour Cost Finishing",
                        children: <Widget> [
                          for(int i = 0 ; i < rekapitulasi.data.length ; i++)...[
                            if(rekapitulasi.data[i].analisaFinFnLc!.isNotEmpty)...[
                              ListView.builder(
                                itemCount: indexSubTotalMachineProcess[i].length,
                                itemBuilder: (context, index){
                                  return Column(
                                    children: [
                                      if(namaFinishing.toString().contains(rekapitulasi.data[i].analisaFinFnLc![indexSubTotalMachineProcess[i][index]].namaFinishingBarangJadi.toString()))...[
                                        if(listSubTotalMachineProcess[i][index] != 0.0)...[
                                          Padding(
                                            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                                            child: CardItemExpansionDetail(
                                              child: ListTile(
                                                contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0), vertical: getProportionateScreenHeight(10.0)),
                                                title: HighlightItemName(
                                                  child: Text(
                                                    listKodeMachineProcess[i][index].toString(),
                                                    // rekapitulasi.data[i].analisaFinFnLc![indexSubTotalMachineProcess[i][index]].kodeItem.toString(),
                                                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14,),
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                subtitle: Padding(
                                                  padding: EdgeInsets.only(top: getProportionateScreenHeight(15)),
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: <Widget>[
                                                      Row(
                                                        children: <Widget>[
                                                          Expanded(
                                                            flex: 12,
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              children: const <Widget>[
                                                                Padding(
                                                                  padding: EdgeInsets.only(left: 0),
                                                                  child: Text("Item Labour Cost Finishing",
                                                                    style: TextStyle(
                                                                      color: Colors.black,
                                                                    ),
                                                                    textAlign: TextAlign.left,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 0,
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: <Widget>[
                                                                Padding(
                                                                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                                                                  child: const Text(":",
                                                                    style: TextStyle(
                                                                      color: Colors.black,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 20,
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              children: <Widget>[
                                                                Padding(
                                                                  padding: const EdgeInsets.only(left: 0),
                                                                  child: Text(rekapitulasi.data[i].analisaFinFnLc![indexSubTotalMachineProcess[i][index]].namaItem.toString(),
                                                                    style: const TextStyle(
                                                                      color: Colors.black,
                                                                    ),
                                                                    textAlign: TextAlign.left,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: getProportionateScreenHeight(10)),
                                                      Row(
                                                        children: <Widget>[
                                                          Expanded(
                                                            flex: 12,
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              children: const <Widget>[
                                                                Padding(
                                                                  padding: EdgeInsets.only(left: 0),
                                                                  child: Text("Qty.",
                                                                    style: TextStyle(
                                                                      color: Colors.black,
                                                                    ),
                                                                    textAlign: TextAlign.left,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 0,
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: <Widget>[
                                                                Padding(
                                                                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                                                                  child: const Text(":",
                                                                    style: TextStyle(
                                                                      color: Colors.black,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 20,
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              children: <Widget>[
                                                                Padding(
                                                                  padding: const EdgeInsets.only(left: 0),
                                                                  child: Text(
                                                                    formatDecimal.format(
                                                                      double.parse(
                                                                        listQtyMachineProcess[i][index].toString(),
                                                                        // rekapitulasi.data[i].analisaFinFnLc![indexSubTotalMachineProcess[i][index]].qty.toString()
                                                                      )
                                                                    )+" "+
                                                                    rekapitulasi.data[i].analisaFinFnLc![indexSubTotalMachineProcess[i][index]].namaSatuan.toString(),
                                                                    style: const TextStyle(
                                                                      color: Colors.black,
                                                                    ),
                                                                    textAlign: TextAlign.left,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: getProportionateScreenHeight(10)),
                                                      Row(
                                                        children: <Widget>[
                                                          Expanded(
                                                            flex: 12,
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              children: const <Widget>[
                                                                Padding(
                                                                  padding: EdgeInsets.only(left: 0),
                                                                  child: Text("Unit Price",
                                                                    style: TextStyle(
                                                                      color: Colors.black,
                                                                    ),
                                                                    textAlign: TextAlign.left,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 0,
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: <Widget>[
                                                                Padding(
                                                                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                                                                  child: const Text(":",
                                                                    style: TextStyle(
                                                                      color: Colors.black,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 20,
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              children: <Widget>[
                                                                Padding(
                                                                  padding: const EdgeInsets.only(left: 0),
                                                                  child: Text(
                                                                    formatCurrency.format(
                                                                      double.parse(rekapitulasi.data[i].analisaFinFnLc![indexSubTotalMachineProcess[i][index]].unitPrice.toString())
                                                                    ),
                                                                    style: const TextStyle(
                                                                      color: Colors.black,
                                                                    ),
                                                                    textAlign: TextAlign.left,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: getProportionateScreenHeight(10)),
                                                      Row(
                                                        children: <Widget>[
                                                          Expanded(
                                                            flex: 12,
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              children: const <Widget>[
                                                                Padding(
                                                                  padding: EdgeInsets.only(left: 0),
                                                                  child: Text("Konst.",
                                                                    style: TextStyle(
                                                                      color: Colors.black,
                                                                    ),
                                                                    textAlign: TextAlign.left,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 0,
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: <Widget>[
                                                                Padding(
                                                                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                                                                  child: const Text(":",
                                                                    style: TextStyle(
                                                                      color: Colors.black,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 20,
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              children: <Widget>[
                                                                Padding(
                                                                  padding: const EdgeInsets.only(left: 0),
                                                                  child: Text(
                                                                    formatDecimal.format(
                                                                      double.parse(
                                                                        listKonstantaMachineProcess[i][index].toString(),
                                                                        // rekapitulasi.data[i].analisaFinFnLc![indexSubTotalMachineProcess[i][index]].konstanta.toString()
                                                                      )
                                                                    ),
                                                                    style: const TextStyle(
                                                                      color: Colors.black,
                                                                    ),
                                                                    textAlign: TextAlign.left,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: getProportionateScreenHeight(10)),
                                                      Row(
                                                        children: <Widget>[
                                                          Expanded(
                                                            flex: 12,
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              children: const <Widget>[
                                                                Padding(
                                                                  padding: EdgeInsets.only(left: 0),
                                                                  child: Text("Total Price (Rp)",
                                                                    style: TextStyle(
                                                                      color: Colors.black,
                                                                    ),
                                                                    textAlign: TextAlign.left,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 0,
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: <Widget>[
                                                                Padding(
                                                                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                                                                  child: const Text(":",
                                                                    style: TextStyle(
                                                                      color: Colors.black,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 20,
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              children: <Widget>[
                                                                Padding(
                                                                  padding: const EdgeInsets.only(left: 0),
                                                                  child: Text(
                                                                    formatCurrency.format(
                                                                      double.parse(listSubTotalMachineProcess[i][index].toString())
                                                                    ),
                                                                    style: const TextStyle(
                                                                      color: Colors.black,
                                                                    ),
                                                                    textAlign: TextAlign.left,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: getProportionateScreenHeight(10)),
                                        ],
                                      ],
                                    ],
                                  );
                                },
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                              ),
                            ]
                          ],
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                            child: CardItemExpansionDetail(
                              child: ListTile(
                                title: Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Expanded(
                                          flex: 4,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: const <Widget>[
                                              Padding(
                                                padding: EdgeInsets.only(left: 0),
                                                child: Text("Grand Total",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14,
                                                  ),
                                                  textAlign: TextAlign.left,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 6,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(right: 0),
                                                child: Text(
                                                  formatCurrency.format(
                                                      double.parse(grandTotalMachineProcess
                                                    )
                                                  ),
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14,
                                                  ),
                                                  textAlign: TextAlign.right,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: getProportionateScreenHeight(10)),
                        ]
                      ),
                      SizedBox(height: getProportionateScreenHeight(30)),
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