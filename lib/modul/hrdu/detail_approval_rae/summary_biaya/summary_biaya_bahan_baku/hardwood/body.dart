import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/marketing/rae/mixin_rae.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/marketing/rae/rekapitulasi/getX_hardwood.dart';
import 'package:mgp_mobile_app/model/hrdu/rae/rekapitulasi.dart';
import 'package:mgp_mobile_app/widget/component/card_expansion_detail.dart';
import 'package:mgp_mobile_app/widget/component/card_item_expansion_detail.dart';
import 'package:mgp_mobile_app/widget/component/highlight_item_name.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class Body extends StatelessWidget with RaeRekapitulasi{
  final String idRae;
  Body({Key? key, required this.idRae}) : super(key: key);
  late Future<Rekapitulasi> futureSumaryHardwood = fetchDataRaeRekapitulasi(idRaeDetail: idRae);

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
              future: futureSumaryHardwood,
              builder: (BuildContext context, AsyncSnapshot<Rekapitulasi> snapshot) {
                if (snapshot.hasData) {
                  var rekapitulasi = snapshot.data;
                  return GetBuilder<GetxHardwoodRae>(
                    init: GetxHardwoodRae(),
                    builder:(controller) => Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: getProportionateScreenHeight(10),
                        ),
                        CardExpansionDetail(
                          label: "Hardwood",
                          children: <Widget> [
                            ListView.builder(
                              itemCount: rekapitulasi!.data.length,
                              itemBuilder: (context, i){
                              return Padding(
                                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                                  child: Column(
                                    children: [
                                      if(rekapitulasi.data[i].analisaHardwood!.isNotEmpty)...[
                                        for(int index = 0 ; index < rekapitulasi.data[i].analisaHardwood!.length ; index++)...[ 
                                            CardItemExpansionDetail(
                                              child: ListTile(
                                                contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0), vertical: getProportionateScreenHeight(10.0)),
                                                title: HighlightItemName(
                                                  child: Text(
                                                    rekapitulasi.data[i].analisaHardwood![index].deskripsi.toString(),
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
                                                            flex: 15,
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              children: const <Widget>[
                                                                Padding(
                                                                  padding: const EdgeInsets.only(left: 0),
                                                                  child: Text("Spesifikasi Kayu",
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
                                                                  child: Text(rekapitulasi.data[i].analisaHardwood![index].namaJenisKayu.toString(),
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
                                                            flex: 15,
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              children: const <Widget>[
                                                                Padding(
                                                                  padding: const EdgeInsets.only(left: 0),
                                                                  child: Text("Part Kayu",
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
                                                                  child: Text(rekapitulasi.data[i].analisaHardwood![index].namaPartKayu.toString(),
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
                                                            flex: 15,
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              children: const <Widget>[
                                                                Padding(
                                                                  padding: const EdgeInsets.only(left: 0),
                                                                  child: Text("Tipe Finishing",
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
                                                                  child: (rekapitulasi.data[i].analisaHardwood![index].namaFinishingBarangJadi != null)
                                                                  ? Text(rekapitulasi.data[i].analisaHardwood![index].namaFinishingBarangJadi.toString(),
                                                                    style: const TextStyle(
                                                                      color: Colors.black,
                                                                    ),
                                                                    textAlign: TextAlign.left,
                                                                  )
                                                                  : const Text("Tanpa Finishing",
                                                                    style: TextStyle(
                                                                      color: Colors.black
                                                                    ),
                                                                    textAlign: TextAlign.left,
                                                                  )
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
                                                            flex: 15,
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              children: const <Widget>[
                                                                Padding(
                                                                  padding: const EdgeInsets.only(left: 0),
                                                                  child: Text("Tipe Sisi",
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
                                                                  child: Text(rekapitulasi.data[i].analisaHardwood![index].namaTipeSisi.toString(),
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
                                                            flex: 15,
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              children: const <Widget>[
                                                                Padding(
                                                                  padding: const EdgeInsets.only(left: 0),
                                                                  child: Text("Qty Final",
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
                                                                      double.parse(rekapitulasi.data[i].analisaHardwood![index].qtyFinal.toString()
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
                                                            flex: 15,
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              children: const <Widget>[
                                                                Padding(
                                                                  padding: const EdgeInsets.only(left: 0),
                                                                  child: Text("T x W x L (Final cm)",
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
                                                                      double.parse(rekapitulasi.data[i].analisaHardwood![index].tFinal.toString()
                                                                      )
                                                                    )+" x "+
                                                                    formatDecimal.format(
                                                                      double.parse(rekapitulasi.data[i].analisaHardwood![index].wFinal.toString()
                                                                      )
                                                                    )+" x "+
                                                                    formatDecimal.format(
                                                                      double.parse(rekapitulasi.data[i].analisaHardwood![index].lFinal.toString()
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
                                                            flex: 15,
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              children: const <Widget>[
                                                                Padding(
                                                                  padding: const EdgeInsets.only(left: 0),
                                                                  child: Text("Qty Raw",
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
                                                                      double.parse(rekapitulasi.data[i].analisaHardwood![index].qtyRaw.toString()
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
                                                            flex: 15,
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              children: const <Widget>[
                                                                Padding(
                                                                  padding: const EdgeInsets.only(left: 0),
                                                                  child: Text("T x W x L (Raw cm)",
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
                                                                      double.parse(rekapitulasi.data[i].analisaHardwood![index].tRaw.toString()
                                                                      )
                                                                    )+" x "+
                                                                    formatDecimal.format(
                                                                      double.parse(rekapitulasi.data[i].analisaHardwood![index].wRaw.toString()
                                                                      )
                                                                    )+" x "+
                                                                    formatDecimal.format(
                                                                      double.parse(rekapitulasi.data[i].analisaHardwood![index].lRaw.toString()
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
                                                            flex: 15,
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              children: const <Widget>[
                                                                Padding(
                                                                  padding: const EdgeInsets.only(left: 0),
                                                                  child: Text("Luas (m2)",
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
                                                                      double.parse(controller.listSubTotalHardwood[i][index].toString()
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
                                                            flex: 15,
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              children: const <Widget>[
                                                                Padding(
                                                                  padding: const EdgeInsets.only(left: 0),
                                                                  child: Text("Volume (m3)",
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
                                                                      double.parse(controller.listSubVolumeHardwood[i][index].toString()
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
                                                            flex: 15,
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
                                                                      double.parse(rekapitulasi.data[i].analisaHardwood![index].unitPrice.toString())
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
                                                            flex: 15,
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
                                                                      double.parse(rekapitulasi.data[i].analisaHardwood![index].konstanta.toString()
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
                                                            flex: 15,
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
                                                                      double.parse(controller.listSubTotalHardwood[i][index].toString())
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
                            Container(
                              width: double.infinity,
                              height: getProportionateScreenHeight(15),
                              decoration: BoxDecoration(
                                border: Border(
                                  top: BorderSide(
                                    width: getProportionateScreenWidth(2),
                                    color: const Color.fromRGBO(246, 246, 246, 1)
                                  ),
                                  bottom: BorderSide(
                                    width: getProportionateScreenWidth(2),
                                    color: const Color.fromRGBO(246, 246, 246, 1)
                                  )
                                )
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10), vertical: getProportionateScreenHeight(10)),
                              child: CardItemExpansionDetail(
                                child: ListTile(
                                  contentPadding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10), horizontal: getProportionateScreenWidth(10)),
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
                                                        double.parse(controller.grandTotalHardwood.value.toString()
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