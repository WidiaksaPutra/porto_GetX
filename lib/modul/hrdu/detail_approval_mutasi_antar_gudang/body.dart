
import 'package:mgp_mobile_app/model/hrdu/mutasi_antar_gudang/detail_mutasi_antar_gudang.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mgp_mobile_app/modul/hrdu/approval_mutasi_antar_gudang/approval_mutasi_antar_gudang.dart';
import 'package:mgp_mobile_app/widget/component/alert_approval.dart';
import 'package:mgp_mobile_app/widget/component/button_pemeriksa.dart';
import 'package:mgp_mobile_app/widget/component/button_pengesah.dart';
import 'package:mgp_mobile_app/widget/component/card_detail.dart';
import 'package:mgp_mobile_app/widget/component/card_expansion_detail.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_date.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_right_row.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_text.dart';
import 'package:mgp_mobile_app/widget/component/catatan_approval.dart';
import 'package:mgp_mobile_app/widget/component/error_form.dart';
import 'package:mgp_mobile_app/widget/component/field_catatan_approval.dart';
import 'package:mgp_mobile_app/widget/theme/constants.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/mgp_api_hrdu.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
    required this.noMutasiAntarGudang,
    required this.statusMenu,
  }) : super(key: key);
  final String noMutasiAntarGudang;
  final String statusMenu;
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final formatDecimal = NumberFormat("###.###", "id_ID");
  final _formKey = GlobalKey<FormState>();
  final _catatanTextEditingController = TextEditingController();
  late Future<DetailMag> futureDetailMag;
  bool visibilityPemeriksa = false;
  bool visibilityPengesah = false;
  bool catatanError = false;
  bool visibilityStatusMenu = false;
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
            final _postProses = await MGPAPI().postMutasiAntarGudang(
              noTransaksi: noTransaksi, 
              statusApproval: status, 
              catatan: catatan, 
              tglApproval: DateTime.now().toString(), 
              approvalBaseline: approvalBaseline,
            );
            if (_postProses == "berhasil") {
              setState(() {
                Get.off(const MutasiAntarGudangView());
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
    futureDetailMag = MGPAPI().fetchApprovalDetailMutasiAntarGudang(noMutasiAntarGudang: widget.noMutasiAntarGudang);
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
              child: FutureBuilder<DetailMag>(
                future: futureDetailMag,
                builder: (context, snapshot){
                  if (snapshot.hasData) {
                    var detailMutasiAntarGudang = snapshot.data;  
                    String status = detailMutasiAntarGudang!.data!.behavior.toString();
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
                        SizedBox(height: getProportionateScreenHeight(5)),
                        CardDetail(
                          child: ListTile(
                            subtitle: Column(
                              children: <Widget>[
                                CardFieldItemDate(
                                  label: "Tgl. Mutasi",
                                  date: detailMutasiAntarGudang.data!.detail!.tglMutasiAntarGudang,
                                  flexLeftRow: 12,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5)),
                                CardFieldItemText(
                                  label: "No. Mutasi",
                                  contentData: detailMutasiAntarGudang.data!.detail!.noMutasiAntarGudang,
                                  flexLeftRow: 12,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5)),
                                CardFieldItemText(
                                  label: "Gudang Asal",
                                  contentData: detailMutasiAntarGudang.data!.detail!.namaGudangAsal,
                                  flexLeftRow: 12,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5)),
                                CardFieldItemText(
                                  label: "Gudang Tujuan",
                                  contentData: detailMutasiAntarGudang.data!.detail!.namaGudangTujuan,
                                  flexLeftRow: 12,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5)),
                                CardFieldItemRightRow(
                                  label: "Item Barang",
                                  rightRow: <Widget> [
                                    Padding(
                                      padding: EdgeInsets.only(left: getProportionateScreenWidth(0.0)),
                                      child: (detailMutasiAntarGudang.data!.detail!.namaItem != null)
                                      ? Text(
                                        detailMutasiAntarGudang.data!.detail!.kodeItem.toString()
                                        +" - "+
                                        detailMutasiAntarGudang.data!.detail!.namaItem.toString(),
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
                                  flexLeftRow: 12,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5)),
                                CardFieldItemRightRow(
                                  label: "Qty Mutasi",
                                  rightRow: <Widget> [
                                    Padding(
                                      padding: EdgeInsets.only(left: getProportionateScreenWidth(0.0)),
                                      child: (detailMutasiAntarGudang.data!.detail!.qtyMutasi != null)
                                      ? Text(
                                        formatDecimal.format(double.parse(detailMutasiAntarGudang.data!.detail!.qtyMutasi.toString())).toString()
                                        +" "+
                                        detailMutasiAntarGudang.data!.detail!.namaSatuan.toString(),
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
                                  flexLeftRow: 12,
                                  flexRightRow: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                        if (detailMutasiAntarGudang.data!.approval!.isNotEmpty)...[
                          CardExpansionDetail(
                            label: "Catatan Approval",
                            children: <Widget> [
                              ListView.separated(
                                separatorBuilder: (context, index) => SizedBox(
                                  height: getProportionateScreenHeight(10),
                                ),
                                itemCount: detailMutasiAntarGudang.data!.approval!.length,
                                itemBuilder: (context, index){
                                  return FieldCatatanApproval(
                                    index: index,
                                    statusApproval: detailMutasiAntarGudang.data!.approval![index]!.statusApproval,
                                    namaKaryawan: detailMutasiAntarGudang.data!.approval![index]!.namaKaryawan,
                                    catatanApproval: detailMutasiAntarGudang.data!.approval![index]!.catatan,
                                    tglApproval: detailMutasiAntarGudang.data!.approval![index]!.tglApproval,
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
                          visible: visibilityStatusMenu,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10), horizontal: getProportionateScreenWidth(3)),
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
                              SizedBox(height: getProportionateScreenHeight(5)),
                              const FormErrors(errors: kCatatanError),
                              SizedBox(height: getProportionateScreenHeight(8)),
                            ],
                          )
                        ),
                        Visibility(
                          visible: visibilityStatusMenu,
                          child: SizedBox(height: getProportionateScreenHeight(10))
                        ),
                        Visibility(
                          visible: visibilityStatusMenu,
                          child: ButtonPemeriksa(
                            visibilityPemeriksa: visibilityPemeriksa,
                            onClickedRevise: () {
                              if (_formKey.currentState!.validate()) {
                                if (_catatanTextEditingController.text != "") {
                                  showAlertDialog(
                                    "REVISE Mutasi Antar Gudang",
                                    "REVISE",
                                    reviseButtonColor,
                                    detailMutasiAntarGudang.data!.detail!.noMutasiAntarGudang.toString(),
                                    "REV",
                                    _catatanTextEditingController.text,
                                    detailMutasiAntarGudang.data!.detail!.baseline.toString(),
                                  );
                                }
                              }
                            },
                            onClickedReject: () {
                              if (_formKey.currentState!.validate()) {
                                if (_catatanTextEditingController.text != "") {
                                   showAlertDialog(
                                    "REJECT Mutasi Antar Gudang",
                                    "REJECT",
                                    rejectButtonColor,
                                    detailMutasiAntarGudang.data!.detail!.noMutasiAntarGudang.toString(),
                                    "REJ",
                                    _catatanTextEditingController.text,
                                    detailMutasiAntarGudang.data!.detail!.baseline.toString(),
                                  );
                                }
                              }
                            },
                            onClickedVerify: () {
                              if (_formKey.currentState!.validate()) {
                                if (_catatanTextEditingController.text != "") {
                                  showAlertDialog(
                                    "VERIFY Mutasi Antar Gudang",
                                    "VERIFY",
                                    verifyButtonColor,
                                    detailMutasiAntarGudang.data!.detail!.noMutasiAntarGudang.toString(),
                                    "VER",
                                    _catatanTextEditingController.text,
                                    detailMutasiAntarGudang.data!.detail!.baseline.toString(),
                                  );
                                }
                              }
                            }, isLoading: isLoading,
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
                                    "REJECT Mutasi Antar Gudang",
                                    "REJECT",
                                    rejectButtonColor,
                                    detailMutasiAntarGudang.data!.detail!.noMutasiAntarGudang.toString(),
                                    "REJ",
                                    _catatanTextEditingController.text,
                                    detailMutasiAntarGudang.data!.detail!.baseline.toString(),
                                  );
                                }
                              }
                            },
                            onClickedApprove: () {
                              if (_formKey.currentState!.validate()) {
                                if (_catatanTextEditingController.text != "") {
                                  showAlertDialog(
                                    "APPROVE Mutasi Antar Gudang",
                                    "APPROVE",
                                    verifyButtonColor,
                                    detailMutasiAntarGudang.data!.detail!.noMutasiAntarGudang.toString(),
                                    "APP",
                                    _catatanTextEditingController.text,
                                    detailMutasiAntarGudang.data!.detail!.baseline.toString(),
                                  );
                                }
                              }
                            }, isLoading: isLoading,
                          ),
                        ),
                        SizedBox(height: getProportionateScreenHeight(30)),
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