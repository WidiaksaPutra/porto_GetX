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
  late List listKodeOverHead = [];
  late List listQtyOverHead = [];
  late List listKonstantaOverHead = [];
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
                  num totalOverHead = 0;
                  num subTotal;
                  int lengRekapitulasi = rekapitulasi!.data.length;
                  // for(int i = 0 ; i<lengRekapitulasi ; i++){
                  //   int lengAnalisaFinTpBop = rekapitulasi.data[i].analisaFinTpBop!.length;
                  //   if (rekapitulasi.data[i].analisaFinTpBop!.isNotEmpty) {
                  //     for (int j = 0; j < lengAnalisaFinTpBop; j++) {
                  //       subTotal = double.parse(rekapitulasi.data[i].analisaFinTpBop![j].qty.toString()) * double.parse(rekapitulasi.data[i].analisaFinTpBop![j].unitPrice.toString()) * double.parse(rekapitulasi.data[i].analisaFinTpBop![j].konstanta.toString());
                  //       listSubOverHead.add(subTotal);
                  //       totalOverHead = totalOverHead + subTotal.round();
                  //     }
                  //     listSubTotal[i].addAll(listSubOverHead);
                  //     // print(listSubTotal);
                  //     listSubOverHead.clear();
                  //   }
                  // }

                  listSubTotal = List.generate(lengRekapitulasi, (_) => []);
                  listKode = List.generate(lengRekapitulasi, (_) => []);
                  listQty = List.generate(lengRekapitulasi, (_) => []);
                  listKonstanta = List.generate(lengRekapitulasi, (_) => []);

                  late int hi, hj;
                  late double hasilSubTotal;
                  late double hasilQty;
                  late int lengAnalisaFinTpBop;
                  late int lengAnalisaFinTpBop2;

                  for(int loop = 0 ; loop < 2 ; loop++){
                    for(int ki = 0 ; ki<lengRekapitulasi ; ki++){
                      lengAnalisaFinTpBop = rekapitulasi.data[ki].analisaFinTpBop!.length;
                      if (rekapitulasi.data[ki].analisaFinTpBop != []) {
                        for (int kj = 0; kj < lengAnalisaFinTpBop; kj++) {
                          if(loop == 0){
                            subTotal = double.parse(rekapitulasi.data[ki].analisaFinTpBop![kj].qty.toString()) * double.parse(rekapitulasi.data[ki].analisaFinTpBop![kj].unitPrice.toString()) * double.parse(rekapitulasi.data[ki].analisaFinTpBop![kj].konstanta.toString());
                        
                            listSubOverHead.add(subTotal);
                            listKodeOverHead.add(rekapitulasi.data[ki].analisaFinTpBop![kj].kodeItem.toString());
                            listQtyOverHead.add(double.parse(rekapitulasi.data[ki].analisaFinTpBop![kj].qty.toString()));
                            listKonstantaOverHead.add(rekapitulasi.data[ki].analisaFinTpBop![kj].konstanta.toString());

                            totalOverHead = totalOverHead + subTotal.round();
                          }
                          else{
                            hasilSubTotal = 0.0;
                            hasilQty = 0.0;
                            for(int i = ki ; i<lengRekapitulasi ; i++){
                              lengAnalisaFinTpBop2 = rekapitulasi.data[i].analisaFinTpBop!.length;
                              if (rekapitulasi.data[i].analisaFinTpBop != []) {
                                for (int j = kj; j < lengAnalisaFinTpBop2; j++) {
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
                          listSubTotal[ki].addAll(listSubOverHead);
                          listKode[ki].addAll(listKodeOverHead);
                          listQty[ki].addAll(listQtyOverHead);
                          listKonstanta[ki].addAll(listKonstantaOverHead);

                          listSubOverHead.clear();
                          listKodeOverHead.clear();
                          listQtyOverHead.clear();
                          listKonstantaOverHead.clear();
                        }
                      } 
                    }
                  }

                  grandTotalBiayaOverhead = totalOverHead.toString();
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                      CardExpansionDetail(
                        label: "List Biaya Overhead",
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
                                    for(int index = 0 ; index < rekapitulasi.data[i].analisaFinTpBop!.length ; index++)...[ 
                                      if(listSubTotal[i][index] != 0.0)...[
                                        CardItemExpansionDetail(
                                          child: ListTile(
                                            contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0), vertical: getProportionateScreenHeight(10.0)),
                                            title: HighlightItemName(
                                              child: Text(
                                                rekapitulasi.data[i].analisaFinTpBop![index].kodeItem.toString(),
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
                                                              child: Text(rekapitulasi.data[i].analisaFinTpBop![index].namaItem.toString(),
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
                                                                  double.parse(rekapitulasi.data[i].analisaFinTpBop![index].qty.toString()
                                                                  )
                                                                )+" "+
                                                                rekapitulasi.data[i].analisaFinTpBop![index].namaSatuan.toString(),
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
                                                                  double.parse(rekapitulasi.data[i].analisaFinTpBop![index].unitPrice.toString())
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
                                                                  double.parse(rekapitulasi.data[i].analisaFinTpBop![index].konstanta.toString())
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
                                                      double.parse(grandTotalBiayaOverhead
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