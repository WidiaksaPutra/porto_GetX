import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/marketing/rae/mixin_rae.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/marketing/rae/rekapitulasi/getX_hardwood.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/marketing/rae/rekapitulasi/getX_plywood.dart';
import 'package:mgp_mobile_app/model/hrdu/rae/rekapitulasi.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_rae/summary_biaya/summary_biaya_bahan_baku/hardwood/hardwood.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_rae/summary_biaya/summary_biaya_bahan_baku/plywood/plywood.dart';
import 'package:mgp_mobile_app/widget/component/card_expansion_detail.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_format_currency.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_text.dart';
import 'package:mgp_mobile_app/widget/component/card_item_expansion_detail.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class Body extends StatelessWidget with RaeRekapitulasi {
  final String idRae;
  Body({Key? key, required this.idRae}) : super(key: key);
  late Future<Rekapitulasi> futureSumaryBiayaBahanBaku = fetchDataRaeRekapitulasi(idRaeDetail: idRae);

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
              future: futureSumaryBiayaBahanBaku,
              builder: (BuildContext context, AsyncSnapshot<Rekapitulasi> snapshot) {
                if (snapshot.hasData) {
                  var rekapitulasi = snapshot.data;
                  return GetBuilder<GetxHardwoodRae>(
                    init: GetxHardwoodRae(),
                    builder:(controller) =>
                    GetBuilder<GetxPlywoodRae>(
                    init: GetxPlywoodRae(),
                    builder:(controller1) => 
                    Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: getProportionateScreenHeight(10),
                          ),
                          CardExpansionDetail(
                            label: "Hardwood",
                            children: <Widget> [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                                child: CardItemExpansionDetail(
                                  child: ListTile(
                                    contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0), vertical: getProportionateScreenHeight(10.0)),
                                    subtitle: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        CardFieldItemText(
                                          label: "Volume (m3)",
                                          contentData: controller.totalVolumeHardwood.value.toString(),
                                          flexLeftRow: 12,
                                          flexRightRow: 20,
                                        ),
                                        CardFieldItemFormatCurrency(
                                          label: "Total Price (Rp)",
                                          contentData: controller.grandTotalHardwood.value.toString(),
                                          flexLeftRow: 12,
                                          flexRightRow: 20,
                                        ),
                                      ],
                                    ),
                                    onTap: (){
                                      Get.to(Hardwood(idRae: idRae));
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(height: getProportionateScreenHeight(10)),
                            ]
                          ),
                          CardExpansionDetail(
                            label: "Plywood",
                            children: <Widget> [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                                child: CardItemExpansionDetail(
                                  child: ListTile(
                                    contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0), vertical: getProportionateScreenHeight(10.0)),
                                    subtitle: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        CardFieldItemText(
                                          label: "Volume (m3)",
                                          contentData: controller1.totalVolumePlywood.value.toString(),
                                          flexLeftRow: 12,
                                          flexRightRow: 20,
                                        ),
                                        CardFieldItemFormatCurrency(
                                          label: "Total Price (Rp)",
                                          contentData: controller1.totalPlywood.value.roundToDouble().toString(),
                                          flexLeftRow: 12,
                                          flexRightRow: 20,
                                        ),
                                      ],
                                    ),
                                    onTap: (){
                                      Get.to(Plywood(idRae: idRae));
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(height: getProportionateScreenHeight(10)),
                            ]
                          ),
                        ],
                      ),
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