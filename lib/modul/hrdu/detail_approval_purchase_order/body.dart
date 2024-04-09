import 'package:mgp_mobile_app/controller_getX/default/getX_default_visibility_detail.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/purchase_order/getX_item_purchase_order.dart';
import 'package:mgp_mobile_app/model/hrdu/purchase_order/detail_purchase_order_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mgp_mobile_app/modul/hrdu/approval_purchase_order/approval_purchase_order.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/mgp_api_hrdu.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/api_purchase_order/api_detail_purchase_order.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/api_purchase_order/api_post_purchase_order.dart';
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

class _BodyState extends State<Body> with PurchaseOrderDetail, PurchaseOrderPostClass{
  final formatCurrency = NumberFormat.currency(
    locale: 'ID',
    decimalDigits: 0,
    symbol: "Rp"
  );
  final formatDecimal = NumberFormat("###.###", "id_ID");
  final _formKey = GlobalKey<FormState>();
  final _catatanTextEditingController = TextEditingController();
  late Future<DetailRegpo> futureDetailRegpo;
  bool isLoading = false;

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
            Navigator.of(Get.overlayContext!, rootNavigator: true).pop();
            setState(() {
              isLoading = true;
            });
            final _postProses = await postPurchaseOrder(
              noTransaksi: noTransaksi,
              statusApproval: status,
              catatan: catatan,
              tglApproval: DateTime.now().toString(),
              approvalBaseline: approvalBaseline,
            );
            if (_postProses == "berhasil") {
              setState((){
                Get.off(const PurchaseOrderView());
                isLoading = false;
              });
            }
          }, isLoading: isLoading,
        );
      }
    );
  }
  
  @override
  void initState() {
    futureDetailRegpo = fetchDetailPurchaseOrder(noPurchaseOrder: widget.noPurchaseOrder, getToken: MGPAPI.tokens.toString());
    initializeDateFormatting();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
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
                    Get.put(DefaultVisibilityDetail()).defaultButtonVisibilityDetail(status);
                    Get.put(DefaultVisibilityDetail()).defaultApprovalVisibilityDetail(widget.statusMenu);
                    Get.put(GetxItemPurchaseOrder()).functSharedPrefPo(noPurchaseOrder: detailPurchaseOrder.data!.detail!.noPurchaseOrder.toString());
                    return GetX<DefaultVisibilityDetail>(
                      init: DefaultVisibilityDetail(),
                        builder:(controller) => Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: getProportionateScreenHeight(5)),
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
                                  SizedBox(height: getProportionateScreenHeight(5)),
                                  CardFieldItemText(
                                    label: "Nama Vendor",
                                    contentData: detailPurchaseOrder.data!.detail!.namaVendor,
                                    flexLeftRow: 12,
                                    flexRightRow: 20,
                                  ),
                                  SizedBox(height: getProportionateScreenHeight(5)),
                                  CardFieldItemText(
                                    label: "Contact Person",
                                    contentData: detailPurchaseOrder.data!.detail!.contactPerson,
                                    flexLeftRow: 12,
                                    flexRightRow: 20,
                                  ),
                                  SizedBox(height: getProportionateScreenHeight(5)),
                                  CardFieldItemText(
                                    label: "Alamat Vendor",
                                    contentData: detailPurchaseOrder.data!.detail!.alamatVendor,
                                    flexLeftRow: 12,
                                    flexRightRow: 20,
                                  ),
                                  SizedBox(height: getProportionateScreenHeight(5)),
                                  CardFieldItemDate(
                                    label: "Tgl. Purchase Order",
                                    date: detailPurchaseOrder.data!.detail!.tglPurchaseOrder,
                                    flexLeftRow: 12,
                                    flexRightRow: 20,
                                  ),
                                  SizedBox(height: getProportionateScreenHeight(5)),
                                  CardFieldItemText(
                                    label: "No. Purchase Order",
                                    contentData: detailPurchaseOrder.data!.detail!.noPurchaseOrder,
                                    flexLeftRow: 12,
                                    flexRightRow: 20,
                                  ),
                                  SizedBox(height: getProportionateScreenHeight(5)),
                                  CardFieldItemText(
                                    label: "Alamat Pengiriman",
                                    contentData: detailPurchaseOrder.data!.detail!.alamatTujuanPengiriman,
                                    flexLeftRow: 12,
                                    flexRightRow: 20,
                                  ),
                                  SizedBox(height: getProportionateScreenHeight(5)),
                                  CardFieldItemDate(
                                    label: "Tgl. Pengiriman",
                                    date: detailPurchaseOrder.data!.detail!.tglPengiriman,
                                    flexLeftRow: 12,
                                    flexRightRow: 20,
                                  ),
                                  SizedBox(height: getProportionateScreenHeight(5)),
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
                                  height: getProportionateScreenHeight(10),
                                ),
                                itemCount: detailPurchaseOrder.data!.detail!.poDetail!.length,
                                itemBuilder: (BuildContext context, index){
                                  return Padding(
                                    padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                                    child: CardItemExpansionDetail(
                                      child: ListTile(
                                        contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0), vertical: getProportionateScreenHeight(10.0)),
                                        title: HighlightItemName(
                                          child: Text(
                                            snapshot.data!.data!.detail!.poDetail![index]!.kodeItem.toString(),
                                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14,),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        subtitle: Padding(
                                          padding: EdgeInsets.only(top: getProportionateScreenHeight(15)),
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
                                              SizedBox(height: getProportionateScreenHeight(10)),
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
                                                      style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 14,
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
                                              SizedBox(height: getProportionateScreenHeight(10)),
                                              CardFieldItemFormatCurrency(
                                                label: "Harga Kesepakatan",
                                                contentData: detailPurchaseOrder.data!.detail!.poDetail![index]!.hargaKesepakatan,
                                                flexLeftRow: 12,
                                                flexRightRow: 20,
                                              ),
                                              SizedBox(height: getProportionateScreenHeight(10)),
                                              GetX<GetxItemPurchaseOrder>(
                                                init: GetxItemPurchaseOrder(),
                                                builder:(controller2) => CardFieldItemFormatCurrency(
                                                  label: "Sub Total",
                                                  contentData: controller2.subTotalHarga[index],
                                                  flexLeftRow: 12,
                                                  flexRightRow: 20,
                                                ),
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
                              SizedBox(height: getProportionateScreenHeight(10)),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                                child: CardItemExpansionDetail(
                                  child: ListTile(
                                    title: GetX<GetxItemPurchaseOrder>(
                                      init: GetxItemPurchaseOrder(),
                                      builder:(controller2) => Column(
                                        children: <Widget> [
                                          CardFieldItemTotal(
                                            label: "Total",
                                            total: controller2.grandTotalHarga.value,
                                            flexLeftRow: 15,
                                            flexRightRow: 20,
                                          ),
                                          SizedBox(height: getProportionateScreenHeight(5)),
                                          CardFieldItemPercent(
                                            label: "Diskon",
                                            labelValue: detailPurchaseOrder.data!.detail!.diskon,
                                            total: controller2.diskonHarga.value,
                                            flexLeftRow: 15,
                                            flexRightRow: 20,
                                          ),
                                          SizedBox(height: getProportionateScreenHeight(5)),
                                          CardFieldItemTotal(
                                            label: "Total Setelah Diskon",
                                            total: controller2.totalSetelahDiskon.value,
                                            flexLeftRow: 15,
                                            flexRightRow: 20,
                                          ),
                                          SizedBox(height: getProportionateScreenHeight(5)),
                                          CardFieldItemPercent(
                                            label: "PPN",
                                            labelValue: detailPurchaseOrder.data!.detail!.ppn,
                                            total: controller2.ppnHarga.value,
                                            flexLeftRow: 15,
                                            flexRightRow: 20,
                                          ),
                                          SizedBox(height: getProportionateScreenHeight(5)),
                                          CardFieldItemTotal(
                                            label: "Total Setelah PPN",
                                            total: controller2.totalSetelahPpn.value,
                                            flexLeftRow: 15,
                                            flexRightRow: 20,
                                          ),
                                          CardFieldItemPercent(
                                            label: "DP",
                                            labelValue: detailPurchaseOrder.data!.detail!.dp,
                                            total: controller2.dpHarga.value,
                                            flexLeftRow: 15,
                                            flexRightRow: 20,
                                          ),
                                          SizedBox(height: getProportionateScreenHeight(5)),
                                          CardFieldItemTotal(
                                            label: "Total Setelah DP",
                                            total: controller2.totalSetelahDp.value,
                                            flexLeftRow: 15,
                                            flexRightRow: 20,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: getProportionateScreenHeight(10))
                            ],
                          ),
                          if (detailPurchaseOrder.data!.approval!.isNotEmpty)...[
                            CardExpansionDetail(
                              label: "Catatan Approval",
                              children: <Widget> [
                                ListView.separated(
                                  separatorBuilder: (context, index) => SizedBox(
                                    height: getProportionateScreenHeight(10),
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
                                SizedBox(height: getProportionateScreenHeight(10)),
                              ]
                            ),
                          ],
                          Visibility(
                            visible: controller.visibilityStatusMenu.value,
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10), horizontal: getProportionateScreenWidth(3)),
                              child: CatatanApproval(
                                controller: _catatanTextEditingController,
                                onChanged: (value) {
                                  if (value!.isNotEmpty) {
                                    setState(() {
                                      controller.catatanError = false.obs;
                                    });
                                  }
                                  return; 
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    setState(() {
                                      controller.catatanError = true.obs;
                                    });
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          Visibility(
                            visible: controller.catatanError.value,
                            child: Column(
                              children: <Widget>[
                                SizedBox(height: getProportionateScreenHeight(5)),
                                const FormErrors(errors: kCatatanError),
                                SizedBox(height: getProportionateScreenHeight(8)),
                              ],
                            )
                          ),
                          Visibility(
                            visible: controller.visibilityStatusMenu.value,
                            child: SizedBox(height: getProportionateScreenHeight(10))
                          ),
                          Visibility(
                            visible: controller.visibilityStatusMenu.value,
                            child: ButtonPemeriksa(
                              visibilityPemeriksa: controller.visibilityPemeriksa.value,
                              onClickedRevise: () {
                                if (_formKey.currentState!.validate()) {
                                  if (_catatanTextEditingController.text != "") {
                                    showAlertDialog(
                                      "REVISE Seleksi Vendor",
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
                                      "REJECT Seleksi Vendor",
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
                                      "VERIFY Seleksi Vendor",
                                      "VERIFY",
                                      verifyButtonColor,
                                      detailPurchaseOrder.data!.detail!.noPurchaseOrder.toString(),
                                      "VER",
                                      _catatanTextEditingController.text,
                                      detailPurchaseOrder.data!.detail!.baseline.toString(),
                                    );
                                  }
                                }
                              }, isLoading: isLoading,
                            ),
                          ),
                          Visibility(
                            visible: controller.visibilityStatusMenu.value,
                            child: ButtonPengesah(
                              visibilityPengesah: controller.visibilityPengesah.value,
                              onClickedReject: () {
                                if (_formKey.currentState!.validate()) {
                                  if (_catatanTextEditingController.text != "") {
                                    showAlertDialog(
                                      "REJECT Seleksi Vendor",
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
                                      "APPROVE Seleksi Vendor",
                                      "APPROVE",
                                      verifyButtonColor,
                                      futureDetailPo!.data!.detail!.noPurchaseOrder.toString(),
                                      "APP",
                                      _catatanTextEditingController.text,
                                      futureDetailPo!.data!.detail!.baseline.toString(),
                                    );
                                  }
                                }
                              }, isLoading: isLoading,
                            ),
                          ),
                          SizedBox(height: getProportionateScreenHeight(30)),
                        ],
                      ),
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