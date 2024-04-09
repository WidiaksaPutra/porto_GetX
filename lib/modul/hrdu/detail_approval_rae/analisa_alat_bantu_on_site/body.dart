import 'package:get/get.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/marketing/rae/analisa_barang_jadi/getX_alat_bantu_on-site.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/marketing/rae/mixin_rae.dart';
import 'package:mgp_mobile_app/model/hrdu/rae/analisa_single_rae.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mgp_mobile_app/widget/component/card_expansion_detail.dart';
import 'package:mgp_mobile_app/widget/component/card_item_expansion_detail.dart';
import 'package:mgp_mobile_app/widget/component/highlight_item_name.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class Body extends StatefulWidget {
  final String idRaeDetail;
  const Body({Key? key, required this.idRaeDetail}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> with RaeDetail{
  late Future<AnalisaSingleRegrae> futureAlatBantuOnSite = fetchDataRAEDetail(idRaeDetail: widget.idRaeDetail);
  final formatCurrency = NumberFormat.currency(
    locale: 'ID', 
    decimalDigits: 1, 
    symbol: "Rp"
  );
  final formatDecimal = NumberFormat("###.######", "id_ID");

  @override
  Widget build(BuildContext context) {
    Get.put(GetxAlatBantuOnSiteRae()).alatBantuOnSiteRae(widget.idRaeDetail.toString());
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: FutureBuilder(
              future: futureAlatBantuOnSite,
              builder: (BuildContext context,
                AsyncSnapshot<AnalisaSingleRegrae> snapshot) {
                if (snapshot.hasData) {
                  var analisaSingleRAE = futureDetailRae!.data;
                  return GetBuilder<GetxAlatBantuOnSiteRae>(
                    init: GetxAlatBantuOnSiteRae(),
                    builder:(controller) => Column(
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
                                itemCount: analisaSingleRAE!.analisaAlatBantuOnsite!.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                                    child: CardItemExpansionDetail(
                                      child: ListTile(
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: getProportionateScreenWidth(20.0),
                                            vertical: getProportionateScreenHeight(10.0)),
                                        title: HighlightItemName(
                                          child: Text( analisaSingleRAE.analisaAlatBantuOnsite![index].kodeItem.toString(),
                                            style: const TextStyle(
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
                                                          child: Text( analisaSingleRAE.analisaAlatBantuOnsite![index].namaItem.toString(),
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
                                                          child: Text(formatDecimal.format(double.parse(analisaSingleRAE.analisaAlatBantuOnsite![index].qty.toString())) + " " + analisaSingleRAE.analisaAlatBantuOnsite![index].namaSatuan.toString(),
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
                                                            formatCurrency.format(double.parse(controller.unitPriceAlatBantuOnSite.value.toString())),
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
                                                          child: Text(formatDecimal.format(double.parse(analisaSingleRAE.analisaAlatBantuOnsite![index].konstanta.toString())),
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
                                                          child: Text(formatCurrency.format(double.parse(controller.subTotalPrice[index].toString())),
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
