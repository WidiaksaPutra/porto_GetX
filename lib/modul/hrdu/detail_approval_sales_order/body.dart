import 'package:mgp_mobile_app/model/hrdu/sales_order/detail_sales_order_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mgp_mobile_app/modul/hrdu/approval_sales_order/approval_sales_order.dart';
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
  const Body({
    Key? key,
    required this.noSalesOrder,
    required this.statusMenu,
  }) : super(key: key);
  final String noSalesOrder;
  final String statusMenu;
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
  late Future<DetailRegso> futureDetailRegso;
  final _formKey = GlobalKey<FormState>();
  final _catatanTextEditingController = TextEditingController();
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
            final _postProses = await MGPAPI().postSalesOrder(
              noTransaksi: noTransaksi,
              statusApproval: status,
              catatan: catatan,
              tglApproval: DateTime.now().toString(),
              approvalBaseline: approvalBaseline,
            );
            if (_postProses == "berhasil") {
              Get.offAll(const SalesOrderView());
            }
          },
        );
      }
    );
  }
  
  @override
  void initState() {
    futureDetailRegso = MGPAPI().fetchApprovalDetailSalesOrder(noSalesOrder: widget.noSalesOrder);
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
              child: FutureBuilder<DetailRegso>(
                future: futureDetailRegso,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var detailSalesOrder = snapshot.data;
                    String status = detailSalesOrder!.data!.behavior.toString();
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
                    double valuePPN = double.parse(snapshot.data!.data!.detail!.ppn.toString());
                    double valueDiskon = double.parse(snapshot.data!.data!.detail!.diskon.toString());
                    num totalHarga = 0;
                    for(var i = 0; i< snapshot.data!.data!.detail!.detail!.length; i++){
                      num subTotal = (double.parse(snapshot.data!.data!.detail!.detail![i]!.hargaSatuanJual.toString())) * double.parse(snapshot.data!.data!.detail!.detail![i]!.qtyItem.toString());
                      totalHarga = totalHarga + (double.parse(snapshot.data!.data!.detail!.detail![i]!.hargaSatuanJual.toString())) * double.parse(snapshot.data!.data!.detail!.detail![i]!.qtyItem.toString());
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
                                  date: detailSalesOrder.data!.detail!.tglSalesOrder,
                                  flexLeftRow: 13,
                                  flexRightRow: 20,
                                ),
                                const SizedBox(height: 5),
                                CardFieldItemText(
                                  label: "No. Sales Order",
                                  contentData: detailSalesOrder.data!.detail!.noSalesOrder,
                                  flexLeftRow: 13,
                                  flexRightRow: 20,
                                ),
                                const SizedBox(height: 5),
                                CardFieldItemText(
                                  label: "Customer",
                                  contentData: detailSalesOrder.data!.detail!.namaCustomer,
                                  flexLeftRow: 13,
                                  flexRightRow: 20,
                                ),
                                const SizedBox(height: 5),
                                CardFieldItemText(
                                  label: "Sales",
                                  contentData: detailSalesOrder.data!.detail!.namaSales,
                                  flexLeftRow: 13,
                                  flexRightRow: 20,
                                ),
                                const SizedBox(height: 5),
                                CardFieldItemText(
                                  label: "Alamat Pengiriman",
                                  contentData: detailSalesOrder.data!.detail!.alamatPengiriman,
                                  flexLeftRow: 13,
                                  flexRightRow: 20,
                                ),
                                const SizedBox(height: 5),
                                CardFieldItemDate(
                                  label: "Tgl. Batas Waktu",
                                  date: detailSalesOrder.data!.detail!.batasWaktu,
                                  flexLeftRow: 13,
                                  flexRightRow: 20,
                                ),
                                const SizedBox(height: 5),
                                CardFieldItemText(
                                  label: "Catatan Sales Order",
                                  contentData: detailSalesOrder.data!.detail!.catatanSo,
                                  flexLeftRow: 13,
                                  flexRightRow: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                        CardExpansionDetail(
                          label: "Item Sales Order",
                          children: <Widget> [
                            ListView.separated(
                              separatorBuilder: (context, index) => const SizedBox(
                                height: 10,
                              ),
                              itemCount: detailSalesOrder.data!.detail!.detail!.length,
                              itemBuilder: (BuildContext context, index){
                                return Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: CardItemExpansionDetail(
                                    child: ListTile(
                                      contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                                      title: HighlightItemName(
                                        child: Text(
                                          detailSalesOrder.data!.detail!.detail![index]!.kodeBarang.toString(),
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
                                              label: "Nama Barang",
                                              contentData: detailSalesOrder.data!.detail!.detail![index]!.namaBarang,
                                              flexLeftRow: 13,
                                              flexRightRow: 20,
                                            ),
                                            const SizedBox(height: 10),
                                            CardFieldItemText(
                                              label: "Nama Gudang",
                                              contentData: detailSalesOrder.data!.detail!.detail![index]!.namaGudang,
                                              flexLeftRow: 13,
                                              flexRightRow: 20,
                                            ),
                                            const SizedBox(height: 10),
                                            CardFieldItemRightRow(
                                              label: "Qty",
                                              rightRow: <Widget> [
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 0),
                                                  child: (detailSalesOrder.data!.detail!.detail![index]!.qtyItem != null)
                                                  ? Text(
                                                    formatDecimal.format(double.parse(detailSalesOrder.data!.detail!.detail![index]!.qtyItem.toString())).toString()
                                                    +' '+
                                                    detailSalesOrder.data!.detail!.detail![index]!.namaSatuan.toString(),
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
                                              flexLeftRow: 13,
                                              flexRightRow: 20,
                                            ),
                                            const SizedBox(height: 10),
                                            CardFieldItemFormatCurrency(
                                              label: "Harga Satuan",
                                              contentData: detailSalesOrder.data!.detail!.detail![index]!.hargaSatuanJual,
                                              flexLeftRow: 13, 
                                              flexRightRow: 20,
                                            ),
                                            const SizedBox(height: 10),
                                            CardFieldItemFormatCurrency(
                                              label: "Sub Total",
                                              contentData: subTotalHarga[index],
                                              flexLeftRow: 13, 
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
                                        labelValue: detailSalesOrder.data!.detail!.diskon,
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
                                        labelValue: detailSalesOrder.data!.detail!.ppn,
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
                            const SizedBox(height: 10)
                          ],
                        ),
                        if (detailSalesOrder.data!.approval!.isNotEmpty)...[
                          CardExpansionDetail(
                            label: "Catatan Approval",
                            children: <Widget> [
                              ListView.separated(
                                separatorBuilder: (context, index) => const SizedBox(
                                  height: 10,
                                ),
                                itemCount: detailSalesOrder.data!.approval!.length,
                                itemBuilder: (context, index){
                                  return FieldCatatanApproval(
                                    index: index,
                                    statusApproval: detailSalesOrder.data!.approval![index]!.statusApproval,
                                    namaKaryawan: detailSalesOrder.data!.approval![index]!.namaKaryawan,
                                    catatanApproval: detailSalesOrder.data!.approval![index]!.catatan,
                                    tglApproval: detailSalesOrder.data!.approval![index]!.tglApproval,
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
                                    "REVISE Sales Order",
                                    "REVISE",
                                    reviseButtonColor,
                                    detailSalesOrder.data!.detail!.noSalesOrder.toString(),
                                    "REV",
                                    _catatanTextEditingController.text,
                                    detailSalesOrder.data!.detail!.baseline.toString(),
                                  );
                                }
                              }
                            },
                            onClickedReject: () {
                              if (_formKey.currentState!.validate()) {
                                if (_catatanTextEditingController.text != "") {
                                  showAlertDialog(
                                    "REJECT Sales Order",
                                    "REJECT",
                                    rejectButtonColor,
                                    detailSalesOrder.data!.detail!.noSalesOrder.toString(),
                                    "REJ",
                                    _catatanTextEditingController.text,
                                    detailSalesOrder.data!.detail!.baseline.toString(),
                                  );
                                }
                              }
                            },
                            onClickedVerify: () {
                              if (_formKey.currentState!.validate()) {
                                if (_catatanTextEditingController.text != "") {
                                  showAlertDialog(
                                    "VERIFY Sales Order",
                                    "VERIFY",
                                    verifyButtonColor,
                                    detailSalesOrder.data!.detail!.noSalesOrder.toString(),
                                    "VER",
                                    _catatanTextEditingController.text,
                                    detailSalesOrder.data!.detail!.baseline.toString(),
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
                                    "REJECT Sales Order",
                                    "REJECT",
                                    rejectButtonColor,
                                    detailSalesOrder.data!.detail!.noSalesOrder.toString(),
                                    "REJ",
                                    _catatanTextEditingController.text,
                                    detailSalesOrder.data!.detail!.baseline.toString(),
                                  );
                                }
                              }
                            },
                            onClickedApprove: () {
                              if (_formKey.currentState!.validate()) {
                                if (_catatanTextEditingController.text != "") {
                                  showAlertDialog(
                                    "APPROVE Sales Order",
                                    "APPROVE",
                                    verifyButtonColor,
                                    detailSalesOrder.data!.detail!.noSalesOrder.toString(),
                                    "APP",
                                    _catatanTextEditingController.text,
                                    detailSalesOrder.data!.detail!.baseline.toString(),
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