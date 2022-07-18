import 'package:mgp_mobile_app/model/hrdu/rab/analisa_single_rab.dart';
import 'package:mgp_mobile_app/model/hrdu/rae/detail_rae_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mgp_mobile_app/widget/component/card_expansion_detail.dart';
import 'package:mgp_mobile_app/widget/component/card_item_expansion_detail.dart';
import 'package:mgp_mobile_app/widget/component/highlight_item_name.dart';

class Body extends StatefulWidget {
  final Future<AnalisaSingleRegrab> analisaSingleRegrab;
  const Body({Key? key, required this.analisaSingleRegrab}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final formatCurrency = NumberFormat.currency(
    locale: 'ID',
    decimalDigits: 0,
    symbol: "Rp"
  );
  final formatDecimal = NumberFormat("###.######", "id_ID");
  final decimalFormat = NumberFormat("###", "id_ID");
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
  late String grandTotalBiayaOverhead;

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
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: FutureBuilder(
              future: widget.analisaSingleRegrab,
              builder: (BuildContext context, AsyncSnapshot<AnalisaSingleRegrab> snapshot) {
                if (snapshot.hasData) {
                 var analisaSingleRAE = snapshot.data;
                  num totalFactorySupply = 0;
                  num totalLabourCost = 0;
                  num totalMachineProcess = 0;
                  num totalBiayaOverhead = 0;
                  if (analisaSingleRAE!.data!.analisaFinTpFs!.isNotEmpty) {
                    for (var i = 0; i < analisaSingleRAE.data!.analisaFinTpFs!.length; i++) {
                      num subTotal = double.parse(analisaSingleRAE.data!.analisaFinTpFs![i]!.qty.toString()) * double.parse(analisaSingleRAE.data!.analisaFinTpFs![i]!.unitPrice.toString()) * double.parse(analisaSingleRAE.data!.analisaFinTpFs![i]!.konstanta.toString());
                      subTotalFactorySupply.add(subTotal);
                      totalFactorySupply = totalFactorySupply + subTotal;
                    }
                  }
                  if (analisaSingleRAE.data!.analisaFinTpLc!.isNotEmpty) {
                    for (var i = 0; i < analisaSingleRAE.data!.analisaFinTpLc!.length; i++) {
                      num subTotal = double.parse(analisaSingleRAE.data!.analisaFinTpLc![i]!.qty.toString()) * double.parse(analisaSingleRAE.data!.analisaFinTpLc![i]!.unitPrice.toString()) * double.parse(analisaSingleRAE.data!.analisaFinTpLc![i]!.konstanta.toString());
                      subTotalLabourCost.add(subTotal);
                      totalLabourCost = totalLabourCost + subTotal;
                    }
                  }
                  if (analisaSingleRAE.data!.analisaFinTpMp!.isNotEmpty) {
                    for (var i = 0; i < analisaSingleRAE.data!.analisaFinTpMp!.length; i++) {
                      num subTotal = double.parse(analisaSingleRAE.data!.analisaFinTpMp![i]!.qty.toString()) * double.parse(analisaSingleRAE.data!.analisaFinTpMp![i]!.unitPrice.toString()) * double.parse(analisaSingleRAE.data!.analisaFinTpMp![i]!.konstanta.toString());
                      subTotalMachineProcess.add(subTotal);
                      totalMachineProcess = totalMachineProcess + subTotal;
                    }
                  }
                  if (analisaSingleRAE.data!.analisaFinTpBop!.isNotEmpty) {
                    for (var i = 0; i < analisaSingleRAE.data!.analisaFinTpBop!.length; i++) {
                      num subTotal = double.parse(analisaSingleRAE.data!.analisaFinTpBop![i]!.qty.toString()) * double.parse(analisaSingleRAE.data!.analisaFinTpBop![i]!.unitPrice.toString()) * double.parse(analisaSingleRAE.data!.analisaFinTpBop![i]!.konstanta.toString());
                      subTotalBiayaOverhead.add(subTotal);
                      totalBiayaOverhead = totalBiayaOverhead + subTotal;
                    }
                  }
                  grandTotalFactorySupply = totalFactorySupply.toString();
                  grandTotalLabourCost = totalLabourCost.toString();
                  grandTotalMachineProcess = totalMachineProcess.toString();
                  grandTotalBiayaOverhead = totalBiayaOverhead.toString();
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(
                        height: 10,
                      ),
                      CardExpansionDetail(
                        label: "Factory Supply",
                        children: <Widget> [
                          ListView.separated(
                            separatorBuilder: (context, index) => const SizedBox(
                              height: 10,
                            ),
                            itemCount: analisaSingleRAE.data!.analisaFinTpFs!.length,
                            itemBuilder: (context, index){
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: CardItemExpansionDetail(
                                  child: ListTile(
                                    contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                                    title: HighlightItemName(
                                      child: Text(
                                        analisaSingleRAE.data!.analisaFinTpFs![index]!.kodeItem.toString(),
                                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    subtitle: Padding(
                                      padding: const EdgeInsets.only(top: 15),
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
                                                  children: const <Widget>[
                                                    Padding(
                                                      padding: EdgeInsets.symmetric(horizontal: 10),
                                                      child: Text(":",
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
                                                      child: Text(analisaSingleRAE.data!.analisaFinTpFs![index]!.namaItem.toString(),
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
                                          const SizedBox(height: 10),
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
                                                  children: const <Widget>[
                                                    Padding(
                                                      padding: EdgeInsets.symmetric(horizontal: 10),
                                                      child: Text(":",
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
                                                          double.parse(analisaSingleRAE.data!.analisaFinTpFs![index]!.qty.toString()
                                                          )
                                                        )+" "+
                                                        analisaSingleRAE.data!.analisaFinTpFs![index]!.namaSatuan.toString(),
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
                                          const SizedBox(height: 10),
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
                                                  children: const <Widget>[
                                                    Padding(
                                                      padding: EdgeInsets.symmetric(horizontal: 10),
                                                      child: Text(":",
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
                                                          double.parse(analisaSingleRAE.data!.analisaFinTpFs![index]!.unitPrice.toString())
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
                                          const SizedBox(height: 10),
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
                                                  children: const <Widget>[
                                                    Padding(
                                                      padding: EdgeInsets.symmetric(horizontal: 10),
                                                      child: Text(":",
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
                                                          double.parse(analisaSingleRAE.data!.analisaFinTpFs![index]!.konstanta.toString()
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
                                          const SizedBox(height: 10),
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
                                                  children: const <Widget>[
                                                    Padding(
                                                      padding: EdgeInsets.symmetric(horizontal: 10),
                                                      child: Text(":",
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
                              );
                            },
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
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
                                                    fontSize: 14
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
                                                    fontSize: 14
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
                          const SizedBox(height: 10),
                        ]
                      ),
                      CardExpansionDetail(
                        label: "Labour Cost",
                        children: <Widget> [
                          ListView.separated(
                            separatorBuilder: (context, index) => const SizedBox(
                              height: 10,
                            ),
                            itemCount: analisaSingleRAE.data!.analisaFinTpLc!.length,
                            itemBuilder: (context, index){
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: CardItemExpansionDetail(
                                  child: ListTile(
                                    contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                                    title: HighlightItemName(
                                      child: Text(
                                        analisaSingleRAE.data!.analisaFinTpLc![index]!.kodeItem.toString(),
                                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    subtitle: Padding(
                                      padding: const EdgeInsets.only(top: 15),
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
                                                  children: const <Widget>[
                                                    Padding(
                                                      padding: EdgeInsets.symmetric(horizontal: 10),
                                                      child: Text(":",
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
                                                      child: Text(analisaSingleRAE.data!.analisaFinTpLc![index]!.namaItem.toString(),
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
                                          const SizedBox(height: 10),
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
                                                  children: const <Widget>[
                                                    Padding(
                                                      padding: EdgeInsets.symmetric(horizontal: 10),
                                                      child: Text(":",
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
                                                          double.parse(analisaSingleRAE.data!.analisaFinTpLc![index]!.qty.toString()
                                                          )
                                                        )+" "+
                                                        analisaSingleRAE.data!.analisaFinTpLc![index]!.namaSatuan.toString(),
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
                                          const SizedBox(height: 10),
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
                                                  children: const <Widget>[
                                                    Padding(
                                                      padding: EdgeInsets.symmetric(horizontal: 10),
                                                      child: Text(":",
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
                                                          double.parse(analisaSingleRAE.data!.analisaFinTpLc![index]!.unitPrice.toString())
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
                                          const SizedBox(height: 10),
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
                                                  children: const <Widget>[
                                                    Padding(
                                                      padding: EdgeInsets.symmetric(horizontal: 10),
                                                      child: Text(":",
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
                                                          double.parse(analisaSingleRAE.data!.analisaFinTpLc![index]!.konstanta.toString()
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
                                          const SizedBox(height: 10),
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
                                                  children: const <Widget>[
                                                    Padding(
                                                      padding: EdgeInsets.symmetric(horizontal: 10),
                                                      child: Text(":",
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
                              );
                            },
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
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
                                                    fontSize: 14
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
                                                    fontSize: 14
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
                          const SizedBox(height: 10),
                        ]
                      ),
                      CardExpansionDetail(
                        label: "Machine Process",
                        children: <Widget> [
                          ListView.separated(
                            separatorBuilder: (context, index) => const SizedBox(
                              height: 10,
                            ),
                            itemCount: analisaSingleRAE.data!.analisaFinTpMp!.length,
                            itemBuilder: (context, index){
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: CardItemExpansionDetail(
                                  child: ListTile(
                                    contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                                    title: HighlightItemName(
                                      child: Text(
                                        analisaSingleRAE.data!.analisaFinTpMp![index]!.kodeItem.toString(),
                                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    subtitle: Padding(
                                      padding: const EdgeInsets.only(top: 15),
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
                                                  children: const <Widget>[
                                                    Padding(
                                                      padding: EdgeInsets.symmetric(horizontal: 10),
                                                      child: Text(":",
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
                                                      child: Text(analisaSingleRAE.data!.analisaFinTpMp![index]!.namaItem.toString(),
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
                                          const SizedBox(height: 10),
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
                                                  children: const <Widget>[
                                                    Padding(
                                                      padding: EdgeInsets.symmetric(horizontal: 10),
                                                      child: Text(":",
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
                                                          double.parse(analisaSingleRAE.data!.analisaFinTpMp![index]!.qty.toString()
                                                          )
                                                        )+" "+
                                                        analisaSingleRAE.data!.analisaFinTpMp![index]!.namaSatuan.toString(),
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
                                          const SizedBox(height: 10),
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
                                                  children: const <Widget>[
                                                    Padding(
                                                      padding: EdgeInsets.symmetric(horizontal: 10),
                                                      child: Text(":",
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
                                                          double.parse(analisaSingleRAE.data!.analisaFinTpMp![index]!.unitPrice.toString())
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
                                          const SizedBox(height: 10),
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
                                                  children: const <Widget>[
                                                    Padding(
                                                      padding: EdgeInsets.symmetric(horizontal: 10),
                                                      child: Text(":",
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
                                                          double.parse(analisaSingleRAE.data!.analisaFinTpMp![index]!.konstanta.toString()
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
                                          const SizedBox(height: 10),
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
                                                  children: const <Widget>[
                                                    Padding(
                                                      padding: EdgeInsets.symmetric(horizontal: 10),
                                                      child: Text(":",
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
                              );
                            },
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
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
                                                    fontSize: 14
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
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14
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
                          const SizedBox(height: 10),
                        ]
                      ),
                      CardExpansionDetail(
                        label: "Biaya Overhead",
                        children: <Widget> [
                          ListView.separated(
                            separatorBuilder: (context, index) => const SizedBox(
                              height: 10,
                            ),
                            itemCount: analisaSingleRAE.data!.analisaFinTpBop!.length,
                            itemBuilder: (context, index){
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: CardItemExpansionDetail(
                                  child: ListTile(
                                    contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                                    title: HighlightItemName(
                                      child: Text(
                                        analisaSingleRAE.data!.analisaFinTpBop![index]!.kodeItem.toString(),
                                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    subtitle: Padding(
                                      padding: const EdgeInsets.only(top: 15),
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
                                                  children: const <Widget>[
                                                    Padding(
                                                      padding: EdgeInsets.symmetric(horizontal: 10),
                                                      child: Text(":",
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
                                                      child: Text(analisaSingleRAE.data!.analisaFinTpBop![index]!.namaItem.toString(),
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
                                          const SizedBox(height: 10),
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
                                                  children: const <Widget>[
                                                    Padding(
                                                      padding: EdgeInsets.symmetric(horizontal: 10),
                                                      child: Text(":",
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
                                                          double.parse(analisaSingleRAE.data!.analisaFinTpBop![index]!.qty.toString()
                                                          )
                                                        )+" "+
                                                        analisaSingleRAE.data!.analisaFinTpBop![index]!.namaSatuan.toString(),
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
                                          const SizedBox(height: 10),
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
                                                  children: const <Widget>[
                                                    Padding(
                                                      padding: EdgeInsets.symmetric(horizontal: 10),
                                                      child: Text(":",
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
                                                          double.parse(analisaSingleRAE.data!.analisaFinTpBop![index]!.unitPrice.toString())
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
                                          const SizedBox(height: 10),
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
                                                  children: const <Widget>[
                                                    Padding(
                                                      padding: EdgeInsets.symmetric(horizontal: 10),
                                                      child: Text(":",
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
                                                          double.parse(analisaSingleRAE.data!.analisaFinTpBop![index]!.konstanta.toString()
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
                                          const SizedBox(height: 10),
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
                                                  children: const <Widget>[
                                                    Padding(
                                                      padding: EdgeInsets.symmetric(horizontal: 10),
                                                      child: Text(":",
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
                                                          double.parse(subTotalBiayaOverhead[index].toString())
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
                              );
                            },
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
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
                                                    fontSize: 14
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
                                                    fontSize: 14
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
                          const SizedBox(height: 10),
                        ]
                      ),
                      const SizedBox(height: 30),
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