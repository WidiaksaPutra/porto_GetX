import 'package:mgp_mobile_app/model/hrdu/rae/analisa_single_rae.dart';
import 'package:mgp_mobile_app/model/hrdu/rae/detail_rae_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mgp_mobile_app/widget/component/card_expansion_detail.dart';
import 'package:mgp_mobile_app/widget/component/card_item_expansion_detail.dart';
import 'package:mgp_mobile_app/widget/component/highlight_item_name.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class BodyFinihingRae extends StatefulWidget {
  final Future<AnalisaSingleRegrae> analisaSingleRegrae;
  final String namaFinishing;
  const BodyFinihingRae({Key? key, required this.analisaSingleRegrae, required this.namaFinishing}) : super(key: key);
  @override
  _BodyFinihingRaeState createState() => _BodyFinihingRaeState();
}

class _BodyFinihingRaeState extends State<BodyFinihingRae> {
  final formatCurrency = NumberFormat.currency(
    locale: 'ID',
    decimalDigits: 1,
    symbol: "Rp"
  );
  final formatDecimal = NumberFormat("###.######", "id_ID");
  final decimalFormat = NumberFormat("###", "id_ID");
  late List subTotalHargaRAE = [];
  late List subTotalHargaPrelim = [];
  late List totalHargaPrelim = [];
  late String grandTotalPrelim;
  late String grandTotalHargaRAE;
  final List<String> errors = [];
  late Future<DetailRegrae> futureDetailRegrae;
  late String? tokens;
  bool visibilityPemeriksa = false;
  bool visibilityPengesah = false;
  late List subTotalFactorySupply = [];
  late List subTotalLabourCost = [];
  late List subTotalMachineProcess = [];
  late List subTotalBiayaOverhead = [];
  late String grandTotalFactorySupply;
  late String grandTotalLabourCost;
  late String grandTotalMachineProcess;
  late List listLuaslHardwood = [];
  late List listLuasPlywood = [];
  final List<int> indexanalisaFinFnBp = [];
  final List<int> indexanalisaFinFnSc = [];
  final List<int> indexanalisaFinFnLc = [];
  
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
                  num totalFactorySupply = 0;
                  num totalLabourCost = 0;
                  num totalMachineProcess = 0;
                  num luasHardwood = 0;
                  num luasPlywood = 0;
                  indexanalisaFinFnBp.clear();
                  indexanalisaFinFnSc.clear();
                  indexanalisaFinFnLc.clear();

                  if (analisaSingleRAE!.data!.analisaFinFnBp!.isNotEmpty) {//analisa_fin_fn_bp
                    for (var i = 0; i < analisaSingleRAE.data!.analisaFinFnBp!.length; i++) {
                      if(widget.namaFinishing.toString().contains(analisaSingleRAE.data!.analisaFinFnBp![i].namaFinishingBarangJadi.toString())){
                        indexanalisaFinFnBp.add(i);
                        num subTotal = double.parse(analisaSingleRAE.data!.analisaFinFnBp![i].qty.toString()) * double.parse(analisaSingleRAE.data!.analisaFinFnBp![i].unitPrice.toString()) * double.parse(analisaSingleRAE.data!.analisaFinFnBp![i].konstanta.toString());
                        subTotalFactorySupply.add(subTotal);
                        totalFactorySupply = totalFactorySupply + subTotal.round();
                      }
                    }
                  }
                  if (analisaSingleRAE.data!.analisaFinFnSc!.isNotEmpty) {//analisa_fin_fn_sc
                    for (var i = 0; i < analisaSingleRAE.data!.analisaFinFnSc!.length; i++) {
                      if(widget.namaFinishing.toString().contains(analisaSingleRAE.data!.analisaFinFnSc![i].namaFinishingBarangJadi.toString())){
                        indexanalisaFinFnSc.add(i);
                        num subTotal = double.parse(analisaSingleRAE.data!.analisaFinFnSc![i].qty.toString()) * double.parse(analisaSingleRAE.data!.analisaFinFnSc![i].unitPrice.toString()) * double.parse(analisaSingleRAE.data!.analisaFinFnSc![i].konstanta.toString());
                        subTotalLabourCost.add(subTotal);
                        totalLabourCost = totalLabourCost + subTotal.round();
                      }
                    }
                  }
                  if (analisaSingleRAE.data!.analisaFinFnLc!.isNotEmpty) {//analisa_fin_fn_lc
                    for (var i = 0; i < analisaSingleRAE.data!.analisaFinFnLc!.length; i++) {
                      if(widget.namaFinishing.toString().contains(analisaSingleRAE.data!.analisaFinFnLc![i].namaFinishingBarangJadi.toString())){
                        indexanalisaFinFnLc.add(i);
                        num subTotal = double.parse(analisaSingleRAE.data!.analisaFinFnLc![i].qty.toString()) * double.parse(analisaSingleRAE.data!.analisaFinFnLc![i].unitPrice.toString()) * double.parse(analisaSingleRAE.data!.analisaFinFnLc![i].konstanta.toString());
                        subTotalMachineProcess.add(subTotal);
                        totalMachineProcess = totalMachineProcess + subTotal.round();
                      }
                    }
                  }

                  if (analisaSingleRAE.data!.analisaHardwood!.isNotEmpty) {
                    for (var i = 0; i < analisaSingleRAE.data!.analisaHardwood!.length; i++) {
                      if(analisaSingleRAE.data!.analisaHardwood![i].namaFinishingBarangJadi.toString().contains(widget.namaFinishing.toString())){
                        if (analisaSingleRAE.data!.analisaHardwood![i].namaTipeSisi.toString() == "4 Sisi (2TL + 2WL)") {
                          num tPlusW = (double.parse(analisaSingleRAE.data!.analisaHardwood![i].tFinal.toString()) + double.parse(analisaSingleRAE.data!.analisaHardwood![i].wFinal.toString()));
                          num luas = (tPlusW * 2 * double.parse(analisaSingleRAE.data!.analisaHardwood![i].qtyFinal.toString()) * double.parse(analisaSingleRAE.data!.analisaHardwood![i].lFinal.toString()))/10000;
                          listLuaslHardwood.add(luas);
                          luasHardwood = luasHardwood + luas;
                        } else if (analisaSingleRAE.data!.analisaHardwood![i].namaTipeSisi.toString() == "3 Sisi Opsi 1 (2TL + WL)") {
                          num tPlusWPlusT = (double.parse(analisaSingleRAE.data!.analisaHardwood![i].tFinal.toString()) + double.parse(analisaSingleRAE.data!.analisaHardwood![i].wFinal.toString()) + double.parse(analisaSingleRAE.data!.analisaHardwood![i].tFinal.toString()));
                          num luas = (tPlusWPlusT * double.parse(analisaSingleRAE.data!.analisaHardwood![i].qtyFinal.toString()) * double.parse(analisaSingleRAE.data!.analisaHardwood![i].lFinal.toString()))/10000;
                          listLuaslHardwood.add(luas);
                          luasHardwood = luasHardwood + luas;
                        } else if (analisaSingleRAE.data!.analisaHardwood![i].namaTipeSisi.toString() == "3 Sisi Opsi 2 (TL + 2WL)") {
                          num tPlusWPlusW = (double.parse(analisaSingleRAE.data!.analisaHardwood![i].tFinal.toString()) + double.parse(analisaSingleRAE.data!.analisaHardwood![i].wFinal.toString()) + double.parse(analisaSingleRAE.data!.analisaHardwood![i].wFinal.toString()));
                          num luas = (tPlusWPlusW * double.parse(analisaSingleRAE.data!.analisaHardwood![i].qtyFinal.toString()) * double.parse(analisaSingleRAE.data!.analisaHardwood![i].lFinal.toString()))/10000;
                          listLuaslHardwood.add(luas);
                          luasHardwood = luasHardwood + luas;
                        } else if (analisaSingleRAE.data!.analisaHardwood![i].namaTipeSisi.toString() == "2 Sisi Opsi 1 (TL + WL)") {
                          num tPlusW = (double.parse(analisaSingleRAE.data!.analisaHardwood![i].tFinal.toString()) + double.parse(analisaSingleRAE.data!.analisaHardwood![i].wFinal.toString()));
                          num luas = (tPlusW * double.parse(analisaSingleRAE.data!.analisaHardwood![i].qtyFinal.toString()) * double.parse(analisaSingleRAE.data!.analisaHardwood![i].lFinal.toString()))/10000;
                          listLuaslHardwood.add(luas);
                          luasHardwood = luasHardwood + luas;
                        } else if (analisaSingleRAE.data!.analisaHardwood![i].namaTipeSisi.toString() == "2 Sisi Opsi 2 (2TL)") {
                          num tPlusT = (double.parse(analisaSingleRAE.data!.analisaHardwood![i].tFinal.toString()) + double.parse(analisaSingleRAE.data!.analisaHardwood![i].tFinal.toString()));
                          num luas = (tPlusT * double.parse(analisaSingleRAE.data!.analisaHardwood![i].qtyFinal.toString()) * double.parse(analisaSingleRAE.data!.analisaHardwood![i].lFinal.toString()))/10000;
                          listLuaslHardwood.add(luas);
                          luasHardwood = luasHardwood + luas;
                        } else if (analisaSingleRAE.data!.analisaHardwood![i].namaTipeSisi.toString() == "2 Sisi Opsi 3 (2WL)") {
                          num wPlusW = (double.parse(analisaSingleRAE.data!.analisaHardwood![i].wFinal.toString()) + double.parse(analisaSingleRAE.data!.analisaHardwood![i].wFinal.toString()));
                          num luas = (wPlusW * double.parse(analisaSingleRAE.data!.analisaHardwood![i].qtyFinal.toString()) * double.parse(analisaSingleRAE.data!.analisaHardwood![i].lFinal.toString()))/10000;
                          listLuaslHardwood.add(luas);
                          luasHardwood = luasHardwood + luas;
                        } else if (analisaSingleRAE.data!.analisaHardwood![i].namaTipeSisi.toString() == "1 Sisi Opsi 1 (TL)") {
                          num luas = (double.parse(analisaSingleRAE.data!.analisaHardwood![i].tFinal.toString()) * double.parse(analisaSingleRAE.data!.analisaHardwood![i].qtyFinal.toString()) * double.parse(analisaSingleRAE.data!.analisaHardwood![i].lFinal.toString()))/10000;
                          listLuaslHardwood.add(luas);
                          luasHardwood = luasHardwood + luas;
                        } else if (analisaSingleRAE.data!.analisaHardwood![i].namaTipeSisi.toString() == "1 Sisi Opsi 2 (WL)") {
                          num luas = (double.parse(analisaSingleRAE.data!.analisaHardwood![i].wFinal.toString()) * double.parse(analisaSingleRAE.data!.analisaHardwood![i].qtyFinal.toString()) * double.parse(analisaSingleRAE.data!.analisaHardwood![i].lFinal.toString()))/10000;
                          listLuaslHardwood.add(luas);
                          luasHardwood = luasHardwood + luas;
                        } else {
                          num luas = 0;
                          listLuaslHardwood.add(luas);
                          luasHardwood = luasHardwood + luas;
                        }
                      }
                    }
                  }

                  if (analisaSingleRAE.data!.analisaPlywood!.isNotEmpty) {
                    for (var i = 0; i < analisaSingleRAE.data!.analisaPlywood!.length; i++) {
                      if(analisaSingleRAE.data!.analisaPlywood![i].namaFinishingBarangJadi.toString().contains(widget.namaFinishing.toString())){
                        if (analisaSingleRAE.data!.analisaPlywood![i].namaTipeSisi.toString() == "4 Sisi (2TL + 2WL)") {
                          num tPlusW = (double.parse(analisaSingleRAE.data!.analisaPlywood![i].tRaw.toString()) + double.parse(analisaSingleRAE.data!.analisaPlywood![i].wRaw.toString()));
                          num luas = (tPlusW * 2 * double.parse(analisaSingleRAE.data!.analisaPlywood![i].qtyRaw.toString()) * double.parse(analisaSingleRAE.data!.analisaPlywood![i].lRaw.toString()))/10000;
                          listLuasPlywood.add(luas);
                          luasPlywood = luasPlywood + luas;
                        } else if (analisaSingleRAE.data!.analisaPlywood![i].namaTipeSisi.toString() == "3 Sisi Opsi 1 (2TL + WL)") {
                          num tPlusWPlusT = (double.parse(analisaSingleRAE.data!.analisaPlywood![i].tRaw.toString()) + double.parse(analisaSingleRAE.data!.analisaPlywood![i].wRaw.toString()) + double.parse(analisaSingleRAE.data!.analisaPlywood![i].tRaw.toString()));
                          num luas = (tPlusWPlusT * double.parse(analisaSingleRAE.data!.analisaPlywood![i].qtyRaw.toString()) * double.parse(analisaSingleRAE.data!.analisaPlywood![i].lRaw.toString()))/10000;
                          listLuasPlywood.add(luas);
                          luasPlywood = luasPlywood + luas;
                        } else if (analisaSingleRAE.data!.analisaPlywood![i].namaTipeSisi.toString() == "3 Sisi Opsi 2 (TL + 2WL)") {
                          num tPlusWPlusW = (double.parse(analisaSingleRAE.data!.analisaPlywood![i].tRaw.toString()) + double.parse(analisaSingleRAE.data!.analisaPlywood![i].wRaw.toString()) + double.parse(analisaSingleRAE.data!.analisaPlywood![i].wRaw.toString()));
                          num luas = (tPlusWPlusW * double.parse(analisaSingleRAE.data!.analisaPlywood![i].qtyRaw.toString()) * double.parse(analisaSingleRAE.data!.analisaPlywood![i].lRaw.toString()))/10000;
                          listLuasPlywood.add(luas);
                          luasPlywood = luasPlywood + luas;
                        } else if (analisaSingleRAE.data!.analisaPlywood![i].namaTipeSisi.toString() == "2 Sisi Opsi 1 (TL + WL)") {
                          num tPlusW = (double.parse(analisaSingleRAE.data!.analisaPlywood![i].tRaw.toString()) + double.parse(analisaSingleRAE.data!.analisaPlywood![i].wRaw.toString()));
                          num luas = (tPlusW * double.parse(analisaSingleRAE.data!.analisaPlywood![i].qtyRaw.toString()) * double.parse(analisaSingleRAE.data!.analisaPlywood![i].lRaw.toString()))/10000;
                          listLuasPlywood.add(luas);
                          luasPlywood = luasPlywood + luas;
                        } else if (analisaSingleRAE.data!.analisaPlywood![i].namaTipeSisi.toString() == "2 Sisi Opsi 2 (2TL)") {
                          num tPlusT = (double.parse(analisaSingleRAE.data!.analisaPlywood![i].tRaw.toString()) + double.parse(analisaSingleRAE.data!.analisaPlywood![i].tRaw.toString()));
                          num luas = (tPlusT * double.parse(analisaSingleRAE.data!.analisaPlywood![i].qtyRaw.toString()) * double.parse(analisaSingleRAE.data!.analisaPlywood![i].lRaw.toString()))/10000;
                          listLuasPlywood.add(luas);
                          luasPlywood = luasPlywood + luas;
                        } else if (analisaSingleRAE.data!.analisaPlywood![i].namaTipeSisi.toString() == "2 Sisi Opsi 3 (2WL)") {
                          num wPlusW = (double.parse(analisaSingleRAE.data!.analisaPlywood![i].wRaw.toString()) + double.parse(analisaSingleRAE.data!.analisaPlywood![i].wRaw.toString()));
                          num luas = (wPlusW * double.parse(analisaSingleRAE.data!.analisaPlywood![i].qtyRaw.toString()) * double.parse(analisaSingleRAE.data!.analisaPlywood![i].lRaw.toString()))/10000;
                          listLuasPlywood.add(luas);
                          luasPlywood = luasPlywood + luas;
                        } else if (analisaSingleRAE.data!.analisaPlywood![i].namaTipeSisi.toString() == "1 Sisi Opsi 1 (TL)") {
                          num luas = (double.parse(analisaSingleRAE.data!.analisaPlywood![i].tRaw.toString()) * double.parse(analisaSingleRAE.data!.analisaPlywood![i].qtyRaw.toString()) * double.parse(analisaSingleRAE.data!.analisaPlywood![i].lRaw.toString()))/10000;
                          listLuasPlywood.add(luas);
                          luasPlywood = luasPlywood + luas;
                        } else if (analisaSingleRAE.data!.analisaPlywood![i].namaTipeSisi.toString() == "1 Sisi Opsi 2 (WL)") {
                          num luas = (double.parse(analisaSingleRAE.data!.analisaPlywood![i].wRaw.toString()) * double.parse(analisaSingleRAE.data!.analisaPlywood![i].qtyRaw.toString()) * double.parse(analisaSingleRAE.data!.analisaPlywood![i].lRaw.toString()))/10000;
                          listLuasPlywood.add(luas);
                          luasPlywood = luasPlywood + luas;
                        } else {
                          num luas = 0;
                          listLuasPlywood.add(luas);
                          luasPlywood = luasPlywood + luas;
                        }
                      }
                    }
                  }

                  num totalLuasPermukaan = luasHardwood + luasPlywood;
                  grandTotalFactorySupply = totalFactorySupply.toString();
                  grandTotalLabourCost = totalLabourCost.toString();
                  grandTotalMachineProcess = totalMachineProcess.toString();
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                      CardExpansionDetail(
                        label: "Total Luas Permukaan",
                        children: <Widget> [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                            child: CardItemExpansionDetail(
                              child: SizedBox(
                                width: double.infinity,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10), vertical: getProportionateScreenHeight(10)),
                                  child: Text(
                                    "${totalLuasPermukaan.toString()} (m2)",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                    textAlign: TextAlign.left,
                                  )
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: getProportionateScreenHeight(10)),
                        ],
                      ),
                      CardExpansionDetail(
                        label: "List Item Bahan Penunjang Finishing",
                        children: <Widget> [
                          ListView.separated(
                            separatorBuilder: (context, index) => SizedBox(
                              height: getProportionateScreenHeight(10),
                            ),
                            itemCount: indexanalisaFinFnBp.length,
                            itemBuilder: (context, index){
                              return Column(
                                children: [
                                  if(analisaSingleRAE.data!.analisaFinFnBp![indexanalisaFinFnBp[index]].namaFinishingBarangJadi.toString().contains(widget.namaFinishing.toString()))...[
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                                      child: CardItemExpansionDetail(
                                        child: ListTile(
                                          contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0), vertical: getProportionateScreenHeight(10.0)),
                                          title: HighlightItemName(
                                            child: Text(
                                              analisaSingleRAE.data!.analisaFinFnBp![indexanalisaFinFnBp[index]].kodeItem.toString(),
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
                                                            child: Text(analisaSingleRAE.data!.analisaFinFnBp![indexanalisaFinFnBp[index]].namaItem.toString(),
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
                                                                double.parse(analisaSingleRAE.data!.analisaFinFnBp![indexanalisaFinFnBp[index]].qty.toString()
                                                                )
                                                              )+" "+
                                                              analisaSingleRAE.data!.analisaFinFnBp![indexanalisaFinFnBp[index]].namaSatuan.toString(),
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
                                                                double.parse(analisaSingleRAE.data!.analisaFinFnBp![indexanalisaFinFnBp[index]].unitPrice.toString())
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
                                                                double.parse(analisaSingleRAE.data!.analisaFinFnBp![indexanalisaFinFnBp[index]].konstanta.toString()
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
                                                                double.parse(subTotalFactorySupply[index].toString())
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
                                    ),
                                  ],
                                ],
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
                                                      double.parse(grandTotalFactorySupply
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
                      CardExpansionDetail(
                        label: "List Item Subkon Finishing",
                        children: <Widget> [
                          ListView.separated(
                            separatorBuilder: (context, index) => SizedBox(
                              height: getProportionateScreenHeight(10),
                            ),
                            itemCount: indexanalisaFinFnSc.length,
                            itemBuilder: (context, index){
                              return Column(
                                children: [
                                  if(widget.namaFinishing.toString().contains(analisaSingleRAE.data!.analisaFinFnSc![indexanalisaFinFnSc[index]].namaFinishingBarangJadi.toString()))...[
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                                      child: CardItemExpansionDetail(
                                        child: ListTile(
                                          contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0), vertical: getProportionateScreenHeight(10.0)),
                                          title: HighlightItemName(
                                            child: Text(
                                              analisaSingleRAE.data!.analisaFinFnSc![indexanalisaFinFnSc[index]].kodeItem.toString(),
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
                                                            child: Text(analisaSingleRAE.data!.analisaFinFnSc![indexanalisaFinFnSc[index]].namaItem.toString(),
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
                                                                double.parse(analisaSingleRAE.data!.analisaFinFnSc![indexanalisaFinFnSc[index]].qty.toString()
                                                                )
                                                              )+" "+
                                                              analisaSingleRAE.data!.analisaFinFnSc![indexanalisaFinFnSc[index]].namaSatuan.toString(),
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
                                                                double.parse(analisaSingleRAE.data!.analisaFinFnSc![indexanalisaFinFnSc[index]].unitPrice.toString())
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
                                                                double.parse(analisaSingleRAE.data!.analisaFinFnSc![indexanalisaFinFnSc[index]].konstanta.toString()
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
                                                                double.parse(subTotalLabourCost[index].toString())
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
                                    ),
                                  ],
                                ],
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
                                                      double.parse(grandTotalLabourCost
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
                      CardExpansionDetail(
                        label: "List Item Labour Cost Finishing",
                        children: <Widget> [
                          ListView.separated(
                            separatorBuilder: (context, index) => SizedBox(
                              height: getProportionateScreenHeight(10),
                            ),
                            itemCount: indexanalisaFinFnLc.length,
                            itemBuilder: (context, index){
                              return Column(
                                children: [
                                  if(widget.namaFinishing.toString().contains(analisaSingleRAE.data!.analisaFinFnLc![indexanalisaFinFnLc[index]].namaFinishingBarangJadi.toString()))...[
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                                      child: CardItemExpansionDetail(
                                        child: ListTile(
                                          contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0), vertical: getProportionateScreenHeight(10.0)),
                                          title: HighlightItemName(
                                            child: Text(
                                              analisaSingleRAE.data!.analisaFinFnLc![indexanalisaFinFnLc[index]].kodeItem.toString(),
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
                                                            child: Text("Item Machine Process",
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
                                                            child: Text(analisaSingleRAE.data!.analisaFinFnLc![indexanalisaFinFnLc[index]].namaItem.toString(),
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
                                                                double.parse(analisaSingleRAE.data!.analisaFinFnLc![indexanalisaFinFnLc[index]].qty.toString()
                                                                )
                                                              )+" "+
                                                              analisaSingleRAE.data!.analisaFinFnLc![indexanalisaFinFnLc[index]].namaSatuan.toString(),
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
                                                                double.parse(analisaSingleRAE.data!.analisaFinFnLc![indexanalisaFinFnLc[index]].unitPrice.toString())
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
                                                                double.parse(analisaSingleRAE.data!.analisaFinFnLc![indexanalisaFinFnLc[index]].konstanta.toString()
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
                                                                double.parse(subTotalMachineProcess[index].toString())
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
                                    ),
                                  ],
                                ],
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
                                                      double.parse(grandTotalMachineProcess
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