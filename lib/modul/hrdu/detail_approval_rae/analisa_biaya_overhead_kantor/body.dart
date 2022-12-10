
import 'package:mgp_mobile_app/model/hrdu/rae/analisa_single_rae.dart';
import 'package:mgp_mobile_app/model/hrdu/rae/detail_rae_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mgp_mobile_app/widget/component/card_expansion_detail.dart';
import 'package:mgp_mobile_app/widget/component/card_item_expansion_detail.dart';
import 'package:mgp_mobile_app/widget/component/highlight_item_name.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class Body extends StatefulWidget {
  final Future<AnalisaSingleRegrae> analisaSingleRegrae;
  final String totalAnalisaBahanBaku, totalAnalisaPenunjanProduksi, totalAnalisaFinishing, totalAnalisaAlatBantuOnSite, totalAnalisaLabourCostOnSite;
  const Body({Key? key, required this.analisaSingleRegrae, required this.totalAnalisaBahanBaku, required this.totalAnalisaPenunjanProduksi, required this.totalAnalisaFinishing, required this.totalAnalisaAlatBantuOnSite, required this.totalAnalisaLabourCostOnSite}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final formatCurrency = NumberFormat.currency(
    locale: 'ID',
    decimalDigits: 1,
    symbol: "Rp"
  );
  final formatDecimal = NumberFormat("###.######", "id_ID");
  final decimalFormat = NumberFormat("###", "id_ID");
  final List<String> errors = [];
  late Future<DetailRegrae> futureDetailRegrae;
  late String? tokens;
  bool visibilityPemeriksa = false;
  bool visibilityPengesah = false;
  late List subTotalBiayaOverheadKantor = [];
  // late String grandTotalBiayaOverheadKantor;

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
              future: widget.analisaSingleRegrae,
              builder: (BuildContext context, AsyncSnapshot<AnalisaSingleRegrae> snapshot) {
                if (snapshot.hasData) {
                 var analisaSingleRAE = snapshot.data;
                  // num totalBiayaOverheadKantor = 0;
                  num unitPrice = double.parse(widget.totalAnalisaBahanBaku.toString()) + double.parse(widget.totalAnalisaPenunjanProduksi.toString()) + double.parse(widget.totalAnalisaFinishing.toString()) + double.parse(widget.totalAnalisaAlatBantuOnSite) + double.parse(widget.totalAnalisaLabourCostOnSite);
                  if (analisaSingleRAE!.data!.analisaBiayaOverheadKantor!.isNotEmpty) {
                    for (var i = 0; i < analisaSingleRAE.data!.analisaBiayaOverheadKantor!.length; i++) {
                      num subTotal = double.parse(analisaSingleRAE.data!.analisaBiayaOverheadKantor![i].qty.toString()) * unitPrice * double.parse(analisaSingleRAE.data!.analisaBiayaOverheadKantor![i].konstanta.toString());
                      subTotalBiayaOverheadKantor.add(subTotal);
                      // totalBiayaOverheadKantor = totalBiayaOverheadKantor + subTotal;
                    }
                  }
                  print(subTotalBiayaOverheadKantor[0]);
                  // print(widget.totalAnalisaBahanBaku.toString());
                  // print(widget.totalAnalisaPenunjanProduksi.toString());
                  // print(widget.totalAnalisaFinishing.toString());
                  // print(unitPrice.round());
                  // grandTotalBiayaOverheadKantor = totalBiayaOverheadKantor.toString();
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
                          ListView.separated(
                            separatorBuilder: (context, index) => const Divider(
                              color: Colors.black,
                            ),
                            itemCount: analisaSingleRAE.data!.analisaBiayaOverheadKantor!.length,
                            itemBuilder: (context, index){
                              return Padding(
                                padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                                child: CardItemExpansionDetail(
                                  child: ListTile(
                                    contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0), vertical: getProportionateScreenHeight(10.0)),
                                    title: HighlightItemName(
                                      child: Text(
                                        analisaSingleRAE.data!.analisaBiayaOverheadKantor![index].kodeItem.toString(),
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
                                                      child: Text(analisaSingleRAE.data!.analisaBiayaOverheadKantor![index].namaItem.toString(),
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
                                                          double.parse(analisaSingleRAE.data!.analisaBiayaOverheadKantor![index].qty.toString()
                                                          )
                                                        )+" "+
                                                        analisaSingleRAE.data!.analisaBiayaOverheadKantor![index].namaSatuan.toString(),
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
                                                          double.parse(unitPrice.round().toString())
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
                                                          double.parse(analisaSingleRAE.data!.analisaBiayaOverheadKantor![index].konstanta.toString()
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
                                                          double.parse(subTotalBiayaOverheadKantor[index].toString())
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
                              );
                            },
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                          ),
                          // SizedBox(height: getProportionateScreenHeight(10)),
                          // Padding(
                          //   padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                          //   child: CardItemExpansionDetail(
                          //     child: ListTile(
                          //       title: Column(
                          //         children: <Widget>[
                          //           Row(
                          //             children: <Widget>[
                          //               Expanded(
                          //                 flex: 4,
                          //                 child: Column(
                          //                   crossAxisAlignment: CrossAxisAlignment.start,
                          //                   mainAxisAlignment: MainAxisAlignment.start,
                          //                   children: <Widget>[
                          //                     Padding(
                          //                       padding: const EdgeInsets.only(left: 0),
                          //                       child: Text("Grand Total",
                          //                         style: TextStyle(
                          //                           color: Colors.black,
                          //                           fontWeight: FontWeight.bold,
                          //                           fontSize: 14,
                          //                         ),
                          //                         textAlign: TextAlign.left,
                          //                       ),
                          //                     ),
                          //                   ],
                          //                 ),
                          //               ),
                          //               Expanded(
                          //                 flex: 6,
                          //                 child: Column(
                          //                   crossAxisAlignment: CrossAxisAlignment.end,
                          //                   mainAxisAlignment: MainAxisAlignment.end,
                          //                   children: <Widget>[
                          //                     Padding(
                          //                       padding: const EdgeInsets.only(right: 0),
                          //                       child: Text(
                          //                         formatCurrency.format(
                          //                             double.parse(grandTotalBiayaOverheadKantor
                          //                           )
                          //                         ),
                          //                         style: TextStyle(
                          //                           color: Colors.black,
                          //                           fontWeight: FontWeight.bold,
                          //                           fontSize: 14,
                          //                         ),
                          //                         textAlign: TextAlign.right,
                          //                       ),
                          //                     ),
                          //                   ],
                          //                 ),
                          //               ),
                          //             ],
                          //           ),
                          //         ],
                          //       ),
                          //     ),
                          //   ),
                          // ),
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