import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:mgp_mobile_app/model/hrdu/rae/rekapitulasi.dart';
import 'package:mgp_mobile_app/widget/component/card_expansion_detail.dart';
import 'package:mgp_mobile_app/widget/component/card_item_expansion_detail.dart';
import 'package:mgp_mobile_app/widget/component/highlight_item_name.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class Body extends StatelessWidget {
  final Future<Rekapitulasi> futureRekapitulasi;
  final List listSubTotalOverheadKantor, unitPrice;
  final num totalBiayaOverheadKantor;
  Body({Key? key, required this.futureRekapitulasi, required this.listSubTotalOverheadKantor, required this.totalBiayaOverheadKantor, required this.unitPrice}) : super(key: key);

  final formatCurrency = NumberFormat.currency(
    locale: 'ID',
    decimalDigits: 1,
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
              future: futureRekapitulasi,
              builder: (BuildContext context, AsyncSnapshot<Rekapitulasi> snapshot) {
                if (snapshot.hasData) {
                 var rekapitulasi = snapshot.data;
                  
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                      CardExpansionDetail(
                        label: "Biaya Overhead Kantor",
                        children: <Widget> [
                          ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: rekapitulasi!.data.length,
                            itemBuilder: (context, i){
                              return Padding(
                                padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                                child: Column(
                                  children: [
                                    for(int index = 0 ; index < rekapitulasi.data[i].analisaBiayaOverheadKantor!.length ; index++)...[
                                      CardItemExpansionDetail(
                                        child: ListTile(
                                          contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0), vertical: getProportionateScreenHeight(10.0)),
                                          title: HighlightItemName(
                                            child: Text(
                                              rekapitulasi.data[i].analisaBiayaOverheadKantor![index].kodeItem.toString(),
                                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14,),
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
                                                            padding: const EdgeInsets.only(left: 0),
                                                            child: Text("Item Biaya Overhead Kantor",
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
                                                            child: Text(rekapitulasi.data[i].analisaBiayaOverheadKantor![index].namaItem.toString(),
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
                                                            padding: const EdgeInsets.only(left: 0),
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
                                                                double.parse(rekapitulasi.data[i].analisaBiayaOverheadKantor![index].qty.toString()
                                                                )
                                                              )+" "+
                                                              rekapitulasi.data[i].analisaBiayaOverheadKantor![index].namaSatuan.toString(),
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
                                                                double.parse(unitPrice[i].toString())
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
                                                            padding: const EdgeInsets.only(left: 0),
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
                                                                double.parse(rekapitulasi.data[i].analisaBiayaOverheadKantor![index].konstanta.toString()
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
                                                            padding: const EdgeInsets.only(left: 0),
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
                                                                double.parse(listSubTotalOverheadKantor[i][index].round().toString())
                                                              ),
                                                              // double.parse(subTotalBiayaOverheadKantor[index].toString()).toString(),
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
                                                      double.parse(totalBiayaOverheadKantor.toString()
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