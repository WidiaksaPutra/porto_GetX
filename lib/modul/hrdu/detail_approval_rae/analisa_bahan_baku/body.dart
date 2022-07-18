import 'package:mgp_mobile_app/widget/component/highlight_item_name.dart';
import 'package:mgp_mobile_app/widget/component/separator_box.dart';
import 'package:mgp_mobile_app/widget/theme/constants.dart';
import 'package:mgp_mobile_app/model/hrdu/rae/analisa_single_rae.dart';
import 'package:mgp_mobile_app/model/hrdu/rae/detail_rae_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mgp_mobile_app/widget/component/card_expansion_detail.dart';
import 'package:mgp_mobile_app/widget/component/card_item_expansion_detail.dart';

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
  late List subTotalHardwood = [];
  late List subTotalPlywood = [];
  late List listLuaslHardwood = [];
  late List listLuasPlywood = [];
  late List listVolumeHardwood = [];
  late List listVolumePlywood = [];
  late String totalLuasHardwood;
  late String totalVolumeHardwood;
  late String grandTotalHardwood;
  late String totalLuasPlywood;
  late String totalVolumePlywood;
  late String grandTotalPlywood;

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
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: FutureBuilder(
              future: widget.analisaSingleRegrae,
              builder: (BuildContext context, AsyncSnapshot<AnalisaSingleRegrae> snapshot) {
                if (snapshot.hasData) {
                  var analisaSingleRAE = snapshot.data;
                  num totalHardwood = 0;
                  num totalPlywood = 0;
                  num luasHardwood = 0;
                  num luasPlywood = 0;
                  num volumeHardwood = 0;
                  num volumePlywood = 0;
                  if (analisaSingleRAE!.data!.analisaHardwood!.isNotEmpty) {
                    for (var i = 0; i < analisaSingleRAE.data!.analisaHardwood!.length; i++) {
                      num volume = (double.parse(analisaSingleRAE.data!.analisaHardwood![i]!.tRaw.toString()) * double.parse(analisaSingleRAE.data!.analisaHardwood![i]!.wRaw.toString()) * double.parse(analisaSingleRAE.data!.analisaHardwood![i]!.lRaw.toString()) * double.parse(analisaSingleRAE.data!.analisaHardwood![i]!.qtyRaw.toString()))/1000000;
                      volumeHardwood = volumeHardwood + volume;
                      listVolumeHardwood.add(volume);
                      num subTotal = volume * double.parse(analisaSingleRAE.data!.analisaHardwood![i]!.unitPrice.toString()) * double.parse(analisaSingleRAE.data!.analisaHardwood![i]!.konstanta.toString());
                      subTotalHardwood.add(subTotal);
                      totalHardwood = totalHardwood + subTotal;
                      if (analisaSingleRAE.data!.analisaHardwood![i]!.namaTipeSisi.toString() == "4 Sisi (2TL + 2WL)") {
                        num tPlusW = (double.parse(analisaSingleRAE.data!.analisaHardwood![i]!.tFinal.toString()) + double.parse(analisaSingleRAE.data!.analisaHardwood![i]!.wFinal.toString()));
                        num luas = (tPlusW * 2 * double.parse(analisaSingleRAE.data!.analisaHardwood![i]!.qtyFinal.toString()) * double.parse(analisaSingleRAE.data!.analisaHardwood![i]!.lFinal.toString()))/10000;
                        listLuaslHardwood.add(luas);
                        luasHardwood = luasHardwood + luas;
                      } else if (analisaSingleRAE.data!.analisaHardwood![i]!.namaTipeSisi.toString() == "3 Sisi Opsi 1 (2TL + WL)") {
                        num tPlusWPlusT = (double.parse(analisaSingleRAE.data!.analisaHardwood![i]!.tFinal.toString()) + double.parse(analisaSingleRAE.data!.analisaHardwood![i]!.wFinal.toString()) + double.parse(analisaSingleRAE.data!.analisaHardwood![i]!.tFinal.toString()));
                        num luas = (tPlusWPlusT * double.parse(analisaSingleRAE.data!.analisaHardwood![i]!.qtyFinal.toString()) * double.parse(analisaSingleRAE.data!.analisaHardwood![i]!.lFinal.toString()))/10000;
                        listLuaslHardwood.add(luas);
                        luasHardwood = luasHardwood + luas;
                      } else if (analisaSingleRAE.data!.analisaHardwood![i]!.namaTipeSisi.toString() == "3 Sisi Opsi 2 (TL + 2WL)") {
                        num tPlusWPlusW = (double.parse(analisaSingleRAE.data!.analisaHardwood![i]!.tFinal.toString()) + double.parse(analisaSingleRAE.data!.analisaHardwood![i]!.wFinal.toString()) + double.parse(analisaSingleRAE.data!.analisaHardwood![i]!.wFinal.toString()));
                        num luas = (tPlusWPlusW * double.parse(analisaSingleRAE.data!.analisaHardwood![i]!.qtyFinal.toString()) * double.parse(analisaSingleRAE.data!.analisaHardwood![i]!.lFinal.toString()))/10000;
                        listLuaslHardwood.add(luas);
                        luasHardwood = luasHardwood + luas;
                      } else if (analisaSingleRAE.data!.analisaHardwood![i]!.namaTipeSisi.toString() == "2 Sisi Opsi 1 (TL + WL)") {
                        num tPlusW = (double.parse(analisaSingleRAE.data!.analisaHardwood![i]!.tFinal.toString()) + double.parse(analisaSingleRAE.data!.analisaHardwood![i]!.wFinal.toString()));
                        num luas = (tPlusW * double.parse(analisaSingleRAE.data!.analisaHardwood![i]!.qtyFinal.toString()) * double.parse(analisaSingleRAE.data!.analisaHardwood![i]!.lFinal.toString()))/10000;
                        listLuaslHardwood.add(luas);
                        luasHardwood = luasHardwood + luas;
                      } else if (analisaSingleRAE.data!.analisaHardwood![i]!.namaTipeSisi.toString() == "2 Sisi Opsi 2 (2TL)") {
                        num tPlusT = (double.parse(analisaSingleRAE.data!.analisaHardwood![i]!.tFinal.toString()) + double.parse(analisaSingleRAE.data!.analisaHardwood![i]!.tFinal.toString()));
                        num luas = (tPlusT * double.parse(analisaSingleRAE.data!.analisaHardwood![i]!.qtyFinal.toString()) * double.parse(analisaSingleRAE.data!.analisaHardwood![i]!.lFinal.toString()))/10000;
                        listLuaslHardwood.add(luas);
                        luasHardwood = luasHardwood + luas;
                      } else if (analisaSingleRAE.data!.analisaHardwood![i]!.namaTipeSisi.toString() == "2 Sisi Opsi 3 (2WL)") {
                        num wPlusW = (double.parse(analisaSingleRAE.data!.analisaHardwood![i]!.wFinal.toString()) + double.parse(analisaSingleRAE.data!.analisaHardwood![i]!.wFinal.toString()));
                        num luas = (wPlusW * double.parse(analisaSingleRAE.data!.analisaHardwood![i]!.qtyFinal.toString()) * double.parse(analisaSingleRAE.data!.analisaHardwood![i]!.lFinal.toString()))/10000;
                        listLuaslHardwood.add(luas);
                        luasHardwood = luasHardwood + luas;
                      } else if (analisaSingleRAE.data!.analisaHardwood![i]!.namaTipeSisi.toString() == "1 Sisi Opsi 1 (TL)") {
                        num luas = (double.parse(analisaSingleRAE.data!.analisaHardwood![i]!.tFinal.toString()) * double.parse(analisaSingleRAE.data!.analisaHardwood![i]!.qtyFinal.toString()) * double.parse(analisaSingleRAE.data!.analisaHardwood![i]!.lFinal.toString()))/10000;
                        listLuaslHardwood.add(luas);
                        luasHardwood = luasHardwood + luas;
                      } else if (analisaSingleRAE.data!.analisaHardwood![i]!.namaTipeSisi.toString() == "1 Sisi Opsi 2 (WL)") {
                        num luas = (double.parse(analisaSingleRAE.data!.analisaHardwood![i]!.wFinal.toString()) * double.parse(analisaSingleRAE.data!.analisaHardwood![i]!.qtyFinal.toString()) * double.parse(analisaSingleRAE.data!.analisaHardwood![i]!.lFinal.toString()))/10000;
                        listLuaslHardwood.add(luas);
                        luasHardwood = luasHardwood + luas;
                      } else {
                        num luas = 0;
                        listLuaslHardwood.add(luas);
                        luasHardwood = luasHardwood + luas;
                      }
                    }
                  }
                  if (analisaSingleRAE.data!.analisaPlywood!.isNotEmpty) {
                    for (var i = 0; i < analisaSingleRAE.data!.analisaPlywood!.length; i++) {
                      num volume = (double.parse(analisaSingleRAE.data!.analisaPlywood![i]!.tRaw.toString()) * double.parse(analisaSingleRAE.data!.analisaPlywood![i]!.wRaw.toString()) * double.parse(analisaSingleRAE.data!.analisaPlywood![i]!.lRaw.toString()) * double.parse(analisaSingleRAE.data!.analisaPlywood![i]!.qtyRaw.toString()))/1000000;
                      volumePlywood = volumePlywood + volume;
                      listVolumePlywood.add(volume);
                      num subTotal = double.parse(analisaSingleRAE.data!.analisaPlywood![i]!.unitPrice.toString()) * double.parse(analisaSingleRAE.data!.analisaPlywood![i]!.konstanta.toString()) * double.parse(analisaSingleRAE.data!.analisaPlywood![i]!.qtyRaw.toString());
                      subTotalPlywood.add(subTotal);
                      totalPlywood = totalPlywood + subTotal;
                      if (analisaSingleRAE.data!.analisaPlywood![i]!.namaTipeSisi.toString() == "4 Sisi (2TL + 2WL)") {
                        num tPlusW = (double.parse(analisaSingleRAE.data!.analisaPlywood![i]!.tRaw.toString()) + double.parse(analisaSingleRAE.data!.analisaPlywood![i]!.wRaw.toString()));
                        num luas = (tPlusW * 2 * double.parse(analisaSingleRAE.data!.analisaPlywood![i]!.qtyRaw.toString()) * double.parse(analisaSingleRAE.data!.analisaPlywood![i]!.lRaw.toString()))/10000;
                        listLuasPlywood.add(luas);
                        luasPlywood = luasPlywood + luas;
                      } else if (analisaSingleRAE.data!.analisaPlywood![i]!.namaTipeSisi.toString() == "3 Sisi Opsi 1 (2TL + WL)") {
                        num tPlusWPlusT = (double.parse(analisaSingleRAE.data!.analisaPlywood![i]!.tRaw.toString()) + double.parse(analisaSingleRAE.data!.analisaPlywood![i]!.wRaw.toString()) + double.parse(analisaSingleRAE.data!.analisaPlywood![i]!.tRaw.toString()));
                        num luas = (tPlusWPlusT * double.parse(analisaSingleRAE.data!.analisaPlywood![i]!.qtyRaw.toString()) * double.parse(analisaSingleRAE.data!.analisaPlywood![i]!.lRaw.toString()))/10000;
                        listLuasPlywood.add(luas);
                        luasPlywood = luasPlywood + luas;
                      } else if (analisaSingleRAE.data!.analisaPlywood![i]!.namaTipeSisi.toString() == "3 Sisi Opsi 2 (TL + 2WL)") {
                        num tPlusWPlusW = (double.parse(analisaSingleRAE.data!.analisaPlywood![i]!.tRaw.toString()) + double.parse(analisaSingleRAE.data!.analisaPlywood![i]!.wRaw.toString()) + double.parse(analisaSingleRAE.data!.analisaPlywood![i]!.wRaw.toString()));
                        num luas = (tPlusWPlusW * double.parse(analisaSingleRAE.data!.analisaPlywood![i]!.qtyRaw.toString()) * double.parse(analisaSingleRAE.data!.analisaPlywood![i]!.lRaw.toString()))/10000;
                        listLuasPlywood.add(luas);
                        luasPlywood = luasPlywood + luas;
                      } else if (analisaSingleRAE.data!.analisaPlywood![i]!.namaTipeSisi.toString() == "2 Sisi Opsi 1 (TL + WL)") {
                        num tPlusW = (double.parse(analisaSingleRAE.data!.analisaPlywood![i]!.tRaw.toString()) + double.parse(analisaSingleRAE.data!.analisaPlywood![i]!.wRaw.toString()));
                        num luas = (tPlusW * double.parse(analisaSingleRAE.data!.analisaPlywood![i]!.qtyRaw.toString()) * double.parse(analisaSingleRAE.data!.analisaPlywood![i]!.lRaw.toString()))/10000;
                        listLuasPlywood.add(luas);
                        luasPlywood = luasPlywood + luas;
                      } else if (analisaSingleRAE.data!.analisaPlywood![i]!.namaTipeSisi.toString() == "2 Sisi Opsi 2 (2TL)") {
                        num tPlusT = (double.parse(analisaSingleRAE.data!.analisaPlywood![i]!.tRaw.toString()) + double.parse(analisaSingleRAE.data!.analisaPlywood![i]!.tRaw.toString()));
                        num luas = (tPlusT * double.parse(analisaSingleRAE.data!.analisaPlywood![i]!.qtyRaw.toString()) * double.parse(analisaSingleRAE.data!.analisaPlywood![i]!.lRaw.toString()))/10000;
                        listLuasPlywood.add(luas);
                        luasPlywood = luasPlywood + luas;
                      } else if (analisaSingleRAE.data!.analisaPlywood![i]!.namaTipeSisi.toString() == "2 Sisi Opsi 3 (2WL)") {
                        num wPlusW = (double.parse(analisaSingleRAE.data!.analisaPlywood![i]!.wRaw.toString()) + double.parse(analisaSingleRAE.data!.analisaPlywood![i]!.wRaw.toString()));
                        num luas = (wPlusW * double.parse(analisaSingleRAE.data!.analisaPlywood![i]!.qtyRaw.toString()) * double.parse(analisaSingleRAE.data!.analisaPlywood![i]!.lRaw.toString()))/10000;
                        listLuasPlywood.add(luas);
                        luasPlywood = luasPlywood + luas;
                      } else if (analisaSingleRAE.data!.analisaPlywood![i]!.namaTipeSisi.toString() == "1 Sisi Opsi 1 (TL)") {
                        num luas = (double.parse(analisaSingleRAE.data!.analisaPlywood![i]!.tRaw.toString()) * double.parse(analisaSingleRAE.data!.analisaPlywood![i]!.qtyRaw.toString()) * double.parse(analisaSingleRAE.data!.analisaPlywood![i]!.lRaw.toString()))/10000;
                        listLuasPlywood.add(luas);
                        luasPlywood = luasPlywood + luas;
                      } else if (analisaSingleRAE.data!.analisaPlywood![i]!.namaTipeSisi.toString() == "1 Sisi Opsi 2 (WL)") {
                        num luas = (double.parse(analisaSingleRAE.data!.analisaPlywood![i]!.wRaw.toString()) * double.parse(analisaSingleRAE.data!.analisaPlywood![i]!.qtyRaw.toString()) * double.parse(analisaSingleRAE.data!.analisaPlywood![i]!.lRaw.toString()))/10000;
                        listLuasPlywood.add(luas);
                        luasPlywood = luasPlywood + luas;
                      } else {
                        num luas = 0;
                        listLuasPlywood.add(luas);
                        luasPlywood = luasPlywood + luas;
                      }
                    }
                  }
                  grandTotalHardwood = totalHardwood.toString();
                  totalLuasHardwood = luasHardwood.toString();
                  totalVolumeHardwood = volumeHardwood.toString();
                  grandTotalPlywood = totalPlywood.toString();
                  totalLuasPlywood = luasPlywood.toString();
                  totalVolumePlywood = volumePlywood.toString();
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(
                        height: 10,
                      ),
                      CardExpansionDetail(
                        label: "Hardwood",
                        children: <Widget> [
                          ListView.separated(
                            separatorBuilder: (context, index) {
                              return const SeparatorBox();
                            },
                            itemCount: analisaSingleRAE.data!.analisaHardwood!.length,
                            itemBuilder: (context, index){
                              return ListTile(
                                contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                                title: HighlightItemName(
                                  child: Text(
                                    analisaSingleRAE.data!.analisaHardwood![index]!.deskripsi.toString(),
                                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                subtitle: Padding(
                                  padding: const EdgeInsets.only(top: 15),
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
                                              children: const <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                                  child: Text(":",
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
                                                  child: Text(analisaSingleRAE.data!.analisaHardwood![index]!.namaJenisKayu.toString(),
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
                                      const SizedBox(height: 10),
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
                                              children: const <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                                  child: Text(":",
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
                                                  child: Text(analisaSingleRAE.data!.analisaHardwood![index]!.namaPartKayu.toString(),
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
                                      const SizedBox(height: 10),
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
                                              children: const <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                                  child: Text(":",
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
                                                  child: (analisaSingleRAE.data!.analisaHardwood![index]!.namaFinishingBarangJadi != null)
                                                  ? Text(analisaSingleRAE.data!.analisaHardwood![index]!.namaFinishingBarangJadi.toString(),
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
                                      const SizedBox(height: 10),
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
                                              children: const <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                                  child: Text(":",
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
                                                  child: Text(analisaSingleRAE.data!.analisaHardwood![index]!.namaTipeSisi.toString(),
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
                                      const SizedBox(height: 10),
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
                                              children: const <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                                  child: Text(":",
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
                                                      double.parse(analisaSingleRAE.data!.analisaHardwood![index]!.qtyFinal.toString()
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
                                      const SizedBox(height: 10),
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
                                              children: const <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                                  child: Text(":",
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
                                                      double.parse(analisaSingleRAE.data!.analisaHardwood![index]!.tFinal.toString()
                                                      )
                                                    )+" x "+
                                                    formatDecimal.format(
                                                      double.parse(analisaSingleRAE.data!.analisaHardwood![index]!.wFinal.toString()
                                                      )
                                                    )+" x "+
                                                    formatDecimal.format(
                                                      double.parse(analisaSingleRAE.data!.analisaHardwood![index]!.lFinal.toString()
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
                                      const SizedBox(height: 10),
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
                                              children: const <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                                  child: Text(":",
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
                                                      double.parse(analisaSingleRAE.data!.analisaHardwood![index]!.qtyFinal.toString()
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
                                      const SizedBox(height: 10),
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
                                              children: const <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                                  child: Text(":",
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
                                                      double.parse(analisaSingleRAE.data!.analisaHardwood![index]!.tRaw.toString()
                                                      )
                                                    )+" x "+
                                                    formatDecimal.format(
                                                      double.parse(analisaSingleRAE.data!.analisaHardwood![index]!.wRaw.toString()
                                                      )
                                                    )+" x "+
                                                    formatDecimal.format(
                                                      double.parse(analisaSingleRAE.data!.analisaHardwood![index]!.lRaw.toString()
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
                                      const SizedBox(height: 10),
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
                                              children: const <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                                  child: Text(":",
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
                                      const SizedBox(height: 10),
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
                                              children: const <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                                  child: Text(":",
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
                                      const SizedBox(height: 10),
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
                                              children: const <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                                  child: Text(":",
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
                                                      double.parse(analisaSingleRAE.data!.analisaHardwood![index]!.unitPrice.toString())
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
                                      const SizedBox(height: 10),
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
                                              children: const <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                                  child: Text(":",
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
                                                      double.parse(analisaSingleRAE.data!.analisaHardwood![index]!.konstanta.toString()
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
                                      const SizedBox(height: 10),
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
                                              children: const <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                                  child: Text(":",
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
                            height: 15,
                            decoration: const BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                  width: 2,
                                  color: Color.fromRGBO(246, 246, 246, 1)
                                ),
                                bottom: BorderSide(
                                  width: 2,
                                  color: Color.fromRGBO(246, 246, 246, 1)
                                )
                              )
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            child: CardItemExpansionDetail(
                              child: ListTile(
                                contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                title: Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Expanded(
                                          flex: 4,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: const <Widget>[
                                              Padding(
                                                padding: EdgeInsets.only(left: 0),
                                                child: Text("Total Luas",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14
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
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14
                                                  ),
                                                  textAlign: TextAlign.right,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: <Widget>[
                                        Expanded(
                                          flex: 4,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: const <Widget>[
                                              Padding(
                                                padding: EdgeInsets.only(left: 0),
                                                child: Text("Total Volume",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14
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
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14
                                                  ),
                                                  textAlign: TextAlign.right,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: <Widget>[
                                        Expanded(
                                          flex: 4,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: const <Widget>[
                                              Padding(
                                                padding: EdgeInsets.only(left: 0),
                                                child: Text("Grand Total",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14
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
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14
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
                        label: "Plywood",
                        children: <Widget> [
                          ListView.separated(
                            separatorBuilder: (context, index) {
                              return Container(
                                width: double.infinity,
                                height: 15,
                                decoration: const BoxDecoration(
                                  border: Border(
                                    top: BorderSide(
                                      width: 2,
                                      color: Color.fromRGBO(246, 246, 246, 1)
                                    ),
                                    bottom: BorderSide(
                                      width: 2,
                                      color: Color.fromRGBO(246, 246, 246, 1)
                                    )
                                  )
                                ),
                              );
                            },
                            itemCount: analisaSingleRAE.data!.analisaPlywood!.length,
                            itemBuilder: (context, index){
                              return ListTile(
                                contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                                title: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget> [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
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
                                            padding: const EdgeInsets.symmetric(horizontal: 15),
                                            child: Text(
                                              analisaSingleRAE.data!.analisaPlywood![index]!.deskripsi.toString(),
                                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                subtitle: Padding(
                                  padding: const EdgeInsets.only(top: 15),
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
                                              children: const <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                                  child: Text(":",
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
                                                  child: (analisaSingleRAE.data!.analisaPlywood![index]!.namaFinishingBarangJadi != null)
                                                  ? Text(analisaSingleRAE.data!.analisaPlywood![index]!.namaFinishingBarangJadi.toString(),
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
                                      const SizedBox(height: 10),
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
                                              children: const <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                                  child: Text(":",
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
                                                  child: Text(analisaSingleRAE.data!.analisaPlywood![index]!.namaTipeSisi.toString(),
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
                                      const SizedBox(height: 10),
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
                                              children: const <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                                  child: Text(":",
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
                                                      double.parse(analisaSingleRAE.data!.analisaPlywood![index]!.qtyFinal.toString()
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
                                      const SizedBox(height: 10),
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
                                              children: const <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                                  child: Text(":",
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
                                                      double.parse(analisaSingleRAE.data!.analisaPlywood![index]!.tFinal.toString()
                                                      )
                                                    )+" x "+
                                                    formatDecimal.format(
                                                      double.parse(analisaSingleRAE.data!.analisaPlywood![index]!.wFinal.toString()
                                                      )
                                                    )+" x "+
                                                    formatDecimal.format(
                                                      double.parse(analisaSingleRAE.data!.analisaPlywood![index]!.lFinal.toString()
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
                                      const SizedBox(height: 10),
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
                                              children: const <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                                  child: Text(":",
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
                                                      double.parse(analisaSingleRAE.data!.analisaPlywood![index]!.qtyFinal.toString()
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
                                      const SizedBox(height: 10),
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
                                              children: const <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                                  child: Text(":",
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
                                                      double.parse(analisaSingleRAE.data!.analisaPlywood![index]!.tRaw.toString()
                                                      )
                                                    )+" x "+
                                                    formatDecimal.format(
                                                      double.parse(analisaSingleRAE.data!.analisaPlywood![index]!.wRaw.toString()
                                                      )
                                                    )+" x "+
                                                    formatDecimal.format(
                                                      double.parse(analisaSingleRAE.data!.analisaPlywood![index]!.lRaw.toString()
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
                                      const SizedBox(height: 10),
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
                                              children: const <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                                  child: Text(":",
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
                                                      double.parse(listLuasPlywood[index].toString()
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
                                      const SizedBox(height: 10),
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
                                              children: const <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                                  child: Text(":",
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
                                                      double.parse(listVolumePlywood[index].toString()
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
                                      const SizedBox(height: 10),
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
                                              children: const <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                                  child: Text(":",
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
                                                      double.parse(analisaSingleRAE.data!.analisaPlywood![index]!.unitPrice.toString())
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
                                      const SizedBox(height: 10),
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
                                              children: const <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                                  child: Text(":",
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
                                                      double.parse(analisaSingleRAE.data!.analisaPlywood![index]!.konstanta.toString()
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
                                      const SizedBox(height: 10),
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
                                              children: const <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                                  child: Text(":",
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
                                                      double.parse(subTotalPlywood[index].toString())
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
                            height: 15,
                            decoration: const BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                  width: 2,
                                  color: Color.fromRGBO(246, 246, 246, 1)
                                ),
                                bottom: BorderSide(
                                  width: 2,
                                  color: Color.fromRGBO(246, 246, 246, 1)
                                )
                              )
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            child: CardItemExpansionDetail(
                              child: ListTile(
                                contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                title: Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Expanded(
                                          flex: 4,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: const <Widget>[
                                              Padding(
                                                padding: EdgeInsets.only(left: 0),
                                                child: Text("Total Luas",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14
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
                                                      double.parse(totalLuasPlywood.toString()
                                                    )
                                                  ),
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14
                                                  ),
                                                  textAlign: TextAlign.right,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: <Widget>[
                                        Expanded(
                                          flex: 4,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: const <Widget>[
                                              Padding(
                                                padding: EdgeInsets.only(left: 0),
                                                child: Text("Total Volume",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14
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
                                                      double.parse(totalVolumePlywood.toString()
                                                    )
                                                  ),
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14
                                                  ),
                                                  textAlign: TextAlign.right,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: <Widget>[
                                        Expanded(
                                          flex: 4,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: const <Widget>[
                                              Padding(
                                                padding: EdgeInsets.only(left: 0),
                                                child: Text("Grand Total",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14
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
                                                      double.parse(grandTotalPlywood.toString()
                                                    )
                                                  ),
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14
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
                      const SizedBox(height: 30),
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