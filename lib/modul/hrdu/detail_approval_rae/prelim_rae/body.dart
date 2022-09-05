import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:mgp_mobile_app/model/hrdu/rae/detail_rae_model.dart';
import 'package:mgp_mobile_app/model/hrdu/rae/list_kelompok_prelim.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/mgp_api_hrdu.dart';
import 'package:mgp_mobile_app/widget/component/card_expansion_detail.dart';
import 'package:mgp_mobile_app/widget/component/card_field_total_analisa.dart';
import 'package:mgp_mobile_app/widget/component/highlight_item_name.dart';
import 'package:mgp_mobile_app/widget/component/skeleton.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class Body extends StatefulWidget {
  final Future<DetailRegrae> detailRegrae;
  final String grandTotalPrelim;
  const Body({Key? key, required this.detailRegrae, required this.grandTotalPrelim}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final formatCurrency = NumberFormat.currency(
    locale: 'ID',
    decimalDigits: 0,
    symbol: "Rp"
  );
  final formatDecimal = NumberFormat("###.######", "id_ID");
  final decimalFormat = NumberFormat("###", "id_ID");
  late List subTotalHargaPrelim = [];
  late List totalHargaPrelim = [];
  late List<ListDataPrelim> atk = [];
  late List<ListDataPrelim> safety = [];
  late List<ListDataPrelim> proteksi = [];
  late List<ListDataPrelim> handTools = [];
  late List<ListDataPrelim> honorStaff = [];
  late List<ListDataPrelim> lainLain = [];
  late Future<ListKelompokPrelimRegrae> futurePrelim;

  @override
  void initState() {
    futurePrelim = MGPAPI().fetchAnalisaPrelimRAE();
    initializeDateFormatting();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20).w),
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: FutureBuilder<ListKelompokPrelimRegrae>(
              future: futurePrelim,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var listKelompokPrelim = snapshot.data;
                  return FutureBuilder<DetailRegrae>(
                    future: widget.detailRegrae,
                    builder: (context, snapshots) {
                      if (snapshots.hasData) {
                        var dataPrelim = snapshots.data;
                        atk.clear();
                        safety.clear();
                        proteksi.clear();
                        handTools.clear();
                        honorStaff.clear();
                        lainLain.clear();
                        if (dataPrelim!.data!.detail!.prelim!.isNotEmpty) {
                          for (var i = 0; i < listKelompokPrelim!.data!.length; i++) {
                            for (var j = 0; j < dataPrelim.data!.detail!.prelim!.length; j++) {
                              num subTotal = double.parse(dataPrelim.data!.detail!.prelim![j]!.qtyAnalisa.toString())
                              * double.parse(dataPrelim.data!.detail!.prelim![j]!.unitPrice.toString());
                              num subTotalPrelim = subTotal.round() 
                              * double.parse(dataPrelim.data!.detail!.prelim![j]!.konstanta.toString());
                              if (listKelompokPrelim.data![i]!.idKelompok.toString() == dataPrelim.data!.detail!.prelim![j]!.idKelompok.toString() && listKelompokPrelim.data![i]!.namaKelompok.toString() == "ATK") {
                                atk.add(
                                  ListDataPrelim(
                                    dataPrelim.data!.detail!.prelim![j]!.kodeItemPrelim.toString(),
                                    dataPrelim.data!.detail!.prelim![j]!.namaItemPrelim.toString(),
                                    dataPrelim.data!.detail!.prelim![j]!.qtyAnalisa.toString(),
                                    dataPrelim.data!.detail!.prelim![j]!.namaSatuanPrelim.toString(),
                                    dataPrelim.data!.detail!.prelim![j]!.unitPrice.toString(),
                                    subTotal.toString(),
                                    dataPrelim.data!.detail!.prelim![j]!.qtyDurasi.toString(),
                                    dataPrelim.data!.detail!.prelim![j]!.konstanta.toString(), 
                                    subTotalPrelim.toString(),
                                  ),
                                );
                              } else if (listKelompokPrelim.data![i]!.idKelompok.toString() == dataPrelim.data!.detail!.prelim![j]!.idKelompok.toString() && listKelompokPrelim.data![i]!.namaKelompok.toString() == "Safety") {
                                safety.add(
                                  ListDataPrelim(
                                    dataPrelim.data!.detail!.prelim![j]!.kodeItemPrelim.toString(),
                                    dataPrelim.data!.detail!.prelim![j]!.namaItemPrelim.toString(),
                                    dataPrelim.data!.detail!.prelim![j]!.qtyAnalisa.toString(),
                                    dataPrelim.data!.detail!.prelim![j]!.namaSatuanPrelim.toString(),
                                    dataPrelim.data!.detail!.prelim![j]!.unitPrice.toString(),
                                    subTotal.toString(),
                                    dataPrelim.data!.detail!.prelim![j]!.qtyDurasi.toString(),
                                    dataPrelim.data!.detail!.prelim![j]!.konstanta.toString(), 
                                    subTotalPrelim.toString(),
                                  ),
                                );
                              } else if (listKelompokPrelim.data![i]!.idKelompok.toString() == dataPrelim.data!.detail!.prelim![j]!.idKelompok.toString() && listKelompokPrelim.data![i]!.namaKelompok.toString() == "Proteksi") {
                                proteksi.add(
                                  ListDataPrelim(
                                    dataPrelim.data!.detail!.prelim![j]!.kodeItemPrelim.toString(),
                                    dataPrelim.data!.detail!.prelim![j]!.namaItemPrelim.toString(),
                                    dataPrelim.data!.detail!.prelim![j]!.qtyAnalisa.toString(),
                                    dataPrelim.data!.detail!.prelim![j]!.namaSatuanPrelim.toString(),
                                    dataPrelim.data!.detail!.prelim![j]!.unitPrice.toString(),
                                    subTotal.toString(),
                                    dataPrelim.data!.detail!.prelim![j]!.qtyDurasi.toString(),
                                    dataPrelim.data!.detail!.prelim![j]!.konstanta.toString(), 
                                    subTotalPrelim.toString(),
                                  ),
                                );
                              } else if (listKelompokPrelim.data![i]!.idKelompok.toString() == dataPrelim.data!.detail!.prelim![j]!.idKelompok.toString() && listKelompokPrelim.data![i]!.namaKelompok.toString() == "Hand Tools") {
                                handTools.add(
                                  ListDataPrelim(
                                    dataPrelim.data!.detail!.prelim![j]!.kodeItemPrelim.toString(),
                                    dataPrelim.data!.detail!.prelim![j]!.namaItemPrelim.toString(),
                                    dataPrelim.data!.detail!.prelim![j]!.qtyAnalisa.toString(),
                                    dataPrelim.data!.detail!.prelim![j]!.namaSatuanPrelim.toString(),
                                    dataPrelim.data!.detail!.prelim![j]!.unitPrice.toString(),
                                    subTotal.toString(),
                                    dataPrelim.data!.detail!.prelim![j]!.qtyDurasi.toString(),
                                    dataPrelim.data!.detail!.prelim![j]!.konstanta.toString(), 
                                    subTotalPrelim.toString(),
                                  ),
                                );
                              } else if (listKelompokPrelim.data![i]!.idKelompok.toString() == dataPrelim.data!.detail!.prelim![j]!.idKelompok.toString() && listKelompokPrelim.data![i]!.namaKelompok.toString() == "Honor Staff") {
                                honorStaff.add(
                                  ListDataPrelim(
                                    dataPrelim.data!.detail!.prelim![j]!.kodeItemPrelim.toString(),
                                    dataPrelim.data!.detail!.prelim![j]!.namaItemPrelim.toString(),
                                    dataPrelim.data!.detail!.prelim![j]!.qtyAnalisa.toString(),
                                    dataPrelim.data!.detail!.prelim![j]!.namaSatuanPrelim.toString(),
                                    dataPrelim.data!.detail!.prelim![j]!.unitPrice.toString(),
                                    subTotal.toString(),
                                    dataPrelim.data!.detail!.prelim![j]!.qtyDurasi.toString(),
                                    dataPrelim.data!.detail!.prelim![j]!.konstanta.toString(), 
                                    subTotalPrelim.toString(),
                                  ),
                                );
                              } else if (listKelompokPrelim.data![i]!.idKelompok.toString() == dataPrelim.data!.detail!.prelim![j]!.idKelompok.toString() && listKelompokPrelim.data![i]!.namaKelompok.toString() == "Lain-lain") {
                                lainLain.add(
                                  ListDataPrelim(
                                    dataPrelim.data!.detail!.prelim![j]!.kodeItemPrelim.toString(),
                                    dataPrelim.data!.detail!.prelim![j]!.namaItemPrelim.toString(),
                                    dataPrelim.data!.detail!.prelim![j]!.qtyAnalisa.toString(),
                                    dataPrelim.data!.detail!.prelim![j]!.namaSatuanPrelim.toString(),
                                    dataPrelim.data!.detail!.prelim![j]!.unitPrice.toString(),
                                    subTotal.toString(),
                                    dataPrelim.data!.detail!.prelim![j]!.qtyDurasi.toString(),
                                    dataPrelim.data!.detail!.prelim![j]!.konstanta.toString(), 
                                    subTotalPrelim.toString(),
                                  ),
                                );
                              }
                            }
                          }
                        }
                        return Column(
                          children: <Widget> [
                            SizedBox(height: getProportionateScreenHeight(5).h),
                            CardExpansionDetail(
                              label: "ATK",
                              children: <Widget> [
                                if (atk.isNotEmpty)...[
                                  ListView.separated(
                                    separatorBuilder: (context, index) {
                                      return Container(
                                        width: double.infinity,
                                        height: getProportionateScreenHeight(15).h,
                                        decoration:  BoxDecoration(
                                          border: Border(
                                            top: BorderSide(
                                              width: getProportionateScreenWidth(2).w,
                                              color: const Color.fromRGBO(246, 246, 246, 1)
                                            ),
                                            bottom: BorderSide(
                                              width: getProportionateScreenWidth(2).w,
                                              color: const Color.fromRGBO(246, 246, 246, 1)
                                            )
                                          )
                                        ),
                                      );
                                    },
                                    itemCount: atk.length,
                                    itemBuilder: (context, index){
                                      return ListTile(
                                        contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0).w, vertical: getProportionateScreenHeight(10.0).h),
                                        title: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget> [
                                            HighlightItemName(
                                              child: Text(
                                                atk[index].kodePrelim.toString(),
                                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14.sp),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                        subtitle: Padding(
                                          padding: EdgeInsets.only(top: getProportionateScreenHeight(15).h),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    flex: 15,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: const <Widget>[
                                                        Padding(
                                                          padding: EdgeInsets.only(left: 0),
                                                          child: Text("Item Prelim",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 0,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
                                                          child: const Text(":",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 20,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: (atk[index].itemPrelim.toString() != "null")
                                                          ? Text(atk[index].itemPrelim.toString(),
                                                            style: const TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          )
                                                          : const Text("Tanpa Finishing",
                                                            style: TextStyle(
                                                              color: Colors.black
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          )
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: getProportionateScreenHeight(10).h),
                                              Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    flex: 15,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: const <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text("Qty",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 0,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
                                                          child: const Text(":",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 20,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text(
                                                            formatDecimal.format(
                                                              double.parse(atk[index].qtyPrelim.toString()
                                                              )
                                                            )+" "+
                                                            atk[index].satuanPrelim.toString(),
                                                            style: const TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: getProportionateScreenHeight(10).h),
                                              Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    flex: 15,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: const <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text("Unit Price",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 0,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
                                                          child: const Text(":",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 20,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text(
                                                            formatCurrency.format(
                                                              double.parse(atk[index].unitPricePrelim.toString()
                                                              )
                                                            ),
                                                            style: const TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: getProportionateScreenHeight(10).h),
                                              Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    flex: 15,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                     children: const <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text("Sub Total",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 0,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
                                                          child: const Text(":",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 20,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text(
                                                            formatCurrency.format(
                                                              double.parse(atk[index].subTotalPrelim.toString()
                                                              )
                                                            ),
                                                            style: const TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: getProportionateScreenHeight(10).h),
                                              Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    flex: 15,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: const <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text("Qty Durasi",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 0,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
                                                          child: const Text(":",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 20,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text(
                                                            formatDecimal.format(
                                                              double.parse(atk[index].qtyDurasiPrelim.toString()
                                                              )
                                                            ),
                                                            style: const TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: getProportionateScreenHeight(10).h),
                                              Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    flex: 15,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: const <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text("Konstanta",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 0,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
                                                          child: const Text(":",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 20,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text(
                                                            formatDecimal.format(
                                                              double.parse(atk[index].konstantaPrelim.toString())
                                                            ),
                                                            style: const TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: getProportionateScreenHeight(10).h),
                                              Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    flex: 15,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: const <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text("Total",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 0,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
                                                          child: const Text(":",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                Expanded(
                                                    flex: 20,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text(
                                                            formatDecimal.format(
                                                              double.parse(atk[index].konstantaPrelim.toString())
                                                            ),
                                                            style: const TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                  ),
                                ],
                                if (atk.isEmpty)...[
                                  Center(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10.0).h),
                                      child: const Text("Tidak Ada Data",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ]
                              ]
                            ),
                            CardExpansionDetail(
                              label: "Safety",
                              children: <Widget> [
                                if (safety.isNotEmpty)...[
                                  ListView.separated(
                                    separatorBuilder: (context, index) {
                                      return Container(
                                        width: double.infinity,
                                        height: getProportionateScreenHeight(15).h,
                                        decoration:  BoxDecoration(
                                          border: Border(
                                            top: BorderSide(
                                              width: getProportionateScreenWidth(2).w,
                                              color: const Color.fromRGBO(246, 246, 246, 1)
                                            ),
                                            bottom: BorderSide(
                                              width: getProportionateScreenWidth(2).w,
                                              color: const Color.fromRGBO(246, 246, 246, 1)
                                            )
                                          )
                                        ),
                                      );
                                    },
                                    itemCount: safety.length,
                                    itemBuilder: (context, index){
                                      return ListTile(
                                        contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0).w, vertical: getProportionateScreenHeight(10.0).h),
                                        title: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget> [
                                            HighlightItemName(
                                              child: Text(
                                                safety[index].kodePrelim.toString(),
                                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14.sp),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                        subtitle: Padding(
                                          padding: EdgeInsets.only(top: getProportionateScreenHeight(15).h),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    flex: 15,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: const <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text("Item Prelim",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 0,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
                                                          child: const Text(":",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 20,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: (safety[index].itemPrelim.toString() != "null")
                                                          ? Text(safety[index].itemPrelim.toString(),
                                                            style: const TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          )
                                                          : const Text("Tanpa Finishing",
                                                            style: TextStyle(
                                                              color: Colors.black
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          )
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: getProportionateScreenHeight(10).h),
                                              Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    flex: 15,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: const <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text("Qty",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 0,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
                                                          child: const Text(":",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 20,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text(
                                                            formatDecimal.format(
                                                              double.parse(safety[index].qtyPrelim.toString()
                                                              )
                                                            )+" "+
                                                            safety[index].satuanPrelim.toString(),
                                                            style: const TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: getProportionateScreenHeight(10).h),
                                              Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    flex: 15,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: const <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text("Unit Price",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 0,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
                                                          child: const Text(":",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 20,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text(
                                                            formatCurrency.format(
                                                              double.parse(safety[index].unitPricePrelim.toString()
                                                              )
                                                            ),
                                                            style: const TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: getProportionateScreenHeight(10).h),
                                              Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    flex: 15,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                     children: const <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text("Sub Total",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 0,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
                                                          child: const Text(":",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 20,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text(
                                                            formatCurrency.format(
                                                              double.parse(safety[index].subTotalPrelim.toString()
                                                              )
                                                            ),
                                                            style: const TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: getProportionateScreenHeight(10).h),
                                              Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    flex: 15,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: const <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text("Qty Durasi",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 0,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
                                                          child: const Text(":",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 20,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text(
                                                            formatDecimal.format(
                                                              double.parse(safety[index].qtyDurasiPrelim.toString()
                                                              )
                                                            ),
                                                            style: const TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: getProportionateScreenHeight(10).h),
                                              Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    flex: 15,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: const <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text("Konstanta",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 0,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
                                                          child: const Text(":",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 20,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text(
                                                            formatDecimal.format(
                                                              double.parse(safety[index].konstantaPrelim.toString())
                                                            ),
                                                            style: const TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: getProportionateScreenHeight(10).h),
                                              Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    flex: 15,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: const <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text("Total",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 0,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
                                                          child: const Text(":",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 20,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: <Widget>[
                                                          Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text(
                                                            formatCurrency.format(
                                                              double.parse(safety[index].totalPrelim.toString()
                                                              )
                                                            ),
                                                            style: const TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                  ),
                                ],
                                if (safety.isEmpty)...[
                                  Center(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10.0).h),
                                      child: const Text("Tidak Ada Data",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ]
                              ]
                            ),
                            CardExpansionDetail(
                              label: "Proteksi",
                              children: <Widget> [
                                if (proteksi.isNotEmpty)...[
                                  ListView.separated(
                                    separatorBuilder: (context, index) {
                                      return Container(
                                        width: double.infinity,
                                        height: getProportionateScreenHeight(15).h,
                                        decoration:  BoxDecoration(
                                          border: Border(
                                            top: BorderSide(
                                              width: getProportionateScreenWidth(2).w,
                                              color: const Color.fromRGBO(246, 246, 246, 1)
                                            ),
                                            bottom: BorderSide(
                                              width: getProportionateScreenWidth(2).w,
                                              color: const Color.fromRGBO(246, 246, 246, 1)
                                            )
                                          )
                                        ),
                                      );
                                    },
                                    itemCount: proteksi.length,
                                    itemBuilder: (context, index){
                                      return ListTile(
                                        contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0).w, vertical: getProportionateScreenHeight(10.0).h),
                                        title: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget> [
                                            HighlightItemName(
                                              child: Text(
                                                proteksi[index].kodePrelim.toString(),
                                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14.sp),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                        subtitle: Padding(
                                          padding: EdgeInsets.only(top: getProportionateScreenHeight(15).h),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    flex: 15,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: const <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text("Item Prelim",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 0,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
                                                          child: const Text(":",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 20,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: (proteksi[index].itemPrelim.toString() != "null")
                                                          ? Text(proteksi[index].itemPrelim.toString(),
                                                            style: const TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          )
                                                          : const Text("Tanpa Finishing",
                                                            style: TextStyle(
                                                              color: Colors.black
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          )
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: getProportionateScreenHeight(10).h),
                                              Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    flex: 15,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: const <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text("Qty",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 0,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
                                                          child: const Text(":",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 20,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text(
                                                            formatDecimal.format(
                                                              double.parse(proteksi[index].qtyPrelim.toString()
                                                              )
                                                            )+" "+
                                                            proteksi[index].satuanPrelim.toString(),
                                                            style: const TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: getProportionateScreenHeight(10).h),
                                              Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    flex: 15,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: const <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text("Unit Price",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 0,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
                                                          child: const Text(":",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 20,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text(
                                                            formatCurrency.format(
                                                              double.parse(proteksi[index].unitPricePrelim.toString()
                                                              )
                                                            ),
                                                            style: const TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: getProportionateScreenHeight(10).h),
                                              Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    flex: 15,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                     children: const <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text("Sub Total",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 0,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
                                                          child: const Text(":",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 20,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text(
                                                            formatCurrency.format(
                                                              double.parse(proteksi[index].subTotalPrelim.toString()
                                                              )
                                                            ),
                                                            style: const TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: getProportionateScreenHeight(10).h),
                                              Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    flex: 15,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: const <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text("Qty Durasi",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 0,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
                                                          child: const Text(":",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 20,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text(
                                                            formatDecimal.format(
                                                              double.parse(proteksi[index].qtyDurasiPrelim.toString()
                                                              )
                                                            ),
                                                            style: const TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: getProportionateScreenHeight(10).h),
                                              Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    flex: 15,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: const <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text("Konstanta",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 0,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
                                                          child: const Text(":",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 20,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text(
                                                            formatDecimal.format(
                                                              double.parse(proteksi[index].konstantaPrelim.toString())
                                                            ),
                                                            style: const TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: getProportionateScreenHeight(10).h),
                                              Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    flex: 15,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: const <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text("Total",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 0,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
                                                          child: const Text(":",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 20,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text(
                                                            formatCurrency.format(
                                                              double.parse(proteksi[index].totalPrelim.toString()
                                                              )
                                                            ),
                                                            style: const TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                  ),
                                ],
                                if (proteksi.isEmpty)...[
                                  Center(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10.0).h),
                                      child: const Text("Tidak Ada Data",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ]
                              ]
                            ),
                            CardExpansionDetail(
                              label: "Hand Tools",
                              children: <Widget> [
                                if (handTools.isNotEmpty)...[
                                  ListView.separated(
                                    separatorBuilder: (context, index) {
                                      return Container(
                                        width: double.infinity,
                                        height: getProportionateScreenHeight(15).h,
                                        decoration:  BoxDecoration(
                                          border: Border(
                                            top: BorderSide(
                                              width: getProportionateScreenWidth(2).w,
                                              color: const Color.fromRGBO(246, 246, 246, 1)
                                            ),
                                            bottom: BorderSide(
                                              width: getProportionateScreenWidth(2).w,
                                              color: const Color.fromRGBO(246, 246, 246, 1)
                                            )
                                          )
                                        ),
                                      );
                                    },
                                    itemCount: handTools.length,
                                    itemBuilder: (context, index){
                                      return ListTile(
                                        contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0).w, vertical: getProportionateScreenHeight(10.0).h),
                                        title: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget> [
                                            HighlightItemName(
                                              child: Text(
                                                handTools[index].kodePrelim.toString(),
                                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14.sp),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                        subtitle: Padding(
                                          padding: EdgeInsets.only(top: getProportionateScreenHeight(15).h),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    flex: 15,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: const <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text("Item Prelim",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 0,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
                                                          child: const Text(":",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 20,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: (handTools[index].itemPrelim.toString() != "null")
                                                          ? Text(handTools[index].itemPrelim.toString(),
                                                            style: const TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          )
                                                          : const Text("Tanpa Finishing",
                                                            style: TextStyle(
                                                              color: Colors.black
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          )
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: getProportionateScreenHeight(10).h),
                                              Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    flex: 15,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: const <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text("Qty",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 0,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
                                                          child: const Text(":",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 20,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text(
                                                            formatDecimal.format(
                                                              double.parse(handTools[index].qtyPrelim.toString()
                                                              )
                                                            )+" "+
                                                            handTools[index].satuanPrelim.toString(),
                                                            style: const TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: getProportionateScreenHeight(10).h),
                                              Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    flex: 15,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: const <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text("Unit Price",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 0,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
                                                          child: const Text(":",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 20,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text(
                                                            formatCurrency.format(
                                                              double.parse(handTools[index].unitPricePrelim.toString()
                                                              )
                                                            ),
                                                            style: const TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: getProportionateScreenHeight(10).h),
                                              Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    flex: 15,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                     children: const <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text("Sub Total",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 0,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
                                                          child: const Text(":",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 20,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text(
                                                            formatCurrency.format(
                                                              double.parse(handTools[index].subTotalPrelim.toString()
                                                              )
                                                            ),
                                                            style: const TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: getProportionateScreenHeight(10).h),
                                              Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    flex: 15,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: const <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text("Qty Durasi",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 0,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
                                                          child: const Text(":",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 20,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text(
                                                            formatDecimal.format(
                                                              double.parse(handTools[index].qtyDurasiPrelim.toString()
                                                              )
                                                            ),
                                                            style: const TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: getProportionateScreenHeight(10).h),
                                              Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    flex: 15,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: const <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text("Konstanta",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 0,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
                                                          child: const Text(":",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 20,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text(
                                                            formatDecimal.format(
                                                              double.parse(handTools[index].konstantaPrelim.toString())
                                                            ),
                                                            style: const TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: getProportionateScreenHeight(10).h),
                                              Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    flex: 15,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: const <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text("Total",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 0,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
                                                          child: const Text(":",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 20,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text(
                                                            formatCurrency.format(
                                                              double.parse(handTools[index].totalPrelim.toString()
                                                              )
                                                            ),
                                                            style: const TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                  ),
                                ],
                                if (handTools.isEmpty)...[
                                  Center(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10.0).h),
                                      child: const Text("Tidak Ada Data",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ]
                              ]
                            ),
                            CardExpansionDetail(
                              label: "Honor Staff",
                              children: <Widget> [
                                if (honorStaff.isNotEmpty)...[
                                  ListView.separated(
                                    separatorBuilder: (context, index) {
                                      return Container(
                                        width: double.infinity,
                                        height: getProportionateScreenHeight(15).h,
                                        decoration:  BoxDecoration(
                                          border: Border(
                                            top: BorderSide(
                                              width: getProportionateScreenWidth(2).w,
                                              color: const Color.fromRGBO(246, 246, 246, 1)
                                            ),
                                            bottom: BorderSide(
                                              width: getProportionateScreenWidth(2).w,
                                              color: const Color.fromRGBO(246, 246, 246, 1)
                                            )
                                          )
                                        ),
                                      );
                                    },
                                    itemCount: honorStaff.length,
                                    itemBuilder: (context, index){
                                      return ListTile(
                                        contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0).w, vertical: getProportionateScreenHeight(10.0).h),
                                        title: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget> [
                                            HighlightItemName(
                                              child: Text(
                                                honorStaff[index].kodePrelim.toString(),
                                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14.sp),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                        subtitle: Padding(
                                          padding: EdgeInsets.only(top: getProportionateScreenHeight(15).h),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    flex: 15,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: const <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text("Item Prelim",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 0,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
                                                          child: const Text(":",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 20,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: (honorStaff[index].itemPrelim.toString() != "null")
                                                          ? Text(honorStaff[index].itemPrelim.toString(),
                                                            style: const TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          )
                                                          : const Text("Tanpa Finishing",
                                                            style: TextStyle(
                                                              color: Colors.black
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          )
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: getProportionateScreenHeight(10).h),
                                              Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    flex: 15,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: const <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text("Qty",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 0,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
                                                          child: const Text(":",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 20,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text(
                                                            formatDecimal.format(
                                                              double.parse(honorStaff[index].qtyPrelim.toString()
                                                              )
                                                            )+" "+
                                                            honorStaff[index].satuanPrelim.toString(),
                                                            style: const TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: getProportionateScreenHeight(10).h),
                                              Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    flex: 15,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: const <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text("Unit Price",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 0,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
                                                          child: const Text(":",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 20,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text(
                                                            formatCurrency.format(
                                                              double.parse(honorStaff[index].unitPricePrelim.toString()
                                                              )
                                                            ),
                                                            style: const TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: getProportionateScreenHeight(10).h),
                                              Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    flex: 15,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                     children: const <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text("Sub Total",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 0,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
                                                          child: const Text(":",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 20,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text(
                                                            formatCurrency.format(
                                                              double.parse(honorStaff[index].subTotalPrelim.toString()
                                                              )
                                                            ),
                                                            style: const TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: getProportionateScreenHeight(10).h),
                                              Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    flex: 15,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: const <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text("Qty Durasi",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 0,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
                                                          child: const Text(":",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 20,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text(
                                                            formatDecimal.format(
                                                              double.parse(honorStaff[index].qtyDurasiPrelim.toString()
                                                              )
                                                            ),
                                                            style: const TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: getProportionateScreenHeight(10).h),
                                              Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    flex: 15,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: const <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text("Konstanta",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 0,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
                                                          child: const Text(":",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 20,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text(
                                                            formatDecimal.format(
                                                              double.parse(honorStaff[index].konstantaPrelim.toString())
                                                            ),
                                                            style: const TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: getProportionateScreenHeight(10).h),
                                              Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    flex: 15,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: const <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text("Total",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 0,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
                                                          child: const Text(":",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 20,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text(
                                                            formatCurrency.format(
                                                              double.parse(honorStaff[index].totalPrelim.toString()
                                                              )
                                                            ),
                                                            style: const TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                  ),
                                ],
                                if (honorStaff.isEmpty)...[
                                  Center(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10.0).h),
                                      child: const Text("Tidak Ada Data",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ]
                              ]
                            ),
                            CardExpansionDetail(
                              label: "Lain-lain",
                              children: <Widget> [
                                if (lainLain.isNotEmpty)...[
                                  ListView.separated(
                                    separatorBuilder: (context, index) {
                                      return Container(
                                        width: double.infinity,
                                        height: getProportionateScreenHeight(15).h,
                                        decoration:  BoxDecoration(
                                          border: Border(
                                            top: BorderSide(
                                              width: getProportionateScreenWidth(2).w,
                                              color: const Color.fromRGBO(246, 246, 246, 1)
                                            ),
                                            bottom: BorderSide(
                                              width: getProportionateScreenWidth(2).w,
                                              color: const Color.fromRGBO(246, 246, 246, 1)
                                            )
                                          )
                                        ),
                                      );
                                    },
                                    itemCount: lainLain.length,
                                    itemBuilder: (context, index){
                                      return ListTile(
                                        contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0).w, vertical: getProportionateScreenHeight(10.0).h),
                                        title: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget> [
                                            HighlightItemName(
                                              child: Text(
                                                lainLain[index].kodePrelim.toString(),
                                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14.sp),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                        subtitle: Padding(
                                          padding: EdgeInsets.only(top: getProportionateScreenHeight(15).h),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    flex: 15,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: const <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text("Item Prelim",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 0,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
                                                          child: const Text(":",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 20,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: (lainLain[index].itemPrelim.toString() != "null")
                                                          ? Text(lainLain[index].itemPrelim.toString(),
                                                            style: const TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          )
                                                          : const Text("Tanpa Finishing",
                                                            style: TextStyle(
                                                              color: Colors.black
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          )
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: getProportionateScreenHeight(10).h),
                                              Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    flex: 15,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: const <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text("Qty",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 0,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
                                                          child: const Text(":",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 20,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text(
                                                            formatDecimal.format(
                                                              double.parse(lainLain[index].qtyPrelim.toString()
                                                              )
                                                            )+" "+
                                                            lainLain[index].satuanPrelim.toString(),
                                                            style: const TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: getProportionateScreenHeight(10).h),
                                              Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    flex: 15,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: const <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text("Unit Price",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 0,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
                                                          child: const Text(":",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 20,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text(
                                                            formatCurrency.format(
                                                              double.parse(lainLain[index].unitPricePrelim.toString()
                                                              )
                                                            ),
                                                            style: const TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: getProportionateScreenHeight(10).h),
                                              Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    flex: 15,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                     children: const <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text("Sub Total",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 0,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
                                                          child: const Text(":",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 20,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text(
                                                            formatCurrency.format(
                                                              double.parse(lainLain[index].subTotalPrelim.toString()
                                                              )
                                                            ),
                                                            style: const TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: getProportionateScreenHeight(10).h),
                                              Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    flex: 15,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: const <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text("Qty Durasi",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 0,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
                                                          child: const Text(":",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 20,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text(
                                                            formatDecimal.format(
                                                              double.parse(lainLain[index].qtyDurasiPrelim.toString()
                                                              )
                                                            ),
                                                            style: const TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: getProportionateScreenHeight(10).h),
                                              Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    flex: 15,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: const <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text("Konstanta",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 0,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
                                                          child: const Text(":",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 20,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text(
                                                            formatDecimal.format(
                                                              double.parse(lainLain[index].konstantaPrelim.toString())
                                                            ),
                                                            style: const TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: getProportionateScreenHeight(10).h),
                                              Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    flex: 15,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: const <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text("Total",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 0,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
                                                          child: const Text(":",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 20,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text(
                                                            formatCurrency.format(
                                                              double.parse(lainLain[index].totalPrelim.toString()
                                                              )
                                                            ),
                                                            style: const TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                  ),
                                ],
                                if (lainLain.isEmpty)...[
                                  Center(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10.0).h),
                                      child: const Text("Tidak Ada Data",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ]
                              ]
                            ),
                            SizedBox(height: getProportionateScreenHeight(10).h),
                            CardFieldGrandTotalAnalisa(
                              child: ListTile(
                                contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20).w),
                                title: Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Expanded(
                                          flex: 4,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(left: 0),
                                                child: Text("Grand Total",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14.sp
                                                  ),
                                                  textAlign: TextAlign.left,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 6,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(right: 0),
                                                child: Text(
                                                  formatCurrency.format(
                                                      double.parse(widget.grandTotalPrelim.toString()
                                                    )
                                                  ),
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14.sp
                                                  ),
                                                  textAlign: TextAlign.right,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }
                  );
                } else {
                  return Column(
                    children: <Widget> [
                      SizedBox(height: getProportionateScreenHeight(10).h),
                      Skeleton(
                        height: getProportionateScreenHeight(60).h,
                        width: double.infinity,
                      ),
                      SizedBox(height: getProportionateScreenHeight(10).h),
                      Skeleton(
                        height: getProportionateScreenHeight(60).h,
                        width: double.infinity,
                      ),
                      SizedBox(height: getProportionateScreenHeight(10).h),
                      Skeleton(
                        height: getProportionateScreenHeight(60).h,
                        width: double.infinity,
                      ),
                      SizedBox(height: getProportionateScreenHeight(10).h),
                      Skeleton(
                        height: getProportionateScreenHeight(60).h,
                        width: double.infinity,
                      ),
                      SizedBox(height: getProportionateScreenHeight(10).h),
                      Skeleton(
                        height: getProportionateScreenHeight(60).h,
                        width: double.infinity,
                      ),
                      SizedBox(height: getProportionateScreenHeight(10).h),
                      Skeleton(
                        height: getProportionateScreenHeight(60).h,
                        width: double.infinity,
                      ),
                      SizedBox(height: getProportionateScreenHeight(10).h),
                      Skeleton(
                        height: getProportionateScreenHeight(60).h,
                        width: double.infinity,
                      ),
                    ],
                  );
                }
              },
            ),
          ),
        ),
      )
    );
  }
}

class ListDataPrelim {
  ListDataPrelim(
    this.kodePrelim,
    this.itemPrelim,
    this.qtyPrelim,
    this.satuanPrelim,
    this.unitPricePrelim,
    this.subTotalPrelim,
    this.qtyDurasiPrelim,
    this.konstantaPrelim,
    this.totalPrelim,
  );
  final String kodePrelim;
  final String itemPrelim;
  final String qtyPrelim;
  final String satuanPrelim;
  final String unitPricePrelim;
  final String subTotalPrelim;
  final String qtyDurasiPrelim;
  final String konstantaPrelim;
  final String totalPrelim;
}