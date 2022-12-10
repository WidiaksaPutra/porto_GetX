
import 'dart:async';

import 'package:mgp_mobile_app/controller_getX/default/getX_default_visibility_detail.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/seleksi_vendor/getX_default_subtotal.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/seleksi_vendor/mixin_seleksi_vendor.dart';
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
import 'package:mgp_mobile_app/service/mgp_api_hrdu/mgp_api_hrdu.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

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

class _BodyState extends State<Body> with SeleksiVendorDetail{
  late Future<DetailPvspr> futures = fetchDataSeleksiVendorDetail(noSeleksiVendor: widget.noSeleksiVendor.toString()); 
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
            final _postProses = await MGPAPI().postSeleksiVendor(
              noTransaksi: noTransaksi,
              statusApproval: status,
              catatan: catatan,
              tglApproval: DateTime.now().toString(),
              approvalBaseline: approvalBaseline,
            );
            if (_postProses == "berhasil") {
              setState(() {
                Get.offAll(const SeleksiVendorView());
                isLoading = false;
              });
            }
          }, isLoading: isLoading,
        );
      }
    );
  }
  
  @override
  void initState(){
    initializeDateFormatting();
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Form(
              key: _formKey,
              child: FutureBuilder<DetailPvspr>(
                future: futures,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    String? status = futureDetailSv?.data!.behavior.toString();
                    Get.put(DefaultVisibilityDetail()).defaultButtonVisibilityDetail(status.toString());
                    Get.put(DefaultVisibilityDetail()).defaultApprovalVisibilityDetail(widget.statusMenu);
                    Get.put(SubTotalSeleksiVendor()).defaultSubTotal(widget.noSeleksiVendor);
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: getProportionateScreenHeight(5)),
                        CardDetail(
                          child: ListTile(
                            subtitle: Column(
                              children: <Widget>[
                                CardFieldItemDate(
                                  label: "Tgl. Purchase Request",
                                  date: futureDetailSv!.data!.detail!.tglPurchaseRequest,
                                  flexLeftRow: 12,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5)),
                                CardFieldItemDate(
                                  label: "Tgl. Pemakaian",
                                  date: futureDetailSv!.data!.detail!.tglPemakaian,
                                  flexLeftRow: 12,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5)),
                                CardFieldItemDate(
                                  label: "Tgl. Seleksi Vendor",
                                  date: futureDetailSv!.data!.detail!.tglSeleksiVendor,
                                  flexLeftRow: 12,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5)),
                                CardFieldItemText(
                                  label: "No. Purchase Request",
                                  contentData: futureDetailSv!.data!.detail!.noPurchaseRequest,
                                  flexLeftRow: 12,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5)),
                                CardFieldItemText(
                                  label: "Keperluan",
                                  contentData: futureDetailSv!.data!.detail!.keperluan,
                                  flexLeftRow: 12,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5)),
                                CardFieldItemText(
                                  label: "No. Seleksi Vendor",
                                  contentData: futureDetailSv!.data!.detail!.noSeleksiVendor,
                                  flexLeftRow: 12,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5)),
                                CardFieldItemText(
                                  label: "Proyek",
                                  contentData: futureDetailSv!.data!.detail!.namaProyek,
                                  flexLeftRow: 12,
                                  flexRightRow: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                        GetX<SubTotalSeleksiVendor>(
                          init: SubTotalSeleksiVendor(),
                          builder: (controller) { 
                            // print(controller.subTotalHargaPr);
                            // print(controller.subTotalHargaSv);
                            if(controller.subTotalHargaPr.isNotEmpty && controller.subTotalHargaSv.isNotEmpty){
                              return Column(
                                children: [
                                  CardExpansionDetail(
                                    label: "Item Purchase Request",
                                    children: <Widget> [
                                      ListView.separated(
                                        separatorBuilder: (context, index) => SizedBox(
                                          height: getProportionateScreenHeight(10),
                                        ),
                                        itemCount: futureDetailSv!.data!.detail!.prDetail!.length,
                                        itemBuilder: (BuildContext context, index){
                                          return Padding(
                                            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                                            child: CardItemExpansionDetail(
                                              child: ListTile(
                                                contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0), vertical: getProportionateScreenHeight(10.0)),
                                                title: HighlightItemName(
                                                  child: Text(
                                                    futureDetailSv!.data!.detail!.prDetail![index].kodeItem.toString(),
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
                                                        label: "Nama Item",
                                                        contentData: futureDetailSv!.data!.detail!.prDetail![index].namaItem,
                                                        flexLeftRow: 12,
                                                        flexRightRow: 20,
                                                      ),
                                                      SizedBox(height: getProportionateScreenHeight(10)),
                                                      CardFieldItemRightRow(
                                                        label: "Qty",
                                                        rightRow: <Widget> [
                                                          Padding(
                                                            padding: const EdgeInsets.only(left: 0),
                                                            child: (futureDetailSv!.data!.detail!.prDetail![index].qtyPr != null)
                                                            ? Text(
                                                              formatDecimal.format(double.parse(futureDetailSv!.data!.detail!.prDetail![index].qtyPr.toString())).toString()
                                                              +' '+
                                                              futureDetailSv!.data!.detail!.prDetail![index].satuanBeli.toString(),
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
                                                        label: "Harga Perkiraan Sendiri",
                                                        contentData: futureDetailSv!.data!.detail!.prDetail![index].hargaPerkiraanSendiri,
                                                        flexLeftRow: 12,
                                                        flexRightRow: 20,
                                                      ),
                                                      SizedBox(height: getProportionateScreenHeight(10)),
                                                      CardFieldItemFormatCurrency(
                                                        label: "Sub Total",
                                                        contentData: controller.subTotalHargaPr[index],
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
                                      SizedBox(height: getProportionateScreenHeight(10))
                                    ],
                                  ),
                                  CardExpansionDetail(
                                    label: "Item Seleksi Vendor",
                                    children: <Widget> [
                                      ListView.separated(
                                        separatorBuilder: (context, index) => SizedBox(
                                          height: getProportionateScreenHeight(10),
                                        ),
                                        itemCount: futureDetailSv!.data!.detail!.detail!.length,
                                        itemBuilder: (BuildContext context, index){
                                          return Padding(
                                            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                                            child: CardItemExpansionDetail(
                                              child: ListTile(
                                                contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0), vertical: getProportionateScreenHeight(10.0)),
                                                title: HighlightItemName(
                                                  child: Text(
                                                    futureDetailSv!.data!.detail!.detail![index].kodeItem.toString(),
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
                                                        label: "Vendor",
                                                        contentData: futureDetailSv!.data!.detail!.detail![index].namaVendor,
                                                        flexLeftRow: 12,
                                                        flexRightRow: 20,
                                                      ),
                                                      SizedBox(height: getProportionateScreenHeight(10)),
                                                      CardFieldItemText(
                                                        label: "Nama Item",
                                                        contentData: futureDetailSv!.data!.detail!.detail![index].namaItem,
                                                        flexLeftRow: 12,
                                                        flexRightRow: 20,
                                                      ),
                                                      SizedBox(height: getProportionateScreenHeight(10)),
                                                      CardFieldItemRightRow(
                                                        label: "Qty",
                                                        rightRow: <Widget> [
                                                          Padding(
                                                            padding: const EdgeInsets.only(left: 0),
                                                            child: (futureDetailSv!.data!.detail!.detail![index].qtyOrder != null)
                                                            ? Text(
                                                              formatDecimal.format(double.parse(futureDetailSv!.data!.detail!.detail![index].qtyOrder.toString())).toString()
                                                              +' '+
                                                              futureDetailSv!.data!.detail!.detail![index].satuanBeli.toString(),
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
                                                        contentData: futureDetailSv!.data!.detail!.detail![index].hargaKesepakatan,
                                                        flexLeftRow: 12,
                                                        flexRightRow: 20,
                                                      ),
                                                      SizedBox(height: getProportionateScreenHeight(10)),
                                                      CardFieldItemFormatCurrency(
                                                        label: "Sub Total",
                                                        contentData: controller.subTotalHargaSv[index],
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
                                      SizedBox(height: getProportionateScreenHeight(10))
                                    ],
                                  ),
                                ]
                              );
                            }
                            else{
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                        ),
                        CardExpansionDetail(
                          label: "Keterangan",
                          children: <Widget> [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                              child: CardItemExpansionDetail(
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10), horizontal: getProportionateScreenWidth(10)),
                                    child: (futureDetailSv!.data!.detail!.keterangan != null)
                                    ? Text(
                                        futureDetailSv!.data!.detail!.keterangan.toString(),
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
                                ),
                              ),
                            ),
                            SizedBox(height: getProportionateScreenHeight(10))
                          ],
                        ),
                        if (futureDetailSv!.data!.approval.isNotEmpty)...[
                          CardExpansionDetail(
                            label: "Catatan Approval",
                            children: <Widget> [
                              ListView.separated(
                                separatorBuilder: (context, index) => SizedBox(
                                  height: getProportionateScreenHeight(10),
                                ),
                                itemCount: futureDetailSv!.data!.approval.length,
                                itemBuilder: (context, index){
                                  return FieldCatatanApproval(
                                    index: index,
                                    statusApproval: futureDetailSv!.data!.approval[index].statusApproval,
                                    namaKaryawan: futureDetailSv!.data!.approval[index].namaKaryawan,
                                    catatanApproval: futureDetailSv!.data!.approval[index].catatan,
                                    tglApproval: futureDetailSv!.data!.approval[index].tglApproval,
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
                                    }
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
                                          "REVISE Seleksi Vendor",
                                          "REVISE",
                                          reviseButtonColor,
                                          futureDetailSv!.data!.detail!.noSeleksiVendor.toString(),
                                          "REV",
                                          _catatanTextEditingController.text,
                                          futureDetailSv!.data!.detail!.baseline.toString(),
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
                                          futureDetailSv!.data!.detail!.noSeleksiVendor.toString(),
                                          "REJ",
                                          _catatanTextEditingController.text,
                                          futureDetailSv!.data!.detail!.baseline.toString(),
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
                                          futureDetailSv!.data!.detail!.noSeleksiVendor.toString(),
                                          "VER",
                                          _catatanTextEditingController.text,
                                          futureDetailSv!.data!.detail!.baseline.toString(),
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
                                          "REJECT Seleksi Vendor",
                                          "REJECT",
                                          rejectButtonColor,
                                          futureDetailSv!.data!.detail!.noSeleksiVendor.toString(),
                                          "REJ",
                                          _catatanTextEditingController.text,
                                          futureDetailSv!.data!.detail!.baseline.toString(),
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
                                          futureDetailSv!.data!.detail!.noSeleksiVendor.toString(),
                                          "APP",
                                          _catatanTextEditingController.text,
                                          futureDetailSv!.data!.detail!.baseline.toString(),
                                        );
                                      }
                                    }
                                  }, isLoading: isLoading,
                                ),
                              ),
                              SizedBox(height: getProportionateScreenHeight(30)),
                            ]
                          ),
                        ),
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