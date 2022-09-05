import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:mgp_mobile_app/modul/hrdu/approval_ppa/approval_ppa.dart';
import 'package:mgp_mobile_app/model/hrdu/ppa/detail_ppa_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mgp_mobile_app/widget/theme/constants.dart';
import 'package:mgp_mobile_app/form_error.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/mgp_api_hrdu.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class Body extends StatefulWidget {
  final String noPPA;
  const Body({Key? key, required this.noPPA}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final formatCurrency = NumberFormat.currency(
    locale: 'ID',
    decimalDigits: 0,
    symbol: "Rp"
  );
  final formatDecimal = NumberFormat("###.###", "id_ID");
  late String tglPPA;
  late String bulan;
  late String priceSatuan;
  late String priceQty;
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  final _catatanTextEditingController = TextEditingController();
  late Future<DetailRegppa> futureDetailRegppa;
  final DateTime? tglNull = null;
  late String? tokens;
  bool visibilityPemeriksa = false;
  bool visibilityPengesah = false;

  void addError({required String error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({required String error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }
  @override
  void initState() {
    futureDetailRegppa = MGPAPI().fetchApprovalDetailPPA(noPPA: widget.noPPA);
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
            child: Form(
              key: _formKey,
              child: FutureBuilder<DetailRegppa>(
                future: futureDetailRegppa,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    String status = snapshot.data!.data!.behavior.toString();
                    if (status == "V") {
                      visibilityPemeriksa = true;
                    } else {
                      visibilityPengesah = true;
                    }
                    if (snapshot.data!.data!.detail!.tglPpa != tglNull) {
                      DateTime tglRK = DateTime.parse(snapshot.data!.data!.detail!.tglPpa.toString());
                      tglPPA = DateFormat('EEEE, dd MMMM yyyy', 'id').format(tglRK);
                    } else {
                      tglPPA = "-";
                    }
                    if (snapshot.data!.data!.detail!.tglPpa != tglNull) {
                      DateTime bulans = DateTime.parse(snapshot.data!.data!.detail!.tglPpa.toString());
                      bulan = DateFormat('MMMM', 'id').format(bulans);
                    } else {
                      bulan = "-";
                    }
                    double hargaSatuan = double.parse(snapshot.data!.data!.detail!.hargaSatuan.toString());
                    priceSatuan = formatCurrency.format(hargaSatuan);
                    double qtyItem = double.parse(snapshot.data!.data!.detail!.qty.toString());
                    priceQty = formatDecimal.format(qtyItem);            
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: getProportionateScreenHeight(20).h,
                        ),
                        Card(
                          elevation: 8.0,
                          margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(3.0).w, vertical: getProportionateScreenHeight(6.0).h),
                          child: Container(
                            padding: EdgeInsets.only(top: getProportionateScreenHeight(10).h, bottom: getProportionateScreenHeight(10).h),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 10,
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width / 1.5,
                                    child: ListTile(
                                      subtitle: Column(
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
                                                      padding: const EdgeInsets.only(left: 0),
                                                      child: Text("Program",
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
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: const <Widget>[
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 0),
                                                      child: Text(":",
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
                                                flex: 6,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: EdgeInsets.only(left: getProportionateScreenWidth(5).w),
                                                      child: Text(snapshot.data!.data!.detail!.namaProgram.toString(),
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
                                          SizedBox(height: getProportionateScreenHeight(5).h),
                                          Row(
                                            children: <Widget>[
                                              Expanded(
                                                flex: 4,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: const <Widget>[
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 0),
                                                      child: Text("Sumber Daya",
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
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: const <Widget>[
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 0),
                                                      child: Text(":",
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
                                                flex: 6,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: EdgeInsets.only(left: getProportionateScreenWidth(5).w),
                                                      child: Text(snapshot.data!.data!.detail!.itemSumberDaya.toString(),
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
                                          SizedBox(height: getProportionateScreenHeight(5).h),
                                          Row(
                                            children: <Widget>[
                                              Expanded(
                                                flex: 4,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: const <Widget>[
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 0),
                                                      child: Text("Tipe Anggaran",
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
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: const <Widget>[
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 0),
                                                      child: Text(":",
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
                                                flex: 6,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: EdgeInsets.only(left: getProportionateScreenWidth(5).w),
                                                      child: Text(snapshot.data!.data!.detail!.nomorAkun.toString()+"-"+snapshot.data!.data!.detail!.namaAkun.toString(),
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
                                          SizedBox(height: getProportionateScreenHeight(5).h),
                                          Row(
                                            children: <Widget>[
                                              Expanded(
                                                flex: 4,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: const <Widget>[
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 0),
                                                      child: Text("Kegiatan",
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
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: const <Widget>[
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 0),
                                                      child: Text(":",
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
                                                flex: 6,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: EdgeInsets.only(left: getProportionateScreenWidth(5).w),
                                                      child: Text(snapshot.data!.data!.detail!.namaKegiatan.toString(),
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
                                          SizedBox(height: getProportionateScreenHeight(5).h),
                                          Row(
                                            children: <Widget>[
                                              Expanded(
                                                flex: 4,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: const <Widget>[
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 0),
                                                      child: Text("Bulan",
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
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: const <Widget>[
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 0),
                                                      child: Text(":",
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
                                                flex: 6,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: EdgeInsets.only(left: getProportionateScreenWidth(5).w),
                                                      child: Text(bulan.toString(),
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
                                          SizedBox(height: getProportionateScreenHeight(5).h),
                                          Row(
                                            children: <Widget>[
                                              Expanded(
                                                flex: 4,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: const <Widget>[
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 0),
                                                      child: Text("Tanggal PPA",
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
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: const <Widget>[
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 0),
                                                      child: Text(":",
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
                                                flex: 6,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: EdgeInsets.only(left: getProportionateScreenWidth(5).w),
                                                      child: Text(tglPPA.toString(),
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
                                          SizedBox(height: getProportionateScreenHeight(5).h),
                                          Row(
                                            children: <Widget>[
                                              Expanded(
                                                flex: 4,
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
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: const <Widget>[
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 0),
                                                      child: Text(":",
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
                                                flex: 6,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: EdgeInsets.only(left: getProportionateScreenWidth(5).w),
                                                      child: Text(priceQty.toString(),
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
                                          SizedBox(height: getProportionateScreenHeight(5).h),
                                          Row(
                                            children: <Widget>[
                                              Expanded(
                                                flex: 4,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: const <Widget>[
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 0),
                                                      child: Text("Harga Satuan",
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
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: const <Widget>[
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 0),
                                                      child: Text(":",
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
                                                flex: 6,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: EdgeInsets.only(left: getProportionateScreenWidth(5).w),
                                                      child: Text(priceSatuan.toString(),
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
                                          SizedBox(height: getProportionateScreenHeight(5).h),
                                          Row(
                                            children: <Widget>[
                                              Expanded(
                                                flex: 4,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: const <Widget>[
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 0),
                                                      child: Text("No. PPA",
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
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: const <Widget>[
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 0),
                                                      child: Text(":",
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
                                                flex: 6,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: EdgeInsets.only(left: getProportionateScreenWidth(5).w),
                                                      child: Text(snapshot.data!.data!.detail!.noPpa.toString(),
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
                                          SizedBox(height: getProportionateScreenHeight(5).h),
                                          Row(
                                            children: <Widget>[
                                              Expanded(
                                                flex: 4,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: const <Widget>[
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 0),
                                                      child: Text("Satuan",
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
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: const <Widget>[
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 0),
                                                      child: Text(":",
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
                                                flex: 6,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: EdgeInsets.only(left: getProportionateScreenWidth(5).w),
                                                      child: Text(snapshot.data!.data!.detail!.satuan.toString(),
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
                                          SizedBox(height: getProportionateScreenHeight(5).h),
                                        ],
                                      ),
                                    ),
                                  )
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(15).h,
                        ),
                        if (snapshot.data!.data!.approval!.isNotEmpty)...[
                          SizedBox(
                            width: double.infinity,
                            child: Card(
                              elevation: 8.0,
                              margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(3.0).w, vertical: getProportionateScreenHeight(6.0).h),
                              child: Container(
                                padding: EdgeInsets.only(top: getProportionateScreenHeight(10).h, bottom: getProportionateScreenHeight(10).h),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15.r),
                                ),
                                child: ListView.separated(
                                  separatorBuilder: (context, index) => const Divider(
                                    color: Colors.black,
                                  ),
                                  itemCount: snapshot.data!.data!.approval!.length,
                                  itemBuilder: (BuildContext context, index){
                                    return ListTile(
                                      contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0).w, vertical: getProportionateScreenHeight(10.0).h),
                                      title: Column(
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
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 0),
                                                      child: (snapshot.data!.data!.approval![index]!.statusApproval.toString() != "APP")
                                                      ? Text("Pemeriksa ${index+1}",style: TextStyle(color: Colors.black, fontSize: 14.sp), textAlign: TextAlign.left)
                                                      : Text("Pengesah",style: TextStyle(color: Colors.black, fontSize: 14.sp), textAlign: TextAlign.left),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                flex: 15,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: const EdgeInsets.only(right: 0),
                                                      child: Text(snapshot.data!.data!.approval![index]!.namaKaryawan.toString(),
                                                        style:  TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 14.sp,
                                                          fontWeight: FontWeight.bold
                                                        ),
                                                        textAlign: TextAlign.right,
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
                                                flex: 10,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 0),
                                                      child: Text("Catatan",
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 14.sp
                                                        ),
                                                        textAlign: TextAlign.left,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                flex: 20,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: const EdgeInsets.only(right: 0),
                                                      child: Text(snapshot.data!.data!.approval![index]!.catatan.toString(),
                                                        style:  TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 14.sp,
                                                          fontWeight: FontWeight.bold
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
                                    );
                                  },
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                ),
                              ),
                            ),
                          ),
                        ],
                        Padding(
                          padding: EdgeInsets.only(top: getProportionateScreenHeight(10).h, bottom: getProportionateScreenHeight(10).h),
                          child: TextFormField(
                            controller: _catatanTextEditingController,
                            minLines: 1,
                            maxLines: 10,
                            keyboardType: TextInputType.multiline,
                            textAlign: TextAlign.start,
                            textAlignVertical: TextAlignVertical.center,
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                removeError(error: kCatatanError);
                              }
                              return; 
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                addError(error: kCatatanError);
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              labelText: "Catatan Approval",
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                              hintText: "Masukkan Catatan",
                              filled: true,
                              fillColor: Colors.white
                            ),
                          ),
                        ),
                        SizedBox(height: getProportionateScreenHeight(10).h),
                        FormError(errors: errors),
                        SizedBox(height: getProportionateScreenHeight(10).h),






                        
                        Visibility(
                          visible: visibilityPemeriksa,
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                width: double.infinity,
                                height: getProportionateScreenHeight(56).h,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.red[700],
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20).r)
                                  ),
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      if (_catatanTextEditingController.text != "") {
                                        final _postProses = await MGPAPI().postPPA(
                                          noTransaksi: snapshot.data!.data!.detail!.noPpa.toString(),
                                          statusApproval: "REJ",
                                          catatan: _catatanTextEditingController.text,
                                          tglApproval: DateTime.now().toString(),
                                          approvalBaseline: snapshot.data!.data!.detail!.baseline.toString(),
                                        );
                                        if (_postProses == "berhasil") {
                                          Get.offAll(const PPAView());
                                        }
                                      }
                                    }
                                  },
                                  child: Text(
                                    "REJECT",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: getProportionateScreenHeight(15).h),
                              SizedBox(
                                width: double.infinity,
                                height: getProportionateScreenHeight(56).h,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.amber[700],
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20).r)
                                  ),
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      if (_catatanTextEditingController.text != "") {
                                        final _postProses = await MGPAPI().postPPA(
                                          noTransaksi: snapshot.data!.data!.detail!.noPpa.toString(),
                                          statusApproval: "REV",
                                          catatan: _catatanTextEditingController.text,
                                          tglApproval: DateTime.now().toString(),
                                          approvalBaseline: snapshot.data!.data!.detail!.baseline.toString(),
                                        );
                                        if (_postProses == "berhasil") {
                                          Get.offAll(const PPAView());
                                        }
                                      }
                                    }
                                  },
                                  child:  Text(
                                    "REVISE",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: getProportionateScreenHeight(15).h),
                              SizedBox(
                                width: double.infinity,
                                height: getProportionateScreenHeight(56).h,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.green[800],
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20).r)
                                  ),
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      if (_catatanTextEditingController.text != "") {
                                        final _postProses = await MGPAPI().postPPA(
                                          noTransaksi: snapshot.data!.data!.detail!.noPpa.toString(),
                                          statusApproval: "VER",
                                          catatan: _catatanTextEditingController.text,
                                          tglApproval: DateTime.now().toString(),
                                          approvalBaseline: snapshot.data!.data!.detail!.baseline.toString(),
                                        );
                                        if (_postProses == "berhasil") {
                                          Get.offAll(const PPAView());
                                        }
                                      }
                                    }
                                  },
                                  child: Text(
                                    "VERIFY",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ),
                        Visibility(
                          visible: visibilityPengesah,
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                width: double.infinity,
                                height: getProportionateScreenHeight(56).h,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.red[700],
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20).r)
                                  ),
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      if (_catatanTextEditingController.text != "") {
                                        final _postProses = await MGPAPI().postPPA(
                                          noTransaksi: snapshot.data!.data!.detail!.noPpa.toString(),
                                          statusApproval: "REJ",
                                          catatan: _catatanTextEditingController.text,
                                          tglApproval: DateTime.now().toString(),
                                          approvalBaseline: snapshot.data!.data!.detail!.baseline.toString(),
                                        );
                                        if (_postProses == "berhasil") {
                                          Get.offAll(const PPAView());
                                        }
                                      }
                                    }
                                  },
                                  child: Text(
                                    "REJECT",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: getProportionateScreenHeight(15).h),
                              SizedBox(
                                width: double.infinity,
                                height: getProportionateScreenHeight(56).h,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.green[800],
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20).r)
                                  ),
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      if (_catatanTextEditingController.text != "") {
                                        final _postProses = await MGPAPI().postPPA(
                                          noTransaksi: snapshot.data!.data!.detail!.noPpa.toString(),
                                          statusApproval: "APP",
                                          catatan: _catatanTextEditingController.text,
                                          tglApproval: DateTime.now().toString(),
                                          approvalBaseline: snapshot.data!.data!.detail!.baseline.toString(),
                                        );
                                        if (_postProses == "berhasil") {
                                          Get.offAll(const PPAView());
                                        }
                                      }
                                    }
                                  },
                                  child: Text(
                                    "APPROVE",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
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
      ),
    );
  }
}