import 'package:mgp_mobile_app/model/hrdu/seleksi_vendor/detail_seleksi_vendor_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mgp_mobile_app/modul/hrdu/approval_seleksi_vendor/approval_seleksi_vendor.dart';
import 'package:mgp_mobile_app/widget/component/alert_approval.dart';
import 'package:mgp_mobile_app/widget/component/button_pemeriksa.dart';
import 'package:mgp_mobile_app/widget/component/button_pengesah.dart';
import 'package:mgp_mobile_app/widget/component/card_detail.dart';
import 'package:mgp_mobile_app/widget/component/card_expansion_detail.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_date.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_format_currency.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_right_row.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_text.dart';
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
    required this.noSeleksiVendor,
    required this.statusMenu,
  }) : super(key: key);
  final String noSeleksiVendor;
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
  late List subTotalHargaPr = [];
  late List subTotalHargaSv = [];
  final _formKey = GlobalKey<FormState>();
  final _catatanTextEditingController = TextEditingController();
  late Future<DetailPvspr> futureDetailPvspr;
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
            final _postProses = await MGPAPI().postSeleksiVendor(
              noTransaksi: noTransaksi,
              statusApproval: status,
              catatan: catatan,
              tglApproval: DateTime.now().toString(),
              approvalBaseline: approvalBaseline,
            );
            if (_postProses == "berhasil") {
              Get.offAll(const SeleksiVendorView());
            }
          },
        );
      }
    );
  }
  
  @override
  void initState() {
    futureDetailPvspr = MGPAPI().fetchApprovalDetailSeleksiVendor(noSeleksiVendor: widget.noSeleksiVendor);
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
              child: FutureBuilder<DetailPvspr>(
                future: futureDetailPvspr,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var detailSeleksiVendor = snapshot.data;
                    String status = detailSeleksiVendor!.data!.behavior.toString();
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
                    for (var i = 0; i < detailSeleksiVendor.data!.detail!.prDetail!.length; i++) {
                      num subTotalPr = (double.parse(detailSeleksiVendor.data!.detail!.prDetail![i]!.hargaPerkiraanSendiri.toString())) * double.parse(detailSeleksiVendor.data!.detail!.prDetail![i]!.qtyPr.toString());
                      subTotalHargaPr.add(subTotalPr.toString());
                    }
                    for (var i = 0; i < detailSeleksiVendor.data!.detail!.detail!.length; i++) {
                      num subTotalSv = (double.parse(detailSeleksiVendor.data!.detail!.detail![i]!.hargaKesepakatan.toString())) * double.parse(detailSeleksiVendor.data!.detail!.detail![i]!.qtyOrder.toString());
                      subTotalHargaSv.add(subTotalSv.toString());
                    }
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
                                  label: "Tgl. Purchase Request",
                                  date: detailSeleksiVendor.data!.detail!.tglPurchaseRequest,
                                  flexLeftRow: 12,
                                  flexRightRow: 20,
                                ),
                                const SizedBox(height: 5),
                                CardFieldItemDate(
                                  label: "Tgl. Pemakaian",
                                  date: detailSeleksiVendor.data!.detail!.tglPemakaian,
                                  flexLeftRow: 12,
                                  flexRightRow: 20,
                                ),
                                const SizedBox(height: 5),
                                CardFieldItemDate(
                                  label: "Tgl. Seleksi Vendor",
                                  date: detailSeleksiVendor.data!.detail!.tglSeleksiVendor,
                                  flexLeftRow: 12,
                                  flexRightRow: 20,
                                ),
                                const SizedBox(height: 5),
                                CardFieldItemText(
                                  label: "No. Purchase Request",
                                  contentData: detailSeleksiVendor.data!.detail!.noPurchaseRequest,
                                  flexLeftRow: 12,
                                  flexRightRow: 20,
                                ),
                                const SizedBox(height: 5),
                                CardFieldItemText(
                                  label: "Keperluan",
                                  contentData: detailSeleksiVendor.data!.detail!.keperluan,
                                  flexLeftRow: 12,
                                  flexRightRow: 20,
                                ),
                                const SizedBox(height: 5),
                                CardFieldItemText(
                                  label: "No. Seleksi Vendor",
                                  contentData: detailSeleksiVendor.data!.detail!.noSeleksiVendor,
                                  flexLeftRow: 12,
                                  flexRightRow: 20,
                                ),
                                const SizedBox(height: 5),
                                CardFieldItemText(
                                  label: "Proyek",
                                  contentData: detailSeleksiVendor.data!.detail!.namaProyek,
                                  flexLeftRow: 12,
                                  flexRightRow: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                        CardExpansionDetail(
                          label: "Item Purchase Request",
                          children: <Widget> [
                            ListView.separated(
                              separatorBuilder: (context, index) => const SizedBox(
                                height: 10,
                              ),
                              itemCount: detailSeleksiVendor.data!.detail!.prDetail!.length,
                              itemBuilder: (BuildContext context, index){
                                return Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: CardItemExpansionDetail(
                                    child: ListTile(
                                      contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                                      title: HighlightItemName(
                                        child: Text(
                                          detailSeleksiVendor.data!.detail!.prDetail![index]!.kodeItem.toString(),
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
                                              label: "Nama Item",
                                              contentData: detailSeleksiVendor.data!.detail!.prDetail![index]!.namaItem,
                                              flexLeftRow: 12,
                                              flexRightRow: 20,
                                            ),
                                            const SizedBox(height: 10),
                                            CardFieldItemRightRow(
                                              label: "Qty",
                                              rightRow: <Widget> [
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 0),
                                                  child: (detailSeleksiVendor.data!.detail!.prDetail![index]!.qtyPr != null)
                                                  ? Text(
                                                    formatDecimal.format(double.parse(detailSeleksiVendor.data!.detail!.prDetail![index]!.qtyPr.toString())).toString()
                                                    +' '+
                                                    detailSeleksiVendor.data!.detail!.prDetail![index]!.satuanBeli.toString(),
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
                                              flexLeftRow: 12,
                                              flexRightRow: 20,
                                            ),
                                            const SizedBox(height: 10),
                                            CardFieldItemFormatCurrency(
                                              label: "Harga Perkiraan Sendiri",
                                              contentData: detailSeleksiVendor.data!.detail!.prDetail![index]!.hargaPerkiraanSendiri,
                                              flexLeftRow: 12,
                                              flexRightRow: 20,
                                            ),
                                            const SizedBox(height: 10),
                                            CardFieldItemFormatCurrency(
                                              label: "Sub Total",
                                              contentData: subTotalHargaPr[index],
                                              flexLeftRow: 12,
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
                            const SizedBox(height: 10)
                          ],
                        ),
                        CardExpansionDetail(
                          label: "Item Seleksi Vendor",
                          children: <Widget> [
                            ListView.separated(
                              separatorBuilder: (context, index) => const SizedBox(
                                height: 10,
                              ),
                              itemCount: detailSeleksiVendor.data!.detail!.detail!.length,
                              itemBuilder: (BuildContext context, index){
                                return Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: CardItemExpansionDetail(
                                    child: ListTile(
                                      contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                                      title: HighlightItemName(
                                        child: Text(
                                          detailSeleksiVendor.data!.detail!.detail![index]!.kodeItem.toString(),
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
                                              label: "Vendor",
                                              contentData: detailSeleksiVendor.data!.detail!.detail![index]!.namaVendor,
                                              flexLeftRow: 12,
                                              flexRightRow: 20,
                                            ),
                                            const SizedBox(height: 10),
                                            CardFieldItemText(
                                              label: "Nama Item",
                                              contentData: detailSeleksiVendor.data!.detail!.detail![index]!.namaItem,
                                              flexLeftRow: 12,
                                              flexRightRow: 20,
                                            ),
                                            const SizedBox(height: 10),
                                            CardFieldItemRightRow(
                                              label: "Qty",
                                              rightRow: <Widget> [
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 0),
                                                  child: (detailSeleksiVendor.data!.detail!.detail![index]!.qtyOrder != null)
                                                  ? Text(
                                                    formatDecimal.format(double.parse(detailSeleksiVendor.data!.detail!.detail![index]!.qtyOrder.toString())).toString()
                                                    +' '+
                                                    detailSeleksiVendor.data!.detail!.detail![index]!.satuanBeli.toString(),
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
                                              flexLeftRow: 12,
                                              flexRightRow: 20,
                                            ),
                                            const SizedBox(height: 10),
                                            CardFieldItemFormatCurrency(
                                              label: "Harga Kesepakatan",
                                              contentData: detailSeleksiVendor.data!.detail!.detail![index]!.hargaKesepakatan,
                                              flexLeftRow: 12,
                                              flexRightRow: 20,
                                            ),
                                            const SizedBox(height: 10),
                                            CardFieldItemFormatCurrency(
                                              label: "Sub Total",
                                              contentData: subTotalHargaSv[index],
                                              flexLeftRow: 12,
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
                            const SizedBox(height: 10)
                          ],
                        ),
                        if (detailSeleksiVendor.data!.approval!.isNotEmpty)...[
                          CardExpansionDetail(
                            label: "Catatan Approval",
                            children: <Widget> [
                              ListView.separated(
                                separatorBuilder: (context, index) => const SizedBox(
                                  height: 10,
                                ),
                                itemCount: detailSeleksiVendor.data!.approval!.length,
                                itemBuilder: (context, index){
                                  return FieldCatatanApproval(
                                    index: index,
                                    statusApproval: detailSeleksiVendor.data!.approval![index]!.statusApproval,
                                    namaKaryawan: detailSeleksiVendor.data!.approval![index]!.namaKaryawan,
                                    catatanApproval: detailSeleksiVendor.data!.approval![index]!.catatan,
                                    tglApproval: detailSeleksiVendor.data!.approval![index]!.tglApproval,
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
                                    "REVISE Seleksi Vendor",
                                    "REVISE",
                                    reviseButtonColor,
                                    detailSeleksiVendor.data!.detail!.noSeleksiVendor.toString(),
                                    "REV",
                                    _catatanTextEditingController.text,
                                    detailSeleksiVendor.data!.detail!.baseline.toString(),
                                  );
                                }
                              }
                            },
                            onClickedReject: () {
                              if (_formKey.currentState!.validate()) {
                                if (_catatanTextEditingController.text != "") {
                                  showAlertDialog(
                                    "REJECT Seleksi Vendor",
                                    "REJECT",
                                    rejectButtonColor,
                                    detailSeleksiVendor.data!.detail!.noSeleksiVendor.toString(),
                                    "REJ",
                                    _catatanTextEditingController.text,
                                    detailSeleksiVendor.data!.detail!.baseline.toString(),
                                  );
                                }
                              }
                            },
                            onClickedVerify: () {
                              if (_formKey.currentState!.validate()) {
                                if (_catatanTextEditingController.text != "") {
                                  showAlertDialog(
                                    "VERIFY Seleksi Vendor",
                                    "VERIFY",
                                    verifyButtonColor,
                                    detailSeleksiVendor.data!.detail!.noSeleksiVendor.toString(),
                                    "VER",
                                    _catatanTextEditingController.text,
                                    detailSeleksiVendor.data!.detail!.baseline.toString(),
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
                                    "REJECT Seleksi Vendor",
                                    "REJECT",
                                    rejectButtonColor,
                                    detailSeleksiVendor.data!.detail!.noSeleksiVendor.toString(),
                                    "REJ",
                                    _catatanTextEditingController.text,
                                    detailSeleksiVendor.data!.detail!.baseline.toString(),
                                  );
                                }
                              }
                            },
                            onClickedApprove: () {
                              if (_formKey.currentState!.validate()) {
                                if (_catatanTextEditingController.text != "") {
                                  showAlertDialog(
                                    "APPROVE Seleksi Vendor",
                                    "APPROVE",
                                    verifyButtonColor,
                                    detailSeleksiVendor.data!.detail!.noSeleksiVendor.toString(),
                                    "APP",
                                    _catatanTextEditingController.text,
                                    detailSeleksiVendor.data!.detail!.baseline.toString(),
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