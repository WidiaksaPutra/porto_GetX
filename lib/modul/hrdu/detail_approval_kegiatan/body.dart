import 'package:mgp_mobile_app/modul/hrdu/approval_kegiatan/approval_kegiatan.dart';
import 'package:mgp_mobile_app/model/hrdu/kegiatan/detail_kegiatan_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mgp_mobile_app/widget/theme/constants.dart';
import 'package:mgp_mobile_app/form_error.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu.dart';
import 'package:get/get.dart';

class Body extends StatefulWidget {
  final String noKegiatan;
  const Body({Key? key, required this.noKegiatan}) : super(key: key);

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
  late List hargaSatuanJual = [];
  late String tglKegiatan;
  late String tglPeriodeMulai;
  late String tglPeriodeSelesai;
  late List subTotalHarga = [];
  late List qtySumberDaya = [];
  late String grandTotalHarga;
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  final _catatanTextEditingController = TextEditingController();
  late Future<DetailRk> futureDetailRk;
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
    futureDetailRk = MGPAPI().fetchApprovalDetailKegiatan(noKegiatan: widget.noKegiatan);
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
            child: Form(
              key: _formKey,
              child: FutureBuilder<DetailRk>(
                future: futureDetailRk,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    String status = snapshot.data!.data!.behavior.toString();
                    if (status == "V") {
                      visibilityPemeriksa = true;
                    } else {
                      visibilityPengesah = true;
                    }
                    if (snapshot.data!.data!.detail!.tglInput != tglNull) {
                      DateTime tglRK = DateTime.parse(snapshot.data!.data!.detail!.tglInput.toString());
                      tglKegiatan = DateFormat('EEEE, dd MMMM yyyy', 'id').format(tglRK);
                    } else {
                      tglKegiatan = "-";
                    }
                    if (snapshot.data!.data!.detail!.tglMulai != tglNull) {
                      DateTime tglPM = DateTime.parse(snapshot.data!.data!.detail!.tglMulai.toString());
                      tglPeriodeMulai = DateFormat('EEEE, dd MMMM yyyy', 'id').format(tglPM);
                    } else {
                      tglPeriodeMulai = "-";
                    }
                    if (snapshot.data!.data!.detail!.tglSelesai != tglNull) {
                      DateTime tglPS = DateTime.parse(snapshot.data!.data!.detail!.tglSelesai.toString());
                      tglPeriodeSelesai = DateFormat('EEEE, dd MMMM yyyy', 'id').format(tglPS);
                    } else {
                      tglPeriodeSelesai = "-";
                    }
                    num totalHarga = 0;
                    for(var i = 0; i< snapshot.data!.data!.detail!.sumberDaya!.length; i++){
                      num subTotal = (double.parse(snapshot.data!.data!.detail!.sumberDaya![i]!.hargaSatuan.toString())) * double.parse(snapshot.data!.data!.detail!.sumberDaya![i]!.qty.toString());
                      totalHarga = totalHarga + (double.parse(snapshot.data!.data!.detail!.sumberDaya![i]!.hargaSatuan.toString())) * double.parse(snapshot.data!.data!.detail!.sumberDaya![i]!.qty.toString());
                      double hargaSatuan = double.parse(snapshot.data!.data!.detail!.sumberDaya![i]!.hargaSatuan.toString());
                      subTotalHarga.add(formatCurrency.format(subTotal));
                      double qtyItem = double.parse(snapshot.data!.data!.detail!.sumberDaya![i]!.qty.toString());
                      hargaSatuanJual.add(formatCurrency.format(hargaSatuan));
                      qtySumberDaya.add(formatDecimal.format(qtyItem));             
                    }
                    grandTotalHarga = formatCurrency.format(totalHarga).toString();
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(
                          height: 20,
                        ),
                        Card(
                          elevation: 8.0,
                          margin: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 6.0),
                          child: Container(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
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
                                                      padding: EdgeInsets.only(left: 0),
                                                      child: Text("Departemen",
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
                                                      padding: EdgeInsets.only(left: 0),
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
                                                      padding: const EdgeInsets.only(left: 5),
                                                      child: Text(snapshot.data!.data!.detail!.namaUnitOrganisasi.toString(),
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
                                          const SizedBox(height: 5),
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
                                                      child: Text("Penanggung Jawab",
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
                                                      padding: EdgeInsets.only(left: 0),
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
                                                      padding: const EdgeInsets.only(left: 5),
                                                      child: Text(snapshot.data!.data!.detail!.namaJabatan.toString(),
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
                                          const SizedBox(height: 5),
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
                                                      child: Text("Jenis Anggaran",
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
                                                      padding: EdgeInsets.only(left: 0),
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
                                                      padding: const EdgeInsets.only(left: 5),
                                                      child: Text(snapshot.data!.data!.detail!.program!.namaJenisAnggaran.toString(),
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
                                          const SizedBox(height: 5),
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
                                                      child: Text("Kelompok Anggaran",
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
                                                      padding: EdgeInsets.only(left: 0),
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
                                                      padding: const EdgeInsets.only(left: 5),
                                                      child: Text(snapshot.data!.data!.detail!.program!.namaKelompokAnggaran.toString(),
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
                                          const SizedBox(height: 5),
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
                                                      child: Text("Sub Kelompok Anggaran",
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
                                                      padding: EdgeInsets.only(left: 0),
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
                                                      padding: const EdgeInsets.only(left: 5),
                                                      child: Text(snapshot.data!.data!.detail!.program!.namaSubKelompokAnggaran.toString(),
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
                                          const SizedBox(height: 5),
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
                                                      child: Text("Nama Program",
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
                                                      padding: EdgeInsets.only(left: 0),
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
                                                      padding: const EdgeInsets.only(left: 5),
                                                      child: Text(snapshot.data!.data!.detail!.program!.namaProgram.toString(),
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
                                          const SizedBox(height: 5),
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
                                                      child: Text("Tanggal Kegiatan",
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
                                                      padding: EdgeInsets.only(left: 0),
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
                                                      padding: const EdgeInsets.only(left: 5),
                                                      child: Text(tglKegiatan.toString(),
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
                                          const SizedBox(height: 5),
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
                                                      child: Text("Nama Kegiatan",
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
                                                      padding: EdgeInsets.only(left: 0),
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
                                                      padding: const EdgeInsets.only(left: 5),
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
                                          const SizedBox(height: 5),
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
                                                      child: Text("Penanggung Jawab",
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
                                                      padding: EdgeInsets.only(left: 0),
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
                                                      padding: const EdgeInsets.only(left: 5),
                                                      child: Text(snapshot.data!.data!.detail!.namaKaryawan.toString(),
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
                                          const SizedBox(height: 5),
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
                                                      child: Text("Periode Mulai",
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
                                                      padding: EdgeInsets.only(left: 0),
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
                                                      padding: const EdgeInsets.only(left: 5),
                                                      child: Text(tglPeriodeMulai.toString(),
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
                                          const SizedBox(height: 5),
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
                                                      child: Text("Periode Selesai",
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
                                                      padding: EdgeInsets.only(left: 0),
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
                                                      padding: const EdgeInsets.only(left: 5),
                                                      child: Text(tglPeriodeSelesai.toString(),
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
                                          const SizedBox(height: 5),
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
                                                      child: Text("No. Kegiatan",
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
                                                      padding: EdgeInsets.only(left: 0),
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
                                                      padding: const EdgeInsets.only(left: 5),
                                                      child: Text(snapshot.data!.data!.detail!.noKegiatan.toString(),
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
                                          const SizedBox(height: 5),
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
                                                      child: Text("Keterangan",
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
                                                      padding: EdgeInsets.only(left: 0),
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
                                                      padding: const EdgeInsets.only(left: 5),
                                                      child: Text(snapshot.data!.data!.detail!.deskripsiKegiatan.toString(),
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
                                  )
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          "Item Sumber Daya",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Card(
                            elevation: 8.0,
                            margin: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 6.0),
                            child: Container(
                              padding: const EdgeInsets.only(top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                children: <Widget>[
                                  ListView.separated(
                                    separatorBuilder: (context, index) => const Divider(
                                      color: Colors.black,
                                    ),
                                    itemCount: snapshot.data!.data!.detail!.sumberDaya!.length,
                                    itemBuilder: (BuildContext context, index){
                                      return ListTile(
                                        contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                                        title: Text(
                                          snapshot.data!.data!.detail!.sumberDaya![index]!.itemSumberDaya.toString(),
                                          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
                                          overflow: TextOverflow.ellipsis,
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
                                                    flex: 10,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: const <Widget>[
                                                        Padding(
                                                          padding: EdgeInsets.only(left: 0),
                                                          child: Text("Kategori Anggaran",
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
                                                    flex: 20,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.end,
                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(right: 0),
                                                          child: Text(snapshot.data!.data!.detail!.sumberDaya![index]!.namaKategoriSumberDaya.toString(),
                                                            style: const TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.right,
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
                                                    flex: 10,
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
                                                    flex: 20,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.end,
                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(right: 0),
                                                          child: Text(qtySumberDaya[index].toString()+" "+snapshot.data!.data!.detail!.sumberDaya![index]!.satuan.toString(),
                                                            style: const TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.right,
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
                                                    flex: 10,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: const <Widget>[
                                                        Padding(
                                                          padding: EdgeInsets.only(left: 0),
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
                                                    flex: 20,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.end,
                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(right: 0),
                                                          child: Text(hargaSatuanJual[index].toString(),
                                                            style: const TextStyle(
                                                              color: Colors.black,
                                                            ),
                                                            textAlign: TextAlign.right,
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
                                                    flex: 10,
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
                                                    flex: 20,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.end,
                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(right: 0),
                                                          child: Text(subTotalHarga[index].toString(),
                                                            style: const TextStyle(
                                                              color: Colors.black,
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
                                      );
                                    },
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                  ),
                                  const Divider(),
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        flex: 10,
                                        child: SizedBox(
                                          width: MediaQuery.of(context).size.width / 1.5,
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
                                                            child: Text("Total",
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
                                                            child: Text(grandTotalHarga.toString(),
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
                                        )
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        if (snapshot.data!.data!.approval!.isNotEmpty)...[
                          SizedBox(
                            width: double.infinity,
                            child: Card(
                              elevation: 8.0,
                              margin: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 6.0),
                              child: Container(
                                padding: const EdgeInsets.only(top: 10, bottom: 10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: ListView.separated(
                                  separatorBuilder: (context, index) => const Divider(
                                    color: Colors.black,
                                  ),
                                  itemCount: snapshot.data!.data!.approval!.length,
                                  itemBuilder: (BuildContext context, index){
                                    return ListTile(
                                      contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
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
                                                      ? Text("Pemeriksa ${index+1}",style: const TextStyle(color: Colors.black, fontSize: 14), textAlign: TextAlign.left)
                                                      : const Text("Pengesah",style: TextStyle(color: Colors.black, fontSize: 14), textAlign: TextAlign.left),
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
                                                        style: const TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 14,
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
                                          const SizedBox(height: 10),
                                          Row(
                                            children: <Widget>[
                                              Expanded(
                                                flex: 10,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: const <Widget>[
                                                    Padding(
                                                      padding: EdgeInsets.only(left: 0),
                                                      child: Text("Catatan",
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 14
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
                                                        style: const TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 14,
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
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
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
                        const SizedBox(height: 10),
                        FormError(errors: errors),
                        const SizedBox(height: 10),
                        Visibility(
                          visible: visibilityPemeriksa,
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                width: double.infinity,
                                height: 56,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.red[700],
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                                  ),
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      if (_catatanTextEditingController.text != "") {
                                        final _postProses = await MGPAPI().postKegiatan(
                                          noTransaksi: snapshot.data!.data!.detail!.noKegiatan.toString(),
                                          statusApproval: "REJ",
                                          catatan: _catatanTextEditingController.text,
                                          tglApproval: DateTime.now().toString(),
                                          approvalBaseline: snapshot.data!.data!.detail!.baseline.toString(),
                                        );
                                        if (_postProses == "berhasil") {
                                          Get.offAll(const KegiatanView());
                                        }
                                      }
                                    }
                                  },
                                  child: const Text(
                                    "REJECT",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 15),
                              SizedBox(
                                width: double.infinity,
                                height: 56,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.amber[700],
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                                  ),
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      if (_catatanTextEditingController.text != "") {
                                        final _postProses = await MGPAPI().postKegiatan(
                                          noTransaksi: snapshot.data!.data!.detail!.noKegiatan.toString(),
                                          statusApproval: "REV",
                                          catatan: _catatanTextEditingController.text,
                                          tglApproval: DateTime.now().toString(),
                                          approvalBaseline: snapshot.data!.data!.detail!.baseline.toString(),
                                        );
                                        if (_postProses == "berhasil") {
                                          Get.offAll(const KegiatanView());
                                        }
                                      }
                                    }
                                  },
                                  child: const Text(
                                    "REVISE",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 15),
                              SizedBox(
                                width: double.infinity,
                                height: 56,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.green[800],
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                                  ),
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      if (_catatanTextEditingController.text != "") {
                                        final _postProses = await MGPAPI().postKegiatan(
                                          noTransaksi: snapshot.data!.data!.detail!.noKegiatan.toString(),
                                          statusApproval: "VER",
                                          catatan: _catatanTextEditingController.text,
                                          tglApproval: DateTime.now().toString(),
                                          approvalBaseline: snapshot.data!.data!.detail!.baseline.toString(),
                                        );
                                        if (_postProses == "berhasil") {
                                          Get.offAll(const KegiatanView());
                                        }
                                      }
                                    }
                                  },
                                  child: const Text(
                                    "VERIFY",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
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
                                height: 56,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.red[700],
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                                  ),
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      if (_catatanTextEditingController.text != "") {
                                        final _postProses = await MGPAPI().postKegiatan(
                                          noTransaksi: snapshot.data!.data!.detail!.noKegiatan.toString(),
                                          statusApproval: "REJ",
                                          catatan: _catatanTextEditingController.text,
                                          tglApproval: DateTime.now().toString(),
                                          approvalBaseline: snapshot.data!.data!.detail!.baseline.toString(),
                                        );
                                        if (_postProses == "berhasil") {
                                          Get.offAll(const KegiatanView());
                                        }
                                      }
                                    }
                                  },
                                  child: const Text(
                                    "REJECT",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 15),
                              SizedBox(
                                width: double.infinity,
                                height: 56,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.green[800],
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                                  ),
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      if (_catatanTextEditingController.text != "") {
                                        final _postProses = await MGPAPI().postKegiatan(
                                          noTransaksi: snapshot.data!.data!.detail!.noKegiatan.toString(),
                                          statusApproval: "APP",
                                          catatan: _catatanTextEditingController.text,
                                          tglApproval: DateTime.now().toString(),
                                          approvalBaseline: snapshot.data!.data!.detail!.baseline.toString(),
                                        );
                                        if (_postProses == "berhasil") {
                                          Get.offAll(const KegiatanView());
                                        }
                                      }
                                    }
                                  },
                                  child: const Text(
                                    "APPROVE",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
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
      ),
    );
  }
}