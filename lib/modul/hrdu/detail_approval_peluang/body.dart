// import 'package:flutter_html/flutter_html.dart';

import 'package:get/get.dart';
import 'package:mgp_mobile_app/controller_getX/default/getX_default_visibility_detail.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/marketing/peluang/detail_peluang/mixin_peluang.dart';
import 'package:mgp_mobile_app/model/hrdu/peluang/detail_peluang_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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

class _BodyState extends State<Body> with PeluangDetail{
  late Future<DetailRegplg> futures = fetchDataPeluangDetail(noPeluang: widget.noPeluang);
  final formatDecimal = NumberFormat("###.######", "id_ID");
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
            final _postProses = await MGPAPI().postPeluang(
              noTransaksi: noTransaksi,
              statusApproval: status,
              catatan: catatan,
              tglApproval: DateTime.now().toString(),
            );
            if (_postProses == "berhasil") {
              setState(() {
                Get.off(const PeluangView());
                isLoading = false;
              });
            }
          }, isLoading: isLoading,
        );
      }
    );
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
              child: FutureBuilder(
                future: futures,
                builder: (BuildContext context, AsyncSnapshot<DetailRegplg> snapshot) {
                  if (snapshot.hasData) {
                    var detailPeluang = futureDetailPeluang!.data;
                    String status = detailPeluang!.behavior.toString();
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
                                    label: "Tgl. Peluang",
                                    date: detailPeluang.detail!.tglPeluang,
                                    flexLeftRow: 10,
                                    flexRightRow: 20,
                                  ),
                                  SizedBox(height: getProportionateScreenHeight(5)),
                                  CardFieldItemText(
                                    label: "No. Peluang",
                                    contentData: detailPeluang.detail!.noPeluang,
                                    flexLeftRow: 10,
                                    flexRightRow: 20,
                                  ),
                                  SizedBox(height: getProportionateScreenHeight(5)),
                                  CardFieldItemDate(
                                    label: "Target Penawaran",
                                    date: detailPeluang.detail!.tglSelesai,
                                    flexLeftRow: 10,
                                    flexRightRow: 20,
                                  ),
                                  SizedBox(height: getProportionateScreenHeight(5)),
                                  CardFieldItemDate(
                                    label: "Realisasi Penawaran",
                                    date: detailPeluang.detail!.realisasiPenawaran,
                                    flexLeftRow: 10,
                                    flexRightRow: 20,
                                  ),
                                  SizedBox(height: getProportionateScreenHeight(5)),
                                  CardFieldItemText(
                                    label: "Peringkat Peluang",
                                    contentData: detailPeluang.detail!.namaPeringkatPeluang,
                                    flexLeftRow: 10,
                                    flexRightRow: 20,
                                  ),
                                  SizedBox(height: getProportionateScreenHeight(5)),
                                  CardFieldItemText(
                                    label: "Customer",
                                    contentData: detailPeluang.detail!.namaCustomer,
                                    flexLeftRow: 10,
                                    flexRightRow: 20,
                                  ),
                                  SizedBox(height: getProportionateScreenHeight(5)),
                                  CardFieldItemText(
                                    label: "Proyek",
                                    contentData: detailPeluang.detail!.namaProyek,
                                    flexLeftRow: 10,
                                    flexRightRow: 20,
                                  ),
                                  SizedBox(height: getProportionateScreenHeight(5)),
                                  CardFieldItemText(
                                    label: "ATT",
                                    contentData: detailPeluang.detail!.att,
                                    flexLeftRow: 10,
                                    flexRightRow: 20,
                                  ),
                                  SizedBox(height: getProportionateScreenHeight(5)),
                                  CardFieldItemText(
                                    label: "Schedule Kebutuhan Proyek (Total Hari)",
                                    contentData: detailPeluang.detail!.scheduleKebutuhanProyek,
                                    flexLeftRow: 10,
                                    flexRightRow: 20,
                                  ),
                                  SizedBox(height: getProportionateScreenHeight(5)),
                                  CardFieldItemIcon(
                                    label: "Instalasi",
                                    status: detailPeluang.detail!.instalasi,
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
                                padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                                child: CardItemExpansionDetail(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10), horizontal: getProportionateScreenWidth(10)),
                                    child: (detailPeluang.detail!.keteranganPengiriman != null)
                                    ? Text(detailPeluang.detail!.keteranganPengiriman.toString(),
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
                              SizedBox(height: getProportionateScreenHeight(10))
                            ],
                          ),
                          CardExpansionDetail(
                            label: "Lokasi Pengiriman",
                            children: <Widget> [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                                child: CardItemExpansionDetail(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10), vertical: getProportionateScreenHeight(10)),
                                    child: (detailPeluang.detail!.lokasiPengiriman != null)
                                    ? Text(detailPeluang.detail!.lokasiPengiriman.toString(),
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
                              SizedBox(height: getProportionateScreenHeight(10)),
                            ],
                          ),
                          // CardExpansionDetail(
                          //   label: "Informasi Lainnya",
                          //   children: <Widget> [
                          //     Padding(
                          //       padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                          //       child: CardItemExpansionDetail(
                          //         child: Padding(
                          //           padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10), vertical: getProportionateScreenHeight(10)),
                          //           child: (detailPeluang.detail!.lainLain != null)
                          //           ? Html(
                          //             data: detailPeluang.detail!.lainLain
                          //           )
                          //           :  const Text("-",
                          //             style: TextStyle(
                          //               color: Colors.black,
                          //               fontSize: 14,
                          //             ),
                          //             textAlign: TextAlign.left,
                          //           )
                          //         ),
                          //       ),
                          //     ),
                          //     SizedBox(height: getProportionateScreenHeight(10)),
                          //   ],
                          // ),
                          if (detailPeluang.detail!.detail!.isNotEmpty)...[
                            CardExpansionDetail(
                              label: "Item Barang Jadi",
                              children: <Widget> [
                                ListView.separated(
                                  separatorBuilder: (context, index) => SizedBox(
                                    height: getProportionateScreenHeight(10),
                                  ),
                                  itemCount: detailPeluang.detail!.detail!.length,
                                  itemBuilder: (context, index){
                                    return Padding(
                                      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                                      child: CardItemExpansionDetail(
                                        child: ListTile(
                                          contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0), vertical: getProportionateScreenHeight(10.0)),
                                          title: HighlightItemName(
                                            child: Text(
                                              detailPeluang.detail!.detail![index]!.kodeItem.toString(),
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
                                                  contentData: detailPeluang.detail!.detail![index]!.namaItem,
                                                  flexLeftRow: 12,
                                                  flexRightRow: 20,
                                                ),
                                                SizedBox(height: getProportionateScreenHeight(10)),
                                                CardFieldItemText(
                                                  label: "Jenis Barang Jadi",
                                                  contentData: detailPeluang.detail!.detail![index]!.namaJenis,
                                                  flexLeftRow: 12,
                                                  flexRightRow: 20,
                                                ),
                                                SizedBox(height: getProportionateScreenHeight(10)),
                                                CardFieldItemRightRow(
                                                  label: "Qty",
                                                  rightRow: <Widget> [
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 0),
                                                      child: Text(
                                                        formatDecimal.format(
                                                          double.parse(detailPeluang.detail!.detail![index]!.qty.toString()
                                                          )
                                                        ).toString()
                                                        +" "+
                                                        detailPeluang.detail!.detail![index]!.namaSatuanJual.toString(),
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
                                            Get.to(DetailAnalisaSinglePeluangView(idBarangJadi: detailPeluang.detail!.detail![index]!.idItemBuaso.toString()));
                                          }
                                        ),
                                      ),
                                    );
                                  },
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                ),
                                SizedBox(height: getProportionateScreenHeight(10)),
                              ]
                            ),
                          ],
                          if (detailPeluang.approval!.isNotEmpty)...[
                            CardExpansionDetail(
                              label: "Catatan Approval",
                              children: <Widget> [
                                ListView.separated(
                                  separatorBuilder: (context, index) => SizedBox(
                                    height: getProportionateScreenHeight(10),
                                  ),
                                  itemCount: detailPeluang.approval!.length,
                                  itemBuilder: (context, index){
                                    return FieldCatatanApproval(
                                      index: index,
                                      statusApproval: detailPeluang.approval![index]!.statusApproval,
                                      namaKaryawan: detailPeluang.approval![index]!.namaKaryawan,
                                      catatanApproval: detailPeluang.approval![index]!.catatan,
                                      tglApproval: detailPeluang.approval![index]!.tglApproval,
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
                                      "REVISE Peluang",
                                      "REVISE",
                                      reviseButtonColor,
                                      detailPeluang.detail!.noPeluang.toString(),
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
                                      detailPeluang.detail!.noPeluang.toString(),
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
                                      detailPeluang.detail!.noPeluang.toString(),
                                      "VER",
                                      _catatanTextEditingController.text,
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
                                      "REJECT Peluang",
                                      "REJECT",
                                      rejectButtonColor,
                                      detailPeluang.detail!.noPeluang.toString(),
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
                                      detailPeluang.detail!.noPeluang.toString(),
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