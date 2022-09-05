import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:mgp_mobile_app/modul/hrdu/history_analisa_barang_jadi/history_analisa_barang_jadi.dart';
import 'package:mgp_mobile_app/modul/hrdu/history_mutasi_antar_gudang/history_mutasi_antar_gudang.dart';
import 'package:mgp_mobile_app/modul/hrdu/history_sales_order_spk/history_sales_order_spk.dart';
import 'package:mgp_mobile_app/widget/component/card_menu_approval.dart';
import 'package:mgp_mobile_app/widget/component/icon_menu_approval.dart';
import 'package:mgp_mobile_app/widget/component/icon_trailing_menu_approval.dart';
import 'package:mgp_mobile_app/widget/component/text_menu_approval.dart';
import 'package:mgp_mobile_app/widget/theme/constants.dart';
import 'package:mgp_mobile_app/modul/hrdu/history_delivery_order/history_delivery_order.dart';
import 'package:mgp_mobile_app/modul/hrdu/history_faktur_penjualan/history_faktur_penjualan.dart';
import 'package:mgp_mobile_app/modul/hrdu/history_peluang/history_peluang.dart';
import 'package:mgp_mobile_app/modul/hrdu/history_penawaran/history_penawaran.dart';
import 'package:mgp_mobile_app/modul/hrdu/history_penerimaan_barang/history_penerimaan_barang.dart';
import 'package:mgp_mobile_app/modul/hrdu/history_purchase_order/history_purchase_order.dart';
import 'package:mgp_mobile_app/modul/hrdu/history_purchase_request/history_purchase_request.dart';
import 'package:mgp_mobile_app/modul/hrdu/history_rab/history_rab.dart';
import 'package:mgp_mobile_app/modul/hrdu/history_rae/history_rae.dart';
import 'package:mgp_mobile_app/modul/hrdu/history_rap/history_rap.dart';
import 'package:mgp_mobile_app/modul/hrdu/history_sales_order/history_sales_order.dart';
import 'package:mgp_mobile_app/modul/hrdu/history_seleksi_vendor/history_seleksi_vendor.dart';
import 'package:mgp_mobile_app/modul/hrdu/history_surat_jalan/history_surat_jalan.dart';
import 'package:mgp_mobile_app/modul/hrdu/history_surat_perjanjian_kerja/history_surat_perjanjian_kerja.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BodyHistory extends StatefulWidget {
  const BodyHistory({Key? key}) : super(key: key);

  @override
  _BodyHistoryState createState() => _BodyHistoryState();
}

class _BodyHistoryState extends State<BodyHistory> {
  late String tokenUser;
  late SharedPreferences loginData;
  late String? deviceToken;
  late List dataHakAkses = [];
  late List hakAksesMenu = [];

  getHakAksesUser() async {
    loginData = await SharedPreferences.getInstance();
    setState(() {
      tokenUser = loginData.getString("token").toString();
    });
    Map<String, dynamic> decodeToken = JwtDecoder.decode(tokenUser);
    for(var i = 0; i < decodeToken["hak"].length; i++) {
      dataHakAkses.add(decodeToken["hak"][i]);
    }
    for(var i = 0; i < hakAksesHrduApproval.length; i++) {
      for (var j = 0; j < dataHakAkses.length; j++) {
        if(dataHakAkses[j].contains(hakAksesHrduApproval[i])){
          if(!hakAksesMenu.contains(hakAksesHrduApproval[i])){
            hakAksesMenu.add(hakAksesHrduApproval[i]);
          }
        }
      }
    }
  }

  @override
  void initState(){
    getHakAksesUser();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: getProportionateScreenHeight(15).h),
          CardMenuApproval(
            child: ListView.separated(
              separatorBuilder: (context, index) => const Divider(
                color: Colors.black,
              ),
              itemCount: hakAksesMenu.length,
              itemBuilder: (BuildContext context, index){
                return ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15.0).w),
                  leading: const IconMenuApproval(),
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      if(hakAksesMenu[index] == hakAksesHrduApproval[0])...[
                        const TextMenuApproval(
                          label: "Purchase Request"
                        ),
                      ],
                      if(hakAksesMenu[index] == hakAksesHrduApproval[1])...[
                        const TextMenuApproval(
                          label: "Seleksi Vendor"
                        ),
                      ],
                      if(hakAksesMenu[index] == hakAksesHrduApproval[2])...[
                        const TextMenuApproval(
                          label: "Purchase Order"
                        ),
                      ],
                      if(hakAksesMenu[index] == hakAksesHrduApproval[3])...[
                        const TextMenuApproval(
                          label: "Penerimaan Barang"
                        ),
                      ],
                      if(hakAksesMenu[index] == hakAksesHrduApproval[4])...[
                        const TextMenuApproval(
                          label: "Sales Order"
                        ),
                      ],
                      if(hakAksesMenu[index] == hakAksesHrduApproval[5])...[
                        const TextMenuApproval(
                          label: "Sales Order SPK"
                        ),
                      ],
                      if(hakAksesMenu[index] == hakAksesHrduApproval[6])...[
                        const TextMenuApproval(
                          label: "Delivery Order"
                        ),
                      ],
                      if(hakAksesMenu[index] == hakAksesHrduApproval[7])...[
                        const TextMenuApproval(
                          label: "Surat Jalan"
                        ),
                      ],
                      if(hakAksesMenu[index] == hakAksesHrduApproval[8])...[
                        const TextMenuApproval(
                          label: "Faktur Penjualan"
                        ),
                      ],
                      if(hakAksesMenu[index] == hakAksesHrduApproval[9])...[
                        const TextMenuApproval(
                          label: "Analisa Barang Jadi"
                        ),
                      ],
                      if(hakAksesMenu[index] == hakAksesHrduApproval[10])...[
                        const TextMenuApproval(
                          label: "Peluang"
                        ),
                      ],
                      if(hakAksesMenu[index] == hakAksesHrduApproval[11])...[
                        const TextMenuApproval(
                          label: "Rencana Anggaran Estimasi"
                        ),
                      ],
                      if(hakAksesMenu[index] == hakAksesHrduApproval[12])...[
                        const TextMenuApproval(
                          label: "Rencana Anggaran Biaya"
                        ),
                      ],
                      if(hakAksesMenu[index] == hakAksesHrduApproval[13])...[
                        const TextMenuApproval(
                          label: "Penawaran"
                        ),
                      ],
                      if(hakAksesMenu[index] == hakAksesHrduApproval[14])...[
                        const TextMenuApproval(
                          label: "Surat Perjanjian Kerja"
                        ),
                      ],
                      if(hakAksesMenu[index] == hakAksesHrduApproval[15])...[
                        const TextMenuApproval(
                          label: "Rencana Anggaran Produksi"
                        ),
                      ],
                      if(hakAksesMenu[index] == hakAksesHrduApproval[16])...[
                        const TextMenuApproval(
                          label: "Mutasi Antar Gudang"
                        ),
                      ],
                      if(hakAksesMenu[index] == hakAksesHrduApproval[17])...[
                        const TextMenuApproval(
                          label: "Mutasi Barang Jadi"
                        ),
                      ],
                    ],
                  ),
                  trailing: const IconTrailingMenuApproval(),
                  onTap: () {
                    if (hakAksesMenu[index] == hakAksesHrduApproval[0]) {
                      Get.to(const HistoryPurchaseRequestView());
                    } else if (hakAksesMenu[index] == hakAksesHrduApproval[1]) {
                      Get.to(const HistorySeleksiVendorView());
                    } else if (hakAksesMenu[index] == hakAksesHrduApproval[2]) {
                      Get.to(const HistoryPurchaseOrderView());
                    } else if (hakAksesMenu[index] == hakAksesHrduApproval[3]) {
                      Get.to(const HistoryPenerimaanBarangView());
                    } else if (hakAksesMenu[index] == hakAksesHrduApproval[4]) {
                      Get.to(const HistorySalesOrderView());
                    } else if (hakAksesMenu[index] == hakAksesHrduApproval[5]) {
                      Get.to(const HistorySalesOrderSPKView());
                    } else if (hakAksesMenu[index] == hakAksesHrduApproval[6]) {
                      Get.to(const HistoryDeliveryOrderView());
                    } else if (hakAksesMenu[index] == hakAksesHrduApproval[7]) {
                      Get.to(const HistorySuratJalanView());
                    } else if (hakAksesMenu[index] == hakAksesHrduApproval[8]) {
                      Get.to(const HistoryFakturPenjualanView());
                    } else if (hakAksesMenu[index] == hakAksesHrduApproval[9]) {
                      Get.to(const HistoryAnalisaBarangJadiView());
                    } else if (hakAksesMenu[index] == hakAksesHrduApproval[10]) {
                      Get.to(const HistoryPeluangView());
                    } else if (hakAksesMenu[index] == hakAksesHrduApproval[11]) {
                      Get.to(const HistoryRencanaAnggaranEstimasiView());
                    } else if (hakAksesMenu[index] == hakAksesHrduApproval[12]) {
                      Get.to(const HistoryRencanaAnggaranBiayaView());
                    } else if (hakAksesMenu[index] == hakAksesHrduApproval[13]) {
                      Get.to(const HistoryPenawaranView());
                    } else if (hakAksesMenu[index] == hakAksesHrduApproval[14]) {
                      Get.to(const HistorySuratPerjanjianKerjaView());
                    } else if (hakAksesMenu[index] == hakAksesHrduApproval[15]) {
                      Get.to(const HistoryRencanaAnggaranProduksiView());
                    } else if (hakAksesMenu[index] == hakAksesHrduApproval[16]) {
                      Get.to(const HistoryMutasiAntarGudangView());
                    } else if (hakAksesMenu[index] == hakAksesHrduApproval[17]) {
                      
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
    );
  }
}