import 'package:get/get.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/marketing/rae/analisa_barang_jadi/getX_finishing.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/marketing/rae/mixin_rae.dart';
import 'package:mgp_mobile_app/model/hrdu/rae/analisa_single_rae.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_rae/analisa_finishing/analisa_finishing.dart';
import 'package:mgp_mobile_app/widget/component/card_field_analisa.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class NamaBody extends StatefulWidget{
  final String idRaeDetail;
  const NamaBody({Key? key, required this.idRaeDetail}) : super(key: key);

  @override
  _NamaBodyState createState() => _NamaBodyState();
}

class _NamaBodyState extends State<NamaBody> with RaeDetail{
  late Future<AnalisaSingleRegrae> futureFinishing = fetchDataRAEDetail(idRaeDetail: widget.idRaeDetail);

  @override
  void initState() {
    initializeDateFormatting();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // listNamaFinishingBarangJadi.clear;
    Get.put(GetxFinishingRae()).finishing(widget.idRaeDetail, "-");
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: FutureBuilder(
              future: futureFinishing,
              builder: (BuildContext context, AsyncSnapshot<AnalisaSingleRegrae> snapshot) {
                if (snapshot.hasData) {
                  return GetX<GetxFinishingRae>(
                    init: GetxFinishingRae(),
                    builder:(controller) => Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: getProportionateScreenHeight(10)),
                        for(int j = 0 ; j < controller.listNamaFinishingBarangJadi.length ; j++)...[
                          if(controller.listNamaFinishingBarangJadi[j].toString() != "-")...[
                            CardFieldAnalisa(
                              label: controller.listNamaFinishingBarangJadi[j].toString(),
                              onTap: () {
                                Get.to(AnalisaFinishingView2(namaFinishing: controller.listNamaFinishingBarangJadi[j].toString(), idRaeDetail: widget.idRaeDetail));
                              },
                            ),
                          ],
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