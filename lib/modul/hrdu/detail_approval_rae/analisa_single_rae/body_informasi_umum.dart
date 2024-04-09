// import 'package:flutter_html/flutter_html.dart';

import 'package:get/get.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/marketing/rae/analisa_barang_jadi/getX_alat_bantu_on-site.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/marketing/rae/analisa_barang_jadi/getX_bahan_baku.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/marketing/rae/analisa_barang_jadi/getX_biaya_overhead_kantor.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/marketing/rae/analisa_barang_jadi/getX_finishing.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/marketing/rae/analisa_barang_jadi/getX_labour_cost_on_site.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/marketing/rae/analisa_barang_jadi/getX_penunjang_produksi.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/marketing/rae/analisa_barang_jadi/getX_rae.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/marketing/rae/mixin_rae.dart';
import 'package:mgp_mobile_app/widget/component/card_expansion_detail.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_total.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_url_launcher.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_rae/analisa_alat_bantu_on_site/alat_bantu_on_site.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_rae/analisa_bahan_baku/analisa_bahan_baku.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_rae/analisa_biaya_overhead_kantor/biaya_overhead_kantor.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_rae/analisa_finishing/analisa_finishing.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_rae/analisa_labour_cost_on_site/analisa_labour_cost_on_site.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_rae/analisa_penunjang_produksi/analisa_penunjang_produksi.dart';
import 'package:mgp_mobile_app/model/hrdu/rae/analisa_single_rae.dart';
import 'package:flutter/material.dart';
import 'package:mgp_mobile_app/widget/component/card_detail.dart';
import 'package:mgp_mobile_app/widget/component/card_field_analisa.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_text.dart';
import 'package:mgp_mobile_app/widget/component/card_field_total_analisa.dart';
import 'package:mgp_mobile_app/widget/component/card_field_total_analisa_item.dart';
import 'package:mgp_mobile_app/widget/component/card_item_expansion_detail.dart';
import 'package:mgp_mobile_app/widget/component/skeleton.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class BodyInformasi extends StatefulWidget {
  final String idRaeDetail;
  const BodyInformasi({Key? key, required this.idRaeDetail}) : super(key: key);

  @override
  _BodyInformasiState createState() => _BodyInformasiState();
}

class _BodyInformasiState extends State<BodyInformasi> with RaeDetail{
  late Future<AnalisaSingleRegrae> futureAnalisaSinggleRae = fetchDataRAEDetail(idRaeDetail: widget.idRaeDetail);
  
  List namaSummaryBiaya = [
    "Analisa Bahan Baku",
    "Analisa Penunjang Produksi",
    "Analisa Finishing",
    "Analisa Alat Bantu On-Site",
    "Analisa Labour Cost On-Site",
    "Analisa Biaya Overhead Kantor",
  ];

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
              future: futureAnalisaSinggleRae,
              builder: (BuildContext context, AsyncSnapshot<AnalisaSingleRegrae> snapshot) {
                if (snapshot.hasData) {
                  var analisaSingleRAE = futureDetailRae!.data;
                  return GetBuilder<GetxBahanBakuRae>(
                    init: GetxBahanBakuRae(),
                    builder:(controller) => 
                    GetBuilder<GetxPenunjangProduksiRae>(
                    init: GetxPenunjangProduksiRae(),
                    builder:(controller1) => 
                    GetBuilder<GetxFinishingRae>(
                    init: GetxFinishingRae(),
                    builder:(controller2) => 
                    GetBuilder<GetxAlatBantuOnSiteRae>(
                    init: GetxAlatBantuOnSiteRae(),
                    builder:(controller3) =>
                    GetBuilder<GetxLabourCostOnSiteRae>(
                    init: GetxLabourCostOnSiteRae(),
                    builder:(controller4){
                      Get.put(GetxBiayaOverheadKantorRae()).biayaOverheadKantorRae(
                        widget.idRaeDetail.toString(), 
                        double.parse(controller.totalBahanBaku.value.toString()), 
                        double.parse(controller1.totalPenunjangProduksi.value.toString()), 
                        double.parse(controller2.totalFinishing.value.toString()), 
                        double.parse(controller3.totalAlatBantuOnSite.value.toString()), 
                        double.parse(controller4.totalLabourCostOnSite.value.toString()),
                      );
                    return GetX<GetxBiayaOverheadKantorRae>(
                    init: GetxBiayaOverheadKantorRae(),
                    builder:(controller5){
                      Get.put(GetxAnalisaRae()).analisaRae(
                        double.parse(controller.totalBahanBaku.value.toString()), 
                        double.parse(controller1.totalPenunjangProduksi.value.toString()), 
                        double.parse(controller2.totalFinishing.value.toString()), 
                        double.parse(controller3.totalAlatBantuOnSite.value.toString()), 
                        double.parse(controller4.totalLabourCostOnSite.value.toString()),
                        double.parse(controller5.totalBiayaOverheadKantor.value.toString()),
                      );
                    return GetX<GetxAnalisaRae>(
                    init: GetxAnalisaRae(),
                    builder:(controller6) => 
                    Column(
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
                                  contentData: analisaSingleRAE!.kodeItem,
                                  flexLeftRow: 14,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5)),
                                CardFieldItemText(
                                  label: "Nama Barang Jadi",
                                  contentData: analisaSingleRAE.namaItem,
                                  flexLeftRow: 14,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5)),
                                CardFieldItemText(
                                  label: "Sumber Barang Jadi",
                                  contentData: analisaSingleRAE.namaKelompok,
                                  flexLeftRow: 14,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5)),
                                CardFieldItemText(
                                  label: "Satuan Jual",
                                  contentData: analisaSingleRAE.namaSatuan,
                                  flexLeftRow: 14,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5)),
                                CardFieldItemUrlLauncher(
                                  label: "Link Referensi",
                                  linkReferensi: analisaSingleRAE.linkReferensi,
                                  flexLeftRow: 14,
                                  flexRightRow: 20,
                                ),
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
                        //         child: Padding(
                        //           padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10), vertical: getProportionateScreenHeight(10)),
                        //           child: (analisaSingleRAE.uraian != null)
                        //           ? Html(
                        //             data: analisaSingleRAE.uraian
                        //           )
                        //           : const Text("-",
                        //             style: TextStyle(
                        //               color: Colors.black,
                        //               fontSize: 14,
                        //             ),
                        //             textAlign: TextAlign.left,
                        //           )
                        //         ),
                        //       ),
                        //     ),
                        //     SizedBox(height: getProportionateScreenHeight(10)),
                        //   ],
                        // ),
                        CardFieldAnalisa(
                          label: "Analisa Bahan Baku",
                          onTap: () {
                            Get.to(AnalisaBahanBakuView(idRaeDetail: widget.idRaeDetail));
                          },
                        ),
                        CardFieldAnalisa(
                          label: "Analisa Penunjang Produksi",
                          onTap: () {
                            Get.to(AnalisaPenunjangProduksiView(idRaeDetail: widget.idRaeDetail));
                          },
                        ),
                        CardFieldAnalisa(
                          label: "Analisa Finishing",
                          onTap: () {
                            Get.to(AnalisaFinishingView(idRaeDetail: widget.idRaeDetail));
                          },
                        ),
                        CardFieldAnalisa(
                          label: "Analisa Alat Bantu On-Site",
                          onTap: () {
                            Get.to(AnalisaAlatBantuOnSiteView(idRaeDetail: widget.idRaeDetail));
                          },
                        ),
                        CardFieldAnalisa(
                          label: "Analisa Labour Cost On-Site",
                          onTap: () {
                            Get.to(AnalisaLabourCostOnSiteView(idRaeDetail: widget.idRaeDetail));
                          },
                        ),
                        CardFieldAnalisa(
                          label: "Analisa Biaya Overhead Kantor",
                          onTap: () {
                            Get.to(AnalisaBiayaOverheadKantorView(idRaeDetail: widget.idRaeDetail, totalAnalisaBahanBaku: controller.totalBahanBaku.value.toString(), totalAnalisaPenunjanProduksi: controller1.totalPenunjangProduksi.value.toString(), totalAnalisaFinishing: controller2.totalFinishing.value.toString(), totalAnalisaAlatBantuOnSite: controller3.totalAlatBantuOnSite.value.toString(), totalAnalisaLabourCostOnSite: controller4.totalLabourCostOnSite.value.toString()));
                          },
                        ),
                        CardFieldTotalAnalisa(
                          child: ListView.builder(
                            itemCount: namaSummaryBiaya.length,
                            itemBuilder: (context, index){
                              return CardFieldTotalAnalisaItem(
                                label: namaSummaryBiaya[index],
                                total: controller6.totalSummaryBiaya[index],
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
                                  total: controller6.totals.value.toString(),
                                  flexLeftRow: 15,
                                  flexRightRow: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: getProportionateScreenHeight(10)),
                      ],
                    ),
                  );}
                );
                })))));
                }
                 else {
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