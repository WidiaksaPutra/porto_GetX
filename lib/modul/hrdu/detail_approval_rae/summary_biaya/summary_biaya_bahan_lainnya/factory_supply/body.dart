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
  late String grandTotalFactorySupply;
  late List listSubFactorySupply = [];
  late List listKodeFactorySupply = [];
  late List listQtyFactorySupply = [];
  late List listKonstantaFactorySupply = [];
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
                  num totalFactorySupply = 0;
                  num subTotal;
                  int lengRekapitulasi = rekapitulasi!.data.length;

                  listSubTotal = List.generate(lengRekapitulasi, (_) => []);
                  listKode = List.generate(lengRekapitulasi, (_) => []);
                  listQty = List.generate(lengRekapitulasi, (_) => []);
                  listKonstanta = List.generate(lengRekapitulasi, (_) => []);

                  // for(int i = 0 ; i<lengRekapitulasi ; i++){
                  //   int lengAnalisaFinTpFs = rekapitulasi.data[i].analisaFinTpFs!.length;
                  //   if (rekapitulasi.data[i].analisaFinTpFs!.isNotEmpty) {
                  //     for (int j = 0; j < lengAnalisaFinTpFs; j++) {
                  //       subTotal = double.parse(rekapitulasi.data[i].analisaFinTpFs![j].qty.toString()) * double.parse(rekapitulasi.data[i].analisaFinTpFs![j].unitPrice.toString()) * double.parse(rekapitulasi.data[i].analisaFinTpFs![j].konstanta.toString());
                        
                  //       listSubFactorySupply.add(subTotal);
                  //       listKodeFactorySupply.add(rekapitulasi.data[i].analisaFinTpFs![j].kodeItem.toString());
                  //       listQtyFactorySupply.add(double.parse(rekapitulasi.data[i].analisaFinTpFs![j].qty.toString()));
                  //       listKonstantaFactorySupply.add(rekapitulasi.data[i].analisaFinTpFs![j].konstanta.toString());

                  //       totalFactorySupply = totalFactorySupply + subTotal.round();
                  //     }
                  //     listSubTotal[i].addAll(listSubFactorySupply);
                  //     listKode[i].addAll(listKodeFactorySupply);
                  //     listQty[i].addAll(listQtyFactorySupply);
                  //     listKonstanta[i].addAll(listKonstantaFactorySupply);

                  //     listSubFactorySupply.clear();
                  //     listKodeFactorySupply.clear();
                  //     listQtyFactorySupply.clear();
                  //     listKonstantaFactorySupply.clear();
                  //   }
                  // }

                  late int hi, hj;
                  late double hasilSubTotal;
                  late double hasilQty;
                  late int lengAnalisaFinTpFs;
                  late int lengAnalisaFinTpFs2;

                  for(int loop = 0 ; loop < 2 ; loop++){
                    for(int ki = 0 ; ki<lengRekapitulasi ; ki++){
                      lengAnalisaFinTpFs = rekapitulasi.data[ki].analisaFinTpFs!.length;
                      if (rekapitulasi.data[ki].analisaFinTpFs != []) {
                        for (int kj = 0; kj < lengAnalisaFinTpFs; kj++) {
                          if(loop == 0){
                            subTotal = double.parse(rekapitulasi.data[ki].analisaFinTpFs![kj].qty.toString()) * double.parse(rekapitulasi.data[ki].analisaFinTpFs![kj].unitPrice.toString()) * double.parse(rekapitulasi.data[ki].analisaFinTpFs![kj].konstanta.toString());
                        
                            listSubFactorySupply.add(subTotal);
                            listKodeFactorySupply.add(rekapitulasi.data[ki].analisaFinTpFs![kj].kodeItem.toString());
                            listQtyFactorySupply.add(double.parse(rekapitulasi.data[ki].analisaFinTpFs![kj].qty.toString()));
                            listKonstantaFactorySupply.add(rekapitulasi.data[ki].analisaFinTpFs![kj].konstanta.toString());

                            totalFactorySupply = totalFactorySupply + subTotal.round();
                          }
                          else{
                            hasilSubTotal = 0.0;
                            hasilQty = 0.0;
                            for(int i = ki ; i<lengRekapitulasi ; i++){
                              lengAnalisaFinTpFs2 = rekapitulasi.data[i].analisaFinTpFs!.length;
                              if (rekapitulasi.data[i].analisaFinTpFs != []) {
                                for (int j = kj; j < lengAnalisaFinTpFs2; j++) {
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
                          listSubTotal[ki].addAll(listSubFactorySupply);
                          listKode[ki].addAll(listKodeFactorySupply);
                          listQty[ki].addAll(listQtyFactorySupply);
                          listKonstanta[ki].addAll(listKonstantaFactorySupply);

                          listSubFactorySupply.clear();
                          listKodeFactorySupply.clear();
                          listQtyFactorySupply.clear();
                          listKonstantaFactorySupply.clear();
                        }
                      } 
                    }
                  }
                  

                  //  print(listSubTotal);

                  grandTotalFactorySupply = totalFactorySupply.toString();
                  return Column(
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
                            itemCount: rekapitulasi.data.length,
                            itemBuilder: (context, i){
                              return Padding(
                                padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                                child: Column(
                                  children: [
                                    if(rekapitulasi.data[i].analisaFinTpFs != [])...[
                                      for(int index = 0 ; index < rekapitulasi.data[i].analisaFinTpFs!.length ; index++)...[ 
                                        if(listSubTotal[i][index] != 0.0)...[
                                          CardItemExpansionDetail(
                                            child: ListTile(
                                              contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0), vertical: getProportionateScreenHeight(10.0)),
                                              title: HighlightItemName(
                                                child: Text(
                                                  listKode[i][index].toString(),
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
                                                                    listQty[i][index]
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
                                                      double.parse(grandTotalFactorySupply
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