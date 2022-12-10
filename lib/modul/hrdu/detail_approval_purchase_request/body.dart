import 'package:mgp_mobile_app/controller_getX/default/getX_default_visibility_detail.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/purchase_request/mixin_purchase_request.dart';
import 'package:mgp_mobile_app/model/hrdu/purchase_request/detail_purchase_request_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mgp_mobile_app/modul/hrdu/approval_purchase_request/approval_purchase_request.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_purchase_request/detail_approval_purchase_request.dart';
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
    required this.noPurchaseRequest,
    required this.statusMenu,
  }) : super(key: key);
  final String noPurchaseRequest;
  final String statusMenu;
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> with PurchaseRequestDetail{
  late Future<DetailPr> futures = fetchDataPurchaseRequestDetail(noPurchaseRequest: widget.noPurchaseRequest);
  final formatDecimal = NumberFormat("###.###", "id_ID");
  final _formKey = GlobalKey<FormState>();
  final _catatanTextEditingController = TextEditingController();
  late List<String>? gambarIn;
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
            final _postProses = await MGPAPI().postPurchaseRequest(
              noTransaksi: noTransaksi,
              statusApproval: status,
              catatan: catatan,
              tglApproval: DateTime.now().toString(),
              approvalBaseline: approvalBaseline,
            );
            print(_postProses);
            if (_postProses == "berhasil") {
              setState(() {
                Get.off(const PurchaseRequestView());
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
              child: FutureBuilder<DetailPr>(
                future: futures,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    String status = futureDetailPr!.data!.behavior.toString();
                    Get.put(DefaultVisibilityDetail()).defaultButtonVisibilityDetail(status);
                    Get.put(DefaultVisibilityDetail()).defaultApprovalVisibilityDetail(widget.statusMenu);
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
                                  CardFieldItemDate(
                                    label: "Tgl. Purchase Request",
                                    date: futureDetailPr!.data!.detail!.tglPurchaseRequest,
                                    flexLeftRow: 12,
                                    flexRightRow: 20,
                                  ),
                                  SizedBox(height: getProportionateScreenHeight(5)),
                                  CardFieldItemText(
                                    label: "No. Purchase Request",
                                    contentData: futureDetailPr!.data!.detail!.noPurchaseRequest,
                                    flexLeftRow: 12,
                                    flexRightRow: 20,
                                  ),
                                  SizedBox(height: getProportionateScreenHeight(5)),
                                  CardFieldItemText(
                                    label: "Keperluan",
                                    contentData: futureDetailPr!.data!.detail!.keperluan,
                                    flexLeftRow: 12,
                                    flexRightRow: 20,
                                  ),
                                  SizedBox(height: getProportionateScreenHeight(5)),
                                  CardFieldItemDate(
                                    label: "Tgl. Pemakaian",
                                    date: futureDetailPr!.data!.detail!.tglPemakaian,
                                    flexLeftRow: 12,
                                    flexRightRow: 20,
                                  ),
                                  SizedBox(height: getProportionateScreenHeight(5)),
                                  CardFieldItemText(
                                    label: "Nama Proyek",
                                    contentData: futureDetailPr!.data!.detail!.namaProyek,
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
                                separatorBuilder: (context, index) => SizedBox(
                                  height: getProportionateScreenHeight(10),
                                ),
                                itemCount: snapshot.data!.data!.detail!.detail!.length,
                                itemBuilder: (BuildContext context, index){
                                  return Padding(
                                    padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                                    child: CardItemExpansionDetail(
                                      child: ListTile(
                                        contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0), vertical: getProportionateScreenHeight(10.0)),
                                        title: HighlightItemName(
                                          child: Text(
                                            snapshot.data!.data!.detail!.detail![index].kodeItem.toString(),
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
                                                contentData: futureDetailPr!.data!.detail!.detail![index].namaItem,
                                                flexLeftRow: 12,
                                                flexRightRow: 20,
                                              ),
                                              SizedBox(height: getProportionateScreenHeight(10)),
                                              CardFieldItemRightRow(
                                                label: "Qty",
                                                rightRow: <Widget> [
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 0),
                                                    child: (futureDetailPr!.data!.detail!.detail![index].qty != null)
                                                    ? Text(
                                                      formatDecimal.format(
                                                        double.parse(futureDetailPr!.data!.detail!.detail![index].qty.toString()
                                                        )
                                                      ).toString()
                                                      +" "+
                                                      futureDetailPr!.data!.detail!.detail![index].namaSatuan.toString(),
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
                                        onTap : () {
                                          gambarIn = futureDetailPr!.data!.detail!.detail![index].pathGambar;
                                          Get.to(DetailGambarPurchaseRequestView(gambarIndex: gambarIn, futureDPr: futures));
                                        },
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
                            label: "Catatan Purchase Request",
                            children: <Widget> [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                                child: CardItemExpansionDetail(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10), vertical: getProportionateScreenHeight(10)),
                                    child: (futureDetailPr!.data!.detail!.catatanPurchaseRequest != null)
                                    ? Text(futureDetailPr!.data!.detail!.catatanPurchaseRequest.toString(),
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                      ),
                                    )
                                    :  const Text("-",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                      ),
                                      textAlign: TextAlign.left,
                                    )
                                  ),
                                ),
                              ),
                              SizedBox(height: getProportionateScreenHeight(10)),
                            ],
                          ),
                          if (futureDetailPr!.data!.approval.isNotEmpty)...[
                            CardExpansionDetail(
                              label: "Catatan Approval",
                              children: <Widget> [
                                ListView.separated(
                                  separatorBuilder: (context, index) => SizedBox(
                                    height: getProportionateScreenHeight(10),
                                  ),
                                  itemCount: futureDetailPr!.data!.approval.length,
                                  itemBuilder: (context, index){
                                    return FieldCatatanApproval(
                                      index: index,
                                      statusApproval: futureDetailPr!.data!.approval[index].statusApproval,
                                      namaKaryawan: futureDetailPr!.data!.approval[index].namaKaryawan,
                                      catatanApproval: futureDetailPr!.data!.approval[index].catatan,
                                      tglApproval: futureDetailPr!.data!.approval[index].tglApproval,
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
                                      "REVISE Purchase Request",
                                      "REVISE",
                                      reviseButtonColor,
                                      futureDetailPr!.data!.detail!.noPurchaseRequest.toString(),
                                      "REV",
                                      _catatanTextEditingController.text,
                                      futureDetailPr!.data!.detail!.baseline.toString(),
                                    );
                                  }
                                }
                              },
                              onClickedReject: () {
                                if (_formKey.currentState!.validate()) {
                                  if (_catatanTextEditingController.text != "") {
                                    showAlertDialog(
                                      "REJECT Purchase Request",
                                      "REJECT",
                                      rejectButtonColor,
                                      futureDetailPr!.data!.detail!.noPurchaseRequest.toString(),
                                      "REJ",
                                      _catatanTextEditingController.text,
                                      futureDetailPr!.data!.detail!.baseline.toString(),
                                    );
                                  }
                                }
                              },
                              onClickedVerify: () {
                                if (_formKey.currentState!.validate()) {
                                  if (_catatanTextEditingController.text != "") {
                                    showAlertDialog(
                                      "VERIFY Purchase Request",
                                      "VERIFY",
                                      verifyButtonColor,
                                      futureDetailPr!.data!.detail!.noPurchaseRequest.toString(),
                                      "VER",
                                      _catatanTextEditingController.text,
                                      futureDetailPr!.data!.detail!.baseline.toString(),
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
                                      "REJECT Purchase Request",
                                      "REJECT",
                                      rejectButtonColor,
                                      futureDetailPr!.data!.detail!.noPurchaseRequest.toString(),
                                      "REJ",
                                      _catatanTextEditingController.text,
                                      futureDetailPr!.data!.detail!.baseline.toString(),
                                    );
                                  }
                                }
                              },
                              onClickedApprove: () {
                                if (_formKey.currentState!.validate()) {
                                  if (_catatanTextEditingController.text != "") {
                                    showAlertDialog(
                                      "APPROVE Purchase Request",
                                      "APPROVE",
                                      verifyButtonColor,
                                      futureDetailPr!.data!.detail!.noPurchaseRequest.toString(),
                                      "APP",
                                      _catatanTextEditingController.text,
                                      futureDetailPr!.data!.detail!.baseline.toString(),
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