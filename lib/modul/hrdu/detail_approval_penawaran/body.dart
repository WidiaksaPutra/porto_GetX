import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/model/hrdu/penawaran/detail_penawaran_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mgp_mobile_app/modul/hrdu/approval_penawaran/approval_penawaran.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_penawaran/prelim_penawaran/prelim_penawaran.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_rab/analisa_single_rab/analisa_single_rab.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu.dart';
import 'package:mgp_mobile_app/widget/component/alert_approval.dart';
import 'package:mgp_mobile_app/widget/component/button_pemeriksa.dart';
import 'package:mgp_mobile_app/widget/component/button_pengesah.dart';
import 'package:mgp_mobile_app/widget/component/card_detail.dart';
import 'package:mgp_mobile_app/widget/component/card_expansion_detail.dart';
import 'package:mgp_mobile_app/widget/component/card_expansion_detail_prelim_text.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_date.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_format_currency.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_percent.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_right_row.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_text.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_total.dart';
import 'package:mgp_mobile_app/widget/component/card_item_expansion_detail.dart';
import 'package:mgp_mobile_app/widget/component/catatan_approval.dart';
import 'package:mgp_mobile_app/widget/component/error_form.dart';
import 'package:mgp_mobile_app/widget/component/field_catatan_approval.dart';
import 'package:mgp_mobile_app/widget/component/highlight_item_name.dart';
import 'package:mgp_mobile_app/widget/theme/constants.dart';

class Body extends StatefulWidget {
  final String noPenawaran;
  final String baseline;
  final String statusMenu;
  const Body({
    Key? key,
    required this.noPenawaran,
    required this.baseline,
    required this.statusMenu,
  }) : super(key: key);

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
  final decimalFormat = NumberFormat("###", "id_ID");
  late List subTotalHargaPenawaran = [];
  late String grandTotalHarga;
  late String grandTotalPrelim;
  late String diskonHarga;
  late String totalSetelahDiskon;
  late String ppnHarga;
  late String totalSetelahPpn;
  final _formKey = GlobalKey<FormState>();
  final _catatanTextEditingController = TextEditingController();
  late Future<DetailRegpnw> futureDetailRegpnw;
  bool visibilityPemeriksa = false;
  bool visibilityPengesah = false;
  bool catatanError = false;
  bool visibilityStatusMenu = false;

  Future showAlertDialog(
    final String title,
    final String label,
    final Color color,
    final String noTransaksi,
    final String status,
    final String catatan,
    final String approvalBaseline,
  ) {
    return showDialog(
      context: context, 
      builder: (BuildContext context) {
        return AlertApproval(
          title: title,
          titleColor: color,
          contentApproval: label,
          labelButton: label,
          colorButton: color,
          onClicked: () async {
            final _postProses = await MGPAPI().postPenawaran(
              noTransaksi: noTransaksi,
              statusApproval: status,
              catatan: catatan,
              tglApproval: DateTime.now().toString(),
              approvalBaseline: approvalBaseline,
            );
            if (_postProses == "berhasil") {
              Get.offAll(const PenawaranView());
            }
          },
        );
      }
    );
  }
  
  @override
  void initState() {
    futureDetailRegpnw = MGPAPI().fetchApprovalDetailPenawaran(noPenawaran: widget.noPenawaran, baseline: widget.baseline);
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
              child: FutureBuilder<DetailRegpnw>(
                future: futureDetailRegpnw,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var detailPenawaran = snapshot.data;
                    String status = detailPenawaran!.data!.behavior.toString();
                    if (status == "V") {
                      visibilityPemeriksa = true;
                    } else {
                      visibilityPengesah = true;
                    }
                    if (widget.statusMenu == "Approval") {
                      visibilityStatusMenu = true;
                    } else {
                      visibilityStatusMenu = false;
                    }
                    late double valuePPN;
                    late double valueDiskon;
                    if (detailPenawaran.data!.detail!.ppn != null) {
                      valuePPN = double.parse(detailPenawaran.data!.detail!.ppn.toString());
                    } else {
                      valuePPN = 0;
                    }
                    if (detailPenawaran.data!.detail!.diskon != null) {
                      valueDiskon = double.parse(detailPenawaran.data!.detail!.diskon.toString());
                    } else {
                      valueDiskon = 0;
                    }
                    num totalHargaPenawaran = 0;
                    num totalPrelim = 0;
                    if (detailPenawaran.data!.detail!.detailBarangJadi!.isNotEmpty) {
                      for (var i = 0; i < detailPenawaran.data!.detail!.detailBarangJadi!.length; i++) {
                        num subTotal = (double.parse(detailPenawaran.data!.detail!.detailBarangJadi![i]!.rounded.toString()) * double.parse(detailPenawaran.data!.detail!.detailBarangJadi![i]!.qtyRab.toString()));
                        totalHargaPenawaran = totalHargaPenawaran + subTotal;
                        subTotalHargaPenawaran.add(subTotal.toString());
                      }
                    }
                    if (detailPenawaran.data!.detail!.detailPrelim!.isNotEmpty) {
                      for (var i = 0; i < detailPenawaran.data!.detail!.detailPrelim!.length; i++) {
                        num subTotal = double.parse(detailPenawaran.data!.detail!.detailPrelim![i]!.qtyAnalisa.toString())
                        * double.parse(detailPenawaran.data!.detail!.detailPrelim![i]!.unitPrice.toString())
                        * double.parse(detailPenawaran.data!.detail!.detailPrelim![i]!.konstanta.toString());
                        totalPrelim = totalPrelim + subTotal;
                      }
                    }
                    num grandTotalPenawaran = totalHargaPenawaran + totalPrelim;
                    grandTotalHarga = grandTotalPenawaran.toString();
                    num diskonTotal = (grandTotalPenawaran * valueDiskon)/100;
                    num totalDiskon = (grandTotalPenawaran - diskonTotal);
                    num ppnTotal = (totalDiskon * valuePPN)/100;
                    num totalPPN = (totalDiskon + ppnTotal);
                    diskonHarga = diskonTotal.toString();
                    totalSetelahDiskon = totalDiskon.toString();
                    ppnHarga = ppnTotal.toString();
                    totalSetelahPpn = totalPPN.toString();
                    grandTotalPrelim = totalPrelim.toString();
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(height: 5),
                        CardDetail(
                          child: ListTile(
                            subtitle: Column(
                              children: <Widget>[
                                CardFieldItemDate(
                                  label: "Tgl. RAB",
                                  date: detailPenawaran.data!.detail!.tglRab,
                                  flexLeftRow: 8,
                                  flexRightRow: 20,
                                ),
                                const SizedBox(height: 5),
                                CardFieldItemText(
                                  label: "No. RAB",
                                  contentData: detailPenawaran.data!.detail!.noRab,
                                  flexLeftRow: 8,
                                  flexRightRow: 20,
                                ),
                                const SizedBox(height: 5),
                                CardFieldItemDate(
                                  label: "Tgl. Penawaran",
                                  date: detailPenawaran.data!.detail!.tglPenawaran,
                                  flexLeftRow: 8,
                                  flexRightRow: 20,
                                ),
                                const SizedBox(height: 5),
                                CardFieldItemText(
                                  label: "No. Penawaran",
                                  contentData: detailPenawaran.data!.detail!.noPenawaran,
                                  flexLeftRow: 8,
                                  flexRightRow: 20,
                                ),
                                const SizedBox(height: 5),
                                CardFieldItemText(
                                  label: "Customer",
                                  contentData: detailPenawaran.data!.detail!.namaCustomer,
                                  flexLeftRow: 8,
                                  flexRightRow: 20,
                                ),
                                const SizedBox(height: 5),
                                CardFieldItemText(
                                  label: "ATT",
                                  contentData: detailPenawaran.data!.detail!.att,
                                  flexLeftRow: 8,
                                  flexRightRow: 20,
                                ),
                                const SizedBox(height: 5),
                                CardFieldItemDate(
                                  label: "Tgl. Selesai",
                                  date: detailPenawaran.data!.detail!.tglSelesai,
                                  flexLeftRow: 8,
                                  flexRightRow: 20,
                                ),
                                const SizedBox(height: 5),
                                CardFieldItemText(
                                  label: "Proyek",
                                  contentData: detailPenawaran.data!.detail!.namaProyek,
                                  flexLeftRow: 8,
                                  flexRightRow: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                        CardExpansionDetail(
                          label: "Teks Pembuka",
                          children: <Widget> [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: CardItemExpansionDetail(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                  child: (detailPenawaran.data!.detail!.teksPembuka != null)
                                  ? Html(
                                    data: detailPenawaran.data!.detail!.teksPembuka
                                  )
                                  : const Text("-",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14
                                    ),
                                    textAlign: TextAlign.left,
                                  )
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                        CardExpansionDetail(
                          label: "Item Barang Jadi",
                          children: <Widget> [
                            ListView.separated(
                              separatorBuilder: (context, index) => const SizedBox(
                                height: 10,
                              ),
                              itemCount: detailPenawaran.data!.detail!.detailBarangJadi!.length,
                              itemBuilder: (context, index){
                                return Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: CardItemExpansionDetail(
                                    child: ListTile(
                                      contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                                      title: HighlightItemName(
                                        child: Text(
                                          detailPenawaran.data!.detail!.detailBarangJadi![index]!.kodeItem.toString(),
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
                                            CardFieldItemText(
                                              label: "Barang Jadi",
                                              contentData: detailPenawaran.data!.detail!.detailBarangJadi![index]!.namaItem,
                                              flexLeftRow: 12,
                                              flexRightRow: 20,
                                            ),
                                            const SizedBox(height: 10),
                                            CardFieldItemRightRow(
                                              label: "Qty",
                                              rightRow: <Widget> [
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 0),
                                                  child: (detailPenawaran.data!.detail!.detailBarangJadi![index]!.qtyRab != null)
                                                  ? Text(
                                                    formatDecimal.format(
                                                      double.parse(detailPenawaran.data!.detail!.detailBarangJadi![index]!.qtyRab.toString()
                                                      )
                                                    ).toString()
                                                    +" "+
                                                    detailPenawaran.data!.detail!.detailBarangJadi![index]!.namaSatuan.toString(),
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                    ),
                                                    textAlign: TextAlign.left,
                                                  )
                                                  : const Text("-",
                                                    style: TextStyle(
                                                      color: Colors.black
                                                    ),
                                                    textAlign: TextAlign.left,
                                                  )
                                                ),
                                              ],
                                              flexLeftRow: 12,
                                              flexRightRow: 20,
                                            ),
                                            const SizedBox(height: 10),
                                            CardFieldItemFormatCurrency(
                                              label: "Harga Satuan",
                                              contentData: detailPenawaran.data!.detail!.detailBarangJadi![index]!.rounded,
                                              flexLeftRow: 12,
                                              flexRightRow: 20,
                                            ),
                                            const SizedBox(height: 10),
                                            CardFieldItemFormatCurrency(
                                              label: "Sub Total",
                                              contentData: subTotalHargaPenawaran[index],
                                              flexLeftRow: 12,
                                              flexRightRow: 20,
                                            ),
                                          ],
                                        ),
                                      ),
                                      onTap : () {
                                        Get.to(
                                          DetailAnalisaSingleRABView(
                                            idRabDetail: detailPenawaran.data!.detail!.detailBarangJadi![index]!.idRabDetail.toString(),
                                            title: "Analisa Barang Jadi Penawaran",
                                          )
                                        );
                                      },
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
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                                  title: const Text(
                                    "PRELIM",
                                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  subtitle: Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        const CardExpansionDetailPrelim(),
                                        const SizedBox(height: 10),
                                        CardFieldItemFormatCurrency(
                                          label: "Harga Satuan",
                                          contentData: grandTotalPrelim,
                                          flexLeftRow: 12,
                                          flexRightRow: 20,
                                        ),
                                        const SizedBox(height: 10),
                                        CardFieldItemFormatCurrency(
                                          label: "Sub Total",
                                          contentData: grandTotalPrelim,
                                          flexLeftRow: 12,
                                          flexRightRow: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                  onTap : () {
                                    Get.to(AnalisaPrelimPenawaranView(detailPenawaran: futureDetailRegpnw, grandTotalPrelim: grandTotalPrelim));
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: CardItemExpansionDetail(
                                child: ListTile(
                                  title: Column(
                                    children: <Widget> [
                                      CardFieldItemTotal(
                                        label: "Total",
                                        total: grandTotalHarga,
                                        flexLeftRow: 15,
                                        flexRightRow: 20,
                                      ),
                                      const SizedBox(height: 5),
                                      CardFieldItemPercent(
                                        label: "Diskon",
                                        labelValue: detailPenawaran.data!.detail!.diskon,
                                        total: diskonHarga,
                                        flexLeftRow: 15,
                                        flexRightRow: 20,
                                      ),
                                      const SizedBox(height: 5),
                                      CardFieldItemTotal(
                                        label: "Total Setelah Diskon",
                                        total: totalSetelahDiskon,
                                        flexLeftRow: 15,
                                        flexRightRow: 20,
                                      ),
                                      const SizedBox(height: 5),
                                      CardFieldItemPercent(
                                        label: "PPN",
                                        labelValue: detailPenawaran.data!.detail!.ppn,
                                        total: ppnHarga,
                                        flexLeftRow: 15,
                                        flexRightRow: 20,
                                      ),
                                      const SizedBox(height: 5),
                                      CardFieldItemTotal(
                                        label: "Total Setelah PPN",
                                        total: totalSetelahPpn,
                                        flexLeftRow: 15,
                                        flexRightRow: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: CardItemExpansionDetail(
                                child: ListTile(
                                  title: Column(
                                    children: <Widget> [
                                      CardFieldItemTotal(
                                        label: "Grand Total",
                                        total: totalSetelahPpn,
                                        flexLeftRow: 15,
                                        flexRightRow: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                        CardExpansionDetail(
                          label: "Teks Penutup",
                          children: <Widget> [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: CardItemExpansionDetail(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                  child: (detailPenawaran.data!.detail!.teksPenutup != null)
                                  ? Html(
                                    data: detailPenawaran.data!.detail!.teksPenutup
                                  )
                                  : const Text("-",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14
                                    ),
                                    textAlign: TextAlign.left,
                                  )
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                        if (detailPenawaran.data!.approval!.isNotEmpty)...[
                          CardExpansionDetail(
                            label: "Catatan Approval",
                            children: <Widget> [
                              ListView.separated(
                                separatorBuilder: (context, index) => const SizedBox(
                                  height: 10,
                                ),
                                itemCount: detailPenawaran.data!.approval!.length,
                                itemBuilder: (context, index){
                                  return FieldCatatanApproval(
                                    index: index,
                                    statusApproval: detailPenawaran.data!.approval![index]!.statusApproval,
                                    namaKaryawan: detailPenawaran.data!.approval![index]!.namaKaryawan,
                                    catatanApproval: detailPenawaran.data!.approval![index]!.catatan,
                                    tglApproval: detailPenawaran.data!.approval![index]!.tglApproval,
                                  );
                                },
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                              ),
                              const SizedBox(height: 10),
                            ]
                          ),
                        ],
                        Visibility(
                          visible: visibilityStatusMenu,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 3),
                            child: CatatanApproval(
                              controller: _catatanTextEditingController,
                              onChanged: (value) {
                                if (value!.isNotEmpty) {
                                  setState(() {
                                    catatanError = false;
                                  });
                                }
                                return; 
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  setState(() {
                                    catatanError = true;
                                  });
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        Visibility(
                          visible: catatanError,
                          child: Column(
                            children: const <Widget>[
                              SizedBox(height: 5),
                              FormErrors(errors: kCatatanError),
                              SizedBox(height: 8),
                            ],
                          )
                        ),
                        Visibility(
                          visible: visibilityStatusMenu,
                          child: const SizedBox(height: 10)
                        ),
                        Visibility(
                          visible: visibilityStatusMenu,
                          child: ButtonPemeriksa(
                            visibilityPemeriksa: visibilityPemeriksa,
                            onClickedRevise: () {
                              if (_formKey.currentState!.validate()) {
                                if (_catatanTextEditingController.text != "") {
                                  showAlertDialog(
                                    "REVISE Penawaran",
                                    "REVISE",
                                    reviseButtonColor,
                                    detailPenawaran.data!.detail!.noPenawaran.toString(),
                                    "REV",
                                    _catatanTextEditingController.text,
                                    detailPenawaran.data!.detail!.baseline.toString(),
                                  );
                                }
                              }
                            },
                            onClickedReject: () {
                              if (_formKey.currentState!.validate()) {
                                if (_catatanTextEditingController.text != "") {
                                  showAlertDialog(
                                    "REJECT Penawaran",
                                    "REJECT",
                                    rejectButtonColor,
                                    detailPenawaran.data!.detail!.noPenawaran.toString(),
                                    "REJ",
                                    _catatanTextEditingController.text,
                                    detailPenawaran.data!.detail!.baseline.toString(),
                                  );
                                }
                              }
                            },
                            onClickedVerify: () {
                              if (_formKey.currentState!.validate()) {
                                if (_catatanTextEditingController.text != "") {
                                  showAlertDialog(
                                    "VERIFY Penawaran",
                                    "VERIFY",
                                    verifyButtonColor,
                                    detailPenawaran.data!.detail!.noPenawaran.toString(),
                                    "VER",
                                    _catatanTextEditingController.text,
                                    detailPenawaran.data!.detail!.baseline.toString(),
                                  );
                                }
                              }
                            },
                          ),
                        ),
                        Visibility(
                          visible: visibilityStatusMenu,
                          child: ButtonPengesah(
                            visibilityPengesah: visibilityPengesah,
                            onClickedReject: () {
                              if (_formKey.currentState!.validate()) {
                                if (_catatanTextEditingController.text != "") {
                                  showAlertDialog(
                                    "REJECT Penawaran",
                                    "REJECT",
                                    rejectButtonColor,
                                    detailPenawaran.data!.detail!.noPenawaran.toString(),
                                    "REJ",
                                    _catatanTextEditingController.text,
                                    detailPenawaran.data!.detail!.baseline.toString(),
                                  );
                                }
                              }
                            },
                            onClickedApprove: () {
                              if (_formKey.currentState!.validate()) {
                                if (_catatanTextEditingController.text != "") {
                                  showAlertDialog(
                                    "APPROVE Penawaran",
                                    "APPROVE",
                                    verifyButtonColor,
                                    detailPenawaran.data!.detail!.noPenawaran.toString(),
                                    "APP",
                                    _catatanTextEditingController.text,
                                    detailPenawaran.data!.detail!.baseline.toString(),
                                  );
                                }
                              }
                            },
                          ),
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