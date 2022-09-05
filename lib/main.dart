import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mgp_mobile_app/home/home.dart';
import 'package:mgp_mobile_app/modul/hrdu/approval/approval.dart';
import 'package:mgp_mobile_app/modul/hrdu/approval_delivery_order/approval_delivery_order.dart';
import 'package:mgp_mobile_app/modul/hrdu/approval_faktur_penjualan/approval_faktur_penjualan.dart';
import 'package:mgp_mobile_app/modul/hrdu/approval_kegiatan/approval_kegiatan.dart';
import 'package:mgp_mobile_app/modul/hrdu/approval_peluang/approval_peluang.dart';
import 'package:mgp_mobile_app/modul/hrdu/approval_penawaran/approval_penawaran.dart';
import 'package:mgp_mobile_app/modul/hrdu/approval_penerimaan_barang/approval_penerimaan_barang.dart';
import 'package:mgp_mobile_app/modul/hrdu/approval_ppa/approval_ppa.dart';
import 'package:mgp_mobile_app/modul/hrdu/approval_purchase_order/approval_purchase_order.dart';
import 'package:mgp_mobile_app/modul/hrdu/approval_purchase_request/approval_purchase_request.dart';
import 'package:mgp_mobile_app/modul/hrdu/approval_rab/approval_rab.dart';
import 'package:mgp_mobile_app/modul/hrdu/approval_rae/approval_rae.dart';
import 'package:mgp_mobile_app/modul/hrdu/approval_rap/approval_rap.dart';
import 'package:mgp_mobile_app/modul/hrdu/approval_sales_order/approval_sales_order.dart';
import 'package:mgp_mobile_app/modul/hrdu/approval_seleksi_vendor/approval_seleksi_vendor.dart';
import 'package:mgp_mobile_app/modul/hrdu/approval_surat_jalan/approval_surat_jalan.dart';
import 'package:mgp_mobile_app/modul/hrdu/approval_surat_perjanjian_kerja/approval_surat_perjanjian_kerja.dart';
import 'package:mgp_mobile_app/modul/hrdu/history_delivery_order/history_delivery_order.dart';
import 'package:mgp_mobile_app/modul/hrdu/history_faktur_penjualan/history_faktur_penjualan.dart';
import 'package:mgp_mobile_app/modul/hrdu/history_kegiatan/history_kegiatan.dart';
import 'package:mgp_mobile_app/modul/hrdu/history_penawaran/history_penawaran.dart';
import 'package:mgp_mobile_app/modul/hrdu/history_penerimaan_barang/history_penerimaan_barang.dart';
import 'package:mgp_mobile_app/modul/hrdu/history_ppa/history_ppa.dart';
import 'package:mgp_mobile_app/modul/hrdu/history_purchase_order/history_purchase_order.dart';
import 'package:mgp_mobile_app/modul/hrdu/history_purchase_request/history_purchase_request.dart';
import 'package:mgp_mobile_app/modul/hrdu/history_rab/history_rab.dart';
import 'package:mgp_mobile_app/modul/hrdu/history_rae/history_rae.dart';
import 'package:mgp_mobile_app/modul/hrdu/history_sales_order/history_sales_order.dart';
import 'package:mgp_mobile_app/modul/hrdu/history_seleksi_vendor/history_seleksi_vendor.dart';
import 'package:mgp_mobile_app/modul/hrdu/history_surat_jalan/history_surat_jalan.dart';
import 'package:mgp_mobile_app/modul/hrdu/history_surat_perjanjian_kerja/history_surat_perjanjian_kerja.dart';
import 'package:mgp_mobile_app/modul/hrdu/report/report.dart';
import 'package:mgp_mobile_app/login/login.dart';
import 'package:mgp_mobile_app/notification/notification.dart';
import 'package:mgp_mobile_app/profile/component/informasi_akun/informasi_akun.dart';
import 'package:mgp_mobile_app/profile/profile.dart';
import 'package:mgp_mobile_app/splashscreen/splashscreen.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';
import 'package:mgp_mobile_app/widget/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pushy_flutter/pushy_flutter.dart';


void main() {
  runApp(const MyApp());
}

void backgroundNotificationListener(Map<String, dynamic> data) {
  print(data['title']);
  print(data['message']);
  String notificationTitle = data['title'];
  String notificationText = data['message'];
  Pushy.notify(notificationTitle, notificationText, data);
  // String jenis = data['jenis_transaksi'];
  // String levelApproval = data['level_approval'].toString();
  // String behaviour = data['behavior'];
  // String jenisTransaksi = jenis+"_"+behaviour+"_"+levelApproval;
  // Pushy.notify(notificationTitle, notificationText, data);
  Pushy.clearBadge();
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
       home: MainScreen(), 
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}


class _MainScreenState extends State<MainScreen> {
  @override
  initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    late Size size = MediaQuery.of(context).size;
    SizeConfig().init(context);
    return ScreenUtilInit(
      designSize: Size(size.width, size.height),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
            FocusManager.instance.primaryFocus!.unfocus();
          }
        },
        child: GetMaterialApp(
          home: const SplashScreen(),
          theme: theme(),
          getPages: [
            GetPage(name: "/login", page: () => const LoginView()),
            GetPage(name: "/home", page: () => const HomeView()),
            GetPage(name: "/approval", page: () => const ApprovalView()),
            GetPage(name: "/report", page: () => const ReportView()),
            GetPage(name: "/notification", page: () => const NotificationView()),
            GetPage(name: "/profile", page: () => const ProfilView()),
            GetPage(name: "/approval_purchase_request", page: () => const PurchaseRequestView()),
            GetPage(name: "/approval_seleksi_vendor", page: () => const SeleksiVendorView()),
            GetPage(name: "/approval_purchase_order", page: () => const PurchaseOrderView()),
            GetPage(name: "/approval_penerimaan_barang", page: () => const PenerimaanBarangView()),
            GetPage(name: "/approval_sales_order", page: () => const SalesOrderView()),
            GetPage(name: "/approval_delivery_order", page: () => const DeliveryOrderView()),
            GetPage(name: "/approval_faktur_penjualan", page: () => const FakturPenjualanView()),
            GetPage(name: "/approval_surat_jalan", page: () => const SuratJalanView()),
            GetPage(name: "/approval_kegiatan", page: () => const KegiatanView()),
            GetPage(name: "/approval_peluang", page: () => const PeluangView()),
            GetPage(name: "/approval_rencana_anggaran_estimasi", page: () => const RencanaAnggaranEstimasiView()),
            GetPage(name: "/approval_rencana_anggaran_biaya", page: () => const RencanaAnggaranBiayaView()),
            GetPage(name: "/approval_penawaran", page: () => const PenawaranView()),
            GetPage(name: "/approval_surat_perjanjian_kerja", page: () => const SuratPerjanjianKerjaView()),
            GetPage(name: "/approval_rencana_anggaran_produksi", page: () => const RencanaAnggaranProduksiView()),
            GetPage(name: "/approval_ppa", page: () => const PPAView()),
            GetPage(name: "/history_delivery_order", page: () => const HistoryDeliveryOrderView()),
            GetPage(name: "/history_faktur_penjualan", page: () => const HistoryFakturPenjualanView()),
            GetPage(name: "/history_kegiatan", page: () => const HistoryKegiatanView()),
            GetPage(name: "/history_penawaran", page: () => const HistoryPenawaranView()),
            GetPage(name: "/history_penerimaan_barang", page: () => const HistoryPenerimaanBarangView()),
            GetPage(name: "/history_ppa", page: () => const HistoryPPAView()),
            GetPage(name: "/history_purchase_order", page: () => const HistoryPurchaseOrderView()),
            GetPage(name: "/history_purchase_request", page: () => const HistoryPurchaseRequestView()),
            GetPage(name: "/history_rab", page: () => const HistoryRencanaAnggaranBiayaView()),
            GetPage(name: "/history_rae", page: () => const HistoryRencanaAnggaranEstimasiView()),
            GetPage(name: "/history_sales_order", page: () => const HistorySalesOrderView()),
            GetPage(name: "/history_seleksi_vendor", page: () => const HistorySeleksiVendorView()),
            GetPage(name: "/history_surat_jalan", page: () => const HistorySuratJalanView()),
            GetPage(name: "/history_surat_perjanjian_kerja", page: () => const HistorySuratPerjanjianKerjaView()),
            GetPage(name: "/informasi_akun", page: () => const InformasiAkunView()),
          ],
        ),
      ),
    );
  }
}