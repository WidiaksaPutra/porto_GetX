import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/model/hrdu/peluang/detail_peluang_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mgp_mobile_app/modul/hrdu/approval_peluang/approval_peluang.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_peluang/analisa_single_peluang/analisa_single_peluang.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/mgp_api_hrdu.dart';
import 'package:mgp_mobile_app/widget/component/alert_approval.dart';
import 'package:mgp_mobile_app/widget/component/button_pemeriksa.dart';
import 'package:mgp_mobile_app/widget/component/button_pengesah.dart';
import 'package:mgp_mobile_app/widget/component/card_detail.dart';
import 'package:mgp_mobile_app/widget/component/card_expansion_detail.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_date.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_icon.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_right_row.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_text.dart';
import 'package:mgp_mobile_app/widget/component/card_item_expansion_detail.dart';
import 'package:mgp_mobile_app/widget/component/catatan_approval.dart';
import 'package:mgp_mobile_app/widget/component/error_form.dart';
import 'package:mgp_mobile_app/widget/component/field_catatan_approval.dart';
import 'package:mgp_mobile_app/widget/component/highlight_item_name.dart';
import 'package:mgp_mobile_app/widget/theme/constants.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class Body extends StatefulWidget {
  final String noPeluang;
  final String statusMenu;
  const Body({
    Key? key,
    required this.noPeluang,
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
  final formatDecimal = NumberFormat("###.######", "id_ID");
  final decimalFormat = NumberFormat("###", "id_ID");
  final _catatanTextEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late Future<DetailRegplg> futureDetailRegplg;
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
            final _postProses = await MGPAPI().postPeluang(
              noTransaksi: noTransaksi,
              statusApproval: status,
              catatan: catatan,
              tglApproval: DateTime.now().toString(),
            );
            if (_postProses == "berhasil") {
              Get.offAll(const PeluangView());
              Navigator.of(Get.overlayContext!, rootNavigator: true).pop();
            }
          },
        );
      }
    );
  }

  @override
  void initState() {
    futureDetailRegplg = MGPAPI().fetchApprovalDetailPeluang(noPeluang: widget.noPeluang);
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
              child: FutureBuilder(
                future: futureDetailRegplg,
                builder: (BuildContext context, AsyncSnapshot<DetailRegplg> snapshot) {
                  if (snapshot.hasData) {
                    var detailPeluang = snapshot.data;
                    String status = detailPeluang!.data!.behavior.toString();
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
                                  label: "Tgl. Peluang",
                                  date: detailPeluang.data!.detail!.tglPeluang,
                                  flexLeftRow: 10,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5).h),
                                CardFieldItemText(
                                  label: "No. Peluang",
                                  contentData: detailPeluang.data!.detail!.noPeluang,
                                  flexLeftRow: 10,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5).h),
                                CardFieldItemDate(
                                  label: "Target Penawaran",
                                  date: detailPeluang.data!.detail!.tglSelesai,
                                  flexLeftRow: 10,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5).h),
                                CardFieldItemDate(
                                  label: "Realisasi Penawaran",
                                  date: detailPeluang.data!.detail!.realisasiPenawaran,
                                  flexLeftRow: 10,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5).h),
                                CardFieldItemText(
                                  label: "Peringkat Peluang",
                                  contentData: detailPeluang.data!.detail!.namaPeringkatPeluang,
                                  flexLeftRow: 10,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5).h),
                                CardFieldItemText(
                                  label: "Customer",
                                  contentData: detailPeluang.data!.detail!.namaCustomer,
                                  flexLeftRow: 10,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5).h),
                                CardFieldItemText(
                                  label: "Proyek",
                                  contentData: detailPeluang.data!.detail!.namaProyek,
                                  flexLeftRow: 10,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5).h),
                                CardFieldItemText(
                                  label: "ATT",
                                  contentData: detailPeluang.data!.detail!.att,
                                  flexLeftRow: 10,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5).h),
                                CardFieldItemText(
                                  label: "Schedule Kebutuhan Proyek (Total Hari)",
                                  contentData: detailPeluang.data!.detail!.scheduleKebutuhanProyek,
                                  flexLeftRow: 10,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5).h),
                                CardFieldItemIcon(
                                  label: "Instalasi",
                                  status: detailPeluang.data!.detail!.instalasi,
                                  flexLeftRow: 10,
                                  flexRightRow: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                        CardExpansionDetail(
                          label: "Keterangan Pengiriman",
                          children: <Widget> [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
                              child: CardItemExpansionDetail(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10).h, horizontal: getProportionateScreenWidth(10).w),
                                  child: (detailPeluang.data!.detail!.keteranganPengiriman != null)
                                  ? Text(detailPeluang.data!.detail!.keteranganPengiriman.toString(),
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
                              ),
                            ),
                            SizedBox(height: getProportionateScreenHeight(10).h)
                          ],
                        ),
                        CardExpansionDetail(
                          label: "Lokasi Pengiriman",
                          children: <Widget> [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
                              child: CardItemExpansionDetail(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w, vertical: getProportionateScreenHeight(10).h),
                                  child: (detailPeluang.data!.detail!.lokasiPengiriman != null)
                                  ? Text(detailPeluang.data!.detail!.lokasiPengiriman.toString(),
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
                              ),
                            ),
                            SizedBox(height: getProportionateScreenHeight(10).h),
                          ],
                        ),
                        CardExpansionDetail(
                          label: "Informasi Lainnya",
                          children: <Widget> [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
                              child: CardItemExpansionDetail(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w, vertical: getProportionateScreenHeight(10).h),
                                  child: (detailPeluang.data!.detail!.lainLain != null)
                                  ? Html(
                                    data: detailPeluang.data!.detail!.lainLain
                                  )
                                  :  Text("-",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.sp
                                    ),
                                    textAlign: TextAlign.left,
                                  )
                                ),
                              ),
                            ),
                            SizedBox(height: getProportionateScreenHeight(10).h),
                          ],
                        ),
                        if (detailPeluang.data!.detail!.detail!.isNotEmpty)...[
                          CardExpansionDetail(
                            label: "Item Barang Jadi",
                            children: <Widget> [
                              ListView.separated(
                                separatorBuilder: (context, index) => SizedBox(
                                  height: getProportionateScreenHeight(10).h,
                                ),
                                itemCount: detailPeluang.data!.detail!.detail!.length,
                                itemBuilder: (context, index){
                                  return Padding(
                                    padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
                                    child: CardItemExpansionDetail(
                                      child: ListTile(
                                        contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0).w, vertical: getProportionateScreenHeight(10.0).h),
                                        title: HighlightItemName(
                                          child: Text(
                                            detailPeluang.data!.detail!.detail![index]!.kodeItem.toString(),
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
                                                contentData: detailPeluang.data!.detail!.detail![index]!.namaItem,
                                                flexLeftRow: 12,
                                                flexRightRow: 20,
                                              ),
                                              SizedBox(height: getProportionateScreenHeight(10).h),
                                              CardFieldItemText(
                                                label: "Jenis Barang Jadi",
                                                contentData: detailPeluang.data!.detail!.detail![index]!.namaJenis,
                                                flexLeftRow: 12,
                                                flexRightRow: 20,
                                              ),
                                              SizedBox(height: getProportionateScreenHeight(10).h),
                                              CardFieldItemRightRow(
                                                label: "Qty",
                                                rightRow: <Widget> [
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 0),
                                                    child: Text(
                                                      formatDecimal.format(
                                                        double.parse(detailPeluang.data!.detail!.detail![index]!.qty.toString()
                                                        )
                                                      ).toString()
                                                      +" "+
                                                      detailPeluang.data!.detail!.detail![index]!.namaSatuanJual.toString(),
                                                      style: const TextStyle(
                                                        color: Colors.black,
                                                      ),
                                                      textAlign: TextAlign.left,
                                                    ),
                                                  ),
                                                ],
                                                flexLeftRow: 12,
                                                flexRightRow: 20,
                                              ),
                                            ],
                                          ),
                                        ),
                                        onTap: () {
                                          Get.to(DetailAnalisaSinglePeluangView(idBarangJadi: detailPeluang.data!.detail!.detail![index]!.idItemBuaso.toString()));
                                        }
                                      ),
                                    ),
                                  );
                                },
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                              ),
                              SizedBox(height: getProportionateScreenHeight(10).h),
                            ]
                          ),
                        ],
                        if (detailPeluang.data!.approval!.isNotEmpty)...[
                          CardExpansionDetail(
                            label: "Catatan Approval",
                            children: <Widget> [
                              ListView.separated(
                                separatorBuilder: (context, index) => SizedBox(
                                  height: getProportionateScreenHeight(10).h,
                                ),
                                itemCount: detailPeluang.data!.approval!.length,
                                itemBuilder: (context, index){
                                  return FieldCatatanApproval(
                                    index: index,
                                    statusApproval: detailPeluang.data!.approval![index]!.statusApproval,
                                    namaKaryawan: detailPeluang.data!.approval![index]!.namaKaryawan,
                                    catatanApproval: detailPeluang.data!.approval![index]!.catatan,
                                    tglApproval: detailPeluang.data!.approval![index]!.tglApproval,
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
                                    "REVISE Peluang",
                                    "REVISE",
                                    reviseButtonColor,
                                    detailPeluang.data!.detail!.noPeluang.toString(),
                                    "REV",
                                    _catatanTextEditingController.text,
                                  );
                                }
                              }
                            },
                            onClickedReject: () {
                              if (_formKey.currentState!.validate()) {
                                if (_catatanTextEditingController.text != "") {
                                  showAlertDialog(
                                    "REJECT Peluang",
                                    "REJECT",
                                    rejectButtonColor,
                                    detailPeluang.data!.detail!.noPeluang.toString(),
                                    "REJ",
                                    _catatanTextEditingController.text,
                                  );
                                }
                              }
                            },
                            onClickedVerify: () {
                              if (_formKey.currentState!.validate()) {
                                if (_catatanTextEditingController.text != "") {
                                  showAlertDialog(
                                    "VERIFY Peluang",
                                    "VERIFY",
                                    verifyButtonColor,
                                    detailPeluang.data!.detail!.noPeluang.toString(),
                                    "VER",
                                    _catatanTextEditingController.text,
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
                                    "REJECT Peluang",
                                    "REJECT",
                                    rejectButtonColor,
                                    detailPeluang.data!.detail!.noPeluang.toString(),
                                    "REJ",
                                    _catatanTextEditingController.text,
                                  );
                                }
                              }
                            },
                            onClickedApprove: () {
                              if (_formKey.currentState!.validate()) {
                                if (_catatanTextEditingController.text != "") {
                                  showAlertDialog(
                                    "APPROVE Peluang",
                                    "APPROVE",
                                    verifyButtonColor,
                                    detailPeluang.data!.detail!.noPeluang.toString(),
                                    "APP",
                                    _catatanTextEditingController.text,
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