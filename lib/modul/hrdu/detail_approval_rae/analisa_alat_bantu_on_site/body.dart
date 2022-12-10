
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
  const Body({Key? key, required this.analisaSingleRegrae}) : super(key: key);

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
  // late String grandTotalAlatBantuOnSite;
  late List subTotalPrice = [];

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
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: FutureBuilder(
              future: widget.analisaSingleRegrae,
              builder: (BuildContext context,
                  AsyncSnapshot<AnalisaSingleRegrae> snapshot) {
                if (snapshot.hasData) {
                  var analisaSingleRAE = snapshot.data;

                  num totalHardwood = 0;
                  if (analisaSingleRAE!.data!.analisaHardwood!.isNotEmpty) {
                    for (var i = 0; i < analisaSingleRAE.data!.analisaHardwood!.length; i++) {
                      num countTotalUnit = ((double.parse(analisaSingleRAE.data!.analisaHardwood![i].qtyRaw.toString()) 
                      * double.parse(analisaSingleRAE.data!.analisaHardwood![i].tRaw.toString()) 
                      * double.parse(analisaSingleRAE.data!.analisaHardwood![i].wRaw.toString()) 
                      * double.parse(analisaSingleRAE.data!.analisaHardwood![i].lRaw.toString())) / 1000000);
                      num totalUnit = (countTotalUnit < 0.000001) ? 0.000001 : countTotalUnit;
                      num totalPrice = totalUnit * (double.parse(analisaSingleRAE.data!.analisaHardwood![i].unitPrice.toString()) 
                      * double.parse(analisaSingleRAE.data!.analisaHardwood![i].konstanta.toString()));
                      // print(totalPrice);
                      totalHardwood = totalHardwood + totalPrice.round();
                    }
                  }

                  num totalPlywood = 0;
                  if (analisaSingleRAE.data!.analisaPlywood!.isNotEmpty) {
                    for (var i = 0; i < analisaSingleRAE.data!.analisaPlywood!.length; i++) {
                      num total = (double.parse(analisaSingleRAE.data!.analisaPlywood![i].qtyRaw.toString()) 
                      * double.parse(analisaSingleRAE.data!.analisaPlywood![i].unitPrice.toString()) 
                      * double.parse(analisaSingleRAE.data!.analisaPlywood![i].konstanta.toString()));
                      totalPlywood = totalPlywood + total.round();
                    }
                  }

                  num unitPriceAlatBantuOnSite = totalHardwood + totalPlywood;

                  if (analisaSingleRAE.data!.analisaAlatBantuOnsite!.isNotEmpty) {
                    for (var i = 0; i < analisaSingleRAE.data!.analisaAlatBantuOnsite!.length; i++) {
                      num totalPrice = unitPriceAlatBantuOnSite.round() * double.parse(analisaSingleRAE.data!.analisaAlatBantuOnsite![i].qty.toString()) * 
                      double.parse(analisaSingleRAE.data!.analisaAlatBantuOnsite![i].konstanta.toString());
                      subTotalPrice.add(totalPrice);
                      // totalAlatBantuOnSite = totalAlatBantuOnSite + totalPrice;
                    }
                  }

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                      CardExpansionDetail(
                          label: "Alat Bantu On-Site",
                          children: <Widget>[
                            ListView.separated(
                              separatorBuilder: (context, index) => SizedBox(
                                height: getProportionateScreenHeight(10),
                              ),
                              itemCount: analisaSingleRAE.data!.analisaAlatBantuOnsite!.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                                  child: CardItemExpansionDetail(
                                    child: ListTile(
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: getProportionateScreenWidth(20.0),
                                          vertical: getProportionateScreenHeight(10.0)),
                                      title: HighlightItemName(
                                        child: Text( analisaSingleRAE.data!.analisaAlatBantuOnsite![index].kodeItem.toString(),
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      subtitle: Padding(
                                        padding: EdgeInsets.only(
                                          top: getProportionateScreenHeight(15)),
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
                                                        child: Text(
                                                          "Item Alat Bantu On-Site",
                                                          style: TextStyle(color: Colors.black),
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
                                                        child: const Text(":", style: TextStyle(color: Colors.black)),
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
                                                        child: Text( analisaSingleRAE.data!.analisaAlatBantuOnsite![index].namaItem.toString(),
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
                                                        padding: EdgeInsets.symmetric(
                                                          horizontal: getProportionateScreenWidth(10)),
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
                                                        child: Text(formatDecimal.format(double.parse(analisaSingleRAE.data!.analisaAlatBantuOnsite![index].qty.toString())) + " " + analisaSingleRAE.data!.analisaAlatBantuOnsite![index].namaSatuan.toString(),
                                                          style: const TextStyle(color: Colors.black,),
                                                          textAlign:TextAlign.left,
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
                                                      Padding(padding: EdgeInsets.symmetric(horizontal:getProportionateScreenWidth(10)),
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
                                                          formatCurrency.format(double.parse(unitPriceAlatBantuOnSite.toString())),
                                                          style: const TextStyle(color: Colors.black,),
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
                                                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: const <Widget>[
                                                      Padding( padding: EdgeInsets.only(left: 0),
                                                        child: Text("Konstanta",
                                                          style: TextStyle( color: Colors.black,),
                                                          textAlign: TextAlign.left,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 0,
                                                  child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: <Widget>[
                                                      Padding(padding:EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
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
                                                      Padding(padding: const EdgeInsets.only(left: 0),
                                                        child: Text(formatDecimal.format(double.parse(analisaSingleRAE.data!.analisaAlatBantuOnsite![index].konstanta.toString())),
                                                          style: const TextStyle(color: Colors.black),
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
                                                      Padding( padding:const EdgeInsets.only(left: 0),
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
                                                        child: Text(formatCurrency.format(double.parse(subTotalPrice[index].toString())),
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
                            //                             double.parse(grandTotalAlatBantuOnSite
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
                          ]),
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
