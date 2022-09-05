import 'dart:convert';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mgp_mobile_app/model/history_notification/list_notification.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_delivery_order/detail_approval_delivery_order.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_faktur_penjualan/detail_approval_faktur_penjualan.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_mutasi_antar_gudang/detail_approval_mutasi_antar_gudang.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_peluang/detail_approval_peluang.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_penawaran/detail_approval_penawaran.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_penerimaan_barang/detail_approval_penerimaan_barang.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_purchase_order/detail_approval_purchase_order.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_purchase_request/detail_approval_purchase_request.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_rab/detail_approval_rab.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_rae/detail_approval_rae.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_rap/detail_approval_rap.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_sales_order/detail_approval_sales_order_view.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_sales_order_spk/detail_approval_sales_order_spk.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_seleksi_vendor/detail_approval_seleksi_vendor_view.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_surat_jalan/detail_approval_surat_jalan.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_surat_perjanjian_kerja/detail_approval_surat_perjanjian_kerja.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/mgp_api_hrdu.dart';
import 'package:mgp_mobile_app/widget/component/card_list.dart';
import 'package:mgp_mobile_app/widget/component/skeleton.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late String? tokens;
  late List<Datum> dataList = [];
  late Future<List<Datum>> _future;
  final ScrollController _scrollController = ScrollController();
  bool loading = false;
  int pages = 1;

  void routingPage({required String jenisTransaksi, required String noTransaksi, required String baseline, required String statusMenu}) {
    if (jenisTransaksi == "PR") {
      Get.to(DetailPurchaseRequestView(noPurchaseRequest: noTransaksi, statusMenu: statusMenu));
    } else if (jenisTransaksi == "PVSPR") {
      Get.to(DetailSeleksiVendorView(noSeleksiVendor: noTransaksi, statusMenu: statusMenu));
    } else if (jenisTransaksi == "REGPO") {
      Get.to(DetailPurchaseOrderView(noPurchaseOrder: noTransaksi, statusMenu: statusMenu));
    } else if (jenisTransaksi == "PENPO") {
      Get.to(DetailPenerimaanBarangView(noPenerimaanBarang: noTransaksi, statusMenu: statusMenu));
    } else if (jenisTransaksi == "REGSO") {
      Get.to(DetailSalesOrderView(noSalesOrder: noTransaksi, statusMenu: statusMenu));
    } else if (jenisTransaksi == "REGSSPK") {
      Get.to(DetailSalesOrderSPKView(noSalesOrderSPK: noTransaksi, statusMenu: statusMenu, idSalesOrderSpk: '',));
    } else if (jenisTransaksi == "REGDO") {
      Get.to(DetailDeliveryOrderView(noDeliveryOrder: noTransaksi, statusMenu: statusMenu));
    } else if (jenisTransaksi == "REGSJ") {
      Get.to(DetailSuratJalanView(noSuratJalan: noTransaksi, statusMenu: statusMenu));
    } else if (jenisTransaksi == "REGFPNJ") {
      Get.to(DetailFakturPenjualanView(noFaktur: noTransaksi, statusMenu: statusMenu));
    } else if (jenisTransaksi == "REGABJ") {
      // Get.to(DetailPurchaseOrderView(noPurchaseOrder: noTransaksi, statusMenu: statusMenu));
    } else if (jenisTransaksi == "REGPLG") {
      Get.to(DetailPeluangView(noPeluang: noTransaksi, statusMenu: statusMenu));
    } else if (jenisTransaksi == "REGRAE") {
      Get.to(DetailRencanaAnggaranEstimasiView(noRae: noTransaksi, baseline: baseline, statusMenu: statusMenu));
    } else if (jenisTransaksi == "REGRAB") {
      Get.to(DetailRencanaAnggaranBiayaView(noRab: noTransaksi, baseline: baseline, statusMenu: statusMenu));
    } else if (jenisTransaksi == "REGPNW") {
      Get.to(DetailPenawaranView(noPenawaran: noTransaksi, baseline: baseline, statusMenu: statusMenu));
    } else if (jenisTransaksi == "REGSPK") {
      Get.to(DetailSuratPerjanjianKerjaView(noSpk: noTransaksi, baseline: baseline, statusMenu: statusMenu));
    } else if (jenisTransaksi == "REGRAP") {
      Get.to(DetailRencanaAnggaranProduksiView(noRap: noTransaksi, baseline: baseline, statusMenu: statusMenu));
    } else if (jenisTransaksi == "RK") {
      // Get.to(DetailKegiatanView(noKegiatan: noTransaksi, statusMenu: statusMenu));
    } else if (jenisTransaksi == "REGPPA") {
      // Get.to(DetailPurchaseOrderView(noPurchaseOrder: noTransaksi, statusMenu: statusMenu));
    } else if (jenisTransaksi == "MAG") {
      Get.to(DetailMutasiAntarGudangView(noMutasiAntarGudang: noTransaksi, statusMenu: statusMenu));
    } else if (jenisTransaksi == "MBJ") {
      // Get.to(DetailPurchaseOrderView(noPurchaseOrder: noTransaksi, statusMenu: statusMenu));
    } 
  }

  Future<List<Datum>> fetchHistoryNotification({required int page}) async {
    await Future.delayed(const Duration(milliseconds: 800));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    int? perPage = 10;
    Map<String, String>? queryParams = {
      'page' : page.toString(),
      'per_page' : perPage.toString(),
    };
    String? queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = MGPAPI.baseURL + '/notification/list_notif?' + queryString;
    final response =
      await MGPAPI.client.get(Uri.parse(requestUrl),
      headers: {
        'Authorization': 'Bearer $tokens',
      }
    ).timeout(const Duration(seconds: 10));
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      ListNotification listNotificationData = ListNotification.fromJson(parsed);
      dataList.addAll(listNotificationData.data);
      pages++;
      return dataList;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future _refreshPage() async {
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      dataList.clear();
      pages = 1;
    });
    _future = fetchHistoryNotification(page: pages);
  }

  @override
  initState() {
    _future = fetchHistoryNotification(page: pages);
    initializeDateFormatting();
    super.initState();
    _scrollController.addListener(() async {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent &&!loading) {
        setState(() {
          loading = true;
        });
        await Future.delayed(const Duration(milliseconds: 500));
        setState(() {
          _future = fetchHistoryNotification(page: pages);
        });
        setState(() {
          loading = false;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(padding: 
        EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
        child: Column(
          children: <Widget>[
            SizedBox(height: getProportionateScreenHeight(10).h),
            FutureBuilder(
              future: _future,
              builder: (BuildContext context, AsyncSnapshot<List<Datum>> snapshot){
                if (snapshot.hasData) {
                  var dataHistoryNotification = snapshot.data;
                  if (dataHistoryNotification!.isNotEmpty) {
                    return Expanded(
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return Stack(
                            children: <Widget>[
                              RefreshIndicator(
                                onRefresh: _refreshPage,
                                child: ListView.builder(
                                  controller: _scrollController,
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount: dataHistoryNotification.length,
                                  itemBuilder: (context, index){
                                    // print(DateTime.now().timeZoneName.toString());
                                    // DateTime.parse(dataHistoryNotification[index].createdAt.toString()).timeZoneName.toString();
                                    return CardList(
                                      child: ListTile(
                                        contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0).w, vertical: getProportionateScreenHeight(10.0).h),
                                        leading: SizedBox(
                                          height: getProportionateScreenHeight(60).h,
                                          width: getProportionateScreenWidth(60).w,
                                          child: CircleAvatar(
                                            backgroundColor: Colors.white,
                                            child: ClipRRect(
                                              child: Image.asset("assets/images/LogoMGP.png"),
                                              borderRadius: BorderRadius.circular(50).r,
                                            ),
                                          ),
                                        ),
                                        title: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Padding(
                                              padding: EdgeInsets.only(top: getProportionateScreenHeight(5).h),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Row(
                                                    children: <Widget>[
                                                      Expanded(
                                                        flex: 40,
                                                        child: Column(
                                                          children: <Widget>[
                                                            Padding(
                                                              padding: EdgeInsets.only(left: getProportionateScreenWidth(0.0).w),
                                                              child: Text(
                                                                dataHistoryNotification[index].title.toString()
                                                                +" diajukan oleh "+
                                                                dataHistoryNotification[index].namaPengaju.toString()
                                                                +" dengan No.Transaksi "+
                                                                dataHistoryNotification[index].noTransaksi.toString()
                                                                +" baseline "+
                                                                dataHistoryNotification[index].baseline.toString(),
                                                                style: TextStyle(
                                                                  color: Colors.black,
                                                                  fontSize: 14.sp,
                                                                  fontWeight: FontWeight.w600
                                                                ),
                                                                textAlign: TextAlign.left,
                                                              )
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: getProportionateScreenHeight(10).h),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: <Widget>[
                                                Text(
                                                  DateFormat(
                                                    'dd MMMM yyyy', 'id').format(
                                                      DateTime.parse(dataHistoryNotification[index].createdAt.toString()
                                                    )
                                                  ).toString(),
                                                  style: TextStyle(
                                                    color: const Color.fromRGBO(119, 119, 119, 1),
                                                    fontSize: 12.sp
                                                  ),
                                                  textAlign: TextAlign.right,
                                                ),
                                                Text(
                                                  DateFormat(
                                                    'HH:mm a', 'id').format(
                                                      DateTime.parse(dataHistoryNotification[index].createdAt.toString()
                                                    ).toLocal(),
                                                  ).toString(),
                                                  style: TextStyle(
                                                    color: Colors.black, 
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12.sp
                                                  ),
                                                  textAlign: TextAlign.right,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        onTap: () {
                                          routingPage(
                                            jenisTransaksi: dataHistoryNotification[index].jenisTransaksi.toString(),
                                            noTransaksi: dataHistoryNotification[index].noTransaksi.toString(),
                                            baseline: dataHistoryNotification[index].baseline.toString(),
                                            statusMenu: "Approval",
                                          );
                                        },
                                      ),
                                    );
                                  }
                                ),
                              ),
                              if(loading)...[
                                Positioned(
                                  left: 0,
                                  bottom: 0,
                                  child: SizedBox(
                                    height: getProportionateScreenHeight(80).h,
                                    width: constraints.maxWidth,
                                    child: const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  ),
                                ),
                              ]
                            ],
                          );
                        }
                      ),
                    );
                  } else {
                    return Center(
                      child: Column(
                        children: const <Widget>[
                          Text("Tidak Ada Data")
                        ],
                      ),
                    );
                  }
                } else {
                  return Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
                          child: Column(
                            children: <Widget>[
                              Skeleton(
                                width: double.infinity,
                                height: getProportionateScreenHeight(125).h,
                              ),
                              SizedBox(height: getProportionateScreenHeight(15).h),
                            ],
                          ),
                        );
                      }
                    ),
                  );
                }
              }
            ),
          ],
        ),
      ),
    );
  }
  Widget buildSearchField() {
    const color = Colors.black;
    return TextFormField(
      keyboardType: TextInputType.text,
      style: const TextStyle(color: color),
      decoration: const InputDecoration(
        hintText: 'Search',
        prefixIcon: Icon(Icons.search, color: color),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}