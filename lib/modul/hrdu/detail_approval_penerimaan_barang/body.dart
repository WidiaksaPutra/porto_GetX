
import 'package:mgp_mobile_app/model/hrdu/penerimaan_barang/detail_penerimaan_barang.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mgp_mobile_app/modul/hrdu/approval_penerimaan_barang/approval_penerimaan_barang.dart';
import 'package:mgp_mobile_app/widget/component/alert_approval.dart';
import 'package:mgp_mobile_app/widget/component/button_pemeriksa.dart';
import 'package:mgp_mobile_app/widget/component/button_pengesah.dart';
import 'package:mgp_mobile_app/widget/component/card_detail.dart';
import 'package:mgp_mobile_app/widget/component/card_expansion_detail.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_date.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_right_row.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_text.dart';
import 'package:mgp_mobile_app/widget/component/card_gambar.dart';
import 'package:mgp_mobile_app/widget/component/catatan_approval.dart';
import 'package:mgp_mobile_app/widget/component/error_form.dart';
import 'package:mgp_mobile_app/widget/component/field_catatan_approval.dart';
import 'package:mgp_mobile_app/widget/component/preview_image.dart';
import 'package:mgp_mobile_app/widget/theme/constants.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/mgp_api_hrdu.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
    required this.noPenerimaanBarang,
    required this.statusMenu,
  }) : super(key: key);
  final String noPenerimaanBarang;
  final String statusMenu;
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final formatDecimal = NumberFormat("###.###", "id_ID");
  final _formKey = GlobalKey<FormState>();
  final _catatanTextEditingController = TextEditingController();
  late Future<DetailPenpo> futureDetailPenpo;
  bool visibilityPemeriksa = false;
  bool visibilityPengesah = false;
  bool catatanError = false;
  bool visibilityStatusMenu = false;
  late List gambar = [];
  bool isLoading = false;

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
            Navigator.of(Get.overlayContext!, rootNavigator: true).pop();
            setState(() {
              isLoading = true;
            });
            final _postProses = await MGPAPI().postPenerimaanBarang(
              noTransaksi: noTransaksi,
              statusApproval: status,
              catatan: catatan,
              tglApproval: DateTime.now().toString(),
            );
            if (_postProses == "berhasil") {
              setState(() {
                Get.off(const PenerimaanBarangView());
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
    futureDetailPenpo = MGPAPI().fetchApprovalDetailPenerimaanBarang(noPenerimaanBarang: widget.noPenerimaanBarang);
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
              child: FutureBuilder<DetailPenpo>(
                future: futureDetailPenpo,
                builder: (context, snapshot){
                  if (snapshot.hasData) {
                    var detailPenerimaanBarang = snapshot.data;
                    String status = detailPenerimaanBarang!.data!.behavior.toString();
                    if (detailPenerimaanBarang.data!.detail!.fotoSuratJalan != null) {
                      gambar.add(detailPenerimaanBarang.data!.detail!.fotoSuratJalan.toString());
                    }
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
                                  label: "Tgl. Purchase Order",
                                  date: detailPenerimaanBarang.data!.detail!.tglPurchaseOrder,
                                  flexLeftRow: 13,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5)),
                                CardFieldItemText(
                                  label: "Vendor",
                                  contentData: detailPenerimaanBarang.data!.detail!.namaVendor,
                                  flexLeftRow: 13,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5)),
                                CardFieldItemRightRow(
                                  label: "Qty Purchase Order",
                                  rightRow: <Widget> [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 0),
                                      child: (detailPenerimaanBarang.data!.detail!.qtyOrder != null)
                                      ? Text(
                                        formatDecimal.format(
                                          double.parse(detailPenerimaanBarang.data!.detail!.qtyOrder.toString()
                                          )
                                        ).toString()
                                        +" "+
                                        detailPenerimaanBarang.data!.detail!.namaSatuanOrder.toString(),
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
                                  flexLeftRow: 13,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5)),
                                CardFieldItemDate(
                                  label: "Tgl. Penerimaan Barang",
                                  date: detailPenerimaanBarang.data!.detail!.tglPenerimaanBarang,
                                  flexLeftRow: 13,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5)),
                                CardFieldItemText(
                                  label: "No. Surat Jalan",
                                  contentData: detailPenerimaanBarang.data!.detail!.noSuratJalan,
                                  flexLeftRow: 13,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5)),
                                CardFieldItemText(
                                  label: "Gudang Penerimaan",
                                  contentData: detailPenerimaanBarang.data!.detail!.namaGudang,
                                  flexLeftRow: 13,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5)),
                                CardFieldItemRightRow(
                                  label: "Qty Penerimaan Dalam Satuan Beli",
                                  rightRow: <Widget> [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 0),
                                      child: (detailPenerimaanBarang.data!.detail!.qtyBeli != null)
                                      ? Text(
                                        formatDecimal.format(
                                          double.parse(detailPenerimaanBarang.data!.detail!.qtyBeli.toString()
                                          )
                                        ).toString()
                                        +" "+
                                        detailPenerimaanBarang.data!.detail!.namaSatuanBeli.toString(),
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
                                  flexLeftRow: 13,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5)),
                                CardFieldItemText(
                                  label: "No. Purchase Order",
                                  contentData: detailPenerimaanBarang.data!.detail!.noPurchaseOrder,
                                  flexLeftRow: 13,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5)),
                                CardFieldItemText(
                                  label: "Item",
                                  contentData: detailPenerimaanBarang.data!.detail!.namaItem,
                                  flexLeftRow: 13,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5)),
                                CardFieldItemText(
                                  label: "No. Penerimaan Barang",
                                  contentData: detailPenerimaanBarang.data!.detail!.noPenerimaanBarang,
                                  flexLeftRow: 13,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5)),
                                CardFieldItemText(
                                  label: "Petugas Penerimaan",
                                  contentData: detailPenerimaanBarang.data!.detail!.namaKaryawan,
                                  flexLeftRow: 13,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5)),
                                CardFieldItemRightRow(
                                  label: "Qty Penerimaan Dalam Satuan Pakai",
                                  rightRow: <Widget> [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 0),
                                      child: (detailPenerimaanBarang.data!.detail!.qtyPakai != null)
                                      ? Text(
                                        formatDecimal.format(
                                          double.parse(detailPenerimaanBarang.data!.detail!.qtyPakai.toString()
                                          )
                                        ).toString()
                                        +" "+
                                        detailPenerimaanBarang.data!.detail!.namaSatuanPakai.toString(),
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
                                  flexLeftRow: 13,
                                  flexRightRow: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                        if (detailPenerimaanBarang.data!.detail!.fotoSuratJalan != null)...[
                          CardExpansionDetail(
                          label: "Gambar Penerimaan Barang",
                            children: <Widget> [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0), vertical: getProportionateScreenHeight(10.0)),
                                child: CardGambar(
                                  imageLink: detailPenerimaanBarang.data!.detail!.fotoSuratJalan.toString(),
                                  onTap: () {
                                    Get.to(PreviewImage(imageLink: gambar));
                                  },
                                ),
                              ), 
                            ],
                          ),
                        ],
                        if (detailPenerimaanBarang.data!.approval!.isNotEmpty)...[
                          CardExpansionDetail(
                            label: "Catatan Approval",
                            children: <Widget> [
                              ListView.separated(
                                separatorBuilder: (context, index) => SizedBox(
                                  height: getProportionateScreenHeight(10),
                                ),
                                itemCount: detailPenerimaanBarang.data!.approval!.length,
                                itemBuilder: (context, index){
                                  return FieldCatatanApproval(
                                    index: index,
                                    statusApproval: detailPenerimaanBarang.data!.approval![index]!.statusApproval,
                                    namaKaryawan: detailPenerimaanBarang.data!.approval![index]!.namaKaryawan,
                                    catatanApproval: detailPenerimaanBarang.data!.approval![index]!.catatan,
                                    tglApproval: detailPenerimaanBarang.data!.approval![index]!.tglApproval,
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
                                    "REVISE Penerimaan Barang",
                                    "REVISE",
                                    reviseButtonColor,
                                    detailPenerimaanBarang.data!.detail!.noPenerimaanBarang.toString(),
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
                                    "REJECT Penerimaan Barang",
                                    "REJECT",
                                    rejectButtonColor,
                                    detailPenerimaanBarang.data!.detail!.noPenerimaanBarang.toString(),
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
                                    "VERIFY Penerimaan Barang",
                                    "VERIFY",
                                    verifyButtonColor,
                                    detailPenerimaanBarang.data!.detail!.noPenerimaanBarang.toString(),
                                    "VER",
                                    _catatanTextEditingController.text,
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
                                    "REJECT Penerimaan Barang",
                                    "REJECT",
                                    rejectButtonColor,
                                    detailPenerimaanBarang.data!.detail!.noPenerimaanBarang.toString(),
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
                                    "APPROVE Penerimaan Barang",
                                    "APPROVE",
                                    verifyButtonColor,
                                    detailPenerimaanBarang.data!.detail!.noPenerimaanBarang.toString(),
                                    "APP",
                                    _catatanTextEditingController.text,
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