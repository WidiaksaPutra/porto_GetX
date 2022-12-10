import 'package:get/get.dart';
import 'package:mgp_mobile_app/controller_getX/modul/marketing/default_marketing/analisa_barang_jadi/bahan_baku/getX_analisa_bahan_baku.dart';
import 'package:mgp_mobile_app/controller_getX/modul/marketing/default_marketing/analisa_barang_jadi/bahan_baku/mixin_analisa_bahan_baku.dart';
import 'package:mgp_mobile_app/model/hrdu/peluang/analisa_single_peluang_baku.dart';
import 'package:mgp_mobile_app/widget/component/highlight_item_name.dart';
import 'package:mgp_mobile_app/widget/component/separator_box.dart';
import 'package:mgp_mobile_app/widget/theme/constants.dart';
import 'package:mgp_mobile_app/model/hrdu/rae/analisa_single_rae.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mgp_mobile_app/widget/component/card_expansion_detail.dart';
import 'package:mgp_mobile_app/widget/component/card_item_expansion_detail.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class Body extends StatefulWidget {
  final String idRaeDetail; 
  const Body({Key? key, required this.idRaeDetail}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> with BahanBakuDetail{
  late Future<AnalisaSingleRegplgBaku> futureBuku = fetchDataBahanBakuDetail(idBarangJadi: widget.idRaeDetail);
  final formatCurrency = NumberFormat.currency(
    locale: 'ID',
    decimalDigits: 1,
    symbol: "Rp"
  );
  final formatDecimal = NumberFormat("###.######", "id_ID");

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
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: FutureBuilder(
              future: futureBuku,
              builder: (BuildContext context, AsyncSnapshot<AnalisaSingleRegplgBaku> snapshot) {
                if (snapshot.hasData) {
                  var analisaSingleRAE = futureDetailBahanBaku!.data;
                  Get.put(GetxAnalisaBahanBaku()).bahanBaku(widget.idRaeDetail.toString());
                  return GetX<GetxAnalisaBahanBaku>(
                    init: GetxAnalisaBahanBaku(),
                    builder:(controller) => Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                     SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                      CardExpansionDetail(
                        label: "Hardwood",
                        children: <Widget> [
                          ListView.separated(
                            separatorBuilder: (context, index) {
                              return const SeparatorBox();
                            },
                            itemCount: analisaSingleRAE!.analisaHardwood!.length,
                            itemBuilder: (context, index){
                              return ListTile(
                                contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0), vertical: getProportionateScreenHeight(10.0)),
                                title: HighlightItemName(
                                  child: Text(
                                    analisaSingleRAE.analisaHardwood![index].deskripsi.toString(),
                                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14,),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                subtitle: Padding(
                                  padding: EdgeInsets.only(top: getProportionateScreenHeight(15)),
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
                                              children: <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
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
                                                  child: Text(analisaSingleRAE.analisaHardwood![index].namaJenisKayu.toString(),
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
                                      SizedBox(height: getProportionateScreenHeight(10)),
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
                                              children: <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
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
                                                  child: Text(analisaSingleRAE.analisaHardwood![index].namaPartKayu.toString(),
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
                                      SizedBox(height: getProportionateScreenHeight(10)),
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
                                              children: <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
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
                                                  child: (analisaSingleRAE.analisaHardwood![index].namaFinishingBarangJadi != null)
                                                  ? Text(analisaSingleRAE.analisaHardwood![index].namaFinishingBarangJadi.toString(),
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
                                      SizedBox(height: getProportionateScreenHeight(10)),
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
                                              children: <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
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
                                                  child: Text(analisaSingleRAE.analisaHardwood![index].namaTipeSisi.toString(),
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
                                      SizedBox(height: getProportionateScreenHeight(10)),
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
                                              children: <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
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
                                                      double.parse(analisaSingleRAE.analisaHardwood![index].qtyFinal.toString())
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
                                      SizedBox(height: getProportionateScreenHeight(10)),
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
                                              children: <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
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
                                                      double.parse(analisaSingleRAE.analisaHardwood![index].tFinal.toString())
                                                    )+" x "+
                                                    formatDecimal.format(
                                                      double.parse(analisaSingleRAE.analisaHardwood![index].wFinal.toString())
                                                    )+" x "+
                                                    formatDecimal.format(
                                                      double.parse(analisaSingleRAE.analisaHardwood![index].lFinal.toString()
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
                                      SizedBox(height: getProportionateScreenHeight(10)),
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
                                              children: <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
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
                                                      double.parse(analisaSingleRAE.analisaHardwood![index].qtyRaw.toString())
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
                                      SizedBox(height: getProportionateScreenHeight(10)),
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
                                              children: <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
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
                                                      double.parse(analisaSingleRAE.analisaHardwood![index].tRaw.toString()),
                                                    )+" x "+
                                                    formatDecimal.format(
                                                      double.parse(analisaSingleRAE.analisaHardwood![index].wRaw.toString()),
                                                    )+" x "+
                                                    formatDecimal.format(
                                                      double.parse(analisaSingleRAE.analisaHardwood![index].lRaw.toString()),
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
                                      SizedBox(height: getProportionateScreenHeight(10)),
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
                                              children: <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
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
                                                      double.parse(controller.listLuaslHardwood[index].toString()
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
                                      SizedBox(height: getProportionateScreenHeight(10)),
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
                                              children: <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
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
                                                      double.parse(controller.listVolumeHardwood[index].toString()
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
                                      SizedBox(height: getProportionateScreenHeight(10)),
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
                                              children: <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
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
                                                      double.parse(analisaSingleRAE.analisaHardwood![index].unitPrice.toString())
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
                                      SizedBox(height: getProportionateScreenHeight(10)),
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
                                                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
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
                                      SizedBox(height: getProportionateScreenHeight(10)),
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
                                                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
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
                            height: getProportionateScreenHeight(15),
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                  width: getProportionateScreenWidth(2),
                                  color: const Color.fromRGBO(246, 246, 246, 1)
                                ),
                                bottom: BorderSide(
                                  width: getProportionateScreenWidth(2),
                                  color: const Color.fromRGBO(246, 246, 246, 1)
                                )
                              )
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10), vertical: getProportionateScreenHeight(10)),
                            child: CardItemExpansionDetail(
                              child: ListTile(
                                contentPadding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10), horizontal: getProportionateScreenWidth(10)),
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
                                                    fontSize: 14,
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
                                                    fontSize: 14,
                                                  ),
                                                  textAlign: TextAlign.right,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: getProportionateScreenHeight(10)),
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
                                                    fontSize: 14,
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
                                                    fontSize: 14,
                                                  ),
                                                  textAlign: TextAlign.right,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: getProportionateScreenHeight(10)),
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
                                                    fontSize: 14,
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
                                                    fontSize: 14,
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
                                height: getProportionateScreenHeight(15),
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(
                                      width: getProportionateScreenWidth(2),
                                      color: const Color.fromRGBO(246, 246, 246, 1)
                                    ),
                                    bottom: BorderSide(
                                      width: getProportionateScreenWidth(2),
                                      color: const Color.fromRGBO(246, 246, 246, 1)
                                    )
                                  )
                                ),
                              );
                            },
                            itemCount: analisaSingleRAE.data!.analisaPlywood!.length,
                            itemBuilder: (context, index){
                              return ListTile(
                                contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0), vertical: getProportionateScreenHeight(10.0)),
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
                                            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
                                            child: Text(
                                              analisaSingleRAE.data!.analisaPlywood![index].deskripsi.toString(),
                                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14,),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                subtitle: Padding(
                                  padding: EdgeInsets.only(top: getProportionateScreenHeight(15)),
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
                                                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
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
                                                  child: (analisaSingleRAE.data!.analisaPlywood![index].namaFinishingBarangJadi != null)
                                                  ? Text(analisaSingleRAE.data!.analisaPlywood![index].namaFinishingBarangJadi.toString(),
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
                                      SizedBox(height: getProportionateScreenHeight(10)),
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
                                                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
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
                                                  child: Text(analisaSingleRAE.data!.analisaPlywood![index].namaTipeSisi.toString(),
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
                                      SizedBox(height: getProportionateScreenHeight(10)),
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
                                                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
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
                                                      double.parse(analisaSingleRAE.data!.analisaPlywood![index].qtyFinal.toString()
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
                                      SizedBox(height: getProportionateScreenHeight(10)),
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
                                                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
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
                                                      double.parse(analisaSingleRAE.data!.analisaPlywood![index].tFinal.toString()
                                                      )
                                                    )+" x "+
                                                    formatDecimal.format(
                                                      double.parse(analisaSingleRAE.data!.analisaPlywood![index].wFinal.toString()
                                                      )
                                                    )+" x "+
                                                    formatDecimal.format(
                                                      double.parse(analisaSingleRAE.data!.analisaPlywood![index].lFinal.toString()
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
                                      SizedBox(height: getProportionateScreenHeight(10)),
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
                                                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
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
                                                      double.parse(analisaSingleRAE.data!.analisaPlywood![index].qtyRaw.toString()
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
                                      SizedBox(height: getProportionateScreenHeight(10)),
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
                                                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
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
                                                      double.parse(analisaSingleRAE.data!.analisaPlywood![index].tRaw.toString()
                                                      )
                                                    )+" x "+
                                                    formatDecimal.format(
                                                      double.parse(analisaSingleRAE.data!.analisaPlywood![index].wRaw.toString()
                                                      )
                                                    )+" x "+
                                                    formatDecimal.format(
                                                      double.parse(analisaSingleRAE.data!.analisaPlywood![index].lRaw.toString()
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
                                      SizedBox(height: getProportionateScreenHeight(10)),
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
                                                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
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
                                      SizedBox(height: getProportionateScreenHeight(10)),
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
                                                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
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
                                      SizedBox(height: getProportionateScreenHeight(10)),
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
                                                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
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
                                                      double.parse(analisaSingleRAE.data!.analisaPlywood![index].unitPrice.toString())
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
                                      SizedBox(height: getProportionateScreenHeight(10)),
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
                                                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
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
                                                      double.parse(analisaSingleRAE.data!.analisaPlywood![index].konstanta.toString()
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
                                      SizedBox(height: getProportionateScreenHeight(10)),
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
                                                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
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
                            height: getProportionateScreenHeight(15),
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                  width: getProportionateScreenWidth(2),
                                  color: const Color.fromRGBO(246, 246, 246, 1)
                                ),
                                bottom: BorderSide(
                                  width: getProportionateScreenWidth(2),
                                  color: const Color.fromRGBO(246, 246, 246, 1)
                                )
                              )
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10), vertical: getProportionateScreenHeight(10)),
                            child: CardItemExpansionDetail(
                              child: ListTile(
                                contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10), vertical: getProportionateScreenHeight(10)),
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
                                                    fontSize: 14,
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
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14,
                                                  ),
                                                  textAlign: TextAlign.right,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: getProportionateScreenHeight(10)),
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
                                                    fontSize: 14,
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
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14,
                                                  ),
                                                  textAlign: TextAlign.right,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: getProportionateScreenHeight(10)),
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
                                                    fontSize: 14,
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
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14,
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
                      SizedBox(height: getProportionateScreenHeight(30)),
                    ],
                  ),);
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