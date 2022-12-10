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
  final List<String> errors = [];
  late Future<Rekapitulasi> futureDetailRegrae;
  late String? tokens;
  late List subTotalHardwood = [];
  late List subLuaslHardwood = [];
  late List subVolumeHardwood = [];
  late String totalLuasHardwood;
  late String totalVolumeHardwood;
  late String grandTotalHardwood;
  late final listSubTotalHardwood;
  late final listSubVolumeHardwood;
  late final listSubLuaslHardwood;

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
                  num totalHardwood = 0;
                  num luasHardwood = 0;
                  num volumeHardwood = 0;

                  int lengRekapitulasi = rekapitulasi!.data.length;
                  listSubTotalHardwood = List.generate(lengRekapitulasi, (_) => []);
                  listSubVolumeHardwood = List.generate(lengRekapitulasi, (_) => []);
                  listSubLuaslHardwood = List.generate(lengRekapitulasi, (_) => []);

                  for(int i = 0 ; i < lengRekapitulasi; i++){
                    if (rekapitulasi.data[i].analisaHardwood!.isNotEmpty) {
                      for (var j = 0; j < rekapitulasi.data[i].analisaHardwood!.length; j++) {
                         num volume = (double.parse(rekapitulasi.data[i].analisaHardwood![j].tRaw.toString()) * double.parse(rekapitulasi.data[i].analisaHardwood![j].wRaw.toString()) * double.parse(rekapitulasi.data[i].analisaHardwood![j].lRaw.toString()) * double.parse(rekapitulasi.data[i].analisaHardwood![j].qtyRaw.toString()))/1000000;
                        volume = (volume < 0.000001) ? 0.000001 : volume;
                        volumeHardwood = volumeHardwood + volume;
                        subVolumeHardwood.add(volume);
                        num subTotal = volume * double.parse(rekapitulasi.data[i].analisaHardwood![j].hargaSatuan.toString()) * double.parse(rekapitulasi.data[i].analisaHardwood![j].konstanta.toString());
                        subTotalHardwood.add(subTotal);
                        totalHardwood = totalHardwood + subTotal.round();
                        if (rekapitulasi.data[i].analisaHardwood![j].namaTipeSisi.toString() == "4 Sisi (2TL + 2WL)") {
                          num tPlusW = (double.parse(rekapitulasi.data[i].analisaHardwood![j].tFinal.toString()) + double.parse(rekapitulasi.data[i].analisaHardwood![j].wFinal.toString()));
                          num luas = (tPlusW * 2 * double.parse(rekapitulasi.data[i].analisaHardwood![j].qtyFinal.toString()) * double.parse(rekapitulasi.data[i].analisaHardwood![j].lFinal.toString()))/10000;
                          subLuaslHardwood.add(luas);
                          luasHardwood = luasHardwood + luas;
                        } else if (rekapitulasi.data[i].analisaHardwood![j].namaTipeSisi.toString() == "3 Sisi Opsi 1 (2TL + WL)") {
                          num tPlusWPlusT = (double.parse(rekapitulasi.data[i].analisaHardwood![j].tFinal.toString()) + double.parse(rekapitulasi.data[i].analisaHardwood![j].wFinal.toString()) + double.parse(rekapitulasi.data[i].analisaHardwood![j].tFinal.toString()));
                          num luas = (tPlusWPlusT * double.parse(rekapitulasi.data[i].analisaHardwood![j].qtyFinal.toString()) * double.parse(rekapitulasi.data[i].analisaHardwood![j].lFinal.toString()))/10000;
                          subLuaslHardwood.add(luas);
                          luasHardwood = luasHardwood + luas;
                        } else if (rekapitulasi.data[i].analisaHardwood![j].namaTipeSisi.toString() == "3 Sisi Opsi 2 (TL + 2WL)") {
                          num tPlusWPlusW = (double.parse(rekapitulasi.data[i].analisaHardwood![j].tFinal.toString()) + double.parse(rekapitulasi.data[i].analisaHardwood![j].wFinal.toString()) + double.parse(rekapitulasi.data[i].analisaHardwood![j].wFinal.toString()));
                          num luas = (tPlusWPlusW * double.parse(rekapitulasi.data[i].analisaHardwood![j].qtyFinal.toString()) * double.parse(rekapitulasi.data[i].analisaHardwood![j].lFinal.toString()))/10000;
                          subLuaslHardwood.add(luas);
                          luasHardwood = luasHardwood + luas;
                        } else if (rekapitulasi.data[i].analisaHardwood![j].namaTipeSisi.toString() == "2 Sisi Opsi 1 (TL + WL)") {
                          num tPlusW = (double.parse(rekapitulasi.data[i].analisaHardwood![j].tFinal.toString()) + double.parse(rekapitulasi.data[i].analisaHardwood![j].wFinal.toString()));
                          num luas = (tPlusW * double.parse(rekapitulasi.data[i].analisaHardwood![j].qtyFinal.toString()) * double.parse(rekapitulasi.data[i].analisaHardwood![j].lFinal.toString()))/10000;
                          subLuaslHardwood.add(luas);
                          luasHardwood = luasHardwood + luas;
                        } else if (rekapitulasi.data[i].analisaHardwood![j].namaTipeSisi.toString() == "2 Sisi Opsi 2 (2TL)") {
                          num tPlusT = (double.parse(rekapitulasi.data[i].analisaHardwood![j].tFinal.toString()) + double.parse(rekapitulasi.data[i].analisaHardwood![j].tFinal.toString()));
                          num luas = (tPlusT * double.parse(rekapitulasi.data[i].analisaHardwood![j].qtyFinal.toString()) * double.parse(rekapitulasi.data[i].analisaHardwood![j].lFinal.toString()))/10000;
                          subLuaslHardwood.add(luas);
                          luasHardwood = luasHardwood + luas;
                        } else if (rekapitulasi.data[i].analisaHardwood![j].namaTipeSisi.toString() == "2 Sisi Opsi 3 (2WL)") {
                          num wPlusW = (double.parse(rekapitulasi.data[i].analisaHardwood![j].wFinal.toString()) + double.parse(rekapitulasi.data[i].analisaHardwood![j].wFinal.toString()));
                          num luas = (wPlusW * double.parse(rekapitulasi.data[i].analisaHardwood![j].qtyFinal.toString()) * double.parse(rekapitulasi.data[i].analisaHardwood![j].lFinal.toString()))/10000;
                          subLuaslHardwood.add(luas);
                          luasHardwood = luasHardwood + luas;
                        } else if (rekapitulasi.data[i].analisaHardwood![j].namaTipeSisi.toString() == "1 Sisi Opsi 1 (TL)") {
                          num luas = (double.parse(rekapitulasi.data[i].analisaHardwood![j].tFinal.toString()) * double.parse(rekapitulasi.data[i].analisaHardwood![j].qtyFinal.toString()) * double.parse(rekapitulasi.data[i].analisaHardwood![j].lFinal.toString()))/10000;
                          subLuaslHardwood.add(luas);
                          luasHardwood = luasHardwood + luas;
                        } else if (rekapitulasi.data[i].analisaHardwood![j].namaTipeSisi.toString() == "1 Sisi Opsi 2 (WL)") {
                          num luas = (double.parse(rekapitulasi.data[i].analisaHardwood![j].wFinal.toString()) * double.parse(rekapitulasi.data[i].analisaHardwood![j].qtyFinal.toString()) * double.parse(rekapitulasi.data[i].analisaHardwood![j].lFinal.toString()))/10000;
                          subLuaslHardwood.add(luas);
                          luasHardwood = luasHardwood + luas;
                        } else {
                          num luas = 0;
                          subLuaslHardwood.add(luas);
                          luasHardwood = luasHardwood + luas;
                        }
                      }
                    }
                    
                    listSubTotalHardwood[i].addAll(subTotalHardwood);
                    listSubVolumeHardwood[i].addAll(subVolumeHardwood);
                    listSubLuaslHardwood[i].addAll(subLuaslHardwood);

                    subTotalHardwood.clear();
                    subVolumeHardwood.clear();
                    subLuaslHardwood.clear();

                  }
                  grandTotalHardwood = totalHardwood.toString();
                  
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
                          ListView.builder(
                            itemCount: rekapitulasi.data.length,
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
                                                                    double.parse(listSubLuaslHardwood[i][index].toString()
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
                                                                    double.parse(listSubVolumeHardwood[i][index].toString()
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
                                                                    double.parse(listSubTotalHardwood[i][index].toString())
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
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(left: 0),
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
                                                      double.parse(grandTotalHardwood.toString()
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