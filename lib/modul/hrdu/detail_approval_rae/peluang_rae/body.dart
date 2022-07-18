import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_date.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_right_row.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_text.dart';
import 'package:mgp_mobile_app/widget/component/highlight_item_name.dart';
import 'package:mgp_mobile_app/model/hrdu/rae/detail_peluang_rae.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu.dart';
import 'package:mgp_mobile_app/widget/component/card_detail.dart';
import 'package:mgp_mobile_app/widget/component/card_expansion_detail.dart';
import 'package:mgp_mobile_app/widget/component/card_item_expansion_detail.dart';
import 'package:mgp_mobile_app/widget/component/skeleton.dart';

class Body extends StatefulWidget {
  final String noPeluang;
  const Body({Key? key, required this.noPeluang}) : super(key: key);

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
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  late Future<DetailPeluangRegrae> futureDetailPeluangRegrae;

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 500));
    futureDetailPeluangRegrae = MGPAPI().fetchDetailPeluangRAE(noPeluang: widget.noPeluang);
    initializeDateFormatting();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Form(
              key: _formKey,
              child: FutureBuilder(
                future: futureDetailPeluangRegrae,
                builder: (BuildContext context, AsyncSnapshot<DetailPeluangRegrae> snapshot) {
                  if (snapshot.hasData) {
                    var detailPeluangRAE = snapshot.data;
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
                                  date: detailPeluangRAE!.data!.tglPeluang,
                                  flexLeftRow: 10,
                                  flexRightRow: 20,
                                ),
                                const SizedBox(height: 5),
                                CardFieldItemText(
                                  label: "No. Peluang",
                                  contentData: detailPeluangRAE.data!.noPeluang,
                                  flexLeftRow: 10,
                                  flexRightRow: 20,
                                ),
                                const SizedBox(height: 5),
                                CardFieldItemDate(
                                  label: "Target Penawaran",
                                  date: detailPeluangRAE.data!.tglSelesai,
                                  flexLeftRow: 10,
                                  flexRightRow: 20,
                                ),
                                const SizedBox(height: 5),
                                CardFieldItemDate(
                                  label: "Realisasi Penawaran",
                                  date: detailPeluangRAE.data!.realisasiPenawaran,
                                  flexLeftRow: 10,
                                  flexRightRow: 20,
                                ),
                                const SizedBox(height: 5),
                                CardFieldItemText(
                                  label: "Peringkat Peluang",
                                  contentData: detailPeluangRAE.data!.namaPeringkatPeluang,
                                  flexLeftRow: 10,
                                  flexRightRow: 20,
                                ),
                                const SizedBox(height: 5),
                                CardFieldItemText(
                                  label: "Customer",
                                  contentData: detailPeluangRAE.data!.namaCustomer,
                                  flexLeftRow: 10,
                                  flexRightRow: 20,
                                ),
                                const SizedBox(height: 5),
                                CardFieldItemText(
                                  label: "Proyek",
                                  contentData: detailPeluangRAE.data!.namaProyek,
                                  flexLeftRow: 10,
                                  flexRightRow: 20,
                                ),
                                const SizedBox(height: 5),
                                CardFieldItemText(
                                  label: "ATT",
                                  contentData: detailPeluangRAE.data!.att,
                                  flexLeftRow: 10,
                                  flexRightRow: 20,
                                ),
                                const SizedBox(height: 5),
                                CardFieldItemText(
                                  label: "Schedule Kebutuhan Proyek (Total Hari)",
                                  contentData: detailPeluangRAE.data!.scheduleKebutuhanProyek,
                                  flexLeftRow: 10,
                                  flexRightRow: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                        if (detailPeluangRAE.data!.detail!.isNotEmpty)...[
                          CardExpansionDetail(
                            label: "Item Barang Jadi",
                            children: <Widget> [
                              ListView.separated(
                                separatorBuilder: (context, index) => const SizedBox(
                                  height: 10,
                                ),
                                itemCount: detailPeluangRAE.data!.detail!.length,
                                itemBuilder: (context, index){
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    child: CardItemExpansionDetail(
                                      child: ListTile(
                                        contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                                        title: HighlightItemName(
                                          child: Text(
                                            detailPeluangRAE.data!.detail![index]!.kodeItem.toString(),
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
                                                label: "Barang Jadi",
                                                contentData: detailPeluangRAE.data!.detail![index]!.namaItem,
                                                flexLeftRow: 12,
                                                flexRightRow: 20,
                                              ),
                                              const SizedBox(height: 10),
                                              CardFieldItemText(
                                                label: "Jenis Barang Jadi",
                                                contentData: detailPeluangRAE.data!.detail![index]!.namaJenis,
                                                flexLeftRow: 12,
                                                flexRightRow: 20,
                                              ),
                                              const SizedBox(height: 10),
                                              CardFieldItemRightRow(
                                                label: "Qty",
                                                rightRow: <Widget> [
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 0),
                                                    child: Text(
                                                      formatDecimal.format(
                                                        double.parse(detailPeluangRAE.data!.detail![index]!.qty.toString()
                                                        )
                                                      ).toString()
                                                      +" "+
                                                      detailPeluangRAE.data!.detail![index]!.namaSatuanJual.toString(),
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
                              const SizedBox(height: 10),
                            ]
                          ),
                        ],
                        const SizedBox(height: 30),
                      ],
                    );
                  } else {
                    return Center(
                      child: Column(
                        children: const <Widget>[
                          SizedBox(height: 20),
                          Skeleton(height: 300, width: double.infinity),
                          SizedBox(height: 10),
                          Skeleton(height: 100, width: double.infinity),
                        ],
                      ),
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