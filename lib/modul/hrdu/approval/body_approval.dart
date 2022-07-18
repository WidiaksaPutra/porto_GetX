import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:mgp_mobile_app/modul/hrdu/approval_analisa_barang_jadi/approval_analisa_barang_jadi.dart';
import 'package:mgp_mobile_app/modul/hrdu/approval_sales_order_spk/approval_sales_order_spk.dart';
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
import 'package:shared_preferences/shared_preferences.dart';

class BodyApproval extends StatefulWidget {
  const BodyApproval({Key? key}) : super(key: key);

  @override
  _BodyApprovalState createState() => _BodyApprovalState();
}

class _BodyApprovalState extends State<BodyApproval> {
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
          const SizedBox(height: 15),
          CardMenuApproval(
            child: ListView.separated(
              separatorBuilder: (context, index) => const Divider(
                color: Colors.black,
              ),
              itemCount: hakAksesMenu.length,
              itemBuilder: (BuildContext context, index){
                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
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
                      Get.to(const PurchaseRequestView());
                    } else if (hakAksesMenu[index] == hakAksesHrduApproval[1]) {
                      Get.to(const SeleksiVendorView());
                    } else if (hakAksesMenu[index] == hakAksesHrduApproval[2]) {
                      Get.to(const PurchaseOrderView());
                    } else if (hakAksesMenu[index] == hakAksesHrduApproval[3]) {
                      Get.to(const PenerimaanBarangView());
                    } else if (hakAksesMenu[index] == hakAksesHrduApproval[4]) {
                      Get.to(const SalesOrderView());
                    } else if (hakAksesMenu[index] == hakAksesHrduApproval[5]) {
                      Get.to(const SalesOrderSPKView());
                    } else if (hakAksesMenu[index] == hakAksesHrduApproval[6]) {
                      Get.to(const DeliveryOrderView());
                    } else if (hakAksesMenu[index] == hakAksesHrduApproval[7]) {
                      Get.to(const SuratJalanView());
                    } else if (hakAksesMenu[index] == hakAksesHrduApproval[8]) {
                      Get.to(const FakturPenjualanView());
                    } else if (hakAksesMenu[index] == hakAksesHrduApproval[9]) {
                      Get.to(const AnalisaBarangJadiView());
                    } else if (hakAksesMenu[index] == hakAksesHrduApproval[10]) {
                      Get.to(const PeluangView());
                    } else if (hakAksesMenu[index] == hakAksesHrduApproval[11]) {
                      Get.to(const RencanaAnggaranEstimasiView());
                    } else if (hakAksesMenu[index] == hakAksesHrduApproval[12]) {
                      Get.to(const RencanaAnggaranBiayaView());
                    } else if (hakAksesMenu[index] == hakAksesHrduApproval[13]) {
                      Get.to(const PenawaranView());
                    } else if (hakAksesMenu[index] == hakAksesHrduApproval[14]) {
                      Get.to(const SuratPerjanjianKerjaView());
                    } else if (hakAksesMenu[index] == hakAksesHrduApproval[15]) {
                      Get.to(const RencanaAnggaranProduksiView());
                    } else if (hakAksesMenu[index] == hakAksesHrduApproval[16]) {
                      Get.to(const MutasiAntarGudangView());
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