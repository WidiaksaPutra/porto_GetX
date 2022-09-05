import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:mgp_mobile_app/model/hrdu/surat_jalan/detail_surat_jalan_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mgp_mobile_app/modul/hrdu/approval_surat_jalan/approval_surat_jalan.dart';
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
import 'package:mgp_mobile_app/service/mgp_api_hrdu/mgp_api_hrdu.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
    required this.noSuratJalan,
    required this.statusMenu,
  }) : super(key: key);
  final String noSuratJalan;
  final String statusMenu;

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final formatDecimal = NumberFormat("###.###", "id_ID");
  late Future<DetailRegsj> futureDetailRegsj;
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
            final _postProses = await MGPAPI().postSuratJalan(
              noTransaksi: noTransaksi,
              statusApproval: status,
              catatan: catatan,
              tglApproval: DateTime.now().toString(),
              approvalBaseline: approvalBaseline,
            );
            if (_postProses == "berhasil") {
              Get.offAll(const SuratJalanView());
              Navigator.of(Get.overlayContext!, rootNavigator: true).pop();
            }
          },
        );
      }
    );
  }

  @override
  void initState() {
    futureDetailRegsj = MGPAPI().fetchApprovalDetailRegsj(noSuratJalan: widget.noSuratJalan);
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
              child: FutureBuilder<DetailRegsj>(
                future: futureDetailRegsj,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var detailSuratJalan = snapshot.data;
                    String status = detailSuratJalan!.data!.behavior.toString();
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
                        SizedBox(height: getProportionateScreenHeight(5).h),
                        CardDetail(
                          child: ListTile(
                            subtitle: Column(
                              children: <Widget>[
                                CardFieldItemText(
                                  label: "No. Sales Order",
                                  contentData: detailSuratJalan.data!.detail!.noSalesOrder,
                                  flexLeftRow: 13,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5).h),
                                CardFieldItemDate(
                                  label: "Tgl. Sales Order",
                                  date: detailSuratJalan.data!.detail!.tglSalesOrder,
                                  flexLeftRow: 13,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5).h),
                                CardFieldItemText(
                                  label: "Customer",
                                  contentData: detailSuratJalan.data!.detail!.namaCustomer,
                                  flexLeftRow: 13,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5).h),
                                CardFieldItemText(
                                  label: "Sales",
                                  contentData: detailSuratJalan.data!.detail!.namaSales,
                                  flexLeftRow: 13,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5).h),
                                CardFieldItemDate(
                                  label: "Tgl. Delivery Order",
                                  date: detailSuratJalan.data!.detail!.tglDeliveryOrder,
                                  flexLeftRow: 13,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5).h),
                                CardFieldItemText(
                                  label: "No. Delivery Order",
                                  contentData: detailSuratJalan.data!.detail!.noDeliveryOrder,
                                  flexLeftRow: 13,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5).h),
                                CardFieldItemDate(
                                  label: "Tgl. Surat Jalan",
                                  date: detailSuratJalan.data!.detail!.tglSuratJalan,
                                  flexLeftRow: 13,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5).h),
                                CardFieldItemText(
                                  label: "No. Surat Jalan",
                                  contentData: detailSuratJalan.data!.detail!.noSuratJalan,
                                  flexLeftRow: 13,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5).h),
                                CardFieldItemText(
                                  label: "Gudang",
                                  contentData: detailSuratJalan.data!.detail!.namaGudang,
                                  flexLeftRow: 13,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5).h),
                                CardFieldItemText(
                                  label: "Petugas Pengiriman",
                                  contentData: detailSuratJalan.data!.detail!.namaSopir,
                                  flexLeftRow: 13,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5).h),
                                CardFieldItemText(
                                  label: "Proyek",
                                  contentData: detailSuratJalan.data!.detail!.namaProyek,
                                  flexLeftRow: 13,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5).h),
                                CardFieldItemRightRow(
                                  label: "Armada Pengiriman",
                                  rightRow: <Widget> [
                                    Padding(
                                      padding: EdgeInsets.only(left: getProportionateScreenWidth(0.0).w),
                                      child: (detailSuratJalan.data!.detail!.platNomor != null)
                                      ? Text(
                                        detailSuratJalan.data!.detail!.platNomor.toString()
                                        +" - "+
                                        detailSuratJalan.data!.detail!.namaItemAset.toString(),
                                        style: const TextStyle(
                                          color: Colors.black
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
                              ],
                            ),
                          ),
                        ),
                        CardExpansionDetail(
                          label: "Item Surat Jalan",
                          children: <Widget> [
                            ListView.separated(
                              separatorBuilder: (context, index) => SizedBox(
                                height: getProportionateScreenHeight(10).h,
                              ),
                              itemCount: detailSuratJalan.data!.detail!.detail!.length,
                              itemBuilder: (BuildContext context, index){
                                return Padding(
                                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
                                  child: CardItemExpansionDetail(
                                    child: ListTile(
                                      contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0).w, vertical: getProportionateScreenHeight(10.0).h),
                                      title: HighlightItemName(
                                        child: Text(
                                          detailSuratJalan.data!.detail!.detail![index]!.kodeBarang.toString(),
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
                                            CardFieldItemText(
                                              label: "Nama Barang",
                                              contentData: detailSuratJalan.data!.detail!.detail![index]!.namaBarang,
                                              flexLeftRow: 14,
                                              flexRightRow: 20,
                                            ),
                                            SizedBox(height: getProportionateScreenHeight(10).h),
                                            CardFieldItemRightRow(
                                              label: "Qty Surat Jalan",
                                              rightRow: <Widget> [
                                                Padding(
                                                  padding: EdgeInsets.only(left: getProportionateScreenWidth(0.0).w),
                                                  child: (detailSuratJalan.data!.detail!.detail![index]!.qty != null)
                                                  ? Text(
                                                    formatDecimal.format(
                                                      double.parse(detailSuratJalan.data!.detail!.detail![index]!.qty.toString()
                                                      )
                                                    )
                                                    +" "+
                                                    detailSuratJalan.data!.detail!.detail![index]!.namaSatuan.toString(),
                                                    style: const TextStyle(
                                                      color: Colors.black
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
                                              flexLeftRow: 14,
                                              flexRightRow: 20,
                                            ),
                                            SizedBox(height: getProportionateScreenHeight(10).h),
                                            CardFieldItemRightRow(
                                              label: "Qty Sales Order",
                                              rightRow: <Widget> [
                                                Padding(
                                                  padding: EdgeInsets.only(left: getProportionateScreenWidth(0.0).w),
                                                  child: (detailSuratJalan.data!.detail!.detail![index]!.qtyItem != null)
                                                  ? Text(
                                                    formatDecimal.format(
                                                      double.parse(detailSuratJalan.data!.detail!.detail![index]!.qtyItem.toString()
                                                      )
                                                    )
                                                    +" "+
                                                    detailSuratJalan.data!.detail!.detail![index]!.namaSatuan.toString(),
                                                    style: const TextStyle(
                                                      color: Colors.black
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
                                              flexLeftRow: 14,
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
                            SizedBox(height: getProportionateScreenHeight(10).h),
                          ],
                        ),
                        if (detailSuratJalan.data!.approval!.isNotEmpty)...[
                          CardExpansionDetail(
                            label: "Catatan Approval",
                            children: <Widget> [
                              ListView.separated(
                                separatorBuilder: (context, index) => SizedBox(
                                  height: getProportionateScreenHeight(10).h,
                                ),
                                itemCount: detailSuratJalan.data!.approval!.length,
                                itemBuilder: (context, index){
                                  return FieldCatatanApproval(
                                    index: index,
                                    statusApproval: detailSuratJalan.data!.approval![index]!.statusApproval,
                                    namaKaryawan: detailSuratJalan.data!.approval![index]!.namaKaryawan,
                                    catatanApproval: detailSuratJalan.data!.approval![index]!.catatan,
                                    tglApproval: detailSuratJalan.data!.approval![index]!.tglApproval,
                                  );
                                },
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                              ),
                              SizedBox(height: getProportionateScreenHeight(10).h),
                            ]
                          ),
                        ],
                        Visibility(
                          visible: visibilityStatusMenu,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10).h, horizontal: getProportionateScreenWidth(3).w),
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
                            children: <Widget>[
                              SizedBox(height: getProportionateScreenHeight(5).h),
                              const FormErrors(errors: kCatatanError),
                              SizedBox(height: getProportionateScreenHeight(8).h),
                            ],
                          )
                        ),
                        Visibility(
                          visible: visibilityStatusMenu,
                          child: SizedBox(height: getProportionateScreenHeight(10).h)
                        ),
                        Visibility(
                          visible: visibilityStatusMenu,
                          child: ButtonPemeriksa(
                            visibilityPemeriksa: visibilityPemeriksa,
                            onClickedRevise: () {
                              if (_formKey.currentState!.validate()) {
                                if (_catatanTextEditingController.text != "") {
                                  showAlertDialog(
                                    "REVISE Surat Jalan",
                                    "REVISE",
                                    reviseButtonColor,
                                    detailSuratJalan.data!.detail!.noSuratJalan.toString(),
                                    "REV",
                                    _catatanTextEditingController.text,
                                    detailSuratJalan.data!.detail!.baseline.toString(),
                                  );
                                }
                              }
                            },
                            onClickedReject: () {
                              if (_formKey.currentState!.validate()) {
                                if (_catatanTextEditingController.text != "") {
                                  showAlertDialog(
                                    "REJECT Surat Jalan",
                                    "REJECT",
                                    rejectButtonColor,
                                    detailSuratJalan.data!.detail!.noSuratJalan.toString(),
                                    "REJ",
                                    _catatanTextEditingController.text,
                                    detailSuratJalan.data!.detail!.baseline.toString(),
                                  );
                                }
                              }
                            },
                            onClickedVerify: () {
                              if (_formKey.currentState!.validate()) {
                                if (_catatanTextEditingController.text != "") {
                                  showAlertDialog(
                                    "VERIFY Surat Jalan",
                                    "VERIFY",
                                    verifyButtonColor,
                                    detailSuratJalan.data!.detail!.noSuratJalan.toString(),
                                    "VER",
                                    _catatanTextEditingController.text,
                                    detailSuratJalan.data!.detail!.baseline.toString(),
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
                                    "REJECT Surat Jalan",
                                    "REJECT",
                                    rejectButtonColor,
                                    detailSuratJalan.data!.detail!.noSuratJalan.toString(),
                                    "REJ",
                                    _catatanTextEditingController.text,
                                    detailSuratJalan.data!.detail!.baseline.toString(),
                                  );
                                }
                              }
                            },
                            onClickedApprove: () {
                              if (_formKey.currentState!.validate()) {
                                if (_catatanTextEditingController.text != "") {
                                  showAlertDialog(
                                    "APPROVE Surat Jalan",
                                    "APPROVE",
                                    verifyButtonColor,
                                    detailSuratJalan.data!.detail!.noSuratJalan.toString(),
                                    "APP",
                                    _catatanTextEditingController.text,
                                    detailSuratJalan.data!.detail!.baseline.toString(),
                                  );
                                }
                              }
                            },
                          ),
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