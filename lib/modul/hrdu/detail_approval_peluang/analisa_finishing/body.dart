import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:mgp_mobile_app/model/hrdu/peluang/analisa_single_peluang_fin.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mgp_mobile_app/widget/component/card_expansion_detail.dart';
import 'package:mgp_mobile_app/widget/component/card_item_expansion_detail.dart';
import 'package:mgp_mobile_app/widget/component/highlight_item_name.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class BodyFinihing extends StatefulWidget {
  final Future<AnalisaSingleRegplgFinishing> analisaSingleRegplgFinishing;
  final String namaFinishing;
  const BodyFinihing({Key? key, required this.analisaSingleRegplgFinishing, required this.namaFinishing}) : super(key: key);
 
  @override
  _BodyFinishingState createState() => _BodyFinishingState();
}

class _BodyFinishingState extends State<BodyFinihing> {

  final formatCurrency = NumberFormat.currency(
    locale: 'ID',
    decimalDigits: 0,
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
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20).w),
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: FutureBuilder(
              future: widget.analisaSingleRegplgFinishing,
              builder: (BuildContext context, AsyncSnapshot<AnalisaSingleRegplgFinishing>snapshot) {
                if (snapshot.hasData) {
                 var analisaSinglePeluang = snapshot.data;
                  num totalFactorySupply = 0;
                  num totalLabourCost = 0;
                  num totalMachineProcess = 0;
                  num totalBiayaOverhead = 0; 
                  indexanalisaFinFnBp.clear();
                  indexanalisaFinFnSc.clear();
                  indexanalisaFinFnLc.clear();

                  if (analisaSinglePeluang!.data!.analisaFinFnBp!.isNotEmpty) {//analisa_fin_fn_bp
                    for (var i = 0; i < analisaSinglePeluang.data!.analisaFinFnBp!.length; i++) {
                      if(widget.namaFinishing.toString().contains(analisaSinglePeluang.data!.analisaFinFnBp![i].namaFinishingBarangJadi.toString())){
                        indexanalisaFinFnBp.add(i);
                        num subTotal = double.parse(analisaSinglePeluang.data!.analisaFinFnBp![i].qty.toString()) * double.parse(analisaSinglePeluang.data!.analisaFinFnBp![i].hargaSatuan.toString()) * double.parse(analisaSinglePeluang.data!.analisaFinFnBp![i].koefisien.toString());
                        subTotalFactorySupply.add(subTotal);
                        totalFactorySupply = totalFactorySupply + subTotal.round();
                      }
                    }
                  }
                  if (analisaSinglePeluang.data!.analisaFinFnSc!.isNotEmpty) {//analisa_fin_fn_sc
                    for (var i = 0; i < analisaSinglePeluang.data!.analisaFinFnSc!.length; i++) {
                      if(widget.namaFinishing.toString().contains(analisaSinglePeluang.data!.analisaFinFnSc![i].namaFinishingBarangJadi.toString())){
                        indexanalisaFinFnSc.add(i);
                        num subTotal = double.parse(analisaSinglePeluang.data!.analisaFinFnSc![i].qty.toString()) * double.parse(analisaSinglePeluang.data!.analisaFinFnSc![i].hargaSatuan.toString()) * double.parse(analisaSinglePeluang.data!.analisaFinFnSc![i].koefisien.toString());
                        subTotalLabourCost.add(subTotal);
                        totalLabourCost = totalLabourCost + subTotal.round();
                      }
                    }
                  }
                  if (analisaSinglePeluang.data!.analisaFinFnLc!.isNotEmpty) {//analisa_fin_fn_lc
                    for (var i = 0; i < analisaSinglePeluang.data!.analisaFinFnLc!.length; i++) {
                      if(widget.namaFinishing.toString().contains(analisaSinglePeluang.data!.analisaFinFnLc![i].namaFinishingBarangJadi.toString())){
                        indexanalisaFinFnLc.add(i);
                        num subTotal = double.parse(analisaSinglePeluang.data!.analisaFinFnLc![i].qty.toString()) * double.parse(analisaSinglePeluang.data!.analisaFinFnLc![i].hargaSatuan.toString()) * double.parse(analisaSinglePeluang.data!.analisaFinFnLc![i].koefisien.toString());
                        subTotalMachineProcess.add(subTotal);
                        totalMachineProcess = totalMachineProcess + subTotal.round();
                      }
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
                      SizedBox(
                        height: getProportionateScreenHeight(10).h,
                      ),
                      CardExpansionDetail(
                        label: "List Item Bahan Penunjang Finishing",
                        children: <Widget> [
                          ListView.separated(
                            separatorBuilder: (context, index) => SizedBox(
                              height: getProportionateScreenHeight(10).h,
                            ),
                            itemCount: indexanalisaFinFnBp.length,
                            itemBuilder: (context, index){
                              return Column(
                                children: [
                                  if(analisaSinglePeluang.data!.analisaFinFnBp![indexanalisaFinFnBp[index]].namaFinishingBarangJadi.toString().contains(widget.namaFinishing.toString()))...[
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
                                      child: CardItemExpansionDetail(
                                        child: ListTile(
                                          contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0).w, vertical: getProportionateScreenHeight(10.0).h),
                                          title: HighlightItemName(
                                            child: Text(
                                              analisaSinglePeluang.data!.analisaFinFnBp![indexanalisaFinFnBp[index]].kodeItemBahan.toString(),
                                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14.sp),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          subtitle: Padding(
                                            padding: EdgeInsets.only(top: getProportionateScreenHeight(15).h),
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
                                                            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
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
                                                            child: Text(analisaSinglePeluang.data!.analisaFinFnBp![indexanalisaFinFnBp[index]].namaItem.toString(),
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
                                                SizedBox(height: getProportionateScreenHeight(10).h),
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
                                                            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
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
                                                                double.parse(analisaSinglePeluang.data!.analisaFinFnBp![indexanalisaFinFnBp[index]].qty.toString()
                                                                )
                                                              )+" "+
                                                              analisaSinglePeluang.data!.analisaFinFnBp![indexanalisaFinFnBp[index]].namaSatuan.toString(),
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
                                                SizedBox(height: getProportionateScreenHeight(10).h),
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
                                                            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
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
                                                                double.parse(analisaSinglePeluang.data!.analisaFinFnBp![indexanalisaFinFnBp[index]].kodeItemBahan.toString())
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
                                                SizedBox(height: getProportionateScreenHeight(10).h),
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
                                                            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
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
                                                                double.parse(analisaSinglePeluang.data!.analisaFinFnBp![indexanalisaFinFnBp[index]].kodeItemBahan.toString()
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
                                                SizedBox(height: getProportionateScreenHeight(10).h),
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
                                                            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
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
                          SizedBox(height: getProportionateScreenHeight(10).h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
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
                                                    fontSize: 14.sp
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
                                                    fontSize: 14.sp
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
                          SizedBox(height: getProportionateScreenHeight(10).h),
                        ]
                      ),
                      CardExpansionDetail(
                        label: "List Item Subkon Finishing",
                        children: <Widget> [
                          ListView.separated(
                            separatorBuilder: (context, index) => SizedBox(
                              height: getProportionateScreenHeight(10).h,
                            ),
                            itemCount: indexanalisaFinFnSc.length,
                            itemBuilder: (context, index){
                              return Column(
                                children: [
                                  if(widget.namaFinishing.toString().contains(analisaSinglePeluang.data!.analisaFinFnSc![indexanalisaFinFnSc[index]].namaFinishingBarangJadi.toString()))...[
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
                                      child: CardItemExpansionDetail(
                                        child: ListTile(
                                          contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0).w, vertical: getProportionateScreenHeight(10.0).h),
                                          title: HighlightItemName(
                                            child: Text(
                                              analisaSinglePeluang.data!.analisaFinFnSc![indexanalisaFinFnSc[index]].kodeItemBahan.toString(),
                                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14.sp),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          subtitle: Padding(
                                            padding: EdgeInsets.only(top: getProportionateScreenHeight(15).h),
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
                                                            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
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
                                                            child: Text(analisaSinglePeluang.data!.analisaFinFnSc![indexanalisaFinFnSc[index]].namaItem.toString(),
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
                                                SizedBox(height: getProportionateScreenHeight(10).h),
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
                                                            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
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
                                                                double.parse(analisaSinglePeluang.data!.analisaFinFnSc![indexanalisaFinFnSc[index]].qty.toString()
                                                                )
                                                              )+" "+
                                                              analisaSinglePeluang.data!.analisaFinFnSc![indexanalisaFinFnSc[index]].namaSatuan.toString(),
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
                                                SizedBox(height: getProportionateScreenHeight(10).h),
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
                                                            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
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
                                                                double.parse(analisaSinglePeluang.data!.analisaFinFnSc![indexanalisaFinFnSc[index]].koefisien.toString())
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
                                                SizedBox(height: getProportionateScreenHeight(10).h),
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
                                                            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
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
                                                                double.parse(analisaSinglePeluang.data!.analisaFinFnSc![indexanalisaFinFnSc[index]].koefisien.toString()
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
                                                SizedBox(height: getProportionateScreenHeight(10).h),
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
                                                            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
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
                          SizedBox(height: getProportionateScreenHeight(10).h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
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
                                                    fontSize: 14.sp
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
                                                    fontSize: 14.sp
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
                          SizedBox(height: getProportionateScreenHeight(10).h),
                        ]
                      ),
                      CardExpansionDetail(
                        label: "List Item Labour Cost Finishing",
                        children: <Widget> [
                          ListView.separated(
                            separatorBuilder: (context, index) => SizedBox(
                              height: getProportionateScreenHeight(10).h,
                            ),
                            itemCount: indexanalisaFinFnLc.length,
                            itemBuilder: (context, index){
                              return Column(
                                children: [
                                  if(widget.namaFinishing.toString().contains(analisaSinglePeluang.data!.analisaFinFnLc![indexanalisaFinFnLc[index]].namaFinishingBarangJadi.toString()))...[
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
                                      child: CardItemExpansionDetail(
                                        child: ListTile(
                                          contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0).w, vertical: getProportionateScreenHeight(10.0).h),
                                          title: HighlightItemName(
                                            child: Text(
                                              analisaSinglePeluang.data!.analisaFinFnLc![indexanalisaFinFnLc[index]].kodeItemBahan.toString(),
                                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14.sp),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          subtitle: Padding(
                                            padding: EdgeInsets.only(top: getProportionateScreenHeight(15).h),
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
                                                            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
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
                                                            child: Text(analisaSinglePeluang.data!.analisaFinFnLc![indexanalisaFinFnLc[index]].namaItem.toString(),
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
                                                SizedBox(height: getProportionateScreenHeight(10).h),
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
                                                            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
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
                                                                double.parse(analisaSinglePeluang.data!.analisaFinFnLc![indexanalisaFinFnLc[index]].qty.toString()
                                                                )
                                                              )+" "+
                                                              analisaSinglePeluang.data!.analisaFinFnLc![indexanalisaFinFnLc[index]].namaSatuan.toString(),
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
                                                SizedBox(height: getProportionateScreenHeight(10).h),
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
                                                            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
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
                                                                double.parse(analisaSinglePeluang.data!.analisaFinFnLc![indexanalisaFinFnLc[index]].koefisien.toString())
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
                                                SizedBox(height: getProportionateScreenHeight(10).h),
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
                                                            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
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
                                                                double.parse(analisaSinglePeluang.data!.analisaFinFnLc![indexanalisaFinFnLc[index]].koefisien.toString()
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
                                                SizedBox(height: getProportionateScreenHeight(10).h),
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
                                                            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
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
                          SizedBox(height: getProportionateScreenHeight(10).h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
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
                                                    fontSize: 14.sp
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
                                                    fontSize: 14.sp
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
                          SizedBox(height: getProportionateScreenHeight(10).h),
                        ]
                      ),
                      SizedBox(height: getProportionateScreenHeight(30).h),
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