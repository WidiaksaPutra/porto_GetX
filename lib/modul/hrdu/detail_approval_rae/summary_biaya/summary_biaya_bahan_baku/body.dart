import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mgp_mobile_app/model/hrdu/rae/rekapitulasi.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_rae/summary_biaya/summary_biaya_bahan_baku/hardwood/hardwood.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_rae/summary_biaya/summary_biaya_bahan_baku/plywood/plywood.dart';
import 'package:mgp_mobile_app/widget/component/card_expansion_detail.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_format_currency.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_text.dart';
import 'package:mgp_mobile_app/widget/component/card_item_expansion_detail.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class Body extends StatelessWidget {
  final Future<Rekapitulasi> futureRekapitulasi;
  Body({Key? key, required this.futureRekapitulasi}) : super(key: key);

  // late Future<DetailRegrae> futureDetailRegrae;
  final formatCurrency = NumberFormat.currency(
    locale: 'ID',
    decimalDigits: 0,
    symbol: "Rp"
  );

  final formatDecimal = NumberFormat("###.######", "id_ID");

  final decimalFormat = NumberFormat("###", "id_ID");

  @override
  Widget build(BuildContext context) {

    late List subTotalHardwood = [];
    late List subTotalPlywood = [];
    num totalHardwood = 0;
    num totalPlywood = 0;
    num totalVolumeHardwood = 0;
    num totalVolumePlywood = 0;

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
                  for(int i = 0 ; i<rekapitulasi!.data.length ; i++){
                    if (rekapitulasi.data[i].analisaHardwood!.isNotEmpty) {
                      for (var j = 0; j < rekapitulasi.data[i].analisaHardwood!.length; j++) {
                        num volume = (double.parse(rekapitulasi.data[i].analisaHardwood![j].tRaw.toString()) * double.parse(rekapitulasi.data[i].analisaHardwood![j].wRaw.toString()) * double.parse(rekapitulasi.data[i].analisaHardwood![j].lRaw.toString()) * double.parse(rekapitulasi.data[i].analisaHardwood![j].qtyRaw.toString()))/1000000;
                        volume = (volume < 0.000001) ? 0.000001 : volume;
                        totalVolumeHardwood = totalVolumeHardwood + volume;
                        num subTotal = volume * double.parse(rekapitulasi.data[i].analisaHardwood![j].hargaSatuan.toString()) * double.parse(rekapitulasi.data[i].analisaHardwood![j].konstanta.toString());
                        totalHardwood = totalHardwood + subTotal.round();
                      }
                    }
                    if (rekapitulasi.data[i].analisaPlywood!.isNotEmpty) {
                      for (var j = 0; j < rekapitulasi.data[i].analisaPlywood!.length; j++) {
                        num volume = (double.parse(rekapitulasi.data[i].analisaPlywood![j].tRaw.toString()) * double.parse(rekapitulasi.data[i].analisaPlywood![j].wRaw.toString()) * double.parse(rekapitulasi.data[i].analisaPlywood![j].lRaw.toString()) * double.parse(rekapitulasi.data[i].analisaPlywood![j].qtyRaw.toString()))/1000000;
                        totalVolumePlywood = totalVolumePlywood + volume;
                        num subTotal = double.parse(rekapitulasi.data[i].analisaPlywood![j].unitPrice.toString()) * double.parse(rekapitulasi.data[i].analisaPlywood![j].qtyRaw.toString());
                        totalPlywood = totalPlywood + subTotal.round();
                      }
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
                        label: "Hardwood",
                        children: <Widget> [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                            child: CardItemExpansionDetail(
                              child: ListTile(
                                contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0), vertical: getProportionateScreenHeight(10.0)),
                                subtitle: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    CardFieldItemText(
                                      label: "Volume (m3)",
                                      contentData: totalVolumeHardwood.toString(),
                                      flexLeftRow: 12,
                                      flexRightRow: 20,
                                    ),
                                    CardFieldItemFormatCurrency(
                                      label: "Total Price (Rp)",
                                      contentData: totalHardwood.roundToDouble().toString(),
                                      flexLeftRow: 12,
                                      flexRightRow: 20,
                                    ),
                                  ],
                                ),
                                onTap: (){
                                  Get.to(Hardwood(futureRekapitulasi: futureRekapitulasi,));
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: getProportionateScreenHeight(10)),
                        ]
                      ),
                      CardExpansionDetail(
                        label: "Plywood",
                        children: <Widget> [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                            child: CardItemExpansionDetail(
                              child: ListTile(
                                contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0), vertical: getProportionateScreenHeight(10.0)),
                                subtitle: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    CardFieldItemText(
                                      label: "Volume (m3)",
                                      contentData: totalVolumePlywood.toString(),
                                      flexLeftRow: 12,
                                      flexRightRow: 20,
                                    ),
                                    CardFieldItemFormatCurrency(
                                      label: "Total Price (Rp)",
                                      contentData: totalPlywood.roundToDouble().toString(),
                                      flexLeftRow: 12,
                                      flexRightRow: 20,
                                    ),
                                  ],
                                ),
                                onTap: (){
                                  Get.to(Plywood(futureRekapitulasi: futureRekapitulasi,));
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: getProportionateScreenHeight(10)),
                        ]
                      ),
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