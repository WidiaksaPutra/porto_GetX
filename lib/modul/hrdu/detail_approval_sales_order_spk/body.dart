import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mgp_mobile_app/model/hrdu/sales_order_spk/detail_sales_order_spk_model.dart';
import 'package:mgp_mobile_app/modul/hrdu/approval_sales_order_spk/approval_sales_order_spk.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_sales_order_spk/prelim_sales_order_spk/prelim_sales_order_spk.dart';
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
import 'package:mgp_mobile_app/widget/component/card_field_item_url_launcher.dart';
import 'package:mgp_mobile_app/widget/component/card_item_expansion_detail.dart';
import 'package:mgp_mobile_app/widget/component/catatan_approval.dart';
import 'package:mgp_mobile_app/widget/component/error_form.dart';
import 'package:mgp_mobile_app/widget/component/field_catatan_approval.dart';
import 'package:mgp_mobile_app/widget/component/highlight_item_name.dart';
import 'package:mgp_mobile_app/widget/theme/constants.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu.dart';
import 'package:get/get.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
    required this.noSalesOrderSPK,
    required this.statusMenu,
  }) : super(key: key);
  final String noSalesOrderSPK;
  final String statusMenu;

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
  late String grandTotalHarga;
  late String grandTotalPrelim;
  late String diskonHarga;
  late String totalSetelahDiskon;
  late String ppnHarga;
  late String totalSetelahPpn;
  late Future<DetailRegsospk> futureDetailRegsospk;
  final _formKey = GlobalKey<FormState>();
  final _catatanTextEditingController = TextEditingController();
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
            final _postProses = await MGPAPI().postSalesOrderSPK(
              noTransaksi: noTransaksi,
              statusApproval: status,
              catatan: catatan,
              tglApproval: DateTime.now().toString(),
              approvalBaseline: approvalBaseline,
            );
            if (_postProses == "berhasil") {
              Get.offAll(const SalesOrderSPKView());
            }
          },
        );
      }
    );
  }
  
  @override
  void initState() {
    futureDetailRegsospk = MGPAPI().fetchApprovalDetailSalesOrderSPK(noSalesOrderSPK: widget.noSalesOrderSPK);
    initializeDateFormatting();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
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
                    num totalPrelim = 0;
                    if (detailSalesOrderSPK.data!.detail!.prelim!.isNotEmpty) {
                      for (var i = 0; i < detailSalesOrderSPK.data!.detail!.prelim!.length; i++) {
                        num subTotal = double.parse(detailSalesOrderSPK.data!.detail!.prelim![i]!.qtyAnalisa.toString())
                        * double.parse(detailSalesOrderSPK.data!.detail!.prelim![i]!.qtyDurasi.toString())
                        * double.parse(detailSalesOrderSPK.data!.detail!.prelim![i]!.unitPrice.toString())
                        * double.parse(detailSalesOrderSPK.data!.detail!.prelim![i]!.konstanta.toString());
                        totalPrelim = totalPrelim + subTotal;
                      }
                    }
                    double valuePPN = double.parse(snapshot.data!.data!.detail!.ppn.toString());
                    double valueDiskon = double.parse(snapshot.data!.data!.detail!.diskon.toString());
                    num totalHarga = 0;
                    for(var i = 0; i< snapshot.data!.data!.detail!.detail!.length; i++){
                      num subTotal = (double.parse(snapshot.data!.data!.detail!.detail![i]!.hargaRate.toString())) * double.parse(snapshot.data!.data!.detail!.detail![i]!.qtySalesOrderSpk.toString());
                      totalHarga = totalHarga + subTotal;
                      subTotalHarga.add(subTotal.toString());
                    }
                    totalHarga = totalHarga + totalPrelim;
                    grandTotalHarga = totalHarga.toString();
                    num diskonTotal = (totalHarga * valueDiskon)/100;
                    num totalDiskon = (totalHarga - diskonTotal);
                    num ppnTotal = (totalDiskon * valuePPN)/100;
                    num totalPPN = (totalDiskon + ppnTotal);
                    diskonHarga = diskonTotal.toString();
                    totalSetelahDiskon = totalDiskon.toString();
                    ppnHarga = ppnTotal.toString();
                    totalSetelahPpn = totalPPN.toString();
                    grandTotalPrelim = totalPrelim.toString();
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(height: 5),
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
                                const SizedBox(height: 5),
                                CardFieldItemText(
                                  label: "No. Peluang",
                                  contentData: detailSalesOrderSPK.data!.detail!.noPeluang,
                                  flexLeftRow: 13,
                                  flexRightRow: 20,
                                ),
                                const SizedBox(height: 5),
                                CardFieldItemText(
                                  label: "Peringkat Peluang",
                                  contentData: detailSalesOrderSPK.data!.detail!.namaPeringkatPeluang,
                                  flexLeftRow: 13,
                                  flexRightRow: 20,
                                ),
                                const SizedBox(height: 5),
                                CardFieldItemText(
                                  label: "Proyek",
                                  contentData: detailSalesOrderSPK.data!.detail!.namaProyek,
                                  flexLeftRow: 13,
                                  flexRightRow: 20,
                                ),
                                const SizedBox(height: 5),
                                CardFieldItemText(
                                  label: "Schedule Kebutuhan Proyek (Total Hari)",
                                  contentData: detailSalesOrderSPK.data!.detail!.scheduleKebutuhanProyek,
                                  flexLeftRow: 13,
                                  flexRightRow: 20,
                                ),
                                const SizedBox(height: 5),
                                CardFieldItemText(
                                  label: "Customer",
                                  contentData: detailSalesOrderSPK.data!.detail!.namaCustomer,
                                  flexLeftRow: 13,
                                  flexRightRow: 20,
                                ),
                                const SizedBox(height: 5),
                                CardFieldItemText(
                                  label: "ATT",
                                  contentData: detailSalesOrderSPK.data!.detail!.att,
                                  flexLeftRow: 13,
                                  flexRightRow: 20,
                                ),
                                const SizedBox(height: 5),
                                CardFieldItemDate(
                                  label: "Target Penawaran",
                                  date: detailSalesOrderSPK.data!.detail!.tglSelesai,
                                  flexLeftRow: 13,
                                  flexRightRow: 20,
                                ),
                                const SizedBox(height: 5),
                                CardFieldItemDate(
                                  label: "Realisasi Penawaran",
                                  date: detailSalesOrderSPK.data!.detail!.realisasiPenawaran,
                                  flexLeftRow: 13,
                                  flexRightRow: 20,
                                ),
                                const SizedBox(height: 5),
                                CardFieldItemUrlLauncher(
                                  label: "Link Referensi",
                                  linkReferensi: detailSalesOrderSPK.data!.detail!.linkReferensi,
                                  flexLeftRow: 13,
                                  flexRightRow: 20,
                                ),
                                // const SizedBox(height: 5),
                                // CardFieldItemText(
                                //   label: "Segmentasi Pasar",
                                //   contentData: detailSalesOrderSPK.data!.detail!.,
                                //   flexLeftRow: 13,
                                //   flexRightRow: 20,
                                // ),
                                
                              ],
                            ),
                          ),
                        ),
                        CardExpansionDetail(
                          label: "Keterangan Pengiriman",
                          children: <Widget> [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: CardItemExpansionDetail(
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                    child: (detailSalesOrderSPK.data!.detail!.keteranganPengiriman != null)
                                    ? Expanded(
                                      child: Text(detailSalesOrderSPK.data!.detail!.keteranganPengiriman.toString(),
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 14
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
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
                            const SizedBox(height: 10)
                          ],
                        ),
                        CardExpansionDetail(
                          label: "Lokasi Pengiriman",
                          children: <Widget> [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: CardItemExpansionDetail(
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                    child: (detailSalesOrderSPK.data!.detail!.lokasiPengiriman != null)
                                    ? Expanded(
                                      child: Text(detailSalesOrderSPK.data!.detail!.lokasiPengiriman.toString(),
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 14
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
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
                            const SizedBox(height: 10),
                          ],
                        ),
                        CardExpansionDetail(
                          label: "Informasi Lainnya",
                          children: <Widget> [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: CardItemExpansionDetail(
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                    child: (detailSalesOrderSPK.data!.detail!.lainLain != null)
                                    ? Expanded(
                                        child: Html(
                                          data: detailSalesOrderSPK.data!.detail!.lainLain
                                        )
                                      )
                                    : const Text("-",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14
                                      ),
                                      textAlign: TextAlign.left,
                                    )
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
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
                                const SizedBox(height: 5),
                                CardFieldItemText(
                                  label: "No. RAE",
                                  contentData: detailSalesOrderSPK.data!.detail!.noRae,
                                  flexLeftRow: 13,
                                  flexRightRow: 20,
                                ),
                                const SizedBox(height: 5),
                                CardFieldItemDate(
                                  label: "Tgl. RAB",
                                  date: detailSalesOrderSPK.data!.detail!.tglRab,
                                  flexLeftRow: 13,
                                  flexRightRow: 20,
                                ),
                                const SizedBox(height: 5),
                                CardFieldItemText(
                                  label: "No. RAB",
                                  contentData: detailSalesOrderSPK.data!.detail!.noRab,
                                  flexLeftRow: 13,
                                  flexRightRow: 20,
                                ),
                                const SizedBox(height: 5),
                                CardFieldItemDate(
                                  label: "Tgl. Penawaran",
                                  date: detailSalesOrderSPK.data!.detail!.tglPenawaran,
                                  flexLeftRow: 13,
                                  flexRightRow: 20,
                                ),
                                const SizedBox(height: 5),
                                CardFieldItemText(
                                  label: "No. Penawaran",
                                  contentData: detailSalesOrderSPK.data!.detail!.noPenawaran,
                                  flexLeftRow: 13,
                                  flexRightRow: 20,
                                ),
                                const SizedBox(height: 5),
                                CardFieldItemDate(
                                  label: "Tgl. SPK",
                                  date: detailSalesOrderSPK.data!.detail!.tglSpk,
                                  flexLeftRow: 13,
                                  flexRightRow: 20,
                                ),
                                const SizedBox(height: 5),
                                CardFieldItemText(
                                  label: "No. SPK",
                                  contentData: detailSalesOrderSPK.data!.detail!.noSpk,
                                  flexLeftRow: 13,
                                  flexRightRow: 20,
                                ),
                                const SizedBox(height: 5),
                                CardFieldItemDate(
                                  label: "Tgl. Sales Order SPK",
                                  date: detailSalesOrderSPK.data!.detail!.tglSalesOrderSpk,
                                  flexLeftRow: 13,
                                  flexRightRow: 20,
                                ),
                                const SizedBox(height: 5),
                                CardFieldItemText(
                                  label: "No. Sales Order SPK",
                                  contentData: detailSalesOrderSPK.data!.detail!.noSalesOrderSpk,
                                  flexLeftRow: 13,
                                  flexRightRow: 20,
                                ),
                                const SizedBox(height: 5),
                                CardFieldItemDate(
                                  label: "Tgl. Batas Waktu Pengiriman",
                                  date: detailSalesOrderSPK.data!.detail!.tglSelesai,
                                  flexLeftRow: 13,
                                  flexRightRow: 20,
                                ),
                                const SizedBox(height: 5),
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
                              separatorBuilder: (context, index) => const SizedBox(
                                height: 10,
                              ),
                              itemCount: detailSalesOrderSPK.data!.detail!.detail!.length,
                              itemBuilder: (BuildContext context, index){
                                return Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: CardItemExpansionDetail(
                                    child: ListTile(
                                      contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                                      title: HighlightItemName(
                                        child: Text(
                                          detailSalesOrderSPK.data!.detail!.detail![index]!.kodeBarang.toString(),
                                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      subtitle: Padding(
                                        padding: const EdgeInsets.only(top: 15),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            CardFieldItemText(
                                              label: "Nama Barang Jadi",
                                              contentData: detailSalesOrderSPK.data!.detail!.detail![index]!.namaBarang,
                                              flexLeftRow: 13,
                                              flexRightRow: 20,
                                            ),
                                            const SizedBox(height: 10),
                                            CardFieldItemText(
                                              label: "Nama Gudang",
                                              contentData: detailSalesOrderSPK.data!.detail!.detail![index]!.namaGudang,
                                              flexLeftRow: 13,
                                              flexRightRow: 20,
                                            ),
                                            const SizedBox(height: 10),
                                            CardFieldItemRightRow(
                                              label: "Qty",
                                              rightRow: <Widget> [
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 0),
                                                  child: (detailSalesOrderSPK.data!.detail!.detail![index]!.qtySalesOrderSpk != null)
                                                  ? Text(
                                                    formatDecimal.format(double.parse(detailSalesOrderSPK.data!.detail!.detail![index]!.qtySalesOrderSpk.toString())).toString()
                                                    +' '+
                                                    detailSalesOrderSPK.data!.detail!.detail![index]!.namaSatuan.toString(),
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14
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
                                            const SizedBox(height: 10),
                                            CardFieldItemFormatCurrency(
                                              label: "Harga Satuan",
                                              contentData: detailSalesOrderSPK.data!.detail!.detail![index]!.hargaRate,
                                              flexLeftRow: 13, 
                                              flexRightRow: 20,
                                            ),
                                            const SizedBox(height: 10),
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
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: CardItemExpansionDetail(
                                child: ListTile(
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                                  title: const Text(
                                    "PRELIM",
                                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  subtitle: Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        const CardExpansionDetailPrelim(),
                                        const SizedBox(height: 10),
                                        CardFieldItemFormatCurrency(
                                          label: "Harga Satuan",
                                          contentData: grandTotalPrelim,
                                          flexLeftRow: 12,
                                          flexRightRow: 20,
                                        ),
                                        const SizedBox(height: 10),
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
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
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
                                      const SizedBox(height: 5),
                                      CardFieldItemPercent(
                                        label: "Diskon",
                                        labelValue: detailSalesOrderSPK.data!.detail!.diskon,
                                        total: diskonHarga,
                                        flexLeftRow: 15,
                                        flexRightRow: 20,
                                      ),
                                      const SizedBox(height: 5),
                                      CardFieldItemTotal(
                                        label: "Total Setelah Diskon",
                                        total: totalSetelahDiskon,
                                        flexLeftRow: 15,
                                        flexRightRow: 20,
                                      ),
                                      const SizedBox(height: 5),
                                      CardFieldItemPercent(
                                        label: "PPN",
                                        labelValue: detailSalesOrderSPK.data!.detail!.ppn,
                                        total: ppnHarga,
                                        flexLeftRow: 15,
                                        flexRightRow: 20,
                                      ),
                                      const SizedBox(height: 5),
                                      CardFieldItemTotal(
                                        label: "Total Setelah PPN",
                                        total: totalSetelahPpn,
                                        flexLeftRow: 15,
                                        flexRightRow: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10)
                          ],
                        ),
                        if (detailSalesOrderSPK.data!.approval!.isNotEmpty)...[
                          CardExpansionDetail(
                            label: "Catatan Approval",
                            children: <Widget> [
                              ListView.separated(
                                separatorBuilder: (context, index) => const SizedBox(
                                  height: 10,
                                ),
                                itemCount: detailSalesOrderSPK.data!.approval!.length,
                                itemBuilder: (context, index){
                                  return FieldCatatanApproval(
                                    index: index,
                                    statusApproval: detailSalesOrderSPK.data!.approval![index]!.statusApproval,
                                    namaKaryawan: detailSalesOrderSPK.data!.approval![index]!.namaKaryawan,
                                    catatanApproval: detailSalesOrderSPK.data!.approval![index]!.catatan,
                                    tglApproval: detailSalesOrderSPK.data!.approval![index]!.tglApproval,
                                  );
                                },
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                              ),
                              const SizedBox(height: 10),
                            ]
                          ),
                        ],
                        Visibility(
                          visible: visibilityStatusMenu,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 3),
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
                            children: const <Widget>[
                              SizedBox(height: 5),
                              FormErrors(errors: kCatatanError),
                              SizedBox(height: 8),
                            ],
                          )
                        ),
                        Visibility(
                          visible: visibilityStatusMenu,
                          child: const SizedBox(height: 10)
                        ),
                        Visibility(
                          visible: visibilityStatusMenu,
                          child: ButtonPemeriksa(
                            visibilityPemeriksa: visibilityPemeriksa,
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
                            },
                          ),
                        ),
                        const SizedBox(height: 30),
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