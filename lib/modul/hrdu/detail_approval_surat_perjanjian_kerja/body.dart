import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/model/hrdu/surat_perjanjian_kerja/detail_surat_perjanjian_kerja_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mgp_mobile_app/modul/hrdu/approval_surat_perjanjian_kerja/approval_surat_perjanjian_kerja.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_rab/analisa_single_rab/analisa_single_rab.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_surat_perjanjian_kerja/prelim_surat_perjanjian_kerja/prelim_surat_perjanjian_kerja.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/mgp_api_hrdu.dart';
import 'package:mgp_mobile_app/widget/component/alert_approval.dart';
import 'package:mgp_mobile_app/widget/component/button_pemeriksa.dart';
import 'package:mgp_mobile_app/widget/component/button_pengesah.dart';
import 'package:mgp_mobile_app/widget/component/card_detail.dart';
import 'package:mgp_mobile_app/widget/component/card_expansion_detail.dart';
import 'package:mgp_mobile_app/widget/component/card_expansion_detail_prelim_text.dart';
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
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class Body extends StatefulWidget {
  final String noSpk;
  final String baseline;
  final String statusMenu;
  const Body({
    Key? key,
    required this.noSpk,
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
  late List subTotalHargaSuratPerjanjianKerja = [];
  late String grandTotalHarga;
  late String grandTotalPrelim;
  late String diskonHarga;
  late String totalSetelahDiskon;
  late String ppnHarga;
  late String totalSetelahPpn;
  late String subtotalPerlimm;
  late String uangMukaHarga;
  late String totalUangMukaHarga;
  final _formKey = GlobalKey<FormState>();
  final _catatanTextEditingController = TextEditingController();
  late Future<DetailRegspk> futureDetailRegspk;
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
            final _postProses = await MGPAPI().postSPK(
              noTransaksi: noTransaksi,
              statusApproval: status,
              catatan: catatan,
              tglApproval: DateTime.now().toString(),
              approvalBaseline: approvalBaseline,
            );
            if (_postProses == "berhasil") {
              Get.offAll(const SuratPerjanjianKerjaView());
              Navigator.of(Get.overlayContext!, rootNavigator: true).pop();
            }
          },
        );
      }
    );
  }

  @override
  void initState() {
    futureDetailRegspk = MGPAPI().fetchApprovalDetailSPK(noSpk: widget.noSpk, baseline: widget.baseline);
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
              child: FutureBuilder<DetailRegspk>(
                future: futureDetailRegspk,
                builder: (context, snapshot) {
                  var detailSuratPerjanjianKerja = snapshot.data;
                  if (snapshot.hasData) {
                    String status = detailSuratPerjanjianKerja!.data!.behavior.toString();
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
                    double valuePPN = double.parse(detailSuratPerjanjianKerja.data!.detail!.ppn.toString());
                    double valueDiskon = double.parse(detailSuratPerjanjianKerja.data!.detail!.diskon.toString());
                    double uangMuka = double.parse(detailSuratPerjanjianKerja.data!.detail!.uangMuka.toString());
                    num totalHargaPenawaran = 0;
                    num totalPrelim = 0;
                    num subTotalPerlim = 0;
                    if (detailSuratPerjanjianKerja.data!.detail!.detailBarangJadi!.isNotEmpty) {
                      for (var i = 0; i < detailSuratPerjanjianKerja.data!.detail!.detailBarangJadi!.length; i++) {
                        num subTotal = (double.parse(detailSuratPerjanjianKerja.data!.detail!.detailBarangJadi![i].rounded.toString()) * double.parse(detailSuratPerjanjianKerja.data!.detail!.detailBarangJadi![i].qtyRab.toString()));
                        totalHargaPenawaran = totalHargaPenawaran + subTotal;
                        subTotalHargaSuratPerjanjianKerja.add(subTotal.toString());
                      }
                    }
                    if (detailSuratPerjanjianKerja.data!.detail!.detailPrelim!.isNotEmpty) {
                      for (var i = 0; i < detailSuratPerjanjianKerja.data!.detail!.detailPrelim!.length; i++) {
                        subTotalPerlim = double.parse(detailSuratPerjanjianKerja.data!.detail!.detailPrelim![i].qtyAnalisa.toString())
                        * double.parse(detailSuratPerjanjianKerja.data!.detail!.detailPrelim![i].unitPrice.toString())
                        * double.parse(detailSuratPerjanjianKerja.data!.detail!.detailPrelim![i].konstanta.toString());
                        totalPrelim = totalPrelim + subTotalPerlim;
                      }
                    }
                    num grandTotalPenawaran = totalHargaPenawaran + totalPrelim;
                    grandTotalHarga = grandTotalPenawaran.toString();
                    num diskonTotal = (grandTotalPenawaran * valueDiskon)/100;
                    num totalDiskon = (grandTotalPenawaran - diskonTotal);
                    num ppnTotal = (totalDiskon * valuePPN)/100;
                    num totalPPN = (totalDiskon + ppnTotal);
                    num uangMukaTotal = (totalPPN * uangMuka)/100;
                    num totalUangMukaTotal = (totalPPN - uangMukaTotal);
                    diskonHarga = diskonTotal.toString();
                    totalSetelahDiskon = totalDiskon.toString();
                    ppnHarga = ppnTotal.toString();
                    totalSetelahPpn = totalPPN.toString();
                    uangMukaHarga = uangMukaTotal.toString();
                    totalUangMukaHarga = totalUangMukaTotal.toString();
                    subtotalPerlimm = subTotalPerlim.toString();
                    grandTotalPrelim = totalPrelim.toString();
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
                                  label: "Tgl. Penawaran",
                                  date: detailSuratPerjanjianKerja.data!.detail!.tglPenawaran,
                                  flexLeftRow: 8,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5).h),
                                CardFieldItemText(
                                  label: "No. Penawaran",
                                  contentData: detailSuratPerjanjianKerja.data!.detail!.noPenawaran,
                                  flexLeftRow: 8,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5).h),
                                CardFieldItemText(
                                  label: "Customer",
                                  contentData: detailSuratPerjanjianKerja.data!.detail!.namaCustomer,
                                  flexLeftRow: 8,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5).h),
                                CardFieldItemText(
                                  label: "ATT",
                                  contentData: detailSuratPerjanjianKerja.data!.detail!.att,
                                  flexLeftRow: 8,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5).h),
                                CardFieldItemDate(
                                  label: "Tgl. Selesai",
                                  date: detailSuratPerjanjianKerja.data!.detail!.tglSelesai,
                                  flexLeftRow: 8,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5).h),
                                CardFieldItemDate(
                                  label: "Tgl. SPK",
                                  date: detailSuratPerjanjianKerja.data!.detail!.tglSpk,
                                  flexLeftRow: 8,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5).h),
                                CardFieldItemText(
                                  label: "No. SPK",
                                  contentData: detailSuratPerjanjianKerja.data!.detail!.noSpk,
                                  flexLeftRow: 8,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5).h),
                                CardFieldItemDate(
                                  label: "Tgl. Selesai SPK",
                                  date: detailSuratPerjanjianKerja.data!.detail!.tglSelesaiSpk,
                                  flexLeftRow: 8,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5).h),
                                CardFieldItemText(
                                  label: "Proyek",
                                  contentData: detailSuratPerjanjianKerja.data!.detail!.namaProyek,
                                  flexLeftRow: 8,
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
                                height: getProportionateScreenHeight(10).h,
                              ),
                              itemCount: detailSuratPerjanjianKerja.data!.detail!.detailBarangJadi!.length,
                              itemBuilder: (context, index){
                                return Padding(
                                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
                                  child: CardItemExpansionDetail(
                                    child: ListTile(
                                      contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0).w, vertical: getProportionateScreenHeight(10.0).h),
                                      title: HighlightItemName(
                                        child: Text(
                                          detailSuratPerjanjianKerja.data!.detail!.detailBarangJadi![index].kodeItem.toString(),
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
                                              label: "Barang Jadi",
                                              contentData: detailSuratPerjanjianKerja.data!.detail!.detailBarangJadi![index].namaItem,
                                              flexLeftRow: 12,
                                              flexRightRow: 20,
                                            ),
                                            SizedBox(height: getProportionateScreenHeight(10).h),
                                            CardFieldItemRightRow(
                                              label: "Qty",
                                              rightRow: <Widget> [
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 0),
                                                  child: (detailSuratPerjanjianKerja.data!.detail!.detailBarangJadi![index].qtyRab != null)
                                                  ? Text(
                                                    formatDecimal.format(
                                                      double.parse(detailSuratPerjanjianKerja.data!.detail!.detailBarangJadi![index].qtyRab.toString()
                                                      )
                                                    ).toString()
                                                    +" "+
                                                    detailSuratPerjanjianKerja.data!.detail!.detailBarangJadi![index].namaSatuan.toString(),
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
                                            SizedBox(height: getProportionateScreenHeight(10).h),
                                            CardFieldItemFormatCurrency(
                                              label: "Harga Satuan",
                                              contentData: detailSuratPerjanjianKerja.data!.detail!.detailBarangJadi![index].rounded,
                                              flexLeftRow: 12,
                                              flexRightRow: 20,
                                            ),
                                            SizedBox(height: getProportionateScreenHeight(10).h),
                                            CardFieldItemFormatCurrency(
                                              label: "Sub Total",
                                              contentData: subTotalHargaSuratPerjanjianKerja[index],
                                              flexLeftRow: 12,
                                              flexRightRow: 20,
                                            ),
                                          ],
                                        ),
                                      ),
                                      onTap : () {
                                        Get.to(
                                          DetailAnalisaSingleRABView(
                                            idRabDetail: detailSuratPerjanjianKerja.data!.detail!.detailBarangJadi![index].idRabDetail.toString(),
                                            title: "Analisa Barang Jadi SPK",
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
                            SizedBox(height: getProportionateScreenHeight(10).h),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
                              child: CardItemExpansionDetail(
                                child: ListTile(
                                  contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0).w, vertical: getProportionateScreenHeight(10.0).h),
                                  title: Text(
                                    "PRELIM",
                                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14.sp),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  subtitle: Padding(
                                    padding: EdgeInsets.only(top: getProportionateScreenHeight(15).h),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        const CardExpansionDetailPrelim(),
                                        SizedBox(height: getProportionateScreenHeight(10).h),
                                        CardFieldItemFormatCurrency(
                                          label: "Harga Satuan",
                                          contentData: subtotalPerlimm,
                                          flexLeftRow: 12,
                                          flexRightRow: 20,
                                        ),
                                        SizedBox(height: getProportionateScreenHeight(10).h),
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
                                    Get.to(AnalisaPrelimSuratPerjanjianKerjaView(detailRegspk: futureDetailRegspk, grandTotalPrelim: grandTotalPrelim));
                                  },
                                ),
                              ),
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
                                        labelValue: valueDiskon.toString(),
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
                                        labelValue: detailSuratPerjanjianKerja.data!.detail!.ppn,
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
                                      SizedBox(height: getProportionateScreenHeight(5).h),
                                      CardFieldItemPercent(
                                        label: "Uang Muka",
                                        labelValue: detailSuratPerjanjianKerja.data!.detail!.uangMuka,
                                        total: uangMukaHarga,
                                        flexLeftRow: 15,
                                        flexRightRow: 20,
                                      ),
                                      SizedBox(height: getProportionateScreenHeight(5).h),
                                      CardFieldItemTotal(
                                        label: "Sisa",
                                        total: totalUangMukaHarga,
                                        flexLeftRow: 15,
                                        flexRightRow: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: getProportionateScreenHeight(10).h),
                          ],
                        ),
                        if (detailSuratPerjanjianKerja.data!.approval.isNotEmpty)...[
                          CardExpansionDetail(
                            label: "Catatan Approval",
                            children: <Widget> [
                              ListView.separated(
                                separatorBuilder: (context, index) => SizedBox(
                                  height: getProportionateScreenHeight(10).h,
                                ),
                                itemCount: detailSuratPerjanjianKerja.data!.approval.length,
                                itemBuilder: (context, index){
                                  return FieldCatatanApproval(
                                    index: index,
                                    statusApproval: detailSuratPerjanjianKerja.data!.approval[index].statusApproval,
                                    namaKaryawan: detailSuratPerjanjianKerja.data!.approval[index].namaKaryawan,
                                    catatanApproval: detailSuratPerjanjianKerja.data!.approval[index].catatan,
                                    tglApproval: detailSuratPerjanjianKerja.data!.approval[index].tglApproval,
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
                        SizedBox(height: getProportionateScreenHeight(10).h),
                        Visibility(
                          visible: visibilityStatusMenu,
                          child: ButtonPemeriksa(
                            visibilityPemeriksa: visibilityPemeriksa,
                            onClickedRevise: () {
                              if (_formKey.currentState!.validate()) {
                                if (_catatanTextEditingController.text != "") {
                                  showAlertDialog(
                                    "REVISE Surat Perjanjian Kerja",
                                    "REVISE",
                                    reviseButtonColor,
                                    detailSuratPerjanjianKerja.data!.detail!.noSpk.toString(),
                                    "REV",
                                    _catatanTextEditingController.text,
                                    detailSuratPerjanjianKerja.data!.detail!.baseline.toString(),
                                  );
                                }
                              }
                            },
                            onClickedReject: () {
                              if (_formKey.currentState!.validate()) {
                                if (_catatanTextEditingController.text != "") {
                                  showAlertDialog(
                                    "REJECT Surat Perjanjian Kerja",
                                    "REJECT",
                                    rejectButtonColor,
                                    detailSuratPerjanjianKerja.data!.detail!.noSpk.toString(),
                                    "REJ",
                                    _catatanTextEditingController.text,
                                    detailSuratPerjanjianKerja.data!.detail!.baseline.toString(),
                                  );
                                }
                              }
                            },
                            onClickedVerify: () {
                              if (_formKey.currentState!.validate()) {
                                if (_catatanTextEditingController.text != "") {
                                  showAlertDialog(
                                    "VERIFY Surat Perjanjian Kerja",
                                    "VERIFY",
                                    verifyButtonColor,
                                    detailSuratPerjanjianKerja.data!.detail!.noSpk.toString(),
                                    "VER",
                                    _catatanTextEditingController.text,
                                    detailSuratPerjanjianKerja.data!.detail!.baseline.toString(),
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
                                    "REJECT Surat Perjanjian Kerja",
                                    "REJECT",
                                    rejectButtonColor,
                                    detailSuratPerjanjianKerja.data!.detail!.noSpk.toString(),
                                    "REJ",
                                    _catatanTextEditingController.text,
                                    detailSuratPerjanjianKerja.data!.detail!.baseline.toString(),
                                  );
                                }
                              }
                            },
                            onClickedApprove: () {
                              if (_formKey.currentState!.validate()) {
                                if (_catatanTextEditingController.text != "") {
                                  showAlertDialog(
                                    "APPROVE Surat Perjanjian Kerja",
                                    "APPROVE",
                                    verifyButtonColor,
                                    detailSuratPerjanjianKerja.data!.detail!.noSpk.toString(),
                                    "APP",
                                    _catatanTextEditingController.text,
                                    detailSuratPerjanjianKerja.data!.detail!.baseline.toString(),
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