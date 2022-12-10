import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mgp_mobile_app/model/hrdu/rae/rekapitulasi.dart';
import 'package:mgp_mobile_app/widget/component/card_expansion_detail.dart';
import 'package:mgp_mobile_app/widget/component/card_item_expansion_detail.dart';
import 'package:mgp_mobile_app/widget/component/highlight_item_name.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class Body extends StatelessWidget {
  final Future<Rekapitulasi> futureRekapitulasi;
  Body({Key? key, required this.futureRekapitulasi}) : super(key: key);

  final formatCurrency = NumberFormat.currency(
    locale: 'ID',
    decimalDigits: 1,
    symbol: "Rp"
  );

  final formatDecimal = NumberFormat("###.######", "id_ID");
  final decimalFormat = NumberFormat("###", "id_ID");
  late String grandTotalBiayaOverhead;
  late List listSubOverHead = [];
  late final listSubTotal;
  late List subTotalPrice = [];
  late List listHardwood = [];
  late List listPlywood = [];
  late List unitPriceAlatBantuOnSite = [];
  late String grandTotalAlatBantuOnsite;

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
              future: futureRekapitulasi,
              builder: (BuildContext context, AsyncSnapshot<Rekapitulasi> snapshot) {
                if (snapshot.hasData) {
                  var rekapitulasi = snapshot.data;

                  int lengRekapitulasi = rekapitulasi!.data.length;
                  listSubTotal = List.generate(lengRekapitulasi, (_) => []);
                  num totalHardwood;
                  num totalPlywood;
                  
                  num subTotalHardwood;
                  num subTotalPlywood;
                  num countHardPly;
                  num totalAlatBantuOnsite = 0;
                  for(int i = 0 ; i < lengRekapitulasi ; i++){
                    totalHardwood = 0;
                    if (rekapitulasi.data[i].analisaHardwood!.isNotEmpty) {
                      int lengAnalisaHardwood = rekapitulasi.data[i].analisaHardwood!.length;
                      for (int j = 0; j < lengAnalisaHardwood; j++) {
                        num volume = (double.parse(rekapitulasi.data[i].analisaHardwood![j].tRaw.toString()) * double.parse(rekapitulasi.data[i].analisaHardwood![j].wRaw.toString()) * double.parse(rekapitulasi.data[i].analisaHardwood![j].lRaw.toString()) * double.parse(rekapitulasi.data[i].analisaHardwood![j].qtyRaw.toString()))/1000000;
                        volume = (volume < 0.000001) ? 0.000001 : volume;
                        subTotalHardwood = volume * double.parse(rekapitulasi.data[i].analisaHardwood![j].hargaSatuan.toString()) * double.parse(rekapitulasi.data[i].analisaHardwood![j].konstanta.toString());
                        totalHardwood = totalHardwood + subTotalHardwood;
                      }
                    }
                    listHardwood.add(totalHardwood);

                    totalPlywood = 0;
                    if (rekapitulasi.data[i].analisaPlywood!.isNotEmpty) {
                      int lengAnalisaPlywood = rekapitulasi.data[i].analisaPlywood!.length;
                      for (int j = 0; j < lengAnalisaPlywood; j++) {
                        subTotalPlywood = double.parse(rekapitulasi.data[i].analisaPlywood![j].unitPrice.toString()) * double.parse(rekapitulasi.data[i].analisaPlywood![j].qtyRaw.toString());
                        totalPlywood = totalPlywood + subTotalPlywood.round();
                      }
                    }
                    listPlywood.add(totalPlywood);
                    
                  // print("hardwood : ${listHardwood[i]}");
                  // print("plywood : ${listPlywood[i]}");
                    countHardPly = listHardwood[i] + listPlywood[i];
                    // print(countHardPly);
                    unitPriceAlatBantuOnSite.add(countHardPly);
                    
                    if (rekapitulasi.data[i].analisaAlatBantuOnsite!.isNotEmpty) {
                      int lengAnalisaAlatBantuOnsite = rekapitulasi.data[i].analisaAlatBantuOnsite!.length;
                      for (int j = 0; j < lengAnalisaAlatBantuOnsite; j++) {
                        num totalPrice = unitPriceAlatBantuOnSite[i] * double.parse(rekapitulasi.data[i].analisaAlatBantuOnsite![j].qty.toString()) * 
                        double.parse(rekapitulasi.data[i].analisaAlatBantuOnsite![j].konstanta.toString());
                        subTotalPrice.add(totalPrice.roundToDouble());
                        totalAlatBantuOnsite = totalAlatBantuOnsite + totalPrice.roundToDouble();
                        // totalAlatBantuOnSite = totalAlatBantuOnSite + totalPrice;
                      }
                      listSubTotal[i].addAll(subTotalPrice);
                      subTotalPrice.clear();
                    }
                  }
                  grandTotalAlatBantuOnsite = totalAlatBantuOnsite.toString();

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                      CardExpansionDetail(
                        label: "List Alat Bantu On-Site",
                        children: <Widget> [
                          ListView.separated(
                            separatorBuilder: (context, index) => SizedBox(
                              height: getProportionateScreenHeight(10),
                            ),
                            itemCount: rekapitulasi.data.length,
                            itemBuilder: (context, i){
                              return Padding(
                                padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                                child: Column(
                                  children: [
                                    for(int index = 0 ; index < rekapitulasi.data[i].analisaAlatBantuOnsite!.length ; index++)...[ 
                                      CardItemExpansionDetail(
                                        child: ListTile(
                                          contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0), vertical: getProportionateScreenHeight(10.0)),
                                          title: HighlightItemName(
                                            child: Text(
                                              rekapitulasi.data[i].analisaAlatBantuOnsite![index].kodeItem.toString(),
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
                                                            child: Text("Item Alat Bantu On-Site",
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
                                                            child: Text(rekapitulasi.data[i].analisaAlatBantuOnsite![index].namaItem.toString(),
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
                                                                double.parse(rekapitulasi.data[i].analisaAlatBantuOnsite![index].qty.toString()
                                                                )
                                                              )+" "+
                                                              rekapitulasi.data[i].analisaAlatBantuOnsite![index].namaSatuan.toString(),
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
                                                                double.parse(unitPriceAlatBantuOnSite[i].toString())
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
                                                                double.parse(rekapitulasi.data[i].analisaAlatBantuOnsite![index].konstanta.toString())
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
                                                                double.parse(listSubTotal[i][index].toString())
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
                                  ],
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
                                                      double.parse(grandTotalAlatBantuOnsite
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