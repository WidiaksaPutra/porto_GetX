
import 'package:mgp_mobile_app/model/hrdu/faktur_penjualan/detail_faktur_penjualan_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mgp_mobile_app/modul/hrdu/approval_faktur_penjualan/approval_faktur_penjualan.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_penawaran/prelim_penawaran/prelim_penawaran.dart';
import 'package:mgp_mobile_app/widget/component/alert_approval.dart';
import 'package:mgp_mobile_app/widget/component/button_pemeriksa.dart';
import 'package:mgp_mobile_app/widget/component/button_pengesah.dart';
import 'package:mgp_mobile_app/widget/component/card_detail.dart';
import 'package:mgp_mobile_app/widget/component/card_expansion_detail.dart';
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
import 'package:mgp_mobile_app/service/mgp_api_hrdu/mgp_api_hrdu.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class Body extends StatefulWidget {
  final String noFaktur;
  final String statusMenu;
  const Body({
    Key? key,
    required this.noFaktur,
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
  late List subTotalHarga = [];
  late List totalAkumulasiArr = [];
  late String grandTotalHarga;
  late String diskonHarga;
  late String totalSetelahDiskon;
  late String ppnHarga;
  late String totalSetelahPpn;
  late String uangMukaHarga;
  late String totalUangMukaHarga;
  late String grandTotalPrelim;
  late String perlimPersentase;
  final _formKey = GlobalKey<FormState>();
  final _catatanTextEditingController = TextEditingController();
  late Future<DetailRegfpnj> futureDetailRegfpnj;
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
            final _postProses = await MGPAPI().postFakturPenjualan(
              noTransaksi: noTransaksi,
              statusApproval: status,
              catatan: catatan,
              tglApproval: DateTime.now().toString(),
              approvalBaseline: approvalBaseline,
            );
            if (_postProses == "berhasil") {
              setState(() {
                Get.off(const FakturPenjualanView());
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
    futureDetailRegfpnj = MGPAPI().fetchApprovalDetailFakturPenjualan(noFaktur: widget.noFaktur);
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
              child: FutureBuilder<DetailRegfpnj>(
                future: futureDetailRegfpnj,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var detailFakturPenjualan = snapshot.data;
                    String status = detailFakturPenjualan!.data!.behavior.toString();
                    num totalPrelim = 0;
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
                    double valuePPN = double.parse(detailFakturPenjualan.data!.detail!.ppn.toString());
                    double valueDiskon = double.parse(detailFakturPenjualan.data!.detail!.diskon.toString());
                    double uangMuka = double.parse(detailFakturPenjualan.data!.detail!.uangMuka.toString());
                    num totalHarga = 0;
                    num subTotalPerlim = 0;
                    num totalPerlim = 0;
                    for(var i = 0; i < detailFakturPenjualan.data!.detail!.detail!.length; i++){
                      num getSubTotal = double.parse(detailFakturPenjualan.data!.detail!.detail![i].qty.toString()) * double.parse(detailFakturPenjualan.data!.detail!.detail![i].hargaSatuanJual.toString());
                      subTotalHarga.add(getSubTotal);
                      num sum = (double.parse(detailFakturPenjualan.data!.detail!.detail![i].akumulasiProgress.toString()) < 100 ) 
                      ? double.parse(detailFakturPenjualan.data!.detail!.detail![i].akumulasiProgress.toString()) + double.parse(detailFakturPenjualan.data!.detail!.detail![i].persentaseProgress.toString())
                      : 100;
                      num totalAkumulasi = (getSubTotal/100) * sum;
                      totalAkumulasiArr.add(totalAkumulasi);
                      totalHarga = totalHarga + totalAkumulasi;     
                    }

                    for(var i = 0; i < detailFakturPenjualan.data!.detail!.prelim!.length; i++){
                      num total = double.parse(detailFakturPenjualan.data!.detail!.prelim![i].unitPrice.toString()) * double.parse(detailFakturPenjualan.data!.detail!.prelim![i].qtyAnalisa.toString()) * double.parse(detailFakturPenjualan.data!.detail!.prelim![i].konstanta.toString());
                      subTotalPerlim = subTotalPerlim + total;
                      totalPerlim = (double.parse(detailFakturPenjualan.data!.detail!.persentasePrelim.toString()) / 100) * subTotalPerlim; 
                    }
                   
                    num hargaTotal = (totalHarga + totalPerlim);
                    num diskonTotal = (hargaTotal * valueDiskon)/100;
                    num totalDiskon = (hargaTotal - diskonTotal);
                    num ppnTotal = (totalDiskon * valuePPN)/100;
                    num totalPPN = (totalDiskon + ppnTotal);
                    num uangMukaTotal = (totalPPN * uangMuka)/100;
                    num totalUangMukaTotal = (totalPPN - uangMukaTotal);
                    grandTotalHarga = hargaTotal.toString();
                    diskonHarga = diskonTotal.toString();
                    totalSetelahDiskon = totalDiskon.toString();
                    ppnHarga = ppnTotal.toString();
                    totalSetelahPpn = totalPPN.toString();
                    uangMukaHarga = uangMukaTotal.toString();
                    totalUangMukaHarga = totalUangMukaTotal.toString();
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
                                  label: "Tgl. Sales Order",
                                  date: detailFakturPenjualan.data!.detail!.tglSalesOrder,
                                  flexLeftRow: 12,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5)),
                                CardFieldItemText(
                                  label: "No. Sales Order",
                                  contentData: detailFakturPenjualan.data!.detail!.noSalesOrder,
                                  flexLeftRow: 12,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5)),
                                CardFieldItemText(
                                  label: "Sales",
                                  contentData: detailFakturPenjualan.data!.detail!.namaSales,
                                  flexLeftRow: 12,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5)),
                                CardFieldItemText(
                                  label: "Proyek",
                                  contentData: detailFakturPenjualan.data!.detail!.namaProyek,
                                  flexLeftRow: 12,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5)),
                                CardFieldItemText(
                                  label: "Customer",
                                  contentData: detailFakturPenjualan.data!.detail!.namaCustomer,
                                  flexLeftRow: 12,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5)),
                                CardFieldItemDate(
                                  label: "Tgl. Faktur",
                                  date: detailFakturPenjualan.data!.detail!.tglFaktur,
                                  flexLeftRow: 12,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5)),
                                CardFieldItemText(
                                  label: "No. Faktur",
                                  contentData: detailFakturPenjualan.data!.detail!.noFaktur,
                                  flexLeftRow: 12,
                                  flexRightRow: 20,
                                ),
                                // SizedBox(height: getProportionateScreenHeight(5)),
                                // CardFieldItemText(
                                //   label: "Proyek",
                                //   contentData: detailFakturPenjualan.data!.detail!.namaProyek,
                                //   flexLeftRow: 12,
                                //   flexRightRow: 20,
                                // ),
                              ],
                            ),
                          ),
                        ),
                        CardExpansionDetail(
                          label: "Item Faktur Penjualan",
                          children: <Widget> [
                            ListView.separated(
                              separatorBuilder: (context, index) => SizedBox(
                                height: getProportionateScreenHeight(10),
                              ),
                              itemCount: detailFakturPenjualan.data!.detail!.detail!.length,
                              itemBuilder: (BuildContext context, index){
                                return Padding(
                                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                                  child: CardItemExpansionDetail(
                                    child: ListTile(
                                      contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0), vertical: getProportionateScreenHeight(10.0)),
                                      title: HighlightItemName(
                                        child: Text(
                                          detailFakturPenjualan.data!.detail!.detail![index].noSuratJalan.toString(),
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
                                            CardFieldItemDate(
                                              label: "Tgl. Penerimaan Surat Jalan",
                                              date: detailFakturPenjualan.data!.detail!.detail![index].tglPenerimaanSuratJalan,
                                              flexLeftRow: 10,
                                              flexRightRow: 20,
                                            ),
                                            SizedBox(height: getProportionateScreenHeight(10)),
                                            CardFieldItemDate(
                                              label: "Tgl. Surat Jalan",
                                              date: detailFakturPenjualan.data!.detail!.detail![index].tglSuratJalan,
                                              flexLeftRow: 10,
                                              flexRightRow: 20,
                                            ),
                                            SizedBox(height: getProportionateScreenHeight(10)),  
                                            CardFieldItemText(
                                              label: "No. Surat Jalan",
                                              contentData: detailFakturPenjualan.data!.detail!.detail![index].noPenerimaanSuratJalan,
                                              flexLeftRow: 10,
                                              flexRightRow: 20,
                                            ),
                                            SizedBox(height: getProportionateScreenHeight(10)),
                                            CardFieldItemDate(
                                              label: "Tgl. Delivery Order",
                                              date: detailFakturPenjualan.data!.detail!.detail![index].tglDeliveryOrder,
                                              flexLeftRow: 10,
                                              flexRightRow: 20,
                                            ),
                                            SizedBox(height: getProportionateScreenHeight(10)),
                                            CardFieldItemText(
                                              label: "No. Delivery Order",
                                              contentData: detailFakturPenjualan.data!.detail!.detail![index].noDeliveryOrder,
                                              flexLeftRow: 10,
                                              flexRightRow: 20,
                                            ),
                                            SizedBox(height: getProportionateScreenHeight(10)),
                                            CardFieldItemRightRow(
                                              label: "Item Barang",
                                              rightRow: <Widget> [
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 0),
                                                  child: (detailFakturPenjualan.data!.detail!.detail![index].kodeItem != null)
                                                  ? Text(
                                                    "("+
                                                    detailFakturPenjualan.data!.detail!.detail![index].kodeItem.toString()
                                                    +') '+
                                                    detailFakturPenjualan.data!.detail!.detail![index].namaItem.toString(),
                                                    style: TextStyle(
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
                                              flexLeftRow: 10,
                                              flexRightRow: 20,
                                            ),
                                            SizedBox(height: getProportionateScreenHeight(10)),
                                            CardFieldItemText(
                                              label: "Akumulasi Progress",
                                              contentData: detailFakturPenjualan.data!.detail!.detail![index].akumulasiProgress,
                                              flexLeftRow: 10,
                                              flexRightRow: 20,
                                            ),
                                            SizedBox(height: getProportionateScreenHeight(10)),
                                            CardFieldItemRightRow(
                                              label: "Qty. Surat Jalan",
                                              rightRow: <Widget> [
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 0),
                                                  child: (detailFakturPenjualan.data!.detail!.detail![index].qty != null)
                                                  ? Text(
                                                    formatDecimal.format(double.parse(detailFakturPenjualan.data!.detail!.detail![index].qty.toString())).toString()
                                                    +' '+
                                                    detailFakturPenjualan.data!.detail!.detail![index].namaSatuan.toString(),
                                                    style: TextStyle(
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
                                              flexLeftRow: 10,
                                              flexRightRow: 20,
                                            ),
                                            SizedBox(height: getProportionateScreenHeight(10)),
                                            CardFieldItemFormatCurrency(
                                              label: "Harga Satuan",
                                              contentData: detailFakturPenjualan.data!.detail!.detail![index].hargaSatuanJual,
                                              flexLeftRow: 10,
                                              flexRightRow: 20,
                                            ),
                                            SizedBox(height: getProportionateScreenHeight(10)),
                                            CardFieldItemFormatCurrency(
                                              label: "Sub Total",
                                              contentData: subTotalHarga[index].toString(),
                                              flexLeftRow: 10,
                                              flexRightRow: 20,
                                            ),
                                            SizedBox(height: getProportionateScreenHeight(10)),
                                            CardFieldItemText(
                                              label: "Progress",
                                              contentData: "${double.parse(detailFakturPenjualan.data!.detail!.detail![index].persentaseProgress.toString())}%",
                                              flexLeftRow: 10,
                                              flexRightRow: 20,
                                            ),
                                            SizedBox(height: getProportionateScreenHeight(10)),
                                            CardFieldItemFormatCurrency(
                                              label: "Total",
                                              contentData: totalAkumulasiArr[index].toString(),
                                              flexLeftRow: 10,
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
                                        CardFieldItemText(
                                          label: "Akumulasi Progress",
                                          contentData: "${detailFakturPenjualan.data!.detail!.akumulasiPrelim}%",
                                          flexLeftRow: 10,
                                          flexRightRow: 20,
                                        ),
                                        SizedBox(height: getProportionateScreenHeight(10)),
                                        CardFieldItemFormatCurrency(
                                          label: "Sub Total",
                                          contentData: subTotalPerlim.toString(),
                                          flexLeftRow: 10,
                                          flexRightRow: 20,
                                        ),
                                        SizedBox(height: getProportionateScreenHeight(10)),
                                        CardFieldItemText(
                                          label: "Progress",
                                          contentData: "${detailFakturPenjualan.data!.detail!.persentasePrelim}%",
                                          flexLeftRow: 10,
                                          flexRightRow: 20,
                                        ),
                                        SizedBox(height: getProportionateScreenHeight(10)),
                                        CardFieldItemFormatCurrency(
                                          label: "Total",
                                          contentData: totalPerlim.toString(),
                                          flexLeftRow: 10,
                                          flexRightRow: 20,
                                        ),
                                        SizedBox(height: getProportionateScreenHeight(10)),
                                      ],
                                    ),
                                  ),
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
                                        label: "Total",
                                        total: grandTotalHarga,
                                        flexLeftRow: 15,
                                        flexRightRow: 20,
                                      ),
                                      SizedBox(height: getProportionateScreenHeight(5)),
                                      CardFieldItemPercent(
                                        label: "Diskon",
                                        labelValue: detailFakturPenjualan.data!.detail!.diskon,
                                        total: diskonHarga,
                                        flexLeftRow: 15,
                                        flexRightRow: 20,
                                      ),
                                      SizedBox(height: getProportionateScreenHeight(5)),
                                      CardFieldItemTotal(
                                        label: "Total Setelah Diskon",
                                        total: totalSetelahDiskon,
                                        flexLeftRow: 15,
                                        flexRightRow: 20,
                                      ),
                                      SizedBox(height: getProportionateScreenHeight(5)),
                                      CardFieldItemPercent(
                                        label: "PPN",
                                        labelValue: detailFakturPenjualan.data!.detail!.ppn,
                                        total: ppnHarga,
                                        flexLeftRow: 15,
                                        flexRightRow: 20,
                                      ),
                                      SizedBox(height: getProportionateScreenHeight(5)),
                                      CardFieldItemTotal(
                                        label: "Total Setelah PPN",
                                        total: totalSetelahPpn,
                                        flexLeftRow: 15,
                                        flexRightRow: 20,
                                      ),
                                      SizedBox(height: getProportionateScreenHeight(5)),
                                      CardFieldItemPercent(
                                        label: "Uang Muka",
                                        labelValue: detailFakturPenjualan.data!.detail!.uangMuka,
                                        total: uangMukaHarga,
                                        flexLeftRow: 15,
                                        flexRightRow: 20,
                                      ),
                                      SizedBox(height: getProportionateScreenHeight(5)),
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
                            SizedBox(height: getProportionateScreenHeight(10)),
                          ],
                        ),
                        if (detailFakturPenjualan.data!.approval.isNotEmpty)...[
                          CardExpansionDetail(
                            label: "Catatan Approval",
                            children: <Widget> [
                              ListView.separated(
                                separatorBuilder: (context, index) => SizedBox(
                                  height: getProportionateScreenHeight(10),
                                ),
                                itemCount: detailFakturPenjualan.data!.approval.length,
                                itemBuilder: (context, index){
                                  return FieldCatatanApproval(
                                    index: index,
                                    statusApproval: detailFakturPenjualan.data!.approval[index].statusApproval,
                                    namaKaryawan: detailFakturPenjualan.data!.approval[index].namaKaryawan,
                                    catatanApproval: detailFakturPenjualan.data!.approval[index].catatan,
                                    tglApproval: detailFakturPenjualan.data!.approval[index].tglApproval,
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
                                    "REVISE Faktur Penjualan",
                                    "REVISE",
                                    reviseButtonColor,
                                    detailFakturPenjualan.data!.detail!.noFaktur.toString(),
                                    "REV",
                                    _catatanTextEditingController.text,
                                    detailFakturPenjualan.data!.detail!.baseline.toString(),
                                  );
                                }
                              }
                            },
                            onClickedReject: () {
                              if (_formKey.currentState!.validate()) {
                                if (_catatanTextEditingController.text != "") {
                                  showAlertDialog(
                                    "REJECT Faktur Penjualan",
                                    "REJECT",
                                    rejectButtonColor,
                                    detailFakturPenjualan.data!.detail!.noFaktur.toString(),
                                    "REJ",
                                    _catatanTextEditingController.text,
                                    detailFakturPenjualan.data!.detail!.baseline.toString(),
                                  );
                                }
                              }
                            },
                            onClickedVerify: () {
                              if (_formKey.currentState!.validate()) {
                                if (_catatanTextEditingController.text != "") {
                                  showAlertDialog(
                                    "VERIFY Faktur Penjualan",
                                    "VERIFY",
                                    verifyButtonColor,
                                    detailFakturPenjualan.data!.detail!.noFaktur.toString(),
                                    "VER",
                                    _catatanTextEditingController.text,
                                    detailFakturPenjualan.data!.detail!.baseline.toString(),
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
                                    "REJECT Faktur Penjualan",
                                    "REJECT",
                                    rejectButtonColor,
                                    detailFakturPenjualan.data!.detail!.noFaktur.toString(),
                                    "REJ",
                                    _catatanTextEditingController.text,
                                    detailFakturPenjualan.data!.detail!.baseline.toString(),
                                  );
                                } 
                              }
                            },
                            onClickedApprove: () {
                              if (_formKey.currentState!.validate()) {
                                if (_catatanTextEditingController.text != "") {
                                  showAlertDialog(
                                    "APPROVE Faktur Penjualan",
                                    "APPROVE",
                                    verifyButtonColor,
                                    detailFakturPenjualan.data!.detail!.noFaktur.toString(),
                                    "APP",
                                    _catatanTextEditingController.text,
                                    detailFakturPenjualan.data!.detail!.baseline.toString(),
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