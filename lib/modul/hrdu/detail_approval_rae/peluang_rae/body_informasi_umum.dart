import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/model/hrdu/rae/detail_peluang_rae.dart';
import 'package:mgp_mobile_app/widget/component/card_expansion_detail.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_date.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_icon.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_right_row.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mgp_mobile_app/widget/component/card_detail.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_text.dart';
import 'package:mgp_mobile_app/widget/component/card_item_expansion_detail.dart';
import 'package:mgp_mobile_app/widget/component/highlight_item_name.dart';
import 'package:mgp_mobile_app/widget/component/skeleton.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class BodyInformasi extends StatefulWidget {
  final Future<DetailPeluangRegrae> futureAnalisaSinglePeluangUmum;
  const BodyInformasi({Key? key, required this.futureAnalisaSinglePeluangUmum}) : super(key: key);

  @override
  _BodyInformasiState createState() => _BodyInformasiState();
}

class _BodyInformasiState extends State<BodyInformasi> {
    final formatCurrency = NumberFormat.currency(
      locale: 'ID',
      decimalDigits: 0,
      symbol: "Rp"
    );
    final formatDecimal = NumberFormat("###.######", "id_ID");
    final decimalFormat = NumberFormat("###", "id_ID");
    final _formKey = GlobalKey<FormState>();
    final List<String> errors = [];
    late Future<DetailPeluangRegrae> futureDetailPeluangRegrae;
  @override
  void initState() {
    initializeDateFormatting();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15).w),
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: FutureBuilder(
              future: widget.futureAnalisaSinglePeluangUmum,
              builder: (BuildContext context, AsyncSnapshot<DetailPeluangRegrae> snapshot) {
                if (snapshot.hasData) {
                  var detailPeluangRAE = snapshot.data;
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
                                date: detailPeluangRAE!.data!.tglPeluang,
                                flexLeftRow: 10,
                                flexRightRow: 20,
                              ),
                              SizedBox(height: getProportionateScreenHeight(5).h),
                              CardFieldItemText(
                                label: "No. Peluang",
                                contentData: detailPeluangRAE.data!.noPeluang,
                                flexLeftRow: 10,
                                flexRightRow: 20,
                              ),
                              SizedBox(height: getProportionateScreenHeight(5).h),
                              CardFieldItemDate(
                                label: "Target Penawaran",
                                date: detailPeluangRAE.data!.tglSelesai,
                                flexLeftRow: 10,
                                flexRightRow: 20,
                              ),
                              SizedBox(height: getProportionateScreenHeight(5).h),
                              CardFieldItemDate(
                                label: "Realisasi Penawaran",
                                date: detailPeluangRAE.data!.realisasiPenawaran,
                                flexLeftRow: 10,
                                flexRightRow: 20,
                              ),
                              SizedBox(height: getProportionateScreenHeight(5).h),
                              CardFieldItemText(
                                label: "Peringkat Peluang",
                                contentData: detailPeluangRAE.data!.namaPeringkatPeluang,
                                flexLeftRow: 10,
                                flexRightRow: 20,
                              ),
                              SizedBox(height: getProportionateScreenHeight(5).h),
                              CardFieldItemText(
                                label: "Customer",
                                contentData: detailPeluangRAE.data!.namaCustomer,
                                flexLeftRow: 10,
                                flexRightRow: 20,
                              ),
                              SizedBox(height: getProportionateScreenHeight(5).h),
                              CardFieldItemText(
                                label: "Proyek",
                                contentData: detailPeluangRAE.data!.namaProyek,
                                flexLeftRow: 10,
                                flexRightRow: 20,
                              ),
                              SizedBox(height: getProportionateScreenHeight(5).h),
                              CardFieldItemText(
                                label: "ATT",
                                contentData: detailPeluangRAE.data!.att,
                                flexLeftRow: 10,
                                flexRightRow: 20,
                              ),
                              SizedBox(height: getProportionateScreenHeight(5).h),
                              CardFieldItemText(
                                label: "Kelompok Proyek",
                                contentData: detailPeluangRAE.data!.kelompokProyek,
                                flexLeftRow: 10,
                                flexRightRow: 20,
                              ),
                              SizedBox(height: getProportionateScreenHeight(5).h),
                              CardFieldItemText(
                                label: "Keterangan Pengiriman",
                                contentData: detailPeluangRAE.data!.keteranganPengiriman,
                                flexLeftRow: 10,
                                flexRightRow: 20,
                              ),
                              SizedBox(height: getProportionateScreenHeight(5).h),
                              CardFieldItemText(
                                label: "Schedule Kebutuhan Proyek (Total Hari)",
                                contentData: detailPeluangRAE.data!.scheduleKebutuhanProyek,
                                flexLeftRow: 10,
                                flexRightRow: 20,
                              ),
                              SizedBox(height: getProportionateScreenHeight(5).h),
                              CardFieldItemText(
                                label: "Lokasi Pengiriman",
                                contentData: detailPeluangRAE.data!.lokasiPengiriman,
                                flexLeftRow: 10,
                                flexRightRow: 20,
                              ),
                              SizedBox(height: getProportionateScreenHeight(5).h),
                              CardFieldItemIcon(
                                label: "Instalasi",
                                status: detailPeluangRAE.data!.instalasi,
                                flexLeftRow: 10,
                                flexRightRow: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                      CardExpansionDetail(
                        label: "Informasi Lainnya",
                        children: <Widget> [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
                            child: CardItemExpansionDetail(
                              child: SizedBox(
                                width: double.infinity,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w, vertical: getProportionateScreenHeight(10).h),
                                  child : (detailPeluangRAE.data!.lainLain != null)
                                  ? Html(
                                      data: detailPeluangRAE.data!.lainLain
                                    )
                                  : Text("-",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.sp
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: getProportionateScreenHeight(10).h),
                        ],
                      ),
                      if (detailPeluangRAE.data!.detail!.isNotEmpty)...[
                        CardExpansionDetail(
                          label: "Barang Jadi",
                          children: <Widget> [
                            ListView.separated(
                              separatorBuilder: (context, index) => SizedBox(
                                height: getProportionateScreenHeight(10).h,
                              ),
                              itemCount: detailPeluangRAE.data!.detail!.length,
                              itemBuilder: (context, index){
                                return Padding(
                                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
                                  child: CardItemExpansionDetail(
                                    child: ListTile(
                                      contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0).w, vertical: getProportionateScreenHeight(10.0).h),
                                      title: HighlightItemName(
                                        child: Text(
                                          detailPeluangRAE.data!.detail![index].kodeItem.toString(),
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
                                              label: "Nama Barang Jadi",
                                              contentData: detailPeluangRAE.data!.detail![index].namaItem,
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
                                                      double.parse(detailPeluangRAE.data!.detail![index].qty.toString()
                                                      )
                                                    ).toString()
                                                    +" "+
                                                    detailPeluangRAE.data!.detail![index].namaSatuanJual.toString(),
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
                      SizedBox(height: getProportionateScreenHeight(30).h),
                    ],
                  );
                } else {
                  return Center(
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: getProportionateScreenHeight(20).h),
                        Skeleton(height: getProportionateScreenHeight(300).h, width: double.infinity),
                        SizedBox(height: getProportionateScreenHeight(10).h),
                        Skeleton(height: getProportionateScreenHeight(100).h, width: double.infinity),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}