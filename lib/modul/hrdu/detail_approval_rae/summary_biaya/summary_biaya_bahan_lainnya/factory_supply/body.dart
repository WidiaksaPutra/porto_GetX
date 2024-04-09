import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/marketing/rae/mixin_rae.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/marketing/rae/rekapitulasi/getX_factory_supply.dart';
import 'package:mgp_mobile_app/model/hrdu/rae/rekapitulasi.dart';
import 'package:mgp_mobile_app/widget/component/card_expansion_detail.dart';
import 'package:mgp_mobile_app/widget/component/card_item_expansion_detail.dart';
import 'package:mgp_mobile_app/widget/component/highlight_item_name.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class Body extends StatelessWidget with RaeRekapitulasi{
  final String idRae;
  Body({Key? key, required this.idRae}) : super(key: key);
  late Future<Rekapitulasi> futureSumaryRekapitulasi = fetchDataRaeRekapitulasi(idRaeDetail: idRae);

  final formatCurrency = NumberFormat.currency(
    locale: 'ID',
    decimalDigits: 1,
    symbol: "Rp"
  );

  final formatDecimal = NumberFormat("###.######", "id_ID");

  @override
  Widget build(BuildContext context) {
    Get.put(GetxFactorySupplyRae()).factorySupply(idRae);
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: FutureBuilder(
              future: futureSumaryRekapitulasi,
              builder: (BuildContext context, AsyncSnapshot<Rekapitulasi> snapshot) {
                if (snapshot.hasData) {
                  var rekapitulasi = futureRaeRekapitulasi;
                  return GetBuilder<GetxFactorySupplyRae>(
                    init: GetxFactorySupplyRae(),
                    builder:(controller) => Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: getProportionateScreenHeight(10),
                        ),
                        CardExpansionDetail(
                          label: "List Factory Supply",
                          children: <Widget> [
                            ListView.separated(
                              separatorBuilder: (context, index) => SizedBox(
                                height: getProportionateScreenHeight(10),
                              ),
                              itemCount: rekapitulasi!.data.length,
                              itemBuilder: (context, i){
                                return Padding(
                                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                                  child: Column(
                                    children: [
                                      if(rekapitulasi.data[i].analisaFinTpFs != [])...[
                                        for(int index = 0 ; index < rekapitulasi.data[i].analisaFinTpFs!.length ; index++)...[ 
                                          if(controller.listSubTotal[i][index] != 0.0)...[
                                            CardItemExpansionDetail(
                                              child: ListTile(
                                                contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0), vertical: getProportionateScreenHeight(10.0)),
                                                title: HighlightItemName(
                                                  child: Text(
                                                    controller.listKode[i][index].toString(),
                                                    // rekapitulasi.data[i].analisaFinTpFs![index].kodeItem.toString(),
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
                                                                  child: Text(rekapitulasi.data[i].analisaFinTpFs![index].namaItem.toString(),
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
                                                                  child: Text("Qty.",
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
                                                                      controller.listQty[i][index]
                                                                    )+" "+
                                                                    rekapitulasi.data[i].analisaFinTpFs![index].namaSatuan.toString(),
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
                                                                      double.parse(rekapitulasi.data[i].analisaFinTpFs![index].unitPrice.toString())
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
                                                                  child: Text("Konst.",
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
                                                                      double.parse(rekapitulasi.data[i].analisaFinTpFs![index].konstanta.toString())
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
                                                                  child: Text("Total Price (Rp)",
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
                                                                      double.parse(controller.listSubTotal[i][index].toString())
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
                                            SizedBox(
                                              height: getProportionateScreenHeight(10),
                                            ),
                                          ]
                                        ]
                                      ]
                                    ],
                                  ),
                                );
                              },
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                            ),
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
                                                    formatCurrency.format(double.parse(controller.grandTotalFactorySupply.value.toString())),
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