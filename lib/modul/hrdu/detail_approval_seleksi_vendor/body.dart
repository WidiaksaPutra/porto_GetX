import 'package:mgp_mobile_app/controller_getX/default/getX_default_visibility_detail.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/seleksi_vendor/getX_default_subtotal.dart';
import 'package:mgp_mobile_app/model/hrdu/seleksi_vendor/detail_seleksi_vendor_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mgp_mobile_app/modul/hrdu/approval_seleksi_vendor/approval_seleksi_vendor.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/api_seleksi_vendor/api_detail_seleksi_vendor.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/api_seleksi_vendor/api_post_seleksi_vendor.dart';
import 'package:mgp_mobile_app/widget/component/alert_approval.dart';
import 'package:mgp_mobile_app/widget/component/button_pemeriksa.dart';
import 'package:mgp_mobile_app/widget/component/button_pengesah.dart';
import 'package:mgp_mobile_app/widget/component/card_detail.dart';
import 'package:mgp_mobile_app/widget/component/card_expansion_detail.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_date.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_format_currency.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_right_row.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_text.dart';
import 'package:mgp_mobile_app/widget/component/card_gambar.dart';
import 'package:mgp_mobile_app/widget/component/catatan_approval.dart';
import 'package:mgp_mobile_app/widget/component/error_form.dart';
import 'package:mgp_mobile_app/widget/component/field_catatan_approval.dart';
import 'package:mgp_mobile_app/widget/component/preview_image.dart';
import 'package:mgp_mobile_app/widget/theme/constants.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class Body extends StatefulWidget{
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

class _BodyState extends State<Body> with SeleksiVendorPostClass, SeleksiVendorDetail{
  final formatCurrency = NumberFormat.currency(
    locale: 'ID',
    decimalDigits: 0,
    symbol: "Rp"
  );
  final formatDecimal = NumberFormat("###.####", "id_ID");
  late List subTotalHargaPr = [];
  late List subTotalHargaSv = [];
  final _formKey = GlobalKey<FormState>();
  final _catatanTextEditingController = TextEditingController();
  late Future<DetailPvspr> futureDetailPvspr;
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
            final _postProses = await postSeleksiVendor(
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
  void initState() {
    // '2023/04/PRO/SV/000009'
    futureDetailPvspr = fetchDetailSeleksiVendor(noSeleksiVendor: widget.noSeleksiVendor);
    // futureDetailPvspr = MGPAPI().fetchApprovalDetailPurchaseOrder(noPurchaseOrder: '2023/03/PRO/PO/000001');
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
              child: FutureBuilder<DetailPvspr>(
                future: futureDetailPvspr,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var detailSeleksiVendor = snapshot.data;
                    String status = detailSeleksiVendor!.data!.behavior.toString();
                    Get.put(GetxSeleksiVendor()).defaultHarga(detailSeleksiVendor.data!.detail!.hargaKesepakatan.toString(), detailSeleksiVendor.data!.detail!.qtyOrder.toString());
                    Get.put(GetxSeleksiVendor()).defaultGambarLinkSingle(detailSeleksiVendor.data!.detail!.gambar!);
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
                                  SizedBox(height: getProportionateScreenHeight(5)),
                                  CardFieldItemText(
                                    label: "Nama Pembuat Pengajuan",
                                    contentData: detailSeleksiVendor.data!.detail!.namaKaryawanPengaju,
                                    flexLeftRow: 12,
                                    flexRightRow: 20,
                                  ),
                                  SizedBox(height: getProportionateScreenHeight(5)),
                                  CardFieldItemText(
                                    label: "Jabatan Pembuat Pengajuan",
                                    contentData: detailSeleksiVendor.data!.detail!.namaJabatanPengaju,
                                    flexLeftRow: 12,
                                    flexRightRow: 20,
                                  ),
                                  SizedBox(height: getProportionateScreenHeight(5)),
                                  CardFieldItemDate(
                                    label: "Tgl. Input Data",
                                    date: detailSeleksiVendor.data!.detail!.createdAt,
                                    flexLeftRow: 12,
                                    flexRightRow: 20,
                                  ),
                                  SizedBox(height: getProportionateScreenHeight(5)),
                                  CardFieldItemDate(
                                    label: "Tgl. Seleksi Vendor",
                                    date: detailSeleksiVendor.data!.detail!.tglSeleksiVendor,
                                    flexLeftRow: 12,
                                    flexRightRow: 20,
                                  ),
                                  SizedBox(height: getProportionateScreenHeight(5)),
                                  CardFieldItemText(
                                    label: "No. Seleksi Vendor",
                                    contentData: detailSeleksiVendor.data!.detail!.noSeleksiVendor,
                                    flexLeftRow: 12,
                                    flexRightRow: 20,
                                  ),
                                  SizedBox(height: getProportionateScreenHeight(5)),
                                  CardFieldItemDate(
                                    label: "Tgl. Purchase Request",
                                    date: detailSeleksiVendor.data!.detail!.tglPurchaseRequest,
                                    flexLeftRow: 12,
                                    flexRightRow: 20,
                                  ),
                                  SizedBox(height: getProportionateScreenHeight(5)),
                                  CardFieldItemText(
                                    label: "No. Purchase Request",
                                    contentData: detailSeleksiVendor.data!.detail!.noPurchaseRequest,
                                    flexLeftRow: 12,
                                    flexRightRow: 20,
                                  ),
                                  SizedBox(height: getProportionateScreenHeight(5)),
                                  CardFieldItemText(
                                    label: "Status Approval",
                                    contentData: detailSeleksiVendor.data!.detail!.statusApproval,
                                    flexLeftRow: 12,
                                    flexRightRow: 20,
                                  ),
                                  SizedBox(height: getProportionateScreenHeight(5)),
                                  CardFieldItemText(
                                    label: "Proyek",
                                    contentData: detailSeleksiVendor.data!.detail!.namaProyek,
                                    flexLeftRow: 12,
                                    flexRightRow: 20,
                                  ),
                                  SizedBox(height: getProportionateScreenHeight(5)),
                                  CardFieldItemText(
                                    label: "Keperluan",
                                    contentData: detailSeleksiVendor.data!.detail!.keperluan,
                                    flexLeftRow: 12,
                                    flexRightRow: 20,
                                  ),
                                  SizedBox(height: getProportionateScreenHeight(5)),
                                  CardFieldItemText(
                                    label: "Item Barang",
                                    contentData: detailSeleksiVendor.data!.detail!.namaItem,
                                    flexLeftRow: 12,
                                    flexRightRow: 20,
                                  ),
                                  SizedBox(height: getProportionateScreenHeight(5)),
                                  CardFieldItemRightRow(
                                    label: "Qty. Seleksi Vendor",
                                    rightRow: <Widget> [
                                      Padding(
                                        padding: EdgeInsets.only(left: getProportionateScreenWidth(0.0)),
                                        child: (detailSeleksiVendor.data!.detail!.qtyOrder != null)
                                        ? Text(
                                          formatDecimal.format(
                                            double.parse(detailSeleksiVendor.data!.detail!.qtyOrder.toString()
                                            )
                                          )
                                          +" "+
                                          detailSeleksiVendor.data!.detail!.satuanBeli.toString(),
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
                                    flexLeftRow: 14,
                                    flexRightRow: 20,
                                  ),
                                  SizedBox(height: getProportionateScreenHeight(5)),
                                  CardFieldItemText(
                                    label: "Vendor",
                                    contentData: detailSeleksiVendor.data!.detail!.namaVendor,
                                    flexLeftRow: 12,
                                    flexRightRow: 20,
                                  ),
                                  SizedBox(height: getProportionateScreenHeight(5)),
                                  CardFieldItemFormatCurrency(
                                    label: "Harga Satuan Kesepakatan",
                                    contentData: detailSeleksiVendor.data!.detail!.hargaKesepakatan,
                                    flexLeftRow: 12,
                                    flexRightRow: 20,
                                  ),
                                  SizedBox(height: getProportionateScreenHeight(5)),
                                  GetBuilder<GetxSeleksiVendor>(
                                    init: GetxSeleksiVendor(),
                                    builder:(controller2) => CardFieldItemFormatCurrency(
                                      label: "Total Harga",
                                      contentData: controller2.totalHarga.value.toString(),
                                      flexLeftRow: 12,
                                      flexRightRow: 20,
                                    ),
                                  ),
                                  SizedBox(height: getProportionateScreenHeight(5)),
                                  CardFieldItemText(
                                    label: "Catatan Seleksi Vendor",
                                    contentData: detailSeleksiVendor.data!.detail!.keterangan,
                                    flexLeftRow: 12,
                                    flexRightRow: 20,
                                  ),
                                  SizedBox(height: getProportionateScreenHeight(5)),
                                ],
                              ),
                            ),
                          ),
                          if (detailSeleksiVendor.data!.detail!.gambar!.isNotEmpty)...[
                            GetBuilder<GetxSeleksiVendor>(
                              init: GetxSeleksiVendor(),
                              builder:(controller2) => CardExpansionDetail(
                                label: "Dokumen Seleksi Vendor",
                                children: <Widget> [
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0), vertical: getProportionateScreenHeight(10.0)),
                                    child: SizedBox(
                                      height: getProportionateScreenHeight(200),
                                      child: ListView.builder(
                                        // shrinkWrap: true,
                                        itemCount: controller2.gambar.length,
                                        scrollDirection: Axis.vertical,
                                        itemBuilder: (context, index) => CardGambar(
                                          imageLink: controller2.gambar[index],
                                          onTap: () {
                                            Get.to(PreviewImage(imageLink: controller2.gambar));
                                          },
                                        ),
                                      ),
                                    )
                                  ), 
                                ],
                              ),
                            ),
                          ],
                          if (detailSeleksiVendor.data!.approval!.isNotEmpty)...[
                            CardExpansionDetail(
                              label: "Catatan Approval",
                              children: <Widget> [
                                ListView.separated(
                                  separatorBuilder: (context, index) => SizedBox(
                                    height: getProportionateScreenHeight(10),
                                  ),
                                  itemCount: detailSeleksiVendor.data!.approval!.length,
                                  itemBuilder: (context, index){
                                    return FieldCatatanApproval(
                                      index: index,
                                      statusApproval: detailSeleksiVendor.data!.approval![index].statusApproval.toString(),
                                      namaKaryawan: detailSeleksiVendor.data!.approval![index].namaKaryawan.toString(),
                                      catatanApproval: detailSeleksiVendor.data!.approval![index].catatan.toString(),
                                      tglApproval: detailSeleksiVendor.data!.approval![index].tglApproval.toString(),
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
                                  if (value!.isNotEmpty) {
                                    setState(() {
                                      controller.catatanError.value = false;
                                    });
                                  }
                                  return; 
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    setState(() {
                                      controller.catatanError.value = true;
                                    });
                                  }
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
                                      "REVISE Seleksi Vendor",
                                      "REVISE",
                                      reviseButtonColor,
                                      detailSeleksiVendor.data!.detail!.noSeleksiVendor.toString(),
                                      "REV",
                                      _catatanTextEditingController.text,
                                      detailSeleksiVendor.data!.detail!.baseline.toString(),
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
                                      detailSeleksiVendor.data!.detail!.noSeleksiVendor.toString(),
                                      "REJ",
                                      _catatanTextEditingController.text,
                                      detailSeleksiVendor.data!.detail!.baseline.toString(),
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
                                      detailSeleksiVendor.data!.detail!.noSeleksiVendor.toString(),
                                      "VER",
                                      _catatanTextEditingController.text,
                                      detailSeleksiVendor.data!.detail!.baseline.toString(),
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
                                      "REJECT Seleksi Vendor",
                                      "REJECT",
                                      rejectButtonColor,
                                      detailSeleksiVendor.data!.detail!.noSeleksiVendor.toString(),
                                      "REJ",
                                      _catatanTextEditingController.text,
                                      detailSeleksiVendor.data!.detail!.baseline.toString(),
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
                                      detailSeleksiVendor.data!.detail!.noSeleksiVendor.toString(),
                                      "APP",
                                      _catatanTextEditingController.text,
                                      detailSeleksiVendor.data!.detail!.baseline.toString(),
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