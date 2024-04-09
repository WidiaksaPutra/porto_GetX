// import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/marketing/peluang/bahan_baku/mixin_analisa_bahan_baku.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/marketing/peluang/finishing/getX_finishing.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/marketing/peluang/finishing/mixin_analisa_finishing.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/marketing/peluang/penunjang_produksi/getX_penunjang_produksi.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/marketing/peluang/penunjang_produksi/mixin_analisa_bahan_baku.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/marketing/peluang/bahan_baku/getX_bahan_baku.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/marketing/peluang/detail_peluang/getX_peluang.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/marketing/peluang/detail_peluang/mixin_peluang.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/marketing/peluang/detail_peluang/mixin_umum.dart';
import 'package:mgp_mobile_app/model/hrdu/peluang/analisa_single_peluang_baku.dart';
import 'package:mgp_mobile_app/model/hrdu/peluang/analisa_single_peluang_fin.dart';
import 'package:mgp_mobile_app/model/hrdu/peluang/analisa_single_peluang_penunjang.dart';
import 'package:mgp_mobile_app/model/hrdu/peluang/analisa_single_peluang_umum.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_peluang/analisa_bahan_baku/analisa_bahan_baku.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_peluang/analisa_finishing/analisa_finishing.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_peluang/analisa_penunjang_produksi/analisa_penunjang_produksi.dart';
import 'package:mgp_mobile_app/widget/component/card_expansion_detail.dart';
import 'package:mgp_mobile_app/widget/component/card_field_analisa.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_total.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mgp_mobile_app/widget/component/card_detail.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_text.dart';
import 'package:mgp_mobile_app/widget/component/card_field_total_analisa.dart';
import 'package:mgp_mobile_app/widget/component/card_field_total_analisa_item.dart';
import 'package:mgp_mobile_app/widget/component/card_item_expansion_detail.dart';
import 'package:mgp_mobile_app/widget/component/skeleton.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class BodyInformasi extends StatefulWidget {
  final String idBarangJadi;
  const BodyInformasi({Key? key, required this.idBarangJadi}) : super(key: key);

  @override
  _BodyInformasiState createState() => _BodyInformasiState();
}

class _BodyInformasiState extends State<BodyInformasi> with PeluangDetail, PeluangPenunjangDetail, BahanBakuDetail, FinishingDetail, UmumDetail{
  late Future<AnalisaSingleRegplgUmum> futures1 = fetchDataUmumDetail(idBarangJadi: widget.idBarangJadi);
  late Future<AnalisaSingleRegplgBaku> futures2 = fetchDataBahanBakuDetail(idBarangJadi: widget.idBarangJadi);
  late Future<AnalisaSingleRegplgPenunjang> futures3 = fetchDataPeluangPenunjangDetail(idBarangJadi: widget.idBarangJadi);
  late Future<AnalisaSingleRegplgFinishing> futures4 = fetchDataFinishingDetail(idBarangJadi: widget.idBarangJadi);

  Future<dynamic> getAnalisaInformasiUmum() async {
    var responses = await Future.wait([
      futures1, futures2, futures3, futures4,
    ]);
    return "${responses[0]}, ${responses[1]}, ${responses[2]}, ${responses[3]}";
  }

  List namaSummaryBiaya = [
    "Analisa Bahan Baku",
    "Analisa Penunjang Produksi",
    "Analisa Finishing",
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
              future: getAnalisaInformasiUmum(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var analisaDetailUmum = futureDetailUmum!.data;
                  return 
                  GetBuilder<GetxFinishingPeluang>(
                  init: GetxFinishingPeluang(),
                  builder:(controller) => 
                  GetBuilder<GetxBahanBakuPeluang>(
                  init: GetxBahanBakuPeluang(),
                  builder:(controller1) =>
                  GetBuilder<GetxPenunjangProduksiPeluang>(
                  init: GetxPenunjangProduksiPeluang(),
                  builder:(controller2) {
                  Get.put(GetxAnalisaPeluang()).analisaPeluang(double.parse(controller.totalFinishing.value.toString()), double.parse(controller1.totalBahanBaku.value.toString()), double.parse(controller2.totalPenunjangProduksi.value.toString()));
                  return GetBuilder<GetxAnalisaPeluang>(
                  init: GetxAnalisaPeluang(),
                  builder:(controller3) {               
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
                                contentData: analisaDetailUmum!.kodeItem,
                                flexLeftRow: 14,
                                flexRightRow: 20,
                              ),
                              SizedBox(height: getProportionateScreenHeight(5)),
                              CardFieldItemText(
                                label: "Nama Barang Jadi",
                                contentData: analisaDetailUmum.namaItem,
                                flexLeftRow: 14,
                                flexRightRow: 20,
                              ),
                              SizedBox(height: getProportionateScreenHeight(5)),
                              CardFieldItemText(
                                label: "Sumber Barang Jadi",
                                contentData: analisaDetailUmum.namaKelompok,
                                flexLeftRow: 14,
                                flexRightRow: 20,
                              ),
                              SizedBox(height: getProportionateScreenHeight(5)),
                              CardFieldItemText(
                                label: "Satuan Jual",
                                contentData: analisaDetailUmum.namaSatuan,
                                flexLeftRow: 14,
                                flexRightRow: 20,
                              ),
                              SizedBox(height: getProportionateScreenHeight(5)),
                              CardFieldItemUrlLauncher(
                                label: "Link Referensi",
                                linkReferensi: analisaDetailUmum.linkReferensi,
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
                      //         child: SizedBox(
                      //           width: double.infinity,
                      //           child: Padding(
                      //             padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10), vertical: getProportionateScreenHeight(10)),
                      //             child: (analisaDetailUmum.uraian != null)
                      //             ? Html(
                      //               data: analisaDetailUmum.uraian
                      //             )
                      //             :  const Text("-",
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
                          Get.to(AnalisaBahanBakuView(idBarangJadi: widget.idBarangJadi));
                        },
                      ),
                      CardFieldAnalisa(
                        label: "Analisa Penunjang Produksi",
                        onTap: () {
                          Get.to(AnalisaPenunjangProduksiView(idBarangJadi: widget.idBarangJadi));
                        },
                      ),
                      CardFieldAnalisa(
                        label: "Analisa Finshing",
                        onTap: () {
                          Get.to(AnalisaFinishingView(idBarangJadi: widget.idBarangJadi));
                        },
                      ),
                      CardFieldTotalAnalisa(
                        child: ListView.builder(
                          itemCount: namaSummaryBiaya.length,
                          itemBuilder: (context, index){
                            return CardFieldTotalAnalisaItem(
                              label: namaSummaryBiaya[index],
                              total: controller3.totalSummaryBiaya[index],
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
                                total: controller3.totals.toString(),
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
                });}
                ),),);
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