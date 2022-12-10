import 'package:get/get.dart';
import 'package:mgp_mobile_app/controller_getX/modul/marketing/default_marketing/analisa_barang_jadi/penunjang_produksi/getX_analisa_penunjang_produksi.dart';
import 'package:mgp_mobile_app/controller_getX/modul/marketing/default_marketing/analisa_barang_jadi/penunjang_produksi/mixin_analisa_bahan_baku.dart';
import 'package:mgp_mobile_app/model/hrdu/peluang/analisa_single_peluang_penunjang.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mgp_mobile_app/widget/component/card_expansion_detail.dart';
import 'package:mgp_mobile_app/widget/component/card_item_expansion_detail.dart';
import 'package:mgp_mobile_app/widget/component/highlight_item_name.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class Body extends StatefulWidget {
  final String idBarangJadi;
  const Body({Key? key, required this.idBarangJadi}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> with PeluangPenunjangDetail{
  late Future<AnalisaSingleRegplgPenunjang> futurePeluangPenunjang = fetchDataPeluangPenunjangDetail(idBarangJadi: widget.idBarangJadi);
  final formatCurrency = NumberFormat.currency(
    locale: 'ID',
    decimalDigits: 0,
    symbol: "Rp"
  );
  final formatDecimal = NumberFormat("###.######", "id_ID");

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
              future: futurePeluangPenunjang,
              builder: (BuildContext context, AsyncSnapshot<AnalisaSingleRegplgPenunjang> snapshot) {
                if (snapshot.hasData) {
                  var analisaSingleRAE = futureDetailPenunjang!.data;
                  Get.put(GetxAnalisaPeluangPenunjang()).analisaPeluangPenunjang(widget.idBarangJadi.toString());
                  return GetX<GetxAnalisaPeluangPenunjang>(
                    init: GetxAnalisaPeluangPenunjang(),
                    builder:(controller) => Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                       SizedBox(
                          height: getProportionateScreenHeight(10),
                        ),
                        CardExpansionDetail(
                          label: "Factory Supply",
                          children: <Widget> [
                            ListView.separated(
                              separatorBuilder: (context, index) => SizedBox(
                                height: getProportionateScreenHeight(10),
                              ),
                              itemCount: analisaSingleRAE!.analisaFinTpFs!.length,
                              itemBuilder: (context, index){
                                return Padding(
                                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                                  child: CardItemExpansionDetail(
                                    child: ListTile(
                                      contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0), vertical: getProportionateScreenHeight(10.0)),
                                      title: HighlightItemName(
                                        child: Text(
                                          analisaSingleRAE.analisaFinTpFs![index].kodeItemBahan.toString(),
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
                                                  flex: 12,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: const <Widget>[
                                                      Padding(
                                                        padding: EdgeInsets.only(left: 0),
                                                        child: Text("Item Factory Supply",
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
                                                        child: Text(analisaSingleRAE.analisaFinTpFs![index].namaItem.toString(),
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
                                                  flex: 12,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: const <Widget>[
                                                      Padding(
                                                        padding: EdgeInsets.only(left: 0),
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
                                                            double.parse(analisaSingleRAE.analisaFinTpFs![index].qty.toString()
                                                            )
                                                          )+" "+
                                                          analisaSingleRAE.analisaFinTpFs![index].namaSatuan.toString(),
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
                                                  flex: 12,
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
                                                            double.parse(analisaSingleRAE.analisaFinTpFs![index].hargaSatuan.toString())
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
                                                  flex: 12,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: const <Widget>[
                                                      Padding(
                                                        padding: EdgeInsets.only(left: 0),
                                                        child: Text("koefisien",
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
                                                            double.parse(analisaSingleRAE.analisaFinTpFs![index].koefisien.toString()
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
                                                  flex: 12,
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
                                                            double.parse(controller.subTotalFactorySupply[index].toString())
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
                            SizedBox(height: getProportionateScreenHeight(10)),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
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
                                              children: const <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.only(left: 0),
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
                                                        double.parse(controller.grandTotalFactorySupply.value.toString()),
                                                    ),
                                                    style: const TextStyle(
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
                            SizedBox(height: getProportionateScreenHeight(10)),
                          ]
                        ),
                        CardExpansionDetail(
                          label: "Labour Cost",
                          children: <Widget> [
                            ListView.separated(
                              separatorBuilder: (context, index) => SizedBox(
                                height: getProportionateScreenHeight(10),
                              ),
                              itemCount: analisaSingleRAE.analisaFinTpLc!.length,
                              itemBuilder: (context, index){
                                return Padding(
                                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                                  child: CardItemExpansionDetail(
                                    child: ListTile(
                                      contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0), vertical: getProportionateScreenHeight(10.0)),
                                      title: HighlightItemName(
                                        child: Text(
                                          analisaSingleRAE.analisaFinTpLc![index].kodeItemBahan.toString(),
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
                                                  flex: 12,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: const <Widget>[
                                                      Padding(
                                                        padding: EdgeInsets.only(left: 0),
                                                        child: Text("Item Labour Cost",
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
                                                        child: Text(analisaSingleRAE.analisaFinTpLc![index].namaItem.toString(),
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
                                                  flex: 12,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: const <Widget>[
                                                      Padding(
                                                        padding: EdgeInsets.only(left: 0),
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
                                                            double.parse(analisaSingleRAE.analisaFinTpLc![index].qty.toString()
                                                            )
                                                          )+" "+
                                                          analisaSingleRAE.analisaFinTpLc![index].namaSatuan.toString(),
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
                                                  flex: 12,
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
                                                            double.parse(analisaSingleRAE.analisaFinTpLc![index].hargaSatuan.toString())
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
                                                  flex: 12,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: const <Widget>[
                                                      Padding(
                                                        padding: EdgeInsets.only(left: 0),
                                                        child: Text("koefisien",
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
                                                            double.parse(analisaSingleRAE.analisaFinTpLc![index].koefisien.toString()
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
                                                  flex: 12,
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
                                                            double.parse(controller.subTotalLabourCost[index].toString())
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
                            SizedBox(height: getProportionateScreenHeight(10)),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
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
                                              children: const <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.only(left: 0),
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
                                                      double.parse(controller.grandTotalLabourCost.value.toString())
                                                    ),
                                                    style: const TextStyle(
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
                            SizedBox(height: getProportionateScreenHeight(10)),
                          ]
                        ),
                        CardExpansionDetail(
                          label: "Machine Process",
                          children: <Widget> [
                            ListView.separated(
                              separatorBuilder: (context, index) => SizedBox(
                                height: getProportionateScreenHeight(10),
                              ),
                              itemCount: analisaSingleRAE.analisaFinTpMp!.length,
                              itemBuilder: (context, index){
                                return Padding(
                                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                                  child: CardItemExpansionDetail(
                                    child: ListTile(
                                      contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0), vertical: getProportionateScreenHeight(10.0)),
                                      title: HighlightItemName(
                                        child: Text(
                                          analisaSingleRAE.analisaFinTpMp![index].kodeItemBahan.toString(),
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
                                                  flex: 12,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: const <Widget>[
                                                      Padding(
                                                        padding: EdgeInsets.only(left: 0),
                                                        child: Text("Item Machine Process",
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
                                                        child: Text(analisaSingleRAE.analisaFinTpMp![index].namaItem.toString(),
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
                                                  flex: 12,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: const <Widget>[
                                                      Padding(
                                                        padding: EdgeInsets.only(left: 0),
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
                                                            double.parse(analisaSingleRAE.analisaFinTpMp![index].qty.toString()
                                                            )
                                                          )+" "+
                                                          analisaSingleRAE.analisaFinTpMp![index].namaSatuan.toString(),
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
                                                  flex: 12,
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
                                                            double.parse(analisaSingleRAE.analisaFinTpMp![index].hargaSatuan.toString())
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
                                                  flex: 12,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: const <Widget>[
                                                      Padding(
                                                        padding: EdgeInsets.only(left: 0),
                                                        child: Text("koefisien",
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
                                                            double.parse(analisaSingleRAE.analisaFinTpMp![index].koefisien.toString()
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
                                                  flex: 12,
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
                                                            double.parse(controller.subTotalMachineProcess[index].toString())
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
                            SizedBox(height: getProportionateScreenHeight(10)),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
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
                                              children: const <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.only(left: 0),
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
                                                      double.parse(controller.grandTotalMachineProcess.value.toString())
                                                    ),
                                                    style: const TextStyle(
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
                            SizedBox(height: getProportionateScreenHeight(10)),
                          ]
                        ),
                        CardExpansionDetail(
                          label: "Biaya Overhead",
                          children: <Widget> [
                            ListView.separated(
                              separatorBuilder: (context, index) => SizedBox(
                                height: getProportionateScreenHeight(10),
                              ),
                              itemCount: analisaSingleRAE.analisaFinTpBop!.length,
                              itemBuilder: (context, index){
                                return Padding(
                                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                                  child: CardItemExpansionDetail(
                                    child: ListTile(
                                      contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0), vertical: getProportionateScreenHeight(10.0)),
                                      title: HighlightItemName(
                                        child: Text(
                                          analisaSingleRAE.analisaFinTpBop![index].kodeItemBahan.toString(),
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
                                                  flex: 12,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: const <Widget>[
                                                      Padding(
                                                        padding: EdgeInsets.only(left: 0),
                                                        child: Text("Item Biaya Overhead",
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
                                                        child: Text(analisaSingleRAE.analisaFinTpBop![index].namaItem.toString(),
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
                                                  flex: 12,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: const <Widget>[
                                                      Padding(
                                                        padding: EdgeInsets.only(left: 0),
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
                                                            double.parse(analisaSingleRAE.analisaFinTpBop![index].qty.toString()
                                                            )
                                                          )+" "+
                                                          analisaSingleRAE.analisaFinTpBop![index].namaSatuan.toString(),
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
                                                  flex: 12,
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
                                                            double.parse(analisaSingleRAE.analisaFinTpBop![index].hargaSatuan.toString())
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
                                                  flex: 12,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: const <Widget>[
                                                      Padding(
                                                        padding: EdgeInsets.only(left: 0),
                                                        child: Text("koefisien",
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
                                                            double.parse(analisaSingleRAE.analisaFinTpBop![index].koefisien.toString()
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
                                                  flex: 12,
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
                                                            double.parse(controller.subTotalBiayaOverhead[index].toString())
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
                            SizedBox(height: getProportionateScreenHeight(10)),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
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
                                              children: const <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.only(left: 0),
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
                                                        double.parse(controller.grandTotalBiayaOverhead.value.toString()
                                                      )
                                                    ),
                                                    style: const TextStyle(
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
                            SizedBox(height: getProportionateScreenHeight(10)),
                          ]
                        ),
                        SizedBox(height: getProportionateScreenHeight(30)),
                      ],
                    ),
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