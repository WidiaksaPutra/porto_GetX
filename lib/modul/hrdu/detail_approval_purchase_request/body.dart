import 'package:mgp_mobile_app/model/hrdu/purchase_request/detail_purchase_request_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mgp_mobile_app/modul/hrdu/approval_purchase_request/approval_purchase_request.dart';
import 'package:mgp_mobile_app/widget/component/alert_approval.dart';
import 'package:mgp_mobile_app/widget/component/button_pemeriksa.dart';
import 'package:mgp_mobile_app/widget/component/button_pengesah.dart';
import 'package:mgp_mobile_app/widget/component/card_detail.dart';
import 'package:mgp_mobile_app/widget/component/card_expansion_detail.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_date.dart';
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
    required this.noPurchaseRequest,
    required this.statusMenu,
  }) : super(key: key);
  final String noPurchaseRequest;
  final String statusMenu;
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final formatDecimal = NumberFormat("###.###", "id_ID");
  late List qtyDO = [];
  final _formKey = GlobalKey<FormState>();
  final _catatanTextEditingController = TextEditingController();
  late Future<DetailPr> futureDetailPr;
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
            final _postProses = await MGPAPI().postPurchaseRequest(
              noTransaksi: noTransaksi,
              statusApproval: status,
              catatan: catatan,
              tglApproval: DateTime.now().toString(),
              approvalBaseline: approvalBaseline,
            );
            if (_postProses == "berhasil") {
              Get.offAll(const PurchaseRequestView());
            }
          },
        );
      }
    );
  }

  @override
  void initState() {
    futureDetailPr = MGPAPI().fetchApprovalDetailPurchaseRequest(noPurchaseRequest: widget.noPurchaseRequest);
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
              child: FutureBuilder<DetailPr>(
                future: futureDetailPr,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var detailPurchaseRequest = snapshot.data;
                    String status = detailPurchaseRequest!.data!.behavior.toString();
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
                                  date: detailPurchaseRequest.data!.detail!.tglPurchaseRequest,
                                  flexLeftRow: 12,
                                  flexRightRow: 20,
                                ),
                                const SizedBox(height: 5),
                                CardFieldItemText(
                                  label: "No. Purchase Request",
                                  contentData: detailPurchaseRequest.data!.detail!.noPurchaseRequest,
                                  flexLeftRow: 12,
                                  flexRightRow: 20,
                                ),
                                const SizedBox(height: 5),
                                CardFieldItemText(
                                  label: "Keperluan",
                                  contentData: detailPurchaseRequest.data!.detail!.keperluan,
                                  flexLeftRow: 12,
                                  flexRightRow: 20,
                                ),
                                const SizedBox(height: 5),
                                CardFieldItemDate(
                                  label: "Tgl. Pemakaian",
                                  date: detailPurchaseRequest.data!.detail!.tglPemakaian,
                                  flexLeftRow: 12,
                                  flexRightRow: 20,
                                ),
                                const SizedBox(height: 5),
                                CardFieldItemText(
                                  label: "Nama Proyek",
                                  contentData: detailPurchaseRequest.data!.detail!.namaProyek,
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
                              itemCount: snapshot.data!.data!.detail!.detail!.length,
                              itemBuilder: (BuildContext context, index){
                                return Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: CardItemExpansionDetail(
                                    child: ListTile(
                                      contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                                      title: HighlightItemName(
                                        child: Text(
                                          snapshot.data!.data!.detail!.detail![index]!.kodeItem.toString(),
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
                                              contentData: detailPurchaseRequest.data!.detail!.detail![index]!.namaItem,
                                              flexLeftRow: 12,
                                              flexRightRow: 20,
                                            ),
                                            const SizedBox(height: 10),
                                            CardFieldItemRightRow(
                                              label: "Qty",
                                              rightRow: <Widget> [
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 0),
                                                  child: (detailPurchaseRequest.data!.detail!.detail![index]!.qty != null)
                                                  ? Text(
                                                    formatDecimal.format(
                                                      double.parse(detailPurchaseRequest.data!.detail!.detail![index]!.qty.toString()
                                                      )
                                                    ).toString()
                                                    +" "+
                                                    detailPurchaseRequest.data!.detail!.detail![index]!.namaSatuan.toString(),
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
                          label: "Catatan Purchase Request",
                          children: <Widget> [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: CardItemExpansionDetail(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                  child: (detailPurchaseRequest.data!.detail!.catatanPurchaseRequest != null)
                                  ? Text(detailPurchaseRequest.data!.detail!.catatanPurchaseRequest.toString(),
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14
                                    ),
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
                        if (detailPurchaseRequest.data!.approval!.isNotEmpty)...[
                          CardExpansionDetail(
                            label: "Catatan Approval",
                            children: <Widget> [
                              ListView.separated(
                                separatorBuilder: (context, index) => const SizedBox(
                                  height: 10,
                                ),
                                itemCount: detailPurchaseRequest.data!.approval!.length,
                                itemBuilder: (context, index){
                                  return FieldCatatanApproval(
                                    index: index,
                                    statusApproval: detailPurchaseRequest.data!.approval![index]!.statusApproval,
                                    namaKaryawan: detailPurchaseRequest.data!.approval![index]!.namaKaryawan,
                                    catatanApproval: detailPurchaseRequest.data!.approval![index]!.catatan,
                                    tglApproval: detailPurchaseRequest.data!.approval![index]!.tglApproval,
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
                                    "REVISE Purchase Order",
                                    "REVISE",
                                    reviseButtonColor,
                                    detailPurchaseRequest.data!.detail!.noPurchaseRequest.toString(),
                                    "REV",
                                    _catatanTextEditingController.text,
                                    detailPurchaseRequest.data!.detail!.baseline.toString(),
                                  );
                                }
                              }
                            },
                            onClickedReject: () {
                              if (_formKey.currentState!.validate()) {
                                if (_catatanTextEditingController.text != "") {
                                  showAlertDialog(
                                    "REJECT Purchase Order",
                                    "REJECT",
                                    rejectButtonColor,
                                    detailPurchaseRequest.data!.detail!.noPurchaseRequest.toString(),
                                    "REJ",
                                    _catatanTextEditingController.text,
                                    detailPurchaseRequest.data!.detail!.baseline.toString(),
                                  );
                                }
                              }
                            },
                            onClickedVerify: () {
                              if (_formKey.currentState!.validate()) {
                                if (_catatanTextEditingController.text != "") {
                                  showAlertDialog(
                                    "VERIFY Purchase Order",
                                    "VERIFY",
                                    verifyButtonColor,
                                    detailPurchaseRequest.data!.detail!.noPurchaseRequest.toString(),
                                    "VER",
                                    _catatanTextEditingController.text,
                                    detailPurchaseRequest.data!.detail!.baseline.toString(),
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
                                    "REJECT Purchase Order",
                                    "REJECT",
                                    rejectButtonColor,
                                    detailPurchaseRequest.data!.detail!.noPurchaseRequest.toString(),
                                    "REJ",
                                    _catatanTextEditingController.text,
                                    detailPurchaseRequest.data!.detail!.baseline.toString(),
                                  );
                                }
                              }
                            },
                            onClickedApprove: () {
                              if (_formKey.currentState!.validate()) {
                                if (_catatanTextEditingController.text != "") {
                                  showAlertDialog(
                                    "APPROVE Purchase Order",
                                    "APPROVE",
                                    verifyButtonColor,
                                    detailPurchaseRequest.data!.detail!.noPurchaseRequest.toString(),
                                    "APP",
                                    _catatanTextEditingController.text,
                                    detailPurchaseRequest.data!.detail!.baseline.toString(),
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