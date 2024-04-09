import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/approval/getX_approval.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/purchase_order/getX_approval_purchase_order.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/seleksi_vendor/getX_approval_seleksi_vendor.dart';
import 'package:mgp_mobile_app/modul/hrdu/approval_analisa_barang_jadi/approval_analisa_barang_jadi.dart';
import 'package:mgp_mobile_app/modul/hrdu/approval_sales_order_spk/approval_sales_order_spk.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/api_penerimaan_barang/api_approval_penerimaan_barang.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/api_purchase_order/api_approval_purchase_order.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/purchase_request/getX_approval_purchase_request.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/api_seleksi_vendor/api_approval_seleksi_vendor.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/class_analisa_barang_jadi.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/class_delivery_order.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/class_faktur_penjualan.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/class_mutasi_antar_gudang.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/class_peluang.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/class_penawaran.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/class_ppa.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/class_rab.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/class_rae.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/class_rap.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/class_sales_order.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/class_sales_order_spk.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/class_surat_jalan.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/class_surat_perjanjian_kerja.dart';
import 'package:mgp_mobile_app/widget/component/badge.dart';
import 'package:mgp_mobile_app/widget/component/card_menu_approval.dart';
import 'package:mgp_mobile_app/widget/component/icon_menu_approval.dart';
import 'package:mgp_mobile_app/widget/component/icon_trailing_menu_approval.dart';
import 'package:mgp_mobile_app/widget/component/text_menu_approval.dart';
import 'package:mgp_mobile_app/widget/theme/constants.dart';
import 'package:mgp_mobile_app/modul/hrdu/approval_delivery_order/approval_delivery_order.dart';
import 'package:mgp_mobile_app/modul/hrdu/approval_faktur_penjualan/approval_faktur_penjualan.dart';
import 'package:mgp_mobile_app/modul/hrdu/approval_mutasi_antar_gudang/approval_mutasi_antar_gudang.dart';
import 'package:mgp_mobile_app/modul/hrdu/approval_peluang/approval_peluang.dart';
import 'package:mgp_mobile_app/modul/hrdu/approval_penawaran/approval_penawaran.dart';
import 'package:mgp_mobile_app/modul/hrdu/approval_penerimaan_barang/approval_penerimaan_barang.dart';
import 'package:mgp_mobile_app/modul/hrdu/approval_purchase_order/approval_purchase_order.dart';
import 'package:mgp_mobile_app/modul/hrdu/approval_purchase_request/approval_purchase_request.dart';
import 'package:mgp_mobile_app/modul/hrdu/approval_rab/approval_rab.dart';
import 'package:mgp_mobile_app/modul/hrdu/approval_rae/approval_rae.dart';
import 'package:mgp_mobile_app/modul/hrdu/approval_rap/approval_rap.dart';
import 'package:mgp_mobile_app/modul/hrdu/approval_sales_order/approval_sales_order.dart';
import 'package:mgp_mobile_app/modul/hrdu/approval_seleksi_vendor/approval_seleksi_vendor.dart';
import 'package:mgp_mobile_app/modul/hrdu/approval_surat_jalan/approval_surat_jalan.dart';
import 'package:mgp_mobile_app/modul/hrdu/approval_surat_perjanjian_kerja/approval_surat_perjanjian_kerja.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BodyApproval extends StatefulWidget {
  const BodyApproval({Key? key}) : super(key: key);

  @override
  _BodyApprovalState createState() => _BodyApprovalState();
}

class _BodyApprovalState extends State<BodyApproval> with DeliveryOrderClass, FakturPenjualanClass, MutasiAntarGudangClass,
  PeluangClass, PenawaranClass, PenerimaanBarangApprovalClass, PPAClass, PurchaseOrderApprovalClass,
  RABClass, RAEClass, RAPClass, SalesOrderClass, SalesOrderSPKClass, SuratJalanClass, SPKClass, 
  AnalisaBarangJadiClass {
  late String tokenUser;
  late SharedPreferences loginData;

  getHakAksesUser() async {
    loginData = await SharedPreferences.getInstance();
    setState(() {
      tokenUser = loginData.getString("token").toString();
    });
    // late Map<String, dynamic> decodeToken = JwtDecoder.decode(tokenUser);
    Get.put(ApprovalHrdu()).approvalHrdu();
  }

  @override
  void initState(){
    getHakAksesUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(GetxApprovalPurchaseRequest()).fetchCountApprovalPurchaseRequest();
    Get.put(GetxApprovalSeleksiVendor()).fetchCountApprovalSeleksiVendor();
    Get.put(GetxApprovalPurchaseOrder()).fetchCountApprovalPurchaseOrder();
    return GetX<ApprovalHrdu>(
      init: ApprovalHrdu(),
      builder: (controller) => SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: getProportionateScreenHeight(15)),
            CardMenuApproval(
              child: ListView.separated(
                separatorBuilder: (context, index) => const Divider(
                  color: Colors.black,
                ),
                itemCount: controller.hakAksesMenu.length,
                itemBuilder: (BuildContext context, index){
                  return ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15.0)),
                    leading: const IconMenuApproval(),
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        //kedepannya kita hanya perlu membuat objek yang memiliki value label dan future, class navigasinya, untuk mempersingkat proses ini.
                        if(controller.hakAksesMenu[index] == hakAksesHrduApproval[0])...[
                          GetX<GetxApprovalPurchaseRequest>(
                            init: GetxApprovalPurchaseRequest(),
                            builder: (controllerPr) => (controllerPr.loadingTotalDataPr.value == true)
                            ? (controllerPr.totalDataListApprovalPr.value == 0)
                              ? const TextMenuApproval(label: "Purchase Request")
                              : NotivBadges(
                                jumlahNotiv: controllerPr.totalDataListApprovalPr.value.toString(),
                                labelNotiv: "Purchase Request"
                              )
                            : const NotivBadges(jumlahNotiv: "-", labelNotiv: "loading...")
                          ) 
                        ],
                        if(controller.hakAksesMenu[index] == hakAksesHrduApproval[1])...[
                          GetX<GetxApprovalSeleksiVendor>(
                            init: GetxApprovalSeleksiVendor(),
                            builder: (controllerSv) => (controllerSv.loadingTotalDataSv.value == true)
                            ? (controllerSv.totalDataListApprovalSv.value == 0)
                              ? const TextMenuApproval(label: "Seleksi Vendor")
                              : NotivBadges(
                                jumlahNotiv: controllerSv.totalDataListApprovalSv.value.toString(),
                                labelNotiv: "Seleksi Vendor"
                              )
                            : const NotivBadges(jumlahNotiv: "-", labelNotiv: "loading...")
                          ),
                        ],
                        if(controller.hakAksesMenu[index] == hakAksesHrduApproval[2])...[
                           GetX<GetxApprovalPurchaseOrder>(
                            init: GetxApprovalPurchaseOrder(),
                            builder: (controllerSv) => (controllerSv.loadingTotalDataPo.value == true)
                            ? (controllerSv.totalDataListApprovalPo.value == 0)
                              ? const TextMenuApproval(label: "Purchase Order")
                              : NotivBadges(
                                jumlahNotiv: controllerSv.totalDataListApprovalPo.value.toString(),
                                labelNotiv: "Purchase Order"
                              )
                            : const NotivBadges(jumlahNotiv: "-", labelNotiv: "loading...")
                          ),
                        ],
                        if(controller.hakAksesMenu[index] == hakAksesHrduApproval[3])...[
                          FutureBuilder(
                          future: fetchApprovalCountPenerimaanBarang(page: 1),
                          builder: (BuildContext context, AsyncSnapshot<int> snapshot){
                            if(snapshot.hasData){
                              if(snapshot.data == 0){
                                return const TextMenuApproval(label: "Penerimaan Barang");
                              }
                              else{
                                return NotivBadges(jumlahNotiv: snapshot.data.toString(), labelNotiv: "Penerimaan Barang");
                              }
                            }else{
                              return const NotivBadges(jumlahNotiv: "-", labelNotiv: "loading...");
                            }
                          }),
                        ],
                        if(controller.hakAksesMenu[index] == hakAksesHrduApproval[4])...[
                          FutureBuilder(
                          future: fetchApprovalCountSalesOrder(page: 1),
                          builder: (BuildContext context, AsyncSnapshot<int> snapshot){
                            if(snapshot.hasData){
                              if(snapshot.data == 0){
                                return const TextMenuApproval(label: "Sales Order");
                              }
                              else{
                                return NotivBadges(jumlahNotiv: snapshot.data.toString(), labelNotiv: "Sales Order");
                              }
                            }else{
                              return const NotivBadges(jumlahNotiv: "-", labelNotiv: "loading...");
                            }
                          }),
                        ],
                        if(controller.hakAksesMenu[index] == hakAksesHrduApproval[5])...[
                          FutureBuilder(
                          future: fetchApprovalCountSalesOrderSPK(page: 1),
                          builder: (BuildContext context, AsyncSnapshot<int> snapshot){
                            if(snapshot.hasData){
                              if(snapshot.data == 0){
                                return const TextMenuApproval(label: "Sales Order SPK");
                              }
                              else{
                                return NotivBadges(jumlahNotiv: snapshot.data.toString(), labelNotiv: "Sales Order SPK");
                              }
                            }else{
                              return const NotivBadges(jumlahNotiv: "-", labelNotiv: "loading...");
                            }
                          }),
                        ],
                        if(controller.hakAksesMenu[index] == hakAksesHrduApproval[6])...[
                          FutureBuilder(
                          future: fetchApprovalCountDeliveryOrder(page: 1),
                          builder: (BuildContext context, AsyncSnapshot<int> snapshot){
                            if(snapshot.hasData){
                              if(snapshot.data == 0){
                                return const TextMenuApproval(label: "Delivery Order");
                              }
                              else{
                                return NotivBadges(jumlahNotiv: snapshot.data.toString(), labelNotiv: "Delivery Order");
                              }
                            }else{
                              return const NotivBadges(jumlahNotiv: "-", labelNotiv: "loading...");
                            }
                          }),
                        ],
                        if(controller.hakAksesMenu[index] == hakAksesHrduApproval[7])...[
                          FutureBuilder(
                          future: fetchApprovalCountSuratJalan(page: 1),
                          builder: (BuildContext context, AsyncSnapshot<int> snapshot){
                            if(snapshot.hasData){
                              if(snapshot.data == 0){
                                return const TextMenuApproval(label: "Surat Jalan");
                              }
                              else{
                                return NotivBadges(jumlahNotiv: snapshot.data.toString(), labelNotiv: "Surat Jalan");
                              }
                            }else{
                              return const NotivBadges(jumlahNotiv: "-", labelNotiv: "loading...");
                            }
                          }),
                        ],
                        if(controller.hakAksesMenu[index] == hakAksesHrduApproval[8])...[
                          FutureBuilder(
                          future: fetchApprovalCountFakturPenjualan(page: 1),
                          builder: (BuildContext context, AsyncSnapshot<int> snapshot){
                            if(snapshot.hasData){
                              if(snapshot.data == 0){
                                return const TextMenuApproval(label: "Faktur Penjualan");
                              }
                              else{
                                return NotivBadges(jumlahNotiv: snapshot.data.toString(), labelNotiv: "Faktur Penjualan");
                              }
                            }else{
                              return const NotivBadges(jumlahNotiv: "-", labelNotiv: "loading...");
                            }
                          }),
                        ],
                        if(controller.hakAksesMenu[index] == hakAksesHrduApproval[9])...[
                          FutureBuilder(
                          future: fetchApprovalCountAnalisaBarangJadi(page: 1),
                          builder: (BuildContext context, AsyncSnapshot<int> snapshot){
                            if(snapshot.hasData){
                              if(snapshot.data == 0){
                                return const TextMenuApproval(label: "Analisa Barang Jadi");
                              }
                              else{
                                return NotivBadges(jumlahNotiv: snapshot.data.toString(), labelNotiv: "Analisa Barang Jadi");
                              }
                            }else{
                              return const NotivBadges(jumlahNotiv: "-", labelNotiv: "loading...");
                            }
                          }),
                        ],
                        if(controller.hakAksesMenu[index] == hakAksesHrduApproval[10])...[
                          FutureBuilder(
                          future: fetchApprovalCountPeluang(page: 1),
                          builder: (BuildContext context, AsyncSnapshot<int> snapshot){
                            if(snapshot.hasData){
                              if(snapshot.data == 0){
                                return const TextMenuApproval(label: "Peluang");
                              }
                              else{
                                return NotivBadges(jumlahNotiv: snapshot.data.toString(), labelNotiv: "Peluang");
                              }
                            }else{
                              return const NotivBadges(jumlahNotiv: "-", labelNotiv: "loading...");
                            }
                          }),
                        ],
                        if(controller.hakAksesMenu[index] == hakAksesHrduApproval[11])...[
                          FutureBuilder(
                          future: fetchApprovalCountRAE(page: 1),
                          builder: (BuildContext context, AsyncSnapshot<int> snapshot){
                            if(snapshot.hasData){
                              if(snapshot.data == 0){
                                return const TextMenuApproval(label: "Rencana Anggaran Estimasi");
                              }
                              else{
                                return NotivBadges(jumlahNotiv: snapshot.data.toString(), labelNotiv: "Rencana Anggaran Estimasi");
                              }
                            }else{
                              return const NotivBadges(jumlahNotiv: "-", labelNotiv: "loading...");
                            }
                          }),
                        ],
                        if(controller.hakAksesMenu[index] == hakAksesHrduApproval[12])...[
                          FutureBuilder(
                          future: fetchApprovalCountRAB(page: 1),
                          builder: (BuildContext context, AsyncSnapshot<int> snapshot){
                            if(snapshot.hasData){
                              if(snapshot.data == 0){
                                return const TextMenuApproval(label: "Rencana Anggaran Biaya");
                              }
                              else{
                                return NotivBadges(jumlahNotiv: snapshot.data.toString(), labelNotiv: "Rencana Anggaran Biaya");
                              }
                            }else{
                              return const NotivBadges(jumlahNotiv: "-", labelNotiv: "loading...");
                            }
                          }),
                        ],
                        if(controller.hakAksesMenu[index] == hakAksesHrduApproval[13])...[
                          FutureBuilder(
                          future: fetchApprovalCountPenawaran(page: 1),
                          builder: (BuildContext context, AsyncSnapshot<int> snapshot){
                            if(snapshot.hasData){
                              if(snapshot.data == 0){
                                return const TextMenuApproval(label: "Penawaran");
                              }
                              else{
                                return NotivBadges(jumlahNotiv: snapshot.data.toString(), labelNotiv: "Penawaran");
                              }
                            }else{
                              return const NotivBadges(jumlahNotiv: "-", labelNotiv: "loading...");
                            }
                          }),
                        ],
                        if(controller.hakAksesMenu[index] == hakAksesHrduApproval[14])...[
                          FutureBuilder(
                          future: fetchApprovalCountSPK(page: 1),
                          builder: (BuildContext context, AsyncSnapshot<int> snapshot){
                            if(snapshot.hasData){
                              if(snapshot.data == 0){
                                return const TextMenuApproval(label: "Surat Perjanjian Kerja");
                              }
                              else{
                                return NotivBadges(jumlahNotiv: snapshot.data.toString(), labelNotiv: "Surat Perjanjian Kerja");
                              }
                            }else{
                              return const NotivBadges(jumlahNotiv: "-", labelNotiv: "loading...");
                            }
                          }),
                        ],
                        if(controller.hakAksesMenu[index] == hakAksesHrduApproval[15])...[
                          FutureBuilder(
                          future: fetchApprovalCountRAP(page: 1),
                          builder: (BuildContext context, AsyncSnapshot<int> snapshot){
                            if(snapshot.hasData){
                              if(snapshot.data == 0){
                                return const TextMenuApproval(label: "Rencana Anggaran Produksi");
                              }
                              else{
                                return NotivBadges(jumlahNotiv: snapshot.data.toString(), labelNotiv: "Rencana Anggaran Produksi");
                              }
                            }else{
                              return const NotivBadges(jumlahNotiv: "-", labelNotiv: "loading...");
                            }
                          }),
                        ],
                        if(controller.hakAksesMenu[index] == hakAksesHrduApproval[16])...[
                          FutureBuilder(
                          future: fetchApprovalCountMutasiAntarGudang(page: 1),
                          builder: (BuildContext context, AsyncSnapshot<int> snapshot){
                            if(snapshot.hasData){
                              if(snapshot.data == 0){
                                return const TextMenuApproval(label: "Mutasi Antar Gudang");
                              }
                              else{
                                return NotivBadges(jumlahNotiv: snapshot.data.toString(), labelNotiv: "Mutasi Antar Gudang");
                              }
                            }else{
                              return const NotivBadges(jumlahNotiv: "-", labelNotiv: "loading...");
                            }
                          }),
                        ],
                        if(controller.hakAksesMenu[index] == hakAksesHrduApproval[17])...[
                          const TextMenuApproval(
                            label: "Mutasi Barang Jadi"
                          ),
                        ],
                      ],
                    ),
                    trailing: const IconTrailingMenuApproval(),
                    onTap: () {
                      if (controller.hakAksesMenu[index] == hakAksesHrduApproval[0]) {
                        Get.to(const PurchaseRequestView());
                      } else if (controller.hakAksesMenu[index] == hakAksesHrduApproval[1]) {
                        Get.to(const SeleksiVendorView());
                      } else if (controller.hakAksesMenu[index] == hakAksesHrduApproval[2]) {
                        Get.to(const PurchaseOrderView());
                      } else if (controller.hakAksesMenu[index] == hakAksesHrduApproval[3]) {
                        Get.to(const PenerimaanBarangView());
                      } else if (controller.hakAksesMenu[index] == hakAksesHrduApproval[4]) {
                        Get.to(const SalesOrderView());
                      } else if (controller.hakAksesMenu[index] == hakAksesHrduApproval[5]) {
                        Get.to(const SalesOrderSPKView());
                      } else if (controller.hakAksesMenu[index] == hakAksesHrduApproval[6]) {
                        Get.to(const DeliveryOrderView());
                      } else if (controller.hakAksesMenu[index] == hakAksesHrduApproval[7]) {
                        Get.to(const SuratJalanView());
                      } else if (controller.hakAksesMenu[index] == hakAksesHrduApproval[8]) {
                        Get.to(const FakturPenjualanView());
                      } else if (controller.hakAksesMenu[index] == hakAksesHrduApproval[9]) {
                        Get.to(const AnalisaBarangJadiView());
                      } else if (controller.hakAksesMenu[index] == hakAksesHrduApproval[10]) {
                        Get.to(const PeluangView());
                      } else if (controller.hakAksesMenu[index] == hakAksesHrduApproval[11]) {
                        Get.to(const RencanaAnggaranEstimasiView());
                      } else if (controller.hakAksesMenu[index] == hakAksesHrduApproval[12]) {
                        Get.to(const RencanaAnggaranBiayaView());
                      } else if (controller.hakAksesMenu[index] == hakAksesHrduApproval[13]) {
                        Get.to(const PenawaranView());
                      } else if (controller.hakAksesMenu[index] == hakAksesHrduApproval[14]) {
                        Get.to(const SuratPerjanjianKerjaView());
                      } else if (controller.hakAksesMenu[index] == hakAksesHrduApproval[15]) {
                        Get.to(const RencanaAnggaranProduksiView());
                      } else if (controller.hakAksesMenu[index] == hakAksesHrduApproval[16]) {
                        Get.to(const MutasiAntarGudangView());
                      } else if (controller.hakAksesMenu[index] == hakAksesHrduApproval[17]) {
                        
                      }
                    },
                  );
                },
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}