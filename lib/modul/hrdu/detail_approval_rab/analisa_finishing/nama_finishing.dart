
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mgp_mobile_app/model/hrdu/rab/analisa_single_rab.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_rab/analisa_finishing/analisa_finishing.dart';
import 'package:mgp_mobile_app/widget/component/card_field_analisa.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class NamaBody extends StatefulWidget {
  final Future<AnalisaSingleRegrab> analisaSingleRegrab;
  const NamaBody({Key? key, required this.analisaSingleRegrab}) : super(key: key);

  @override
  _NamaBodyState createState() => _NamaBodyState();
}

class _NamaBodyState extends State<NamaBody> {
  late List<String> listNamaFinishingBarangJadi = [];

  @override
  void initState() {
    initializeDateFormatting();
    super.initState();
  }
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
              future: widget.analisaSingleRegrab,
              builder: (BuildContext context, AsyncSnapshot<AnalisaSingleRegrab> snapshot) {
                if (snapshot.hasData) {
                 var analisaSingleRAE = snapshot.data;
                  if (analisaSingleRAE!.data!.analisaFinFnBp!.isNotEmpty) {//analisa_fin_fn_bp
                    for (var i = 0; i < analisaSingleRAE.data!.analisaFinFnBp!.length; i++) {
                      if(!listNamaFinishingBarangJadi.contains(analisaSingleRAE.data!.analisaFinFnBp![i].namaFinishingBarangJadi.toString()) && analisaSingleRAE.data!.analisaFinFnBp![i].namaFinishingBarangJadi.toString() != "-"){
                        listNamaFinishingBarangJadi.add(analisaSingleRAE.data!.analisaFinFnBp![i].namaFinishingBarangJadi.toString());
                      }
                    }
                  }
                  if (analisaSingleRAE.data!.analisaFinFnSc!.isNotEmpty) {//analisa_fin_fn_sc
                    for (var i = 0; i < analisaSingleRAE.data!.analisaFinFnSc!.length; i++) {
                      if(!listNamaFinishingBarangJadi.contains(analisaSingleRAE.data!.analisaFinFnSc![i].namaFinishingBarangJadi.toString()) && analisaSingleRAE.data!.analisaFinFnSc![i].namaFinishingBarangJadi.toString() != "-"){
                        listNamaFinishingBarangJadi.add(analisaSingleRAE.data!.analisaFinFnSc![i].namaFinishingBarangJadi.toString());
                      }
                    }
                  }
                  if (analisaSingleRAE.data!.analisaFinFnLc!.isNotEmpty) {//analisa_fin_fn_lc
                    for (var i = 0; i < analisaSingleRAE.data!.analisaFinFnLc!.length; i++) {
                      if(!listNamaFinishingBarangJadi.contains(analisaSingleRAE.data!.analisaFinFnLc![i].namaFinishingBarangJadi.toString()) && analisaSingleRAE.data!.analisaFinFnLc![i].namaFinishingBarangJadi.toString() != "-"){
                        listNamaFinishingBarangJadi.add(analisaSingleRAE.data!.analisaFinFnLc![i].namaFinishingBarangJadi.toString());
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
                              Get.to(AnalisaFinishingView2(namaFinishing: listNamaFinishingBarangJadi[j].toString(), analisaSingleRegrab: widget.analisaSingleRegrab));
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