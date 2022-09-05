import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/notification/body.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/mgp_api_hrdu.dart';
import 'package:mgp_mobile_app/widget/theme/appbar_theme_color.dart';
import 'package:mgp_mobile_app/widget/theme/constants.dart';
import 'package:mgp_mobile_app/home/component/home_menu.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_delivery_order/detail_approval_delivery_order.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_faktur_penjualan/detail_approval_faktur_penjualan.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_kegiatan/detail_approval_kegiatan.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_penawaran/detail_approval_penawaran.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_penerimaan_barang/detail_approval_penerimaan_barang.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_ppa/detail_approval_ppa.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_purchase_order/detail_approval_purchase_order.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_purchase_request/detail_approval_purchase_request.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_rab/detail_approval_rab.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_rae/detail_approval_rae.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_rap/detail_approval_rap.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_sales_order/detail_approval_sales_order_view.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_seleksi_vendor/detail_approval_seleksi_vendor_view.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_surat_jalan/detail_approval_surat_jalan.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_surat_perjanjian_kerja/detail_approval_surat_perjanjian_kerja.dart';
import 'package:mgp_mobile_app/main.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';
import 'package:pushy_flutter/pushy_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);


  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
    controller.addListener(() {});
    pushyRegister();
    Pushy.listen();
    Pushy.setNotificationIcon('logo_mgp');
    Pushy.setNotificationListener(backgroundNotificationListener);
    Pushy.setNotificationClickListener((Map<String, dynamic> data) {
    // String message = data['message'];
    String jenis = data['jenis_transaksi'];
    // String levelApproval = data['level_approval'].toString();
    String baseline = data['baseline'];
    // String behaviour = data['behavior'];
    // String jenisTransaksi = jenis+"_"+behaviour+"_"+levelApproval;
    String noTransaksi = data['no_transaksi'];
    // showDialog(
    //   context: context,
    //   builder: (BuildContext context) {
    //       return AlertDialog(
    //           title: Text('Notification click'),
    //           content: Text(message),
    //           actions: [ TextButton( child: Text('OK'), onPressed: () { Navigator.of(context, rootNavigator: true).pop('dialog'); } )]
    //       );
    //   });
    if (jenis == "REGDO") {
      Get.to(DetailDeliveryOrderView(noDeliveryOrder: noTransaksi, statusMenu: "Approval"));
    } else if (jenis == "REGFPNJ") {
      Get.to(DetailFakturPenjualanView(noFaktur: noTransaksi, statusMenu: "Approval"));
    } else if (jenis == "RK") {
      Get.to(DetailKegiatanView(noKegiatan: noTransaksi));
    } else if (jenis == "REGPNW") {
      Get.to(DetailPenawaranView(noPenawaran: noTransaksi, baseline: baseline, statusMenu: "Approval"));
    } else if (jenis == "PENPO") {
      Get.to(DetailPenerimaanBarangView(noPenerimaanBarang: noTransaksi, statusMenu: "Approval"));
    } else if (jenis == "REGPPA") {
      Get.to(DetailPPAView(noPPA: noTransaksi));
    } else if (jenis == "REGPO") {
      Get.to(DetailPurchaseOrderView(noPurchaseOrder: noTransaksi, statusMenu: "Approval"));
    } else if (jenis == "PR") {
      Get.to(DetailPurchaseRequestView(noPurchaseRequest: noTransaksi, statusMenu: "Approval"));
    } else if (jenis == "REGRAB") {
      Get.to(DetailRencanaAnggaranBiayaView(noRab: noTransaksi, baseline: baseline, statusMenu: "Approval"));
    } else if (jenis == "REGRAE") {
      Get.to(DetailRencanaAnggaranEstimasiView(noRae: noTransaksi, baseline: baseline, statusMenu: "Approval"));
    } else if (jenis == "REGRAP") {
      Get.to(DetailRencanaAnggaranProduksiView(noRap: noTransaksi, baseline: baseline, statusMenu: "Approval"));
    } else if (jenis == "REGSO") {
      Get.to(DetailSalesOrderView(noSalesOrder: noTransaksi, statusMenu: "Approval"));
    } else if (jenis == "PVSPR") {
      Get.to(DetailSeleksiVendorView(noSeleksiVendor: noTransaksi, statusMenu: "Approval"));
    } else if (jenis == "REGSJ") {
      Get.to(DetailSuratJalanView(noSuratJalan: noTransaksi, statusMenu: "Approval"));
    } else if (jenis == "REGSPK") {
      Get.to(DetailSuratPerjanjianKerjaView(noSpk: noTransaksi, baseline: baseline, statusMenu: "Approval"));
    } 
      Pushy.clearBadge();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future pushyRegister() async {
    try {
      String deviceToken = await Pushy.register();
      // showDialog(
      //       context: context,
      //       builder: (BuildContext context) {
      //       return AlertDialog(
      //           title: const Text('Pushy'),
      //           content: Text('Pushy device token: $deviceToken'),
      //           actions: [ TextButton( child: const Text('OK'), onPressed: () { Navigator.of(context, rootNavigator: true).pop('dialog'); } )]
      //       );
      //   }
      //   );
      MGPAPI().registerTokenDevice(tokenDevice: deviceToken);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("device_token", deviceToken);
    } on PlatformException catch (error) {
      return error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Hi,Welcome!"),
          flexibleSpace: const AppBarThemeColor(),
        ),
        body: Column(
          children: <Widget>[
            Material(
              elevation: 2,
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: getProportionateScreenWidth(1).w,
                      color: const Color.fromRGBO(0, 0, 0, 0.08)
                    )
                  )
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: getProportionateScreenHeight(40).h,
                  child: TabBar(
                    controller: controller,
                    indicatorColor: kPrimaryColor,
                    labelStyle: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Poppins"
                    ),
                    labelColor: kPrimaryColor,
                    unselectedLabelColor: const Color.fromRGBO(0, 0, 0, 0.61),
                    tabs: const <Widget>[
                      Tab(text: "Home"),
                      Tab(text: "Notification"),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: controller,
                children: const <Widget>[
                  HomeMenu(),
                  Body(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}