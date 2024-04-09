import 'package:get/get.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/marketing/rae/analisa_barang_jadi/getX_bahan_baku.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/marketing/rae/analisa_barang_jadi/getX_finishing.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/marketing/rae/mixin_rae.dart';
import 'package:mgp_mobile_app/model/hrdu/rae/analisa_single_rae.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mgp_mobile_app/widget/component/card_expansion_detail.dart';
import 'package:mgp_mobile_app/widget/component/card_item_expansion_detail.dart';
import 'package:mgp_mobile_app/widget/component/highlight_item_name.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class BodyFinihingRae extends StatefulWidget {
  final String idRaeDetail, namaFinishing;
  const BodyFinihingRae({Key? key, required this.idRaeDetail, required this.namaFinishing}) : super(key: key);
  @override
  _BodyFinihingRaeState createState() => _BodyFinihingRaeState();
}

class _BodyFinihingRaeState extends State<BodyFinihingRae> with RaeDetail{
  late Future<AnalisaSingleRegrae> futureFinishing = fetchDataRAEDetail(idRaeDetail: widget.idRaeDetail);
  final formatCurrency = NumberFormat.currency(
    locale: 'ID',
    decimalDigits: 1,
    symbol: "Rp"
  );
  final formatDecimal = NumberFormat("###.######", "id_ID");

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Get.put(GetxBahanBakuRae()).bahanBaku(widget.idRaeDetail.toString());
    Get.put(GetxFinishingRae()).finishing(widget.idRaeDetail, widget.namaFinishing);
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: FutureBuilder(
              future: futureFinishing,
              builder: (BuildContext context, AsyncSnapshot<AnalisaSingleRegrae> snapshot) {
                if (snapshot.hasData) {
                 var analisaSingleRAE = futureDetailRae!.data;
                  return 
                    GetBuilder<GetxFinishingRae>(
                    init: GetxFinishingRae(),
                    builder:(controller) => 
                    GetBuilder<GetxBahanBakuRae>(
                    init: GetxBahanBakuRae(),
                    builder:(controller1) => Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: getProportionateScreenHeight(10),
                          ),
                          CardExpansionDetail(
                            label: "Total Luas Permukaan",
                            children: <Widget> [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                                child: CardItemExpansionDetail(
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10), vertical: getProportionateScreenHeight(10)),
                                      child: Text(
                                        "${controller1.totalLuasPermukaan.value.toString()} (m2)",
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                        ),
                                        textAlign: TextAlign.left,
                                      )
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: getProportionateScreenHeight(10)),
                            ],
                          ),
                          CardExpansionDetail(
                            label: "List Item Bahan Penunjang Finishing",
                            children: <Widget> [
                              ListView.separated(
                                separatorBuilder: (context, index) => SizedBox(
                                  height: getProportionateScreenHeight(10),
                                ),
                                itemCount: controller.indexanalisaFinFnBp.length,
                                itemBuilder: (context, index){
                                  return Column(
                                    children: [
                                      if(analisaSingleRAE!.analisaFinFnBp![controller.indexanalisaFinFnBp[index]].namaFinishingBarangJadi.toString().contains(widget.namaFinishing.toString()))...[
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                                          child: CardItemExpansionDetail(
                                            child: ListTile(
                                              contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0), vertical: getProportionateScreenHeight(10.0)),
                                              title: HighlightItemName(
                                                child: Text(
                                                  analisaSingleRAE.analisaFinFnBp![controller.indexanalisaFinFnBp[index]].kodeItem.toString(),
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
                                                                child: Text(analisaSingleRAE.analisaFinFnBp![controller.indexanalisaFinFnBp[index]].namaItem.toString(),
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
                                                                    double.parse(analisaSingleRAE.analisaFinFnBp![controller.indexanalisaFinFnBp[index]].qty.toString()
                                                                    )
                                                                  )+" "+
                                                                  analisaSingleRAE.analisaFinFnBp![controller.indexanalisaFinFnBp[index]].namaSatuan.toString(),
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
                                                                    double.parse(analisaSingleRAE.analisaFinFnBp![controller.indexanalisaFinFnBp[index]].unitPrice.toString())
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
                                                                    double.parse(analisaSingleRAE.analisaFinFnBp![controller.indexanalisaFinFnBp[index]].konstanta.toString()
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
                                        ),
                                      ],
                                    ],
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
                                                        double.parse(controller.grandTotalFactorySupply.value.toString())
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
                            label: "List Item Subkon Finishing",
                            children: <Widget> [
                              ListView.separated(
                                separatorBuilder: (context, index) => SizedBox(
                                  height: getProportionateScreenHeight(10),
                                ),
                                itemCount: controller.indexanalisaFinFnSc.length,
                                itemBuilder: (context, index){
                                  return Column(
                                    children: [
                                      if(widget.namaFinishing.toString().contains(analisaSingleRAE!.analisaFinFnSc![controller.indexanalisaFinFnSc[index]].namaFinishingBarangJadi.toString()))...[
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                                          child: CardItemExpansionDetail(
                                            child: ListTile(
                                              contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0), vertical: getProportionateScreenHeight(10.0)),
                                              title: HighlightItemName(
                                                child: Text(
                                                  analisaSingleRAE.analisaFinFnSc![controller.indexanalisaFinFnSc[index]].kodeItem.toString(),
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
                                                                child: Text(analisaSingleRAE.analisaFinFnSc![controller.indexanalisaFinFnSc[index]].namaItem.toString(),
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
                                                                    double.parse(analisaSingleRAE.analisaFinFnSc![controller.indexanalisaFinFnSc[index]].qty.toString()
                                                                    )
                                                                  )+" "+
                                                                  analisaSingleRAE.analisaFinFnSc![controller.indexanalisaFinFnSc[index]].namaSatuan.toString(),
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
                                                                    double.parse(analisaSingleRAE.analisaFinFnSc![controller.indexanalisaFinFnSc[index]].unitPrice.toString())
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
                                                                    double.parse(analisaSingleRAE.analisaFinFnSc![controller.indexanalisaFinFnSc[index]].konstanta.toString()
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
                                        ),
                                      ],
                                    ],
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
                                                        double.parse(controller.grandTotalLabourCost.value.toString()),
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
                            label: "List Item Labour Cost Finishing",
                            children: <Widget> [
                              ListView.separated(
                                separatorBuilder: (context, index) => SizedBox(
                                  height: getProportionateScreenHeight(10),
                                ),
                                itemCount: controller.indexanalisaFinFnLc.length,
                                itemBuilder: (context, index){
                                  return Column(
                                    children: [
                                      if(widget.namaFinishing.toString().contains(analisaSingleRAE!.analisaFinFnLc![controller.indexanalisaFinFnLc[index]].namaFinishingBarangJadi.toString()))...[
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                                          child: CardItemExpansionDetail(
                                            child: ListTile(
                                              contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0), vertical: getProportionateScreenHeight(10.0)),
                                              title: HighlightItemName(
                                                child: Text(
                                                  analisaSingleRAE.analisaFinFnLc![controller.indexanalisaFinFnLc[index]].kodeItem.toString(),
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
                                                                child: Text(analisaSingleRAE.analisaFinFnLc![controller.indexanalisaFinFnLc[index]].namaItem.toString(),
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
                                                                    double.parse(analisaSingleRAE.analisaFinFnLc![controller.indexanalisaFinFnLc[index]].qty.toString()
                                                                    )
                                                                  )+" "+
                                                                  analisaSingleRAE.analisaFinFnLc![controller.indexanalisaFinFnLc[index]].namaSatuan.toString(),
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
                                                                    double.parse(analisaSingleRAE.analisaFinFnLc![controller.indexanalisaFinFnLc[index]].unitPrice.toString())
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
                                                                    double.parse(analisaSingleRAE.analisaFinFnLc![controller.indexanalisaFinFnLc[index]].konstanta.toString()
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
                                        ),
                                      ],
                                    ],
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
                                                        double.parse(controller.grandTotalMachineProcess.value.toString()),
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