import 'package:get/get.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/marketing/peluang/finishing/getX_finishing.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/marketing/peluang/finishing/mixin_analisa_finishing.dart';
import 'package:mgp_mobile_app/model/hrdu/peluang/analisa_single_peluang_fin.dart';
import 'package:flutter/material.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_peluang/analisa_finishing/analisa_finishing.dart';
import 'package:mgp_mobile_app/widget/component/card_field_analisa.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class NamaBody extends StatelessWidget with FinishingDetail{
  final String idBarangJadi;
  NamaBody({Key? key, required this.idBarangJadi}) : super(key: key);

  late Future<AnalisaSingleRegplgFinishing> fetchFinishingDetail = fetchDataFinishingDetail(idBarangJadi: idBarangJadi);

  Widget build(BuildContext context) {
    // listNamaFinishingBarangJadi.clear;
    Get.put(GetxFinishingPeluang()).finishing(idBarangJadi: idBarangJadi, namaFinishing: "-");
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: FutureBuilder(
              future: fetchFinishingDetail,//karena kita butuh fetch jadi untuk sementara begini dulu.
              builder: (BuildContext context, AsyncSnapshot<AnalisaSingleRegplgFinishing> snapshot) {
                if (snapshot.hasData) {
                  return GetX<GetxFinishingPeluang>(
                    init: GetxFinishingPeluang(),
                    builder:(controller) => Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: getProportionateScreenHeight(10)),
                        for(int j = 0 ; j < controller.listNamaFinishingBarangJadi.length ; j++)...[
                          CardFieldAnalisa(
                            label: controller.listNamaFinishingBarangJadi[j].toString(),
                            onTap: () {
                              Get.to(AnalisaFinishingView2(namaFinishing: controller.listNamaFinishingBarangJadi[j].toString(), idBarangJadi: idBarangJadi));
                            },
                          )
                        ]
                      ],
                    ),
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