
import 'package:get/get.dart';
import 'package:mgp_mobile_app/model/hrdu/rab/detail_rab_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mgp_mobile_app/modul/hrdu/approval_rab/approval_rab.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_rab/analisa_single_rab/analisa_single_rab.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_rab/prelim_rab/prelim_rab.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/mgp_api_hrdu.dart';
import 'package:mgp_mobile_app/widget/component/alert_approval.dart';
import 'package:mgp_mobile_app/widget/component/button_pemeriksa.dart';
import 'package:mgp_mobile_app/widget/component/button_pengesah.dart';
import 'package:mgp_mobile_app/widget/component/card_detail.dart';
import 'package:mgp_mobile_app/widget/component/card_expansion_detail.dart';
import 'package:mgp_mobile_app/widget/component/card_expansion_detail_prelim_text.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_date.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_format_currency.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_percent_list.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_right_row.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_text.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_total.dart';
import 'package:mgp_mobile_app/widget/component/card_item_expansion_detail.dart';
import 'package:mgp_mobile_app/widget/component/catatan_approval.dart';
import 'package:mgp_mobile_app/widget/component/error_form.dart';
import 'package:mgp_mobile_app/widget/component/field_catatan_approval.dart';
import 'package:mgp_mobile_app/widget/component/highlight_item_name.dart';
import 'package:mgp_mobile_app/widget/theme/constants.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class Body extends StatefulWidget {
  final String noRab;
  final String baseline;
  final String statusMenu;
  const Body({
    Key? key,
    required this.noRab,
    required this.baseline,
    required this.statusMenu,
  }) : super(key: key);

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
  final decimalFormat = NumberFormat("###", "id_ID");
  late List subTotalHargaRAB = [];
  late List hargaProfitBarangJadi = [];
  late String grandTotalPrelim;
  late String grandTotalHargaRAB;
  final _formKey = GlobalKey<FormState>();
  final _catatanTextEditingController = TextEditingController();
  late Future<DetailRegrab> futureDetailRegrab;
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
            final _postProses = await MGPAPI().postRAB(
              noTransaksi: noTransaksi,
              statusApproval: status,
              catatan: catatan,
              tglApproval: DateTime.now().toString(),
              approvalBaseline: approvalBaseline,
            );
            if (_postProses == "berhasil") {
              setState(() {
                Get.off(const RencanaAnggaranBiayaView());
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
    futureDetailRegrab = MGPAPI().fetchApprovalDetailRencanaAnggaranBiaya(noRab: widget.noRab, baseline: widget.baseline);
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
              child: FutureBuilder<DetailRegrab>(
                future: futureDetailRegrab,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var detailRAB = snapshot.data;
                    String status = detailRAB!.data!.behavior.toString();
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
                    num totalHargaRAB = 0;
                    num totalPrelim = 0;
                    if (detailRAB.data!.detail!.detailBarangJadi!.isNotEmpty) {
                      for (var i = 0; i < detailRAB.data!.detail!.detailBarangJadi!.length; i++) {
                        num profit = (double.parse(detailRAB.data!.detail!.detailBarangJadi![i].hargaSatuanRab.toString()) * double.parse(detailRAB.data!.detail!.profit.toString()))/100;
                        num hargaProfit = double.parse(detailRAB.data!.detail!.detailBarangJadi![i].hargaSatuanRab.toString()) + profit;
                        num subTotal = (double.parse(detailRAB.data!.detail!.detailBarangJadi![i].rounded.toString()) * double.parse(detailRAB.data!.detail!.detailBarangJadi![i].qtyRab.toString()));
                        totalHargaRAB = totalHargaRAB + subTotal;
                        subTotalHargaRAB.add(subTotal.toString());
                        hargaProfitBarangJadi.add(hargaProfit.toString());
                      }
                    }
                    if (detailRAB.data!.detail!.detailPrelim!.isNotEmpty) {
                      for (var i = 0; i < detailRAB.data!.detail!.detailPrelim!.length; i++) {
                        num subTotal = double.parse(detailRAB.data!.detail!.detailPrelim![i].qtyAnalisa.toString())
                        * double.parse(detailRAB.data!.detail!.detailPrelim![i].unitPrice.toString())
                        * double.parse(detailRAB.data!.detail!.detailPrelim![i].konstanta.toString());
                        totalPrelim = totalPrelim + subTotal;
                      }
                    }
                    num grandTotalRAB = totalHargaRAB + totalPrelim;
                    grandTotalPrelim = totalPrelim.toString();
                    grandTotalHargaRAB = grandTotalRAB.toString();
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
                                  label: "Tgl. RAE",
                                  date: detailRAB.data!.detail!.tglRae,
                                  flexLeftRow: 10,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5)),
                                CardFieldItemText(
                                  label: "No. RAE",
                                  contentData: detailRAB.data!.detail!.noRae,
                                  flexLeftRow: 10,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5)),
                                CardFieldItemText(
                                  label: "Proyek",
                                  contentData: detailRAB.data!.detail!.namaProyek,
                                  flexLeftRow: 10,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5)),
                                CardFieldItemText(
                                  label: "Customer",
                                  contentData: detailRAB.data!.detail!.namaCustomer,
                                  flexLeftRow: 10,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5)),
                                CardFieldItemText(
                                  label: "ATT",
                                  contentData: detailRAB.data!.detail!.att,
                                  flexLeftRow: 10,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5)),
                                CardFieldItemDate(
                                  label: "Tgl. Selesai",
                                  date: detailRAB.data!.detail!.tglSelesai,
                                  flexLeftRow: 10,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5)),
                                CardFieldItemDate(
                                  label: "Tgl. RAB",
                                  date: detailRAB.data!.detail!.tglRab,
                                  flexLeftRow: 10,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5)),
                                CardFieldItemText(
                                  label: "No. RAB",
                                  contentData: detailRAB.data!.detail!.noRab,
                                  flexLeftRow: 10,
                                  flexRightRow: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                        CardExpansionDetail(
                          label: "Item Barang Jadi",
                          children: <Widget> [
                            ListView.separated(
                              separatorBuilder: (context, index) => SizedBox(
                                height: getProportionateScreenHeight(10),
                              ),
                              itemCount: detailRAB.data!.detail!.detailBarangJadi!.length,
                              itemBuilder: (context, index){
                                return Padding(
                                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                                  child: CardItemExpansionDetail(
                                    child: ListTile(
                                      contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0), vertical: getProportionateScreenHeight(10.0)),
                                      title: HighlightItemName(
                                        child: Text(
                                          detailRAB.data!.detail!.detailBarangJadi![index].kodeItem.toString(),
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
                                              label: "Barang Jadi",
                                              contentData: detailRAB.data!.detail!.detailBarangJadi![index].namaItem,
                                              flexLeftRow: 12,
                                              flexRightRow: 20,
                                            ),
                                            SizedBox(height: getProportionateScreenHeight(10)),
                                            CardFieldItemRightRow(
                                              label: "Qty",
                                              rightRow: <Widget> [
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 0),
                                                  child: (detailRAB.data!.detail!.detailBarangJadi![index].qtyRab != null)
                                                  ? Text(
                                                    formatDecimal.format(
                                                      double.parse(detailRAB.data!.detail!.detailBarangJadi![index].qtyRab.toString()
                                                      )
                                                    ).toString()
                                                    +" "+
                                                    detailRAB.data!.detail!.detailBarangJadi![index].namaSatuan.toString(),
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
                                            SizedBox(height: getProportionateScreenHeight(10)),
                                            CardFieldItemFormatCurrency(
                                              label: "Unit Cost",
                                              contentData: detailRAB.data!.detail!.detailBarangJadi![index].hargaSatuanRab,
                                              flexLeftRow: 12,
                                              flexRightRow: 20,
                                            ),
                                            SizedBox(height: getProportionateScreenHeight(10)),
                                            CardFieldItemPercentList(
                                              label: "Profit",
                                              labelValue: detailRAB.data!.detail!.profit,
                                              total: hargaProfitBarangJadi[index],
                                              flexLeftRow: 12,
                                              flexRightRow: 20,
                                            ),
                                            SizedBox(height: getProportionateScreenHeight(10)),
                                            CardFieldItemFormatCurrency(
                                              label: "Rounded",
                                              contentData: detailRAB.data!.detail!.detailBarangJadi![index].rounded,
                                              flexLeftRow: 12,
                                              flexRightRow: 20,
                                            ),
                                            SizedBox(height: getProportionateScreenHeight(10)),
                                            CardFieldItemFormatCurrency(
                                              label: "Sub Total",
                                              contentData: subTotalHargaRAB[index],
                                              flexLeftRow: 12,
                                              flexRightRow: 20,
                                            ),
                                          ],
                                        ),
                                      ),
                                      onTap : () {
                                        Get.to(
                                          DetailAnalisaSingleRABView(
                                            idRabDetail: detailRAB.data!.detail!.detailBarangJadi![index].idRabDetail.toString(),
                                            title: "Analisa Barang Jadi RAB",
                                          )
                                        );
                                      },
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
                                  contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0), vertical: getProportionateScreenHeight(10.0)),
                                  title: Text(
                                    "PRELIM",
                                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14,),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  subtitle: Padding(
                                    padding: EdgeInsets.only(top: getProportionateScreenHeight(15)),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        const CardExpansionDetailPrelim(),
                                        SizedBox(height: getProportionateScreenHeight(10)),
                                        CardFieldItemFormatCurrency(
                                          label: "Harga Satuan",
                                          contentData: grandTotalPrelim,
                                          flexLeftRow: 12,
                                          flexRightRow: 20,
                                        ),
                                        SizedBox(height: getProportionateScreenHeight(10)),
                                        CardFieldItemFormatCurrency(
                                          label: "Sub Total",
                                          contentData: grandTotalPrelim,
                                          flexLeftRow: 12,
                                          flexRightRow: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                  onTap : () {
                                    Get.to(AnalisaPrelimRencanaAnggaranBiayaView(detailRegrab: futureDetailRegrab, grandTotalPrelim: grandTotalPrelim));
                                  },
                                ),
                              ),
                            ),
                            SizedBox(height: getProportionateScreenHeight(10)),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                              child: CardItemExpansionDetail(
                                child: ListTile(
                                  title: Column(
                                    children: <Widget> [
                                      CardFieldItemTotal(
                                        label: "Grand Total",
                                        total: grandTotalHargaRAB,
                                        flexLeftRow: 15,
                                        flexRightRow: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: getProportionateScreenHeight(10)),
                          ],
                        ),
                        if (detailRAB.data!.approval.isNotEmpty)...[
                          CardExpansionDetail(
                            label: "Catatan Approval",
                            children: <Widget> [
                              ListView.separated(
                                separatorBuilder: (context, index) => SizedBox(
                                  height: getProportionateScreenHeight(10),
                                ),
                                itemCount: detailRAB.data!.approval.length,
                                itemBuilder: (context, index){
                                  return FieldCatatanApproval(
                                    index: index,
                                    statusApproval: detailRAB.data!.approval[index].statusApproval,
                                    namaKaryawan: detailRAB.data!.approval[index].namaKaryawan,
                                    catatanApproval: detailRAB.data!.approval[index].catatan,
                                    tglApproval: detailRAB.data!.approval[index].tglApproval,
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
                                    "REVISE RAB",
                                    "REVISE",
                                    reviseButtonColor,
                                    detailRAB.data!.detail!.noRab.toString(),
                                    "REV",
                                    _catatanTextEditingController.text,
                                    detailRAB.data!.detail!.baseline.toString(),
                                  );
                                }
                              }
                            },
                            onClickedReject: () {
                              if (_formKey.currentState!.validate()) {
                                if (_catatanTextEditingController.text != "") {
                                  showAlertDialog(
                                    "REJECT RAB",
                                    "REJECT",
                                    rejectButtonColor,
                                    detailRAB.data!.detail!.noRab.toString(),
                                    "REJ",
                                    _catatanTextEditingController.text,
                                    detailRAB.data!.detail!.baseline.toString(),
                                  );
                                }
                              }
                            },
                            onClickedVerify: () {
                              if (_formKey.currentState!.validate()) {
                                if (_catatanTextEditingController.text != "") {
                                  showAlertDialog(
                                    "VERIFY RAB",
                                    "VERIFY",
                                    verifyButtonColor,
                                    detailRAB.data!.detail!.noRab.toString(),
                                    "VER",
                                    _catatanTextEditingController.text,
                                    detailRAB.data!.detail!.baseline.toString(),
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
                                    "REJECT RAB",
                                    "REJECT",
                                    rejectButtonColor,
                                    detailRAB.data!.detail!.noRab.toString(),
                                    "REJ",
                                    _catatanTextEditingController.text,
                                    detailRAB.data!.detail!.baseline.toString(),
                                  );
                                }
                              }
                            },
                            onClickedApprove: () {
                              if (_formKey.currentState!.validate()) {
                                if (_catatanTextEditingController.text != "") {
                                  showAlertDialog(
                                    "APPROVE RAB",
                                    "APPROVE",
                                    verifyButtonColor,
                                    detailRAB.data!.detail!.noRab.toString(),
                                    "APP",
                                    _catatanTextEditingController.text,
                                    detailRAB.data!.detail!.baseline.toString(),
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