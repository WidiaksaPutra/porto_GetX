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
  late String grandTotalLabourCost;
  
  // late List listSubTotalLabourCost = [];
  // late final listSubTotal;

  late List listSubTotalLabourCost = [];
  late List listKodeLabourCost = [];
  late List listQtyLabourCost = [];
  late List listKonstantaLabourCost = [];
  late final listSubTotal;
  late final listKode;
  late final listQty;
  late final listKonstanta;

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
                  num totalLabourCost = 0;
                  num subTotal;
                  int lengRekapitulasi = rekapitulasi!.data.length;

                  listSubTotal = List.generate(lengRekapitulasi, (_) => []);
                  listKode = List.generate(lengRekapitulasi, (_) => []);
                  listQty = List.generate(lengRekapitulasi, (_) => []);
                  listKonstanta = List.generate(lengRekapitulasi, (_) => []);

                  late int hi, hj;
                  late double hasilSubTotal;
                  late double hasilQty;
                  late int lengAnalisaFinTpLc;
                  late int lengAnalisaFinTpLc2;

                  for(int loop = 0 ; loop < 2 ; loop++){
                    for(int ki = 0 ; ki<lengRekapitulasi ; ki++){
                      lengAnalisaFinTpLc = rekapitulasi.data[ki].analisaFinTpLc!.length;
                      if (rekapitulasi.data[ki].analisaFinTpLc != []) {
                        for (int kj = 0; kj < lengAnalisaFinTpLc; kj++) {
                          if(loop == 0){
                            subTotal = double.parse(rekapitulasi.data[ki].analisaFinTpLc![kj].qty.toString()) * double.parse(rekapitulasi.data[ki].analisaFinTpLc![kj].unitPrice.toString()) * double.parse(rekapitulasi.data[ki].analisaFinTpLc![kj].konstanta.toString());
                        
                            listSubTotalLabourCost.add(subTotal);
                            listKodeLabourCost.add(rekapitulasi.data[ki].analisaFinTpLc![kj].kodeItem.toString());
                            listQtyLabourCost.add(double.parse(rekapitulasi.data[ki].analisaFinTpLc![kj].qty.toString()));
                            listKonstantaLabourCost.add(rekapitulasi.data[ki].analisaFinTpLc![kj].konstanta.toString());

                            totalLabourCost = totalLabourCost + subTotal.round();
                          }
                          else{
                            hasilSubTotal = 0.0;
                            hasilQty = 0.0;
                            for(int i = ki ; i<lengRekapitulasi ; i++){
                              lengAnalisaFinTpLc2 = rekapitulasi.data[i].analisaFinTpLc!.length;
                              if (rekapitulasi.data[i].analisaFinTpLc != []) {
                                for (int j = kj; j < lengAnalisaFinTpLc2; j++) {
                                  if(listKode[i][j] == listKode[ki][kj] && listKonstanta[i][j] == listKonstanta[ki][kj]){
                                    if(i == ki && j == kj){
                                      hi = i;
                                      hj = j;
                                      hasilSubTotal = hasilSubTotal + listSubTotal[i][j];
                                      hasilQty = hasilQty + listQty[i][j];
                                    }
                                    else{
                                      hasilSubTotal = hasilSubTotal + listSubTotal[i][j];
                                      hasilQty = hasilQty + listQty[i][j];
                                      listQty[i][j] = 0.0;
                                      listSubTotal[i][j] = 0.0;
                                    }            
                                  }
                                }
                              }
                              if(i == lengRekapitulasi-1){
                                listQty[hi][hj] = hasilQty;
                                listSubTotal[hi][hj] = hasilSubTotal.roundToDouble();
                              }
                            }
                          }
                        }
                        if(loop == 0){
                          listSubTotal[ki].addAll(listSubTotalLabourCost);
                          listKode[ki].addAll(listKodeLabourCost);
                          listQty[ki].addAll(listQtyLabourCost);
                          listKonstanta[ki].addAll(listKonstantaLabourCost);

                          listSubTotalLabourCost.clear();
                          listKodeLabourCost.clear();
                          listQtyLabourCost.clear();
                          listKonstantaLabourCost.clear();
                        }
                      } 
                    }
                  }

                  grandTotalLabourCost = totalLabourCost.toString();

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                      CardExpansionDetail(
                        label: "List Labour Cost",
                        children: <Widget> [
                          ListView.separated(
                            separatorBuilder: (context, index) => SizedBox(
                              height: getProportionateScreenHeight(10),
                            ),
                            itemCount: rekapitulasi.data.length,
                            itemBuilder: (context, i){
                              // subTotalLabourCost.clear();
                              return Padding(
                                padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                                child: Column(
                                  children: [
                                    for(int index = 0 ; index < rekapitulasi.data[i].analisaFinTpLc!.length ; index++)...[
                                      if(listSubTotal[i][index] != 0.0)...[
                                        CardItemExpansionDetail(
                                          child: ListTile(
                                            contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0), vertical: getProportionateScreenHeight(10.0)),
                                            title: HighlightItemName(
                                              child: Text(
                                                rekapitulasi.data[i].analisaFinTpLc![index].kodeItem.toString(),
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
                                                              child: Text(rekapitulasi.data[i].analisaFinTpLc![index].namaItem.toString(),
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
                                                                  double.parse(rekapitulasi.data[i].analisaFinTpLc![index].qty.toString()
                                                                  )
                                                                )+" "+
                                                                rekapitulasi.data[i].analisaFinTpLc![index].namaSatuan.toString(),
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
                                                                  double.parse(rekapitulasi.data[i].analisaFinTpLc![index].unitPrice.toString())
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
                                                                  double.parse(rekapitulasi.data[i].analisaFinTpLc![index].konstanta.toString())
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
                                      ],
                                    ],
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
                                                      double.parse(grandTotalLabourCost
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