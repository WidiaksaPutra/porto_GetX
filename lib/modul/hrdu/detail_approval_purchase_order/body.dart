import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:mgp_mobile_app/model/hrdu/purchase_order/detail_purchase_order_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mgp_mobile_app/modul/hrdu/approval_purchase_order/approval_purchase_order.dart';
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
import 'package:mgp_mobile_app/service/mgp_api_hrdu/mgp_api_hrdu.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
    required this.noPurchaseOrder,
    required this.statusMenu,
  }) : super(key: key);
  final String noPurchaseOrder;
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
  late String dpHarga;
  late String totalSetelahDp;
  final _formKey = GlobalKey<FormState>();
  final _catatanTextEditingController = TextEditingController();
  late Future<DetailRegpo> futureDetailRegpo;
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
            final _postProses = await MGPAPI().postPurchaseOrder(
              noTransaksi: noTransaksi,
              statusApproval: status,
              catatan: catatan,
              tglApproval: DateTime.now().toString(),
              approvalBaseline: approvalBaseline,
            );
            if (_postProses == "berhasil") {
              Get.offAll(const PurchaseOrderView());
              Navigator.of(Get.overlayContext!, rootNavigator: true).pop();
            }
          },
        );
      }
    );
  }
  
  @override
  void initState() {
    futureDetailRegpo = MGPAPI().fetchApprovalDetailPurchaseOrder(noPurchaseOrder: widget.noPurchaseOrder);
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
              child: FutureBuilder<DetailRegpo>(
                future: futureDetailRegpo,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var detailPurchaseOrder = snapshot.data;
                    String status = detailPurchaseOrder!.data!.behavior.toString();
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
                    double valueDP = double.parse(snapshot.data!.data!.detail!.dp.toString());
                    num totalHarga = 0;
                    for(var i = 0; i< snapshot.data!.data!.detail!.poDetail!.length; i++){
                      num subTotal = (double.parse(snapshot.data!.data!.detail!.poDetail![i]!.hargaKesepakatan.toString())) * double.parse(snapshot.data!.data!.detail!.poDetail![i]!.qtyOrder.toString());
                      totalHarga = totalHarga + (double.parse(snapshot.data!.data!.detail!.poDetail![i]!.hargaKesepakatan.toString())) * double.parse(snapshot.data!.data!.detail!.poDetail![i]!.qtyOrder.toString());
                      subTotalHarga.add(subTotal.toString());            
                    }
                    grandTotalHarga = totalHarga.toString();
                    num diskonTotal = (totalHarga * valueDiskon)/100;
                    num totalDiskon = (totalHarga - diskonTotal);
                    num ppnTotal = (totalDiskon * valuePPN)/100;
                    num totalPPN = (totalDiskon + ppnTotal);
                    num dpTotal = (totalPPN * valueDP)/100;
                    num totalDP = (totalPPN - dpTotal);
                    diskonHarga = diskonTotal.toString();
                    totalSetelahDiskon = totalDiskon.toString();
                    ppnHarga = ppnTotal.toString();
                    totalSetelahPpn = totalPPN.toString();
                    dpHarga = dpTotal.toString();
                    totalSetelahDp = totalDP.toString();
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
                                  label: "Kode Vendor",
                                  contentData: detailPurchaseOrder.data!.detail!.kodeVendor,
                                  flexLeftRow: 12,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5).h),
                                CardFieldItemText(
                                  label: "Nama Vendor",
                                  contentData: detailPurchaseOrder.data!.detail!.namaVendor,
                                  flexLeftRow: 12,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5).h),
                                CardFieldItemText(
                                  label: "Contact Person",
                                  contentData: detailPurchaseOrder.data!.detail!.contactPerson,
                                  flexLeftRow: 12,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5).h),
                                CardFieldItemText(
                                  label: "Alamat Vendor",
                                  contentData: detailPurchaseOrder.data!.detail!.alamatVendor,
                                  flexLeftRow: 12,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5).h),
                                CardFieldItemDate(
                                  label: "Tgl. Purchase Order",
                                  date: detailPurchaseOrder.data!.detail!.tglPurchaseOrder,
                                  flexLeftRow: 12,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5).h),
                                CardFieldItemText(
                                  label: "No. Purchase Order",
                                  contentData: detailPurchaseOrder.data!.detail!.noPurchaseOrder,
                                  flexLeftRow: 12,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5).h),
                                CardFieldItemText(
                                  label: "Alamat Pengiriman",
                                  contentData: detailPurchaseOrder.data!.detail!.alamatTujuanPengiriman,
                                  flexLeftRow: 12,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5).h),
                                CardFieldItemDate(
                                  label: "Tgl. Pengiriman",
                                  date: detailPurchaseOrder.data!.detail!.tglPengiriman,
                                  flexLeftRow: 12,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5).h),
                                CardFieldItemText(
                                  label: "Keterangan",
                                  contentData: detailPurchaseOrder.data!.detail!.keterangan,
                                  flexLeftRow: 12,
                                  flexRightRow: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                        CardExpansionDetail(
                          label: "Item Purchase Order",
                          children: <Widget> [
                            ListView.separated(
                              separatorBuilder: (context, index) => SizedBox(
                                height: getProportionateScreenHeight(10).h,
                              ),
                              itemCount: detailPurchaseOrder.data!.detail!.poDetail!.length,
                              itemBuilder: (BuildContext context, index){
                                return Padding(
                                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
                                  child: CardItemExpansionDetail(
                                    child: ListTile(
                                      contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0).w, vertical: getProportionateScreenHeight(10.0).h),
                                      title: HighlightItemName(
                                        child: Text(
                                          snapshot.data!.data!.detail!.poDetail![index]!.kodeItem.toString(),
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
                                              label: "Nama Item",
                                              contentData: detailPurchaseOrder.data!.detail!.poDetail![index]!.namaItem,
                                              flexLeftRow: 12,
                                              flexRightRow: 20,
                                            ),
                                            SizedBox(height: getProportionateScreenHeight(10).h),
                                            CardFieldItemRightRow(
                                              label: "Qty",
                                              rightRow: <Widget> [
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 0),
                                                  child: (detailPurchaseOrder.data!.detail!.poDetail![index]!.qtyOrder != null)
                                                  ? Text(
                                                    formatDecimal.format(double.parse(detailPurchaseOrder.data!.detail!.poDetail![index]!.qtyOrder.toString())).toString()
                                                    +' '+
                                                    detailPurchaseOrder.data!.detail!.poDetail![index]!.namaSatuan.toString(),
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
                                              flexLeftRow: 12,
                                              flexRightRow: 20,
                                            ),
                                            SizedBox(height: getProportionateScreenHeight(10).h),
                                            CardFieldItemFormatCurrency(
                                              label: "Harga Kesepakatan",
                                              contentData: detailPurchaseOrder.data!.detail!.poDetail![index]!.hargaKesepakatan,
                                              flexLeftRow: 12,
                                              flexRightRow: 20,
                                            ),
                                            SizedBox(height: getProportionateScreenHeight(10).h),
                                            CardFieldItemFormatCurrency(
                                              label: "Sub Total",
                                              contentData: subTotalHarga[index],
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
                            SizedBox(height: getProportionateScreenHeight(10).h),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
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
                                      SizedBox(height: getProportionateScreenHeight(5).h),
                                      CardFieldItemPercent(
                                        label: "Diskon",
                                        labelValue: detailPurchaseOrder.data!.detail!.diskon,
                                        total: diskonHarga,
                                        flexLeftRow: 15,
                                        flexRightRow: 20,
                                      ),
                                      SizedBox(height: getProportionateScreenHeight(5).h),
                                      CardFieldItemTotal(
                                        label: "Total Setelah Diskon",
                                        total: totalSetelahDiskon,
                                        flexLeftRow: 15,
                                        flexRightRow: 20,
                                      ),
                                      SizedBox(height: getProportionateScreenHeight(5).h),
                                      CardFieldItemPercent(
                                        label: "PPN",
                                        labelValue: detailPurchaseOrder.data!.detail!.ppn,
                                        total: ppnHarga,
                                        flexLeftRow: 15,
                                        flexRightRow: 20,
                                      ),
                                      SizedBox(height: getProportionateScreenHeight(5).h),
                                      CardFieldItemTotal(
                                        label: "Total Setelah PPN",
                                        total: totalSetelahPpn,
                                        flexLeftRow: 15,
                                        flexRightRow: 20,
                                      ),
                                      CardFieldItemPercent(
                                        label: "DP",
                                        labelValue: detailPurchaseOrder.data!.detail!.dp,
                                        total: dpHarga,
                                        flexLeftRow: 15,
                                        flexRightRow: 20,
                                      ),
                                      SizedBox(height: getProportionateScreenHeight(5).h),
                                      CardFieldItemTotal(
                                        label: "Total Setelah DP",
                                        total: totalSetelahDp,
                                        flexLeftRow: 15,
                                        flexRightRow: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: getProportionateScreenHeight(10).h)
                          ],
                        ),
                        if (detailPurchaseOrder.data!.approval!.isNotEmpty)...[
                          CardExpansionDetail(
                            label: "Catatan Approval",
                            children: <Widget> [
                              ListView.separated(
                                separatorBuilder: (context, index) => SizedBox(
                                  height: getProportionateScreenHeight(10).h,
                                ),
                                itemCount: detailPurchaseOrder.data!.approval!.length,
                                itemBuilder: (context, index){
                                  return FieldCatatanApproval(
                                    index: index,
                                    statusApproval: detailPurchaseOrder.data!.approval![index]!.statusApproval,
                                    namaKaryawan: detailPurchaseOrder.data!.approval![index]!.namaKaryawan,
                                    catatanApproval: detailPurchaseOrder.data!.approval![index]!.catatan,
                                    tglApproval: detailPurchaseOrder.data!.approval![index]!.tglApproval,
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
                                    "REVISE Purchase Order",
                                    "REVISE",
                                    reviseButtonColor,
                                    detailPurchaseOrder.data!.detail!.noPurchaseOrder.toString(),
                                    "REV",
                                    _catatanTextEditingController.text,
                                    detailPurchaseOrder.data!.detail!.baseline.toString(),
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
                                    detailPurchaseOrder.data!.detail!.noPurchaseOrder.toString(),
                                    "REJ",
                                    _catatanTextEditingController.text,
                                    detailPurchaseOrder.data!.detail!.baseline.toString(),
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
                                    detailPurchaseOrder.data!.detail!.noPurchaseOrder.toString(),
                                    "VER",
                                    _catatanTextEditingController.text,
                                    detailPurchaseOrder.data!.detail!.baseline.toString(),
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
                                    detailPurchaseOrder.data!.detail!.noPurchaseOrder.toString(),
                                    "REJ",
                                    _catatanTextEditingController.text,
                                    detailPurchaseOrder.data!.detail!.baseline.toString(),
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
                                    detailPurchaseOrder.data!.detail!.noPurchaseOrder.toString(),
                                    "APP",
                                    _catatanTextEditingController.text,
                                    detailPurchaseOrder.data!.detail!.baseline.toString(),
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