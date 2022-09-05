import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:mgp_mobile_app/model/hrdu/delivery_order/detail_delivery_order_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mgp_mobile_app/modul/hrdu/approval_delivery_order/approval_delivery_order.dart';
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
  final String noDeliveryOrder;
  final String statusMenu;
  const Body({
    Key? key,
    required this.noDeliveryOrder,
    required this.statusMenu,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final formatDecimal = NumberFormat("###.###", "id_ID");
  late Future<DetailRegdo> futureDetailRegdo;
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
            final _postProses = await MGPAPI().postDeliveryOrder(
              noTransaksi: noTransaksi,
              statusApproval: status,
              catatan: catatan,
              tglApproval: DateTime.now().toString(),
              approvalBaseline: approvalBaseline,
            );
            if (_postProses == "berhasil") {
              Get.offAll(const DeliveryOrderView());
              Navigator.of(Get.overlayContext!, rootNavigator: true).pop();
            }
          },
        );
      }
    );
  }

  @override
  void initState() {
    futureDetailRegdo = MGPAPI().fetchApprovalDetailDeliveryOrder(noDeliveryOrder: widget.noDeliveryOrder);
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
              child: FutureBuilder<DetailRegdo>(
                future: futureDetailRegdo,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var detailDeliveryOrder = snapshot.data;
                    String status = detailDeliveryOrder!.data!.behavior.toString();
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
                                CardFieldItemDate(
                                  label: "Tgl. Sales Order",
                                  date: detailDeliveryOrder.data!.detail!.tglSalesOrder,
                                  flexLeftRow: 14,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5).h),
                                CardFieldItemText(
                                  label: "No. Sales Order",
                                  contentData: detailDeliveryOrder.data!.detail!.noSalesOrder,
                                  flexLeftRow: 14,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5).h),
                                CardFieldItemText(
                                  label: "Customer",
                                  contentData: detailDeliveryOrder.data!.detail!.namaCustomer,
                                  flexLeftRow: 14,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5).h),
                                CardFieldItemText(
                                  label: "Sales",
                                  contentData: detailDeliveryOrder.data!.detail!.namaSales,
                                  flexLeftRow: 14,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5).h),
                                CardFieldItemDate(
                                  label: "Tgl. Delivery Order",
                                  date: detailDeliveryOrder.data!.detail!.tglDeliveryOrder,
                                  flexLeftRow: 14,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5).h),
                                CardFieldItemText(
                                  label: "No. Delivery Order",
                                  contentData: detailDeliveryOrder.data!.detail!.noDeliveryOrder,
                                  flexLeftRow: 14,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5).h),
                                CardFieldItemText(
                                  label: "Gudang",
                                  contentData: detailDeliveryOrder.data!.detail!.namaGudang,
                                  flexLeftRow: 14,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5).h),
                                CardFieldItemText(
                                  label: "Proyek",
                                  contentData: detailDeliveryOrder.data!.detail!.namaProyek,
                                  flexLeftRow: 14,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5).h),
                                CardFieldItemText(
                                  label: "Catatan",
                                  contentData: detailDeliveryOrder.data!.detail!.catatanDeliveryOrder,
                                  flexLeftRow: 14,
                                  flexRightRow: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                        CardExpansionDetail(
                          label: "Item Delivery Order",
                          children: <Widget> [
                            ListView.separated(
                              separatorBuilder: (context, index) => SizedBox(
                                height: getProportionateScreenHeight(10).h,
                              ),
                              itemCount: detailDeliveryOrder.data!.detail!.detail!.length,
                              itemBuilder: (BuildContext context, index){
                                return Padding(
                                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
                                  child: CardItemExpansionDetail(
                                    child: ListTile(
                                      contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0).w, vertical: getProportionateScreenHeight(10.0).h),
                                      title: HighlightItemName(
                                        child: Text(
                                          detailDeliveryOrder.data!.detail!.detail![index]!.kodeBarang.toString(),
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
                                              contentData: detailDeliveryOrder.data!.detail!.detail![index]!.namaBarang,
                                              flexLeftRow: 8,
                                              flexRightRow: 20,
                                            ),
                                            SizedBox(height: getProportionateScreenHeight(10).h),
                                            CardFieldItemText(
                                              label: "Gudang",
                                              contentData: detailDeliveryOrder.data!.detail!.detail![index]!.namaGudang,
                                              flexLeftRow: 8,
                                              flexRightRow: 20,
                                            ),
                                            SizedBox(height: getProportionateScreenHeight(10).h),
                                            CardFieldItemRightRow(
                                              label: "Qty",
                                              rightRow: <Widget> [
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 0),
                                                  child: (detailDeliveryOrder.data!.detail!.detail![index]!.qty != null)
                                                  ? Text(
                                                    formatDecimal.format(double.parse(detailDeliveryOrder.data!.detail!.detail![index]!.qty.toString())).toString()
                                                    +' '+
                                                    detailDeliveryOrder.data!.detail!.detail![index]!.namaSatuan.toString(),
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14.sp
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
                                              flexLeftRow: 8,
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
                            SizedBox(height: getProportionateScreenHeight(10).h)
                          ],
                        ),
                        if (detailDeliveryOrder.data!.approval!.isNotEmpty)...[
                          CardExpansionDetail(
                            label: "Catatan Approval",
                            children: <Widget> [
                              ListView.separated(
                                separatorBuilder: (context, index) => SizedBox(
                                  height: getProportionateScreenHeight(10).h,
                                ),
                                itemCount: detailDeliveryOrder.data!.approval!.length,
                                itemBuilder: (context, index){
                                  return FieldCatatanApproval(
                                    index: index,
                                    statusApproval: detailDeliveryOrder.data!.approval![index]!.statusApproval,
                                    namaKaryawan: detailDeliveryOrder.data!.approval![index]!.namaKaryawan,
                                    catatanApproval: detailDeliveryOrder.data!.approval![index]!.catatan,
                                    tglApproval: detailDeliveryOrder.data!.approval![index]!.tglApproval,
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
                                    "REVISE Delivery Order",
                                    "REVISE",
                                    reviseButtonColor,
                                    detailDeliveryOrder.data!.detail!.noDeliveryOrder.toString(),
                                    "REV",
                                    _catatanTextEditingController.text,
                                    detailDeliveryOrder.data!.detail!.baseline.toString(),
                                  );
                                }
                              }
                            },
                            onClickedReject: () {
                              if (_formKey.currentState!.validate()) {
                                if (_catatanTextEditingController.text != "") {
                                  showAlertDialog(
                                    "REJECT Delivery Order",
                                    "REJECT",
                                    rejectButtonColor,
                                    detailDeliveryOrder.data!.detail!.noDeliveryOrder.toString(),
                                    "REJ",
                                    _catatanTextEditingController.text,
                                    detailDeliveryOrder.data!.detail!.baseline.toString(),
                                  );
                                }
                              }
                            },
                            onClickedVerify: () {
                              if (_formKey.currentState!.validate()) {
                                if (_catatanTextEditingController.text != "") {
                                  showAlertDialog(
                                    "VERIFY Delivery Order",
                                    "VERIFY",
                                    verifyButtonColor,
                                    detailDeliveryOrder.data!.detail!.noDeliveryOrder.toString(),
                                    "VER",
                                    _catatanTextEditingController.text,
                                    detailDeliveryOrder.data!.detail!.baseline.toString(),
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
                                    "REJECT Delivery Order",
                                    "REJECT",
                                    rejectButtonColor,
                                    detailDeliveryOrder.data!.detail!.noDeliveryOrder.toString(),
                                    "REJ",
                                    _catatanTextEditingController.text,
                                    detailDeliveryOrder.data!.detail!.baseline.toString(),
                                  );
                                }
                              }
                            },
                            onClickedApprove: () {
                              if (_formKey.currentState!.validate()) {
                                if (_catatanTextEditingController.text != "") {
                                  showAlertDialog(
                                    "APPROVE Delivery Order",
                                    "APPROVE",
                                    verifyButtonColor,
                                    detailDeliveryOrder.data!.detail!.noDeliveryOrder.toString(),
                                    "APP",
                                    _catatanTextEditingController.text,
                                    detailDeliveryOrder.data!.detail!.baseline.toString(),
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