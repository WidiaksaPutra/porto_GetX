import 'package:mgp_mobile_app/model/hrdu/faktur_penjualan/detail_faktur_penjualan_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mgp_mobile_app/modul/hrdu/approval_faktur_penjualan/approval_faktur_penjualan.dart';
import 'package:mgp_mobile_app/widget/component/alert_approval.dart';
import 'package:mgp_mobile_app/widget/component/button_pemeriksa.dart';
import 'package:mgp_mobile_app/widget/component/button_pengesah.dart';
import 'package:mgp_mobile_app/widget/component/card_detail.dart';
import 'package:mgp_mobile_app/widget/component/card_expansion_detail.dart';
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
import 'package:mgp_mobile_app/service/mgp_api_hrdu.dart';
import 'package:get/get.dart';

class Body extends StatefulWidget {
  final String noFaktur;
  final String statusMenu;
  const Body({
    Key? key,
    required this.noFaktur,
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
  late List subTotalHarga = [];
  late String grandTotalHarga;
  late String diskonHarga;
  late String totalSetelahDiskon;
  late String ppnHarga;
  late String totalSetelahPpn;
  final _formKey = GlobalKey<FormState>();
  final _catatanTextEditingController = TextEditingController();
  late Future<DetailRegfpnj> futureDetailRegfpnj;
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
            final _postProses = await MGPAPI().postFakturPenjualan(
              noTransaksi: noTransaksi,
              statusApproval: status,
              catatan: catatan,
              tglApproval: DateTime.now().toString(),
              approvalBaseline: approvalBaseline,
            );
            if (_postProses == "berhasil") {
              Get.offAll(const FakturPenjualanView());
            }
          },
        );
      }
    );
  }

  @override
  void initState() {
    futureDetailRegfpnj = MGPAPI().fetchApprovalDetailFakturPenjualan(noFaktur: widget.noFaktur);
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
              child: FutureBuilder<DetailRegfpnj>(
                future: futureDetailRegfpnj,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var detailFakturPenjualan = snapshot.data;
                    String status = detailFakturPenjualan!.data!.behavior.toString();
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
                    double valuePPN = double.parse(detailFakturPenjualan.data!.detail!.ppn.toString());
                    double valueDiskon = double.parse(detailFakturPenjualan.data!.detail!.diskon.toString());
                    num totalHarga = 0;
                    for(var i = 0; i< detailFakturPenjualan.data!.detail!.detail!.length; i++){
                      num subTotal = (double.parse(detailFakturPenjualan.data!.detail!.detail![i]!.hargaSatuanJual.toString())) * double.parse(detailFakturPenjualan.data!.detail!.detail![i]!.qty.toString());
                      totalHarga = totalHarga + (double.parse(detailFakturPenjualan.data!.detail!.detail![i]!.hargaSatuanJual.toString())) * double.parse(detailFakturPenjualan.data!.detail!.detail![i]!.qty.toString());
                      subTotalHarga.add(subTotal.toString());        
                    }
                    grandTotalHarga = totalHarga.toString();
                    num diskonTotal = (totalHarga * valueDiskon)/100;
                    num totalDiskon = (totalHarga - diskonTotal);
                    num ppnTotal = (totalDiskon * valuePPN)/100;
                    num totalPPN = (totalDiskon + ppnTotal);
                    diskonHarga = diskonTotal.toString();
                    totalSetelahDiskon = totalDiskon.toString();
                    ppnHarga = ppnTotal.toString();
                    totalSetelahPpn = totalPPN.toString();
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
                                  label: "Tgl. Sales Order",
                                  date: detailFakturPenjualan.data!.detail!.tglSalesOrder,
                                  flexLeftRow: 12,
                                  flexRightRow: 20,
                                ),
                                const SizedBox(height: 5),
                                CardFieldItemText(
                                  label: "No. Sales Order",
                                  contentData: detailFakturPenjualan.data!.detail!.noSalesOrder,
                                  flexLeftRow: 12,
                                  flexRightRow: 20,
                                ),
                                const SizedBox(height: 5),
                                CardFieldItemText(
                                  label: "Customer",
                                  contentData: detailFakturPenjualan.data!.detail!.namaCustomer,
                                  flexLeftRow: 12,
                                  flexRightRow: 20,
                                ),
                                const SizedBox(height: 5),
                                CardFieldItemText(
                                  label: "Sales",
                                  contentData: detailFakturPenjualan.data!.detail!.namaSales,
                                  flexLeftRow: 12,
                                  flexRightRow: 20,
                                ),
                                const SizedBox(height: 5),
                                CardFieldItemDate(
                                  label: "Tgl. Faktur",
                                  date: detailFakturPenjualan.data!.detail!.tglFaktur,
                                  flexLeftRow: 12,
                                  flexRightRow: 20,
                                ),
                                const SizedBox(height: 5),
                                CardFieldItemText(
                                  label: "No. Faktur",
                                  contentData: detailFakturPenjualan.data!.detail!.noFaktur,
                                  flexLeftRow: 12,
                                  flexRightRow: 20,
                                ),
                                const SizedBox(height: 5),
                                CardFieldItemText(
                                  label: "Proyek",
                                  contentData: detailFakturPenjualan.data!.detail!.namaProyek,
                                  flexLeftRow: 12,
                                  flexRightRow: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                        CardExpansionDetail(
                          label: "Item Faktur Penjualan",
                          children: <Widget> [
                            ListView.separated(
                              separatorBuilder: (context, index) => const SizedBox(
                                height: 10,
                              ),
                              itemCount: detailFakturPenjualan.data!.detail!.detail!.length,
                              itemBuilder: (BuildContext context, index){
                                return Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: CardItemExpansionDetail(
                                    child: ListTile(
                                      contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                                      title: HighlightItemName(
                                        child: Text(
                                          detailFakturPenjualan.data!.detail!.detail![index]!.noSuratJalan.toString(),
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
                                            CardFieldItemDate(
                                              label: "Tgl. Surat Jalan",
                                              date: detailFakturPenjualan.data!.detail!.detail![index]!.tglSuratJalan,
                                              flexLeftRow: 10,
                                              flexRightRow: 20,
                                            ),
                                            const SizedBox(height: 10),
                                            CardFieldItemText(
                                              label: "No. Delivery Order",
                                              contentData: detailFakturPenjualan.data!.detail!.detail![index]!.noDeliveryOrder,
                                              flexLeftRow: 10,
                                              flexRightRow: 20,
                                            ),
                                            const SizedBox(height: 10),
                                            CardFieldItemRightRow(
                                              label: "Item Barang",
                                              rightRow: <Widget> [
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 0),
                                                  child: (detailFakturPenjualan.data!.detail!.detail![index]!.kodeItem != null)
                                                  ? Text(
                                                    "("+
                                                    detailFakturPenjualan.data!.detail!.detail![index]!.kodeItem.toString()
                                                    +') '+
                                                    detailFakturPenjualan.data!.detail!.detail![index]!.namaItem.toString(),
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14
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
                                              flexLeftRow: 10,
                                              flexRightRow: 20,
                                            ),
                                            const SizedBox(height: 10),
                                            CardFieldItemRightRow(
                                              label: "Qty. Surat Jalan",
                                              rightRow: <Widget> [
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 0),
                                                  child: (detailFakturPenjualan.data!.detail!.detail![index]!.qty != null)
                                                  ? Text(
                                                    formatDecimal.format(double.parse(detailFakturPenjualan.data!.detail!.detail![index]!.qty.toString())).toString()
                                                    +' '+
                                                    detailFakturPenjualan.data!.detail!.detail![index]!.namaSatuan.toString(),
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14
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
                                              flexLeftRow: 10,
                                              flexRightRow: 20,
                                            ),
                                            const SizedBox(height: 10),
                                            CardFieldItemFormatCurrency(
                                              label: "Harga Satuan",
                                              contentData: detailFakturPenjualan.data!.detail!.detail![index]!.hargaSatuanJual,
                                              flexLeftRow: 10,
                                              flexRightRow: 20,
                                            ),
                                            const SizedBox(height: 10),
                                            CardFieldItemFormatCurrency(
                                              label: "Sub Total",
                                              contentData: subTotalHarga[index],
                                              flexLeftRow: 10,
                                              flexRightRow: 20,
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
                                        labelValue: detailFakturPenjualan.data!.detail!.diskon,
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
                                        labelValue: detailFakturPenjualan.data!.detail!.ppn,
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
                          ],
                        ),
                        if (detailFakturPenjualan.data!.approval!.isNotEmpty)...[
                          CardExpansionDetail(
                            label: "Catatan Approval",
                            children: <Widget> [
                              ListView.separated(
                                separatorBuilder: (context, index) => const SizedBox(
                                  height: 10,
                                ),
                                itemCount: detailFakturPenjualan.data!.approval!.length,
                                itemBuilder: (context, index){
                                  return FieldCatatanApproval(
                                    index: index,
                                    statusApproval: detailFakturPenjualan.data!.approval![index]!.statusApproval,
                                    namaKaryawan: detailFakturPenjualan.data!.approval![index]!.namaKaryawan,
                                    catatanApproval: detailFakturPenjualan.data!.approval![index]!.catatan,
                                    tglApproval: detailFakturPenjualan.data!.approval![index]!.tglApproval,
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
                                    "REVISE Faktur Penjualan",
                                    "REVISE",
                                    reviseButtonColor,
                                    detailFakturPenjualan.data!.detail!.noFaktur.toString(),
                                    "REV",
                                    _catatanTextEditingController.text,
                                    detailFakturPenjualan.data!.detail!.baseline.toString(),
                                  );
                                }
                              }
                            },
                            onClickedReject: () {
                              if (_formKey.currentState!.validate()) {
                                if (_catatanTextEditingController.text != "") {
                                  showAlertDialog(
                                    "REJECT Faktur Penjualan",
                                    "REJECT",
                                    rejectButtonColor,
                                    detailFakturPenjualan.data!.detail!.noFaktur.toString(),
                                    "REJ",
                                    _catatanTextEditingController.text,
                                    detailFakturPenjualan.data!.detail!.baseline.toString(),
                                  );
                                }
                              }
                            },
                            onClickedVerify: () {
                              if (_formKey.currentState!.validate()) {
                                if (_catatanTextEditingController.text != "") {
                                  showAlertDialog(
                                    "VERIFY Faktur Penjualan",
                                    "VERIFY",
                                    verifyButtonColor,
                                    detailFakturPenjualan.data!.detail!.noFaktur.toString(),
                                    "VER",
                                    _catatanTextEditingController.text,
                                    detailFakturPenjualan.data!.detail!.baseline.toString(),
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
                                    "REJECT Faktur Penjualan",
                                    "REJECT",
                                    rejectButtonColor,
                                    detailFakturPenjualan.data!.detail!.noFaktur.toString(),
                                    "REJ",
                                    _catatanTextEditingController.text,
                                    detailFakturPenjualan.data!.detail!.baseline.toString(),
                                  );
                                } 
                              }
                            },
                            onClickedApprove: () {
                              if (_formKey.currentState!.validate()) {
                                if (_catatanTextEditingController.text != "") {
                                  showAlertDialog(
                                    "APPROVE Faktur Penjualan",
                                    "APPROVE",
                                    verifyButtonColor,
                                    detailFakturPenjualan.data!.detail!.noFaktur.toString(),
                                    "APP",
                                    _catatanTextEditingController.text,
                                    detailFakturPenjualan.data!.detail!.baseline.toString(),
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