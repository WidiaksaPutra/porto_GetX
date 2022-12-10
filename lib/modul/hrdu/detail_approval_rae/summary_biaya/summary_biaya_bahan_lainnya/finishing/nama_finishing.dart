
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mgp_mobile_app/model/hrdu/rae/rekapitulasi.dart';
import 'package:mgp_mobile_app/widget/component/card_field_analisa.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_rae/summary_biaya/summary_biaya_bahan_lainnya/finishing/finishing.dart';

class NamaBody extends StatelessWidget {
  final Future<Rekapitulasi> futureRekapitulasi;
  NamaBody({Key? key, required this.futureRekapitulasi}) : super(key: key);

  late List<String> listNamaFinishingBarangJadi = [];
  
  @override
  Widget build(BuildContext context) {
    listNamaFinishingBarangJadi.clear;
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
                  int lengRekapitulasi = rekapitulasi!.data.length;
                  for(int i = 0 ; i < lengRekapitulasi ; i++){
                    int analisaFinFnBp = rekapitulasi.data[i].analisaFinFnBp!.length;
                    if (rekapitulasi.data[i].analisaFinFnBp!.isNotEmpty) {//analisa_fin_fn_bp
                      for (var j = 0; j < analisaFinFnBp; j++) {
                        if(!listNamaFinishingBarangJadi.contains(rekapitulasi.data[i].analisaFinFnBp![j].namaFinishingBarangJadi.toString()) && rekapitulasi.data[i].analisaFinFnBp![j].namaFinishingBarangJadi.toString() != "-"){
                          listNamaFinishingBarangJadi.add(rekapitulasi.data[i].analisaFinFnBp![j].namaFinishingBarangJadi.toString());
                        }
                      }
                    }

                    int analisaFinFnSc = rekapitulasi.data[i].analisaFinFnSc!.length;
                    if (rekapitulasi.data[i].analisaFinFnSc!.isNotEmpty) {//analisa_fin_fn_sc
                      for (var j = 0; j < analisaFinFnSc; j++) {
                        if(!listNamaFinishingBarangJadi.contains(rekapitulasi.data[i].analisaFinFnSc![j].namaFinishingBarangJadi.toString()) && rekapitulasi.data[i].analisaFinFnSc![j].namaFinishingBarangJadi.toString() != "-"){
                          listNamaFinishingBarangJadi.add(rekapitulasi.data[i].analisaFinFnSc![j].namaFinishingBarangJadi.toString());
                        }
                      }
                    }

                    int analisaFinFnLc = rekapitulasi.data[i].analisaFinFnLc!.length;
                    if (rekapitulasi.data[i].analisaFinFnLc!.isNotEmpty) {//analisa_fin_fn_lc
                      for (var j = 0; j < analisaFinFnLc; j++) {
                        if(!listNamaFinishingBarangJadi.contains(rekapitulasi.data[i].analisaFinFnLc![j].namaFinishingBarangJadi.toString()) && rekapitulasi.data[i].analisaFinFnLc![j].namaFinishingBarangJadi.toString() != "-"){
                          listNamaFinishingBarangJadi.add(rekapitulasi.data[i].analisaFinFnLc![j].namaFinishingBarangJadi.toString());
                        }
                      }
                    }  
                  }
                  // print("halohalo bandung");
                  // print(listNamaFinishingBarangJadi);
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: getProportionateScreenHeight(10)),
                      for(int j = 0 ; j < listNamaFinishingBarangJadi.length ; j++)...[
                        if(listNamaFinishingBarangJadi[j].toString() != "-")...[
                          CardFieldAnalisa(
                            label: listNamaFinishingBarangJadi[j].toString(),
                            onTap: () {
                              Get.to(AnalisaFinishingView2(namaFinishing: listNamaFinishingBarangJadi[j].toString(), futureRekapitulasi: futureRekapitulasi,));
                            },
                          ),
                        ],
                      ]
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