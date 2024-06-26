import 'package:mgp_mobile_app/controller_getX/modul/hrdu/marketing/rae/rekapitulasi/getX_factory_supply.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/marketing/rae/rekapitulasi/getX_hardwood.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/marketing/rae/rekapitulasi/getX_plywood.dart';
import 'package:mgp_mobile_app/model/hrdu/rae/rekapitulasi.dart';
import 'package:mgp_mobile_app/modul/hrdu/approval_rae/approval_rae.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_rae/peluang_rae/analisa_single_peluang.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_rae/summary_biaya/summary_biaya_bahan_baku/summary_biaya_bahan_baku.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_rae/summary_biaya/summary_biaya_bahan_lainnya/summary_biaya_bahan_lainnya.dart';
import 'package:mgp_mobile_app/widget/component/button_pemeriksa.dart';
import 'package:mgp_mobile_app/widget/component/button_pengesah.dart';
import 'package:mgp_mobile_app/widget/component/card_field_analisa.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_format_currency.dart';
import 'package:mgp_mobile_app/widget/component/card_expansion_detail_prelim_text.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_date.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_total.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_right_row.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_text.dart';
import 'package:mgp_mobile_app/widget/component/catatan_approval.dart';
import 'package:mgp_mobile_app/widget/component/error_form.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_rae/analisa_single_rae/analisa_single_rae.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_rae/prelim_rae/prelim_rae.dart';
import 'package:mgp_mobile_app/model/hrdu/rae/detail_rae_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mgp_mobile_app/widget/component/field_catatan_approval.dart';
import 'package:mgp_mobile_app/widget/component/highlight_item_name.dart';
import 'package:mgp_mobile_app/widget/theme/constants.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/mgp_api_hrdu.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/widget/component/alert_approval.dart';
import 'package:mgp_mobile_app/widget/component/card_detail.dart';
import 'package:mgp_mobile_app/widget/component/card_expansion_detail.dart';
import 'package:mgp_mobile_app/widget/component/card_item_expansion_detail.dart';
import 'package:mgp_mobile_app/widget/component/skeleton.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class Body extends StatefulWidget {
  final String noRae;
  final String baseline;
  final String statusMenu;
  const Body({
    Key? key,
    required this.noRae,
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
  final formatDecimal = NumberFormat("###.######", "id_ID");
  final decimalFormat = NumberFormat("###", "id_ID");
  late List subTotalHargaRAE = [];
  late String grandTotalPrelim;
  late String grandTotalHargaRAE;
  final _formKey = GlobalKey<FormState>();
  final _catatanTextEditingController = TextEditingController();
  late Future<DetailRegrae> futureDetailRegrae;
  late Future<Rekapitulasi> futureRekapitulasi;
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
            final _postProses = await MGPAPI().postRAE(
              noTransaksi: noTransaksi,
              statusApproval: status,
              catatan: catatan,
              tglApproval: DateTime.now().toString(),
              approvalBaseline: approvalBaseline,
            );
            if (_postProses == "berhasil") {
              setState(() {
                Get.off(const RencanaAnggaranEstimasiView());
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
    futureDetailRegrae = MGPAPI().fetchApprovalDetailRencanaAnggaranEstimasi(noRae: widget.noRae, baseline: widget.baseline);
    initializeDateFormatting();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Form(
              key: _formKey,
              child: FutureBuilder(
                future: futureDetailRegrae,
                builder: (BuildContext context, AsyncSnapshot<DetailRegrae> snapshot) {
                  if (snapshot.hasData) {
                    var detailRAE = snapshot.data;
                    futureRekapitulasi = MGPAPI().fetchRekapitulasi(idRae: detailRAE!.data!.detail!.idRae.toString());
                    String status = detailRAE.data!.behavior.toString();
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
                    num totalHargaRAE = 0;
                    num totalPrelim = 0;
                    if (detailRAE.data!.detail!.detail!.isNotEmpty) {
                      for (var i = 0; i < detailRAE.data!.detail!.detail!.length; i++) {
                        num subTotal = (double.parse(detailRAE.data!.detail!.detail![i].hargaSatuanRae.toString()) * double.parse(detailRAE.data!.detail!.detail![i].qtyRae.toString()));
                        totalHargaRAE = totalHargaRAE + subTotal;
                        subTotalHargaRAE.add(subTotal.toString());
                      }
                    }
                    if (detailRAE.data!.detail!.prelim!.isNotEmpty) {
                      for (var i = 0; i < detailRAE.data!.detail!.prelim!.length; i++) {
                        num subTotal = double.parse(detailRAE.data!.detail!.prelim![i].qtyAnalisa.toString())
                        * double.parse(detailRAE.data!.detail!.prelim![i].unitPrice.toString())
                        * double.parse(detailRAE.data!.detail!.prelim![i].konstanta.toString());
                        totalPrelim = totalPrelim + subTotal;
                      }
                    }
                    num grandTotalRAE = totalHargaRAE + totalPrelim;
                    grandTotalPrelim = totalPrelim.toString();
                    grandTotalHargaRAE = grandTotalRAE.toString();
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: getProportionateScreenHeight(5)),
                        CardDetail(
                          child: ListTile(
                            subtitle: Column(
                              children: <Widget>[
                                CardFieldItemDate(
                                  label: "Tgl. Peluang",
                                  date: detailRAE.data!.detail!.tglPeluang,
                                  flexLeftRow: 12,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5)),
                                CardFieldItemText(
                                  label: "No. Peluang",
                                  contentData: detailRAE.data!.detail!.noPeluang,
                                  flexLeftRow: 12,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5)),
                                CardFieldItemDate(
                                  label: "Tgl. RAE",
                                  date: detailRAE.data!.detail!.tglRae,
                                  flexLeftRow: 12,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5)),
                                CardFieldItemText(
                                  label: "No. RAE",
                                  contentData: detailRAE.data!.detail!.noRae,
                                  flexLeftRow: 12,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5)),
                                CardFieldItemText(
                                  label: "Schedule Kebutuhan Proyek (Total Hari)",
                                  contentData: detailRAE.data!.detail!.scheduleKebutuhanProyek,
                                  flexLeftRow: 12,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5)),
                                CardFieldItemText(
                                  label: "Customer",
                                  contentData: detailRAE.data!.detail!.namaCustomer,
                                  flexLeftRow: 12,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5)),
                                CardFieldItemText(
                                  label: "ATT",
                                  contentData: detailRAE.data!.detail!.att,
                                  flexLeftRow: 12,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5)),
                                CardFieldItemDate(
                                  label: "Target Penawaran",
                                  date: detailRAE.data!.detail!.tglSelesai,
                                  flexLeftRow: 12,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5)),
                                CardFieldItemText(
                                  label: "Peringkat Peluang",
                                  contentData: detailRAE.data!.detail!.namaPeringkatPeluang,
                                  flexLeftRow: 12,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5)),
                                CardFieldItemDate(
                                  label: "Realisasi Penawaran",
                                  date: detailRAE.data!.detail!.realisasiPenawaran,
                                  flexLeftRow: 12,
                                  flexRightRow: 20,
                                ),
                              ],
                            ),
                            onTap: () {
                              Get.to(DetailAnalisaSinglePeluangView(noPeluang: detailRAE.data!.detail!.noPeluang.toString()));
                            },
                          ),
                        ),
                        CardExpansionDetail(
                          label: "Item Barang Jadi",
                          children: <Widget> [
                            ListView.separated(
                              separatorBuilder: (context, index) => SizedBox(
                                height: getProportionateScreenHeight(10),
                              ),
                              itemCount: detailRAE.data!.detail!.detail!.length,
                              itemBuilder: (context, index){
                                return Padding(
                                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                                  child: CardItemExpansionDetail(
                                    child: ListTile(
                                      contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0), vertical: getProportionateScreenHeight(10.0)),
                                      title: HighlightItemName(
                                        child: Text(
                                          detailRAE.data!.detail!.detail![index].kodeItem.toString(),
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
                                              label: "Barang Jadi",
                                              contentData: detailRAE.data!.detail!.detail![index].namaItem,
                                              flexLeftRow: 12,
                                              flexRightRow: 20,
                                            ),
                                            SizedBox(height: getProportionateScreenHeight(10)),
                                            CardFieldItemRightRow(
                                              label: "Qty",
                                              rightRow: <Widget> [
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 0),
                                                  child: (detailRAE.data!.detail!.detail![index].qtyRae != null)
                                                  ? Text(
                                                    formatDecimal.format(
                                                      double.parse(detailRAE.data!.detail!.detail![index].qtyRae.toString()
                                                      )
                                                    ).toString()
                                                    +" "+
                                                    detailRAE.data!.detail!.detail![index].namaSatuan.toString(),
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
                                              label: "Harga Satuan",
                                              contentData: detailRAE.data!.detail!.detail![index].hargaSatuanRae,
                                              flexLeftRow: 12,
                                              flexRightRow: 20,
                                            ),
                                            SizedBox(height: getProportionateScreenHeight(10)),
                                            CardFieldItemFormatCurrency(
                                              label: "Sub Total",
                                              contentData: subTotalHargaRAE[index],
                                              flexLeftRow: 12,
                                              flexRightRow: 20,
                                            ),
                                          ],
                                        ),
                                      ),
                                      onTap : () {
                                        Get.to(DetailAnalisaSingleRAEView(idRaeDetail: detailRAE.data!.detail!.detail![index].idRaeDetail.toString()));
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
                                  title: const Text(
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
                                    Get.to(AnalisaPrelimRencanaAnggaranEstimasiView(detailRegrae: futureDetailRegrae, grandTotalPrelim: grandTotalPrelim));
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
                                        total: grandTotalHargaRAE,
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
                        CardExpansionDetail(
                          label: "Rekapitulasi",
                          children: <Widget> [
                            Padding(
                              padding: EdgeInsets.only(left: getProportionateScreenWidth(10), right: getProportionateScreenWidth(10), bottom: getProportionateScreenHeight(10)),
                              child: Column(
                                children: [
                                  CardFieldAnalisa(
                                  label: "Summary Biaya Bahan Baku",
                                  onTap: () {
                                      Get.put(GetxHardwoodRae()).bahanBaku(detailRAE.data!.detail!.idRae.toString());
                                      Get.put(GetxPlywoodRae()).bahanBaku(detailRAE.data!.detail!.idRae.toString());
                                      Get.to(SummaryBiayaBahanBaku(idRae: detailRAE.data!.detail!.idRae.toString()));
                                    },
                                  ),
                                  CardFieldAnalisa(
                                  label: "Summary Biaya Bahan Lainnya",
                                  onTap: () {
                                      Get.to(SummaryBiayaBahanLainnya(idRae: detailRAE.data!.detail!.idRae.toString()));
                                    },
                                  ),
                                ],
                              ), 
                            ),
                          ],
                        ),
                        if (detailRAE.data!.approval!.isNotEmpty)...[
                          CardExpansionDetail(
                            label: "Catatan Approval",
                            children: <Widget> [
                              ListView.separated(
                                separatorBuilder: (context, index) => SizedBox(
                                  height: getProportionateScreenHeight(10),
                                ),
                                itemCount: detailRAE.data!.approval!.length,
                                itemBuilder: (context, index){
                                  return FieldCatatanApproval(
                                    index: index,
                                    statusApproval: detailRAE.data!.approval![index].statusApproval,
                                    namaKaryawan: detailRAE.data!.approval![index].namaKaryawan,
                                    catatanApproval: detailRAE.data!.approval![index].catatan,
                                    tglApproval: detailRAE.data!.approval![index].tglApproval,
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
                                    "REVISE RAE",
                                    "REVISE",
                                    reviseButtonColor,
                                    detailRAE.data!.detail!.noRae.toString(),
                                    "REV",
                                    _catatanTextEditingController.text,
                                    detailRAE.data!.detail!.baseline.toString(),
                                  );
                                }
                              }
                            },
                            onClickedReject: () {
                              if (_formKey.currentState!.validate()) {
                                if (_catatanTextEditingController.text != "") {
                                  showAlertDialog(
                                    "REJECT RAE",
                                    "REJECT",
                                    rejectButtonColor,
                                    detailRAE.data!.detail!.noRae.toString(),
                                    "REJ",
                                    _catatanTextEditingController.text,
                                    detailRAE.data!.detail!.baseline.toString(),
                                  );
                                }
                              }
                            },
                            onClickedVerify: () {
                              if (_formKey.currentState!.validate()) {
                                if (_catatanTextEditingController.text != "") {
                                  showAlertDialog(
                                    "VERIFY RAE",
                                    "VERIFY",
                                    verifyButtonColor,
                                    detailRAE.data!.detail!.noRae.toString(),
                                    "VER",
                                    _catatanTextEditingController.text,
                                    detailRAE.data!.detail!.baseline.toString(),
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
                                    "REJECT RAE",
                                    "REJECT",
                                    rejectButtonColor,
                                    detailRAE.data!.detail!.noRae.toString(),
                                    "REJ",
                                    _catatanTextEditingController.text,
                                    detailRAE.data!.detail!.baseline.toString(),
                                  );
                                }
                              }
                            },
                            onClickedApprove: () {
                              if (_formKey.currentState!.validate()) {
                                if (_catatanTextEditingController.text != "") {
                                  showAlertDialog(
                                    "APPROVE RAE",
                                    "APPROVE",
                                    verifyButtonColor,
                                    detailRAE.data!.detail!.noRae.toString(),
                                    "APP",
                                    _catatanTextEditingController.text,
                                    detailRAE.data!.detail!.baseline.toString(),
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
                    return Column(
                      children: <Widget> [
                        SizedBox(height: getProportionateScreenHeight(5)),
                        Skeleton(
                          width: double.infinity,
                          height: getProportionateScreenHeight(400),
                        ),
                        SizedBox(height: getProportionateScreenHeight(10)),
                        Skeleton(
                          width: double.infinity,
                          height: getProportionateScreenHeight(65),
                        ),
                        SizedBox(height: getProportionateScreenHeight(10)),
                        Skeleton(
                          width: double.infinity,
                          height: getProportionateScreenHeight(70),
                        ),
                        SizedBox(height: getProportionateScreenHeight(10)),
                        Skeleton(
                          width: double.infinity,
                          height: getProportionateScreenHeight(65),
                        ),
                        SizedBox(height: getProportionateScreenHeight(10)),
                        Row(
                          children: <Widget> [
                            Expanded(
                              child: Skeleton(
                                height: getProportionateScreenHeight(65),
                              )
                            ),
                            SizedBox(width: getProportionateScreenWidth(10)),
                            Expanded(
                              child: Skeleton(
                                height: getProportionateScreenHeight(65),
                              )
                            ),
                          ],
                        ),
                      ],
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