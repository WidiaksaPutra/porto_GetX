import 'package:mgp_mobile_app/controller_getX/default/getX_default_visibility_detail.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/sales_order/getX_item_sales_order.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/sales_order/mixin_sales_order.dart';
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
import 'package:mgp_mobile_app/service/mgp_api_hrdu/mgp_api_hrdu.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

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

class _BodyState extends State<Body> with SeleksiSalesOrder{
  late Future<DetailRegso> futures = fetchDataSalesOrderDetail(noSalesOrder: widget.noSalesOrder.toString());
  final formatDecimal = NumberFormat("###.###", "id_ID");
  final _formKey = GlobalKey<FormState>();
  final _catatanTextEditingController = TextEditingController();
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
            final _postProses = await MGPAPI().postSalesOrder(
              noTransaksi: noTransaksi,
              statusApproval: status,
              catatan: catatan,
              tglApproval: DateTime.now().toString(),
              approvalBaseline: approvalBaseline,
            );
            if (_postProses == "berhasil") {
              setState(() {
                Get.off(const SalesOrderView());
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
              child: FutureBuilder<DetailRegso>(
                future: futures,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var detailSalesOrder = futureDetailSo!.data;
                    String status = detailSalesOrder!.behavior.toString();
 
                    Get.put(DefaultVisibilityDetail()).defaultButtonVisibilityDetail(status.toString());
                    Get.put(DefaultVisibilityDetail()).defaultApprovalVisibilityDetail(widget.statusMenu);
                    Get.put(GetxItemSalesOrder()).fetchDataItemSalesOrderDetail(widget.noSalesOrder); 
                    return GetX<GetxItemSalesOrder>(
                      init: GetxItemSalesOrder(),
                      builder: (controller) => Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: getProportionateScreenHeight(5)),
                          CardDetail(
                            child: ListTile(
                              subtitle: Column(
                                children: <Widget>[
                                  CardFieldItemDate(
                                    label: "Tgl. Sales Order",
                                    date: detailSalesOrder.detail!.tglSalesOrder,
                                    flexLeftRow: 13,
                                    flexRightRow: 20,
                                  ),
                                  SizedBox(height: getProportionateScreenHeight(5)),
                                  CardFieldItemText(
                                    label: "No. Sales Order",
                                    contentData: detailSalesOrder.detail!.noSalesOrder,
                                    flexLeftRow: 13,
                                    flexRightRow: 20,
                                  ),
                                  SizedBox(height: getProportionateScreenHeight(5)),
                                  CardFieldItemText(
                                    label: "Customer",
                                    contentData: detailSalesOrder.detail!.namaCustomer,
                                    flexLeftRow: 13,
                                    flexRightRow: 20,
                                  ),
                                  SizedBox(height: getProportionateScreenHeight(5)),
                                  CardFieldItemText(
                                    label: "Sales",
                                    contentData: detailSalesOrder.detail!.namaSales,
                                    flexLeftRow: 13,
                                    flexRightRow: 20,
                                  ),
                                  SizedBox(height: getProportionateScreenHeight(5)),
                                  CardFieldItemText(
                                    label: "Alamat Pengiriman",
                                    contentData: detailSalesOrder.detail!.alamatPengiriman,
                                    flexLeftRow: 13,
                                    flexRightRow: 20,
                                  ),
                                  SizedBox(height: getProportionateScreenHeight(5)),
                                  CardFieldItemDate(
                                    label: "Tgl. Batas Waktu",
                                    date: detailSalesOrder.detail!.batasWaktu,
                                    flexLeftRow: 13,
                                    flexRightRow: 20,
                                  ),
                                  SizedBox(height: getProportionateScreenHeight(5)),
                                  CardFieldItemText(
                                    label: "Proyek",
                                    contentData: detailSalesOrder.detail!.namaProyek,
                                    flexLeftRow: 13,
                                    flexRightRow: 20,
                                  ),
                                  SizedBox(height: getProportionateScreenHeight(5)),
                                  CardFieldItemText(
                                    label: "Catatan Sales Order",
                                    contentData: detailSalesOrder.detail!.catatanSo,
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
                                separatorBuilder: (context, index) => SizedBox(
                                  height: getProportionateScreenHeight(10),
                                ),
                                itemCount: detailSalesOrder.detail!.detail!.length,
                                itemBuilder: (BuildContext context, index){
                                  return Padding(
                                    padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                                    child: CardItemExpansionDetail(
                                      child: ListTile(
                                        contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0), vertical: getProportionateScreenHeight(10.0)),
                                        title: HighlightItemName(
                                          child: Text(
                                            detailSalesOrder.detail!.detail![index].kodeBarang.toString(),
                                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14,),
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
                                                label: "Nama Barang",
                                                contentData: detailSalesOrder.detail!.detail![index].namaBarang,
                                                flexLeftRow: 13,
                                                flexRightRow: 20,
                                              ),
                                              SizedBox(height: getProportionateScreenHeight(10)),
                                              CardFieldItemText(
                                                label: "Nama Gudang",
                                                contentData: detailSalesOrder.detail!.detail![index].namaGudang,
                                                flexLeftRow: 13,
                                                flexRightRow: 20,
                                              ),
                                              SizedBox(height: getProportionateScreenHeight(10)),
                                              CardFieldItemRightRow(
                                                label: "Qty",
                                                rightRow: <Widget> [
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 0),
                                                    child: (detailSalesOrder.detail!.detail![index].qtyItem != null)
                                                    ? Text(
                                                      formatDecimal.format(double.parse(detailSalesOrder.detail!.detail![index].qtyItem.toString())).toString()
                                                      +' '+
                                                      detailSalesOrder.detail!.detail![index].namaSatuan.toString(),
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
                                                flexLeftRow: 13,
                                                flexRightRow: 20,
                                              ),
                                              SizedBox(height: getProportionateScreenHeight(10)),
                                              CardFieldItemFormatCurrency(
                                                label: "Harga Satuan",
                                                contentData: detailSalesOrder.detail!.detail![index].hargaSatuanJual,
                                                flexLeftRow: 13, 
                                                flexRightRow: 20,
                                              ),
                                              SizedBox(height: getProportionateScreenHeight(10)),
                                              CardFieldItemFormatCurrency(
                                                label: "Sub Total",
                                                contentData: controller.subTotalHarga[index],
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
                              SizedBox(height: getProportionateScreenHeight(10)),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                                child: CardItemExpansionDetail(
                                  child: ListTile(
                                    title: Column(
                                      children: <Widget> [
                                        CardFieldItemTotal(
                                          label: "Total",
                                          total: controller.grandTotalHarga.value.toString(),
                                          flexLeftRow: 15,
                                          flexRightRow: 20,
                                        ),
                                        SizedBox(height: getProportionateScreenHeight(5)),
                                        CardFieldItemPercent(
                                          label: "Diskon",
                                          labelValue: detailSalesOrder.detail!.diskon,
                                          total: controller.diskonHarga.value.toString(),
                                          flexLeftRow: 15,
                                          flexRightRow: 20,
                                        ),
                                        SizedBox(height: getProportionateScreenHeight(5)),
                                        CardFieldItemTotal(
                                          label: "Total Setelah Diskon",
                                          total: controller.totalSetelahDiskon.value.toString(),
                                          flexLeftRow: 15,
                                          flexRightRow: 20,
                                        ),
                                        SizedBox(height: getProportionateScreenHeight(5)),
                                        CardFieldItemPercent(
                                          label: "PPN",
                                          labelValue: detailSalesOrder.detail!.ppn,
                                          total: controller.ppnHarga.value.toString(),
                                          flexLeftRow: 15,
                                          flexRightRow: 20,
                                        ),
                                        SizedBox(height: getProportionateScreenHeight(5)),
                                        CardFieldItemTotal(
                                          label: "Total Setelah PPN",
                                          total: controller.totalSetelahPpn.value.toString(),
                                          flexLeftRow: 15,
                                          flexRightRow: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: getProportionateScreenHeight(10))
                            ],
                          ),
                          if (detailSalesOrder.approval.isNotEmpty)...[
                            CardExpansionDetail(
                              label: "Catatan Approval",
                              children: <Widget> [
                                ListView.separated(
                                  separatorBuilder: (context, index) => SizedBox(
                                    height: getProportionateScreenHeight(10),
                                  ),
                                  itemCount: detailSalesOrder.approval.length,
                                  itemBuilder: (context, index){
                                    return FieldCatatanApproval(
                                      index: index,
                                      statusApproval: detailSalesOrder.approval[index].statusApproval,
                                      namaKaryawan: detailSalesOrder.approval[index].namaKaryawan,
                                      catatanApproval: detailSalesOrder.approval[index].catatan,
                                      tglApproval: detailSalesOrder.approval[index].tglApproval,
                                    );
                                  },
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                ),
                                SizedBox(height: getProportionateScreenHeight(10)),
                              ]
                            ),
                          ],
                          GetX<DefaultVisibilityDetail>(
                            init: DefaultVisibilityDetail(),
                            builder:(controller2) => Column(
                              children: [
                                Visibility(
                                  visible: controller2.visibilityStatusMenu.value,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10), horizontal: getProportionateScreenWidth(3)),
                                    child: CatatanApproval(
                                      controller: _catatanTextEditingController,
                                      onChanged: (value) {
                                        setState(() {
                                          Get.put(DefaultVisibilityDetail()).defaultCatatanVisibilityDetail(value);
                                        });
                                        return; 
                                      },
                                      validator: (value) {
                                        setState(() {
                                          Get.put(DefaultVisibilityDetail()).defaultCatatanVisibilityDetail(value);
                                        });
                                        return null;
                                      },
                                    ),
                                  ),
                                ),
                                Visibility(
                                  visible: controller2.catatanError.value,
                                  child: Column(
                                    children: <Widget>[
                                      SizedBox(height: getProportionateScreenHeight(5)),
                                      const FormErrors(errors: kCatatanError),
                                      SizedBox(height: getProportionateScreenHeight(8)),
                                    ],
                                  )
                                ),
                                Visibility(
                                  visible: controller2.visibilityStatusMenu.value,
                                  child: SizedBox(height: getProportionateScreenHeight(10))
                                ),
                                Visibility(
                                  visible: controller2.visibilityStatusMenu.value,
                                  child: ButtonPemeriksa(
                                    visibilityPemeriksa: controller2.visibilityPemeriksa.value,
                                    onClickedRevise: () {
                                      if (_formKey.currentState!.validate()) {
                                        if (_catatanTextEditingController.text != "") {
                                          showAlertDialog(
                                            "REVISE Sales Order",
                                            "REVISE",
                                            reviseButtonColor,
                                            detailSalesOrder.detail!.noSalesOrder.toString(),
                                            "REV",
                                            _catatanTextEditingController.text,
                                            detailSalesOrder.detail!.baseline.toString(),
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
                                            detailSalesOrder.detail!.noSalesOrder.toString(),
                                            "REJ",
                                            _catatanTextEditingController.text,
                                            detailSalesOrder.detail!.baseline.toString(),
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
                                            detailSalesOrder.detail!.noSalesOrder.toString(),
                                            "VER",
                                            _catatanTextEditingController.text,
                                            detailSalesOrder.detail!.baseline.toString(),
                                          );
                                        }
                                      }
                                    }, isLoading: isLoading,
                                  ),
                                ),
                                Visibility(
                                  visible: controller2.visibilityStatusMenu.value,
                                  child: ButtonPengesah(
                                    visibilityPengesah: controller2.visibilityPengesah.value,
                                    onClickedReject: () {
                                      if (_formKey.currentState!.validate()) {
                                        if (_catatanTextEditingController.text != "") {
                                          showAlertDialog(
                                            "REJECT Sales Order",
                                            "REJECT",
                                            rejectButtonColor,
                                            detailSalesOrder.detail!.noSalesOrder.toString(),
                                            "REJ",
                                            _catatanTextEditingController.text,
                                            detailSalesOrder.detail!.baseline.toString(),
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
                                            detailSalesOrder.detail!.noSalesOrder.toString(),
                                            "APP",
                                            _catatanTextEditingController.text,
                                            detailSalesOrder.detail!.baseline.toString(),
                                          );
                                        }
                                      }
                                    }, isLoading: isLoading,
                                  ),
                                ),
                                SizedBox(height: getProportionateScreenHeight(30)),
                              ],
                            ),
                          ),
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