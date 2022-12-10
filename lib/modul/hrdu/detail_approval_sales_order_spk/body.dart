import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mgp_mobile_app/controller_getX/default/getX_default_visibility_detail.dart';
import 'package:mgp_mobile_app/model/hrdu/sales_order_spk/detail_sales_order_spk_model.dart';
import 'package:mgp_mobile_app/modul/hrdu/approval_sales_order_spk/approval_sales_order_spk.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_sales_order_spk/prelim_sales_order_spk/prelim_sales_order_spk.dart';
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
import 'package:mgp_mobile_app/widget/component/card_field_item_url_launcher.dart';
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
    required this.noSalesOrderSPK,
    required this.idSalesOrderSpk,
    required this.statusMenu,
  }) : super(key: key);
  final String noSalesOrderSPK;
  final String idSalesOrderSpk;
  final String statusMenu;

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final formatDecimal = NumberFormat("###.###", "id_ID");
  late List subTotalHarga = [];
  late String grandTotalHarga;
  late String grandTotalPrelim;
  late String diskonHarga;
  late String totalSetelahDiskon;
  late String ppnHarga;
  late String totalSetelahPpn;
  late String uangMukaHarga;
  late String totalUangMukaHarga;
  late Future<DetailRegsospk> futureDetailRegsospk;
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
            final _postProses = await MGPAPI().postSalesOrderSPK(
              noTransaksi: noTransaksi,
              statusApproval: status,
              catatan: catatan,
              tglApproval: DateTime.now().toString(),
              approvalBaseline: approvalBaseline,
            );
            if (_postProses == "berhasil") {
              setState(() {
                Get.off(const SalesOrderSPKView());
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
    futureDetailRegsospk = MGPAPI().fetchApprovalDetailSalesOrderSPK(noSalesOrderSpk: widget.noSalesOrderSPK, idSalesOrderSpk: widget.idSalesOrderSpk);
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
              child: FutureBuilder<DetailRegsospk>(
                future: futureDetailRegsospk,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var detailSalesOrderSPK = snapshot.data;
                    String status = detailSalesOrderSPK!.data!.behavior.toString();
                    num totalPrelim = 0;
                    Get.put(DefaultVisibilityDetail()).defaultButtonVisibilityDetail(status.toString());
                    Get.put(DefaultVisibilityDetail()).defaultApprovalVisibilityDetail(widget.statusMenu);

                    if (detailSalesOrderSPK.data!.detail!.prelim!.isNotEmpty) {
                      for (var i = 0; i < detailSalesOrderSPK.data!.detail!.prelim!.length; i++) {
                        totalPrelim = totalPrelim + double.parse(detailSalesOrderSPK.data!.detail!.prelim![i].unitPrice.toString());
                      }
                    }

                    double valuePPN = double.parse(snapshot.data!.data!.detail!.ppn.toString());
                    double valueDiskon = double.parse(snapshot.data!.data!.detail!.diskon.toString());
                    double uangMuka = double.parse(snapshot.data!.data!.detail!.uangMuka.toString());
                    num totalHarga = 0;
                    for(var i = 0; i< snapshot.data!.data!.detail!.detail!.length; i++){
                      num subTotal = (double.parse(snapshot.data!.data!.detail!.detail![i].hargaRate.toString())) * double.parse(snapshot.data!.data!.detail!.detail![i].qtySalesOrderSpk.toString());
                      totalHarga = totalHarga + subTotal;
                      subTotalHarga.add(subTotal.toString());
                    }
                    totalHarga = totalHarga + totalPrelim;
                    grandTotalHarga = totalHarga.toString();
                    num diskonTotal = (totalHarga * valueDiskon)/100;
                    num totalDiskon = (totalHarga - diskonTotal);
                    num ppnTotal = (totalDiskon * valuePPN)/100;
                    num totalPPN = (totalDiskon + ppnTotal);
                    num uangMukaTotal = (totalPPN * uangMuka)/100;
                    num totalUangMukaTotal = (totalPPN - uangMukaTotal);
                    diskonHarga = diskonTotal.toString();
                    totalSetelahDiskon = totalDiskon.toString();
                    ppnHarga = ppnTotal.toString();
                    totalSetelahPpn = totalPPN.toString();
                    grandTotalPrelim = totalPrelim.toString();
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
                                  label: "Tgl. Peluang",
                                  date: detailSalesOrderSPK.data!.detail!.tglPeluang,
                                  flexLeftRow: 13,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5)),
                                CardFieldItemText(
                                  label: "No. Peluang",
                                  contentData: detailSalesOrderSPK.data!.detail!.noPeluang,
                                  flexLeftRow: 13,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5)),
                                CardFieldItemText(
                                  label: "Peringkat Peluang",
                                  contentData: detailSalesOrderSPK.data!.detail!.namaPeringkatPeluang,
                                  flexLeftRow: 13,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5)),
                                CardFieldItemText(
                                  label: "Proyek",
                                  contentData: detailSalesOrderSPK.data!.detail!.namaProyek,
                                  flexLeftRow: 13,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5)),
                                CardFieldItemText(
                                  label: "Schedule Kebutuhan Proyek (Total Hari)",
                                  contentData: detailSalesOrderSPK.data!.detail!.scheduleKebutuhanProyek,
                                  flexLeftRow: 13,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5)),
                                CardFieldItemText(
                                  label: "Customer",
                                  contentData: detailSalesOrderSPK.data!.detail!.namaCustomer,
                                  flexLeftRow: 13,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5)),
                                CardFieldItemText(
                                  label: "ATT",
                                  contentData: detailSalesOrderSPK.data!.detail!.att,
                                  flexLeftRow: 13,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5)),
                                CardFieldItemDate(
                                  label: "Target Penawaran",
                                  date: detailSalesOrderSPK.data!.detail!.tglSelesai,
                                  flexLeftRow: 13,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5)),
                                CardFieldItemDate(
                                  label: "Realisasi Penawaran",
                                  date: detailSalesOrderSPK.data!.detail!.realisasiPenawaran,
                                  flexLeftRow: 13,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5)),
                                CardFieldItemUrlLauncher(
                                  label: "Link Referensi",
                                  linkReferensi: detailSalesOrderSPK.data!.detail!.linkReferensi,
                                  flexLeftRow: 13,
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
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10), horizontal: getProportionateScreenWidth(10)),
                                    child: (detailSalesOrderSPK.data!.detail!.keteranganPengiriman != null)
                                    ? Text(
                                        detailSalesOrderSPK.data!.detail!.keteranganPengiriman.toString(),
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
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10), vertical: getProportionateScreenHeight(10)),
                                    child: (detailSalesOrderSPK.data!.detail!.lokasiPengiriman != null)
                                    ? Text(
                                        detailSalesOrderSPK.data!.detail!.lokasiPengiriman.toString(),
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
                                ),
                              ),
                            ),
                            SizedBox(height: getProportionateScreenHeight(10)),
                          ],
                        ),
                        CardExpansionDetail(
                          label: "Informasi Lainnya",
                          children: <Widget> [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                              child: CardItemExpansionDetail(
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10), vertical: getProportionateScreenHeight(10)),
                                    child : (detailSalesOrderSPK.data!.detail!.lainLain != null)
                                    ? Html(
                                        data: detailSalesOrderSPK.data!.detail!.lainLain
                                      )
                                    : Text("-",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: getProportionateScreenHeight(10)),
                          ],
                        ),
                        CardDetail(
                          child: ListTile(
                            subtitle: Column(
                              children: <Widget>[
                                CardFieldItemDate(
                                  label: "Tgl. RAE",
                                  date: detailSalesOrderSPK.data!.detail!.tglRae,
                                  flexLeftRow: 13,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5)),
                                CardFieldItemText(
                                  label: "No. RAE",
                                  contentData: detailSalesOrderSPK.data!.detail!.noRae,
                                  flexLeftRow: 13,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5)),
                                CardFieldItemDate(
                                  label: "Tgl. RAB",
                                  date: detailSalesOrderSPK.data!.detail!.tglRab,
                                  flexLeftRow: 13,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5)),
                                CardFieldItemText(
                                  label: "No. RAB",
                                  contentData: detailSalesOrderSPK.data!.detail!.noRab,
                                  flexLeftRow: 13,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5)),
                                CardFieldItemDate(
                                  label: "Tgl. Penawaran",
                                  date: detailSalesOrderSPK.data!.detail!.tglPenawaran,
                                  flexLeftRow: 13,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5)),
                                CardFieldItemText(
                                  label: "No. Penawaran",
                                  contentData: detailSalesOrderSPK.data!.detail!.noPenawaran,
                                  flexLeftRow: 13,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5)),
                                CardFieldItemDate(
                                  label: "Tgl. SPK",
                                  date: detailSalesOrderSPK.data!.detail!.tglSpk,
                                  flexLeftRow: 13,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5)),
                                CardFieldItemText(
                                  label: "No. SPK",
                                  contentData: detailSalesOrderSPK.data!.detail!.noSpk,
                                  flexLeftRow: 13,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5)),
                                CardFieldItemDate(
                                  label: "Tgl. Sales Order SPK",
                                  date: detailSalesOrderSPK.data!.detail!.tglSalesOrderSpk,
                                  flexLeftRow: 13,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5)),
                                CardFieldItemText(
                                  label: "No. Sales Order SPK",
                                  contentData: detailSalesOrderSPK.data!.detail!.noSalesOrderSpk,
                                  flexLeftRow: 13,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5)),
                                CardFieldItemDate(
                                  label: "Tgl. Batas Waktu Pengiriman",
                                  date: detailSalesOrderSPK.data!.detail!.tglBatasWaktu,
                                  flexLeftRow: 13,
                                  flexRightRow: 20,
                                ),
                                SizedBox(height: getProportionateScreenHeight(5)),
                                CardFieldItemText(
                                  label: "Sales",
                                  contentData: detailSalesOrderSPK.data!.detail!.namaSales,
                                  flexLeftRow: 13,
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
                              itemCount: detailSalesOrderSPK.data!.detail!.detail!.length,
                              itemBuilder: (BuildContext context, index){
                                return Padding(
                                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                                  child: CardItemExpansionDetail(
                                    child: ListTile(
                                      contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0), vertical: getProportionateScreenHeight(10.0)),
                                      title: HighlightItemName(
                                        child: Text(
                                          detailSalesOrderSPK.data!.detail!.detail![index].kodeBarang.toString(),
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
                                              label: "Nama Barang Jadi",
                                              contentData: detailSalesOrderSPK.data!.detail!.detail![index].namaBarang,
                                              flexLeftRow: 13,
                                              flexRightRow: 20,
                                            ),
                                            SizedBox(height: getProportionateScreenHeight(10)),
                                            CardFieldItemText(
                                              label: "Nama Gudang",
                                              contentData: detailSalesOrderSPK.data!.detail!.detail![index].namaGudang,
                                              flexLeftRow: 13,
                                              flexRightRow: 20,
                                            ),
                                            SizedBox(height: getProportionateScreenHeight(10)),
                                            CardFieldItemRightRow(
                                              label: "Qty",
                                              rightRow: <Widget> [
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 0),
                                                  child: (detailSalesOrderSPK.data!.detail!.detail![index].qtySalesOrderSpk != null)
                                                  ? Text(
                                                    formatDecimal.format(double.parse(detailSalesOrderSPK.data!.detail!.detail![index].qtySalesOrderSpk.toString())).toString()
                                                    +' '+
                                                    detailSalesOrderSPK.data!.detail!.detail![index].namaSatuan.toString(),
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
                                              flexLeftRow: 13,
                                              flexRightRow: 20,
                                            ),
                                            SizedBox(height: getProportionateScreenHeight(10)),
                                            CardFieldItemFormatCurrency(
                                              label: "Harga Satuan",
                                              contentData: detailSalesOrderSPK.data!.detail!.detail![index].hargaRate,
                                              flexLeftRow: 13, 
                                              flexRightRow: 20,
                                            ),
                                            SizedBox(height: getProportionateScreenHeight(10)),
                                            CardFieldItemFormatCurrency(
                                              label: "Sub Total",
                                              contentData: subTotalHarga[index],
                                              flexLeftRow: 13, 
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
                                    Get.to(AnalisaPrelimSalesOrderSPKView(detailRegsospk: futureDetailRegsospk, grandTotalPrelim: grandTotalPrelim));
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
                                        label: "Total",
                                        total: grandTotalHarga,
                                        flexLeftRow: 15,
                                        flexRightRow: 20,
                                      ),
                                      SizedBox(height: getProportionateScreenHeight(5)),
                                      CardFieldItemPercent(
                                        label: "Diskon",
                                        labelValue: detailSalesOrderSPK.data!.detail!.diskon,
                                        total: diskonHarga,
                                        flexLeftRow: 15,
                                        flexRightRow: 20,
                                      ),
                                      SizedBox(height: getProportionateScreenHeight(5)),
                                      CardFieldItemTotal(
                                        label: "Total Setelah Dikurangi Diskon",
                                        total: totalSetelahDiskon,
                                        flexLeftRow: 15,
                                        flexRightRow: 20,
                                      ),
                                      SizedBox(height: getProportionateScreenHeight(5)),
                                      CardFieldItemPercent(
                                        label: "PPN",
                                        labelValue: detailSalesOrderSPK.data!.detail!.ppn,
                                        total: ppnHarga,
                                        flexLeftRow: 15,
                                        flexRightRow: 20,
                                      ),
                                      SizedBox(height: getProportionateScreenHeight(5)),
                                      CardFieldItemTotal(
                                        label: "Total Setelah Ditambah PPN",
                                        total: totalSetelahPpn,
                                        flexLeftRow: 15,
                                        flexRightRow: 20,
                                      ),
                                      SizedBox(height: getProportionateScreenHeight(5)),
                                      CardFieldItemPercent(
                                        label: "Uang Muka",
                                        labelValue: detailSalesOrderSPK.data!.detail!.uangMuka,
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
                                      SizedBox(height: getProportionateScreenHeight(5)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: getProportionateScreenHeight(10))
                          ],
                        ),
                        if (detailSalesOrderSPK.data!.approval.isNotEmpty)...[
                          CardExpansionDetail(
                            label: "Catatan Approval",
                            children: <Widget> [
                              ListView.separated(
                                separatorBuilder: (context, index) => SizedBox(
                                  height: getProportionateScreenHeight(10),
                                ),
                                itemCount: detailSalesOrderSPK.data!.approval.length,
                                itemBuilder: (context, index){
                                  return FieldCatatanApproval(
                                    index: index,
                                    statusApproval: detailSalesOrderSPK.data!.approval[index].statusApproval,
                                    namaKaryawan: detailSalesOrderSPK.data!.approval[index].namaKaryawan,
                                    catatanApproval: detailSalesOrderSPK.data!.approval[index].catatan,
                                    tglApproval: detailSalesOrderSPK.data!.approval[index].tglApproval,
                                  );
                                },
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                              ),
                              SizedBox(height: getProportionateScreenHeight(10)),
                            ]
                          ),
                        ],
                        GetX<DefaultVisibilityDetail>(
                          init: DefaultVisibilityDetail(),
                          builder:(controller2) => Column(
                            children: [
                              Visibility(
                                visible: controller2.visibilityStatusMenu.value,
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
                                visible: controller2.catatanError.value,
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(height: getProportionateScreenHeight(5)),
                                    const FormErrors(errors: kCatatanError),
                                    SizedBox(height: getProportionateScreenHeight(8)),
                                  ],
                                )
                              ),
                              Visibility(
                                visible: controller2.visibilityStatusMenu.value,
                                child: SizedBox(height: getProportionateScreenHeight(10))
                              ),
                              Visibility(
                                visible: controller2.visibilityStatusMenu.value,
                                child: ButtonPemeriksa(
                                  visibilityPemeriksa: controller2.visibilityPemeriksa.value,
                                  onClickedRevise: () {
                                    if (_formKey.currentState!.validate()) {
                                      if (_catatanTextEditingController.text != "") {
                                        showAlertDialog(
                                          "REVISE Sales Order SPK",
                                          "REVISE",
                                          reviseButtonColor,
                                          detailSalesOrderSPK.data!.detail!.noSalesOrderSpk.toString(),
                                          "REV",
                                          _catatanTextEditingController.text,
                                          detailSalesOrderSPK.data!.detail!.baseline.toString(),
                                        );
                                      }
                                    }
                                  },
                                  onClickedReject: () {
                                    if (_formKey.currentState!.validate()) {
                                      if (_catatanTextEditingController.text != "") {
                                        showAlertDialog(
                                          "REJECT Sales Order SPK",
                                          "REJECT",
                                          rejectButtonColor,
                                          detailSalesOrderSPK.data!.detail!.noSalesOrderSpk.toString(),
                                          "REJ",
                                          _catatanTextEditingController.text,
                                          detailSalesOrderSPK.data!.detail!.baseline.toString(),
                                        );
                                      }
                                    }
                                  },
                                  onClickedVerify: () {
                                    if (_formKey.currentState!.validate()) {
                                      if (_catatanTextEditingController.text != "") {
                                        showAlertDialog(
                                          "VERIFY Sales Order SPK",
                                          "VERIFY",
                                          verifyButtonColor,
                                          detailSalesOrderSPK.data!.detail!.noSalesOrderSpk.toString(),
                                          "VER",
                                          _catatanTextEditingController.text,
                                          detailSalesOrderSPK.data!.detail!.baseline.toString(),
                                        );
                                      }
                                    }
                                  }, isLoading: isLoading,
                                ),
                              ),
                              Visibility(
                                visible: controller2.visibilityStatusMenu.value,
                                child: ButtonPengesah(
                                  visibilityPengesah: controller2.visibilityPengesah.value,
                                  onClickedReject: () {
                                    if (_formKey.currentState!.validate()) {
                                      if (_catatanTextEditingController.text != "") {
                                        showAlertDialog(
                                          "REJECT Sales Order SPK",
                                          "REJECT",
                                          rejectButtonColor,
                                          detailSalesOrderSPK.data!.detail!.noSalesOrderSpk.toString(),
                                          "REJ",
                                          _catatanTextEditingController.text,
                                          detailSalesOrderSPK.data!.detail!.baseline.toString(),
                                        );
                                      }
                                    }
                                  },
                                  onClickedApprove: () {
                                    if (_formKey.currentState!.validate()) {
                                      if (_catatanTextEditingController.text != "") {
                                        showAlertDialog(
                                          "APPROVE Sales Order SPK",
                                          "APPROVE",
                                          verifyButtonColor,
                                          detailSalesOrderSPK.data!.detail!.noSalesOrderSpk.toString(),
                                          "APP",
                                          _catatanTextEditingController.text,
                                          detailSalesOrderSPK.data!.detail!.baseline.toString(),
                                        );
                                      }
                                    }
                                  }, isLoading: isLoading,
                                ),
                              ),
                              SizedBox(height: getProportionateScreenHeight(30)),
                            ]
                          ),
                        ),
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