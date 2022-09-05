import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:mgp_mobile_app/widget/theme/constants.dart';
import 'package:mgp_mobile_app/model/hrdu/rae/analisa_single_rae.dart';
import 'package:mgp_mobile_app/model/hrdu/rae/detail_rae_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mgp_mobile_app/widget/component/card_expansion_detail.dart';
import 'package:mgp_mobile_app/widget/component/card_item_expansion_detail.dart';
import 'package:mgp_mobile_app/widget/component/highlight_item_name.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class Body extends StatefulWidget {
  final Future<AnalisaSingleRegrae> analisaSingleRegrae;
  const Body({Key? key, required this.analisaSingleRegrae}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final formatCurrency = NumberFormat.currency(
    locale: 'ID',
    decimalDigits: 0,
    symbol: "Rp"
  );
  final formatDecimal = NumberFormat("###.######", "id_ID");
  final decimalFormat = NumberFormat("###", "id_ID");
  final List<String> errors = [];
  late Future<DetailRegrae> futureDetailRegrae;
  late String? tokens;
  bool visibilityPemeriksa = false;
  bool visibilityPengesah = false;
  late List subTotalLabourCostOnSite = [];
  late String grandTotalLabourCostOnSite;
  late List subTotalHardwood = [];
  late List listLuaslHardwood = [];
  late List listVolumeHardwood = [];
  late String totalLuasHardwood;
  late String totalVolumeHardwood;
  late String grandTotalHardwood;

  @override
  void initState() {
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
            child: FutureBuilder(
              future: widget.analisaSingleRegrae,
              builder: (BuildContext context, AsyncSnapshot<AnalisaSingleRegrae> snapshot) {
                if (snapshot.hasData) {
                 var analisaSingleRAE = snapshot.data;
                  num totalLabourCostOnSite = 0;
                  if (analisaSingleRAE!.data!.analisaLabourCostOnsite!.isNotEmpty) {
                    for (var i = 0; i < analisaSingleRAE.data!.analisaLabourCostOnsite!.length; i++) {
                      num subTotal = double.parse(analisaSingleRAE.data!.analisaLabourCostOnsite![i].qty.toString()) * double.parse(analisaSingleRAE.data!.analisaLabourCostOnsite![i].unitPrice.toString()) * double.parse(analisaSingleRAE.data!.analisaLabourCostOnsite![i].konstanta.toString());
                      subTotalLabourCostOnSite.add(subTotal);
                      totalLabourCostOnSite = totalLabourCostOnSite + subTotal.round();
                    }
                  }
                  num totalHardwood = 0;
                  num luasHardwood = 0;
                  num volumeHardwood = 0;
                  if (analisaSingleRAE.data!.analisaHardwood!.isNotEmpty) {
                    for (var i = 0; i < analisaSingleRAE.data!.analisaHardwood!.length; i++) {
                      num volume = (double.parse(analisaSingleRAE.data!.analisaHardwood![i].tRaw.toString()) * double.parse(analisaSingleRAE.data!.analisaHardwood![i].wRaw.toString()) * double.parse(analisaSingleRAE.data!.analisaHardwood![i].lRaw.toString()) * double.parse(analisaSingleRAE.data!.analisaHardwood![i].qtyRaw.toString()))/1000000;
                      volumeHardwood = volumeHardwood + volume;
                      listVolumeHardwood.add(volume);
                      num subTotal = volume * double.parse(analisaSingleRAE.data!.analisaHardwood![i].unitPrice.toString()) * double.parse(analisaSingleRAE.data!.analisaHardwood![i].konstanta.toString());
                      subTotalHardwood.add(subTotal);
                      totalHardwood = totalHardwood + subTotal.round();
                      if (analisaSingleRAE.data!.analisaHardwood![i].namaTipeSisi.toString() == "4 Sisi (2TL + 2WL)") {
                        num tPlusW = (double.parse(analisaSingleRAE.data!.analisaHardwood![i].tFinal.toString()) + double.parse(analisaSingleRAE.data!.analisaHardwood![i].wFinal.toString()));
                        num luas = (tPlusW * 2 * double.parse(analisaSingleRAE.data!.analisaHardwood![i].qtyFinal.toString()) * double.parse(analisaSingleRAE.data!.analisaHardwood![i].lFinal.toString()))/10000;
                        listLuaslHardwood.add(luas);
                        luasHardwood = luasHardwood + luas;
                      } else if (analisaSingleRAE.data!.analisaHardwood![i].namaTipeSisi.toString() == "3 Sisi Opsi 1 (2TL + WL)") {
                        num tPlusWPlusT = (double.parse(analisaSingleRAE.data!.analisaHardwood![i].tFinal.toString()) + double.parse(analisaSingleRAE.data!.analisaHardwood![i].wFinal.toString()) + double.parse(analisaSingleRAE.data!.analisaHardwood![i].tFinal.toString()));
                        num luas = (tPlusWPlusT * double.parse(analisaSingleRAE.data!.analisaHardwood![i].qtyFinal.toString()) * double.parse(analisaSingleRAE.data!.analisaHardwood![i].lFinal.toString()))/10000;
                        listLuaslHardwood.add(luas);
                        luasHardwood = luasHardwood + luas;
                      } else if (analisaSingleRAE.data!.analisaHardwood![i].namaTipeSisi.toString() == "3 Sisi Opsi 2 (TL + 2WL)") {
                        num tPlusWPlusW = (double.parse(analisaSingleRAE.data!.analisaHardwood![i].tFinal.toString()) + double.parse(analisaSingleRAE.data!.analisaHardwood![i].wFinal.toString()) + double.parse(analisaSingleRAE.data!.analisaHardwood![i].wFinal.toString()));
                        num luas = (tPlusWPlusW * double.parse(analisaSingleRAE.data!.analisaHardwood![i].qtyFinal.toString()) * double.parse(analisaSingleRAE.data!.analisaHardwood![i].lFinal.toString()))/10000;
                        listLuaslHardwood.add(luas);
                        luasHardwood = luasHardwood + luas;
                      } else if (analisaSingleRAE.data!.analisaHardwood![i].namaTipeSisi.toString() == "2 Sisi Opsi 1 (TL + WL)") {
                        num tPlusW = (double.parse(analisaSingleRAE.data!.analisaHardwood![i].tFinal.toString()) + double.parse(analisaSingleRAE.data!.analisaHardwood![i].wFinal.toString()));
                        num luas = (tPlusW * double.parse(analisaSingleRAE.data!.analisaHardwood![i].qtyFinal.toString()) * double.parse(analisaSingleRAE.data!.analisaHardwood![i].lFinal.toString()))/10000;
                        listLuaslHardwood.add(luas);
                        luasHardwood = luasHardwood + luas;
                      } else if (analisaSingleRAE.data!.analisaHardwood![i].namaTipeSisi.toString() == "2 Sisi Opsi 2 (2TL)") {
                        num tPlusT = (double.parse(analisaSingleRAE.data!.analisaHardwood![i].tFinal.toString()) + double.parse(analisaSingleRAE.data!.analisaHardwood![i].tFinal.toString()));
                        num luas = (tPlusT * double.parse(analisaSingleRAE.data!.analisaHardwood![i].qtyFinal.toString()) * double.parse(analisaSingleRAE.data!.analisaHardwood![i].lFinal.toString()))/10000;
                        listLuaslHardwood.add(luas);
                        luasHardwood = luasHardwood + luas;
                      } else if (analisaSingleRAE.data!.analisaHardwood![i].namaTipeSisi.toString() == "2 Sisi Opsi 3 (2WL)") {
                        num wPlusW = (double.parse(analisaSingleRAE.data!.analisaHardwood![i].wFinal.toString()) + double.parse(analisaSingleRAE.data!.analisaHardwood![i].wFinal.toString()));
                        num luas = (wPlusW * double.parse(analisaSingleRAE.data!.analisaHardwood![i].qtyFinal.toString()) * double.parse(analisaSingleRAE.data!.analisaHardwood![i].lFinal.toString()))/10000;
                        listLuaslHardwood.add(luas);
                        luasHardwood = luasHardwood + luas;
                      } else if (analisaSingleRAE.data!.analisaHardwood![i].namaTipeSisi.toString() == "1 Sisi Opsi 1 (TL)") {
                        num luas = (double.parse(analisaSingleRAE.data!.analisaHardwood![i].tFinal.toString()) * double.parse(analisaSingleRAE.data!.analisaHardwood![i].qtyFinal.toString()) * double.parse(analisaSingleRAE.data!.analisaHardwood![i].lFinal.toString()))/10000;
                        listLuaslHardwood.add(luas);
                        luasHardwood = luasHardwood + luas;
                      } else if (analisaSingleRAE.data!.analisaHardwood![i].namaTipeSisi.toString() == "1 Sisi Opsi 2 (WL)") {
                        num luas = (double.parse(analisaSingleRAE.data!.analisaHardwood![i].wFinal.toString()) * double.parse(analisaSingleRAE.data!.analisaHardwood![i].qtyFinal.toString()) * double.parse(analisaSingleRAE.data!.analisaHardwood![i].lFinal.toString()))/10000;
                        listLuaslHardwood.add(luas);
                        luasHardwood = luasHardwood + luas;
                      } else {
                        num luas = 0;
                        listLuaslHardwood.add(luas);
                        luasHardwood = luasHardwood + luas;
                      }
                    }
                  }
                  grandTotalHardwood = totalHardwood.toString();
                  totalLuasHardwood = luasHardwood.toString();
                  totalVolumeHardwood = volumeHardwood.toString();
                  grandTotalLabourCostOnSite = totalLabourCostOnSite.toString();
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                     SizedBox(
                        height: getProportionateScreenHeight(10).h,
                      ),
                      CardExpansionDetail(
                        label: "Referensi Hardwood",
                        children: <Widget> [
                          ListView.separated(
                            separatorBuilder: (context, index) {
                              return Container(
                                width: double.infinity,
                                height: getProportionateScreenHeight(15).h,
                                decoration: BoxDecoration(
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
                            itemCount: analisaSingleRAE.data!.analisaHardwood!.length,
                            itemBuilder: (context, index){
                              return ListTile(
                                contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0).w, vertical: getProportionateScreenHeight(10.0).h),
                                title: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget> [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25.r),
                                        gradient: const LinearGradient(
                                          colors: <Color> [
                                            kPrimaryColor,
                                            kSecondaryColor,
                                          ]
                                        ),
                                      ),
                                      child: FittedBox(
                                        child: Center(
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15).w),
                                            child: Text(
                                              analisaSingleRAE.data!.analisaHardwood![index].deskripsi.toString(),
                                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14.sp),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
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
                                                  child: Text("Spesifikasi Kayu",
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
                                                  child: Text(analisaSingleRAE.data!.analisaHardwood![index].namaJenisKayu.toString(),
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
                                                  child: Text("Part Kayu",
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
                                                  child: Text(analisaSingleRAE.data!.analisaHardwood![index].namaPartKayu.toString(),
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
                                                  child: Text("Tipe Finishing",
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
                                                  child: (analisaSingleRAE.data!.analisaHardwood![index].namaFinishingBarangJadi != null)
                                                  ? Text(analisaSingleRAE.data!.analisaHardwood![index].namaFinishingBarangJadi.toString(),
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
                                                  child: Text("Tipe Sisi",
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
                                                  child: Text(analisaSingleRAE.data!.analisaHardwood![index].namaTipeSisi.toString(),
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
                                                  child: Text("Qty Final",
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
                                                      double.parse(analisaSingleRAE.data!.analisaHardwood![index].qtyFinal.toString()
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
                                                  child: Text("T x W x L (Final cm)",
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
                                                      double.parse(analisaSingleRAE.data!.analisaHardwood![index].tFinal.toString()
                                                      )
                                                    )+" x "+
                                                    formatDecimal.format(
                                                      double.parse(analisaSingleRAE.data!.analisaHardwood![index].wFinal.toString()
                                                      )
                                                    )+" x "+
                                                    formatDecimal.format(
                                                      double.parse(analisaSingleRAE.data!.analisaHardwood![index].lFinal.toString()
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
                                                  child: Text("Qty Raw",
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
                                                      double.parse(analisaSingleRAE.data!.analisaHardwood![index].qtyFinal.toString()
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
                                                  child: Text("T x W x L (Raw cm)",
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
                                                      double.parse(analisaSingleRAE.data!.analisaHardwood![index].tRaw.toString()
                                                      )
                                                    )+" x "+
                                                    formatDecimal.format(
                                                      double.parse(analisaSingleRAE.data!.analisaHardwood![index].wRaw.toString()
                                                      )
                                                    )+" x "+
                                                    formatDecimal.format(
                                                      double.parse(analisaSingleRAE.data!.analisaHardwood![index].lRaw.toString()
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
                                                  child: Text("Luas (m2)",
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
                                                      double.parse(listLuaslHardwood[index].toString()
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
                                                  child: Text("Volume (m3)",
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
                                                      double.parse(listVolumeHardwood[index].toString()
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
                                                      double.parse(analisaSingleRAE.data!.analisaHardwood![index].unitPrice.toString())
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
                                                      double.parse(analisaSingleRAE.data!.analisaHardwood![index].konstanta.toString()
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
                                                      double.parse(subTotalHardwood[index].toString())
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
                          Container(
                            width: double.infinity,
                            height: getProportionateScreenHeight(15).h,
                            decoration: BoxDecoration(
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
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w, vertical: getProportionateScreenHeight(10).h),
                            child: CardItemExpansionDetail(
                              child: ListTile(
                                contentPadding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10).h, horizontal: getProportionateScreenWidth(10).w),
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
                                                child: Text("Total Luas",
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
                                                  formatDecimal.format(
                                                      double.parse(totalLuasHardwood.toString()
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
                                    SizedBox(height: getProportionateScreenHeight(10).h),
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
                                                child: Text("Total Volume",
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
                                                  formatDecimal.format(
                                                      double.parse(totalVolumeHardwood.toString()
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
                                    SizedBox(height: getProportionateScreenHeight(10).h),
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
                                                      double.parse(grandTotalHardwood.toString()
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
                          ),
                        ]
                      ),
                      CardExpansionDetail(
                        label: "Labour Cost On-Site",
                        children: <Widget> [
                          ListView.separated(
                            separatorBuilder: (context, index) => SizedBox(
                              height: getProportionateScreenHeight(10).h,
                            ),
                            itemCount: analisaSingleRAE.data!.analisaLabourCostOnsite!.length,
                            itemBuilder: (context, index){
                              return Padding(
                                padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
                                child: CardItemExpansionDetail(
                                  child: ListTile(
                                    contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0).w, vertical: getProportionateScreenHeight(10.0).h),
                                    title: HighlightItemName(
                                      child: Text(
                                        analisaSingleRAE.data!.analisaLabourCostOnsite![index].kodeItem.toString(),
                                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14.sp),
                                        overflow: TextOverflow.ellipsis,
                                      ),
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
                                                flex: 12,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: const <Widget>[
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 0),
                                                      child: Text("Item Labour Cost On-Site",
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
                                                      child: Text(analisaSingleRAE.data!.analisaLabourCostOnsite![index].namaItem.toString(),
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
                                                flex: 12,
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
                                                          double.parse(analisaSingleRAE.data!.analisaLabourCostOnsite![index].qty.toString()
                                                          )
                                                        )+" "+
                                                        analisaSingleRAE.data!.analisaLabourCostOnsite![index].namaSatuan.toString(),
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
                                                flex: 12,
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
                                                          double.parse(analisaSingleRAE.data!.analisaLabourCostOnsite![index].unitPrice.toString())
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
                                                flex: 12,
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
                                                          double.parse(analisaSingleRAE.data!.analisaLabourCostOnsite![index].konstanta.toString()
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
                                                flex: 12,
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
                                                          double.parse(subTotalLabourCostOnSite[index].toString())
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
                                  ),
                                ),
                              );
                            },
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                          ),
                          SizedBox(height: getProportionateScreenHeight(10).h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
                            child: CardItemExpansionDetail(
                              child: ListTile(
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
                                                      double.parse(grandTotalLabourCostOnSite
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
                          ),
                          SizedBox(height: getProportionateScreenHeight(10).h),
                        ]
                      ),
                      SizedBox(height: getProportionateScreenHeight(30).h),
                    ],
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