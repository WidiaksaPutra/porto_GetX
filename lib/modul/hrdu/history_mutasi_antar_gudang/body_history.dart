
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_mutasi_antar_gudang/detail_approval_mutasi_antar_gudang.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/class_mutasi_antar_gudang.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_right_row.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_date.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_status.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_text.dart';
import 'package:mgp_mobile_app/widget/component/card_list.dart';
import 'package:mgp_mobile_app/widget/component/highlight_item_name.dart';
import 'package:mgp_mobile_app/widget/component/search_field.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class BodyHistory extends StatefulWidget {
  const BodyHistory({Key? key}) : super(key: key);

  @override
  _BodyHistoryState createState() => _BodyHistoryState();
}

class _BodyHistoryState extends State<BodyHistory> with MutasiAntarGudangClass{
  final formatDecimal = NumberFormat("###.###", "id_ID");
  late Future<List<dynamic>> _future;
  final ScrollController _scrollController = ScrollController();
  bool loading = false;
  int pages = 1;

  Future _refreshPage() async{
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      dataList.clear();
      pages = 1;
    });
    _future = fetchHistoryMutasiAntarGudang(page: pages);
  }

  @override
  initState(){
    _future = fetchHistoryMutasiAntarGudang(page: pages);
    initializeDateFormatting();
    super.initState();
    _scrollController.addListener(() async {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent &&!loading) {
        setState(() {
          loading = true;
        });
        await Future.delayed(const Duration(milliseconds: 500));
        setState(() {
          _future = fetchHistoryMutasiAntarGudang(page: pages);
        });
        setState(() {
          loading = false;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(padding: 
        EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Column(
          children: <Widget>[
            SizedBox(height: getProportionateScreenHeight(15)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
              child: const SearchField(),
            ),
            SizedBox(height: getProportionateScreenHeight(5)),
            FutureBuilder(
              future: _future,
              builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot){
                if (snapshot.hasData) {
                  var dataMutasiAntarGudang = snapshot.data;
                  if (dataMutasiAntarGudang!.isNotEmpty) {
                    return Expanded(
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return Stack(
                            children: <Widget>[
                              RefreshIndicator(
                                onRefresh: _refreshPage,
                                child: ListView.builder(
                                  controller: _scrollController,
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount: dataMutasiAntarGudang.length,
                                  itemBuilder: (context, index){
                                    return CardList(
                                      child: ListTile(
                                        contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0), vertical: getProportionateScreenHeight(10.0)),
                                        title: HighlightItemName(
                                          child: Text(
                                            dataMutasiAntarGudang[index].noMutasiAntarGudang.toString(),
                                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
                                                label: "Diajukan oleh",
                                                contentData: dataMutasiAntarGudang[index].namaKaryawanPengaju,
                                                flexLeftRow: 12,
                                                flexRightRow: 20,
                                              ),
                                              SizedBox(height: getProportionateScreenHeight(10)),
                                              CardFieldItemText(
                                                label: "Jabatan",
                                                contentData: dataMutasiAntarGudang[index].namaJabatanPengaju,
                                                flexLeftRow: 12,
                                                flexRightRow: 20,
                                              ),
                                              SizedBox(height: getProportionateScreenHeight(10)),
                                              CardFieldItemDate(
                                                label: "Tgl. Mutasi",
                                                date: dataMutasiAntarGudang[index].tglMutasiAntarGudang,
                                                flexLeftRow: 12,
                                                flexRightRow: 20,
                                              ),
                                              SizedBox(height: getProportionateScreenHeight(10)),
                                              CardFieldItemRightRow(
                                                label: "Item Barang",
                                                rightRow: <Widget> [
                                                  Padding(
                                                    padding: EdgeInsets.only(left: getProportionateScreenWidth(0.0)),
                                                    child: (dataMutasiAntarGudang[index].namaItem != null)
                                                    ? Text(
                                                      dataMutasiAntarGudang[index].kodeItem.toString()
                                                      +" - "+
                                                      dataMutasiAntarGudang[index].namaItem.toString(),
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
                                                flexLeftRow: 12,
                                                flexRightRow: 20,
                                              ),
                                              SizedBox(height: getProportionateScreenHeight(10)),
                                              CardFieldItemRightRow(
                                                label: "Qty Mutasi",
                                                rightRow: <Widget> [
                                                  Padding(
                                                    padding: EdgeInsets.only(left: getProportionateScreenWidth(0.0)),
                                                    child: (dataMutasiAntarGudang[index].qtyMutasi != null)
                                                    ? Text(
                                                      formatDecimal.format(double.parse(dataMutasiAntarGudang[index].qtyMutasi.toString())).toString()
                                                      +" "+
                                                      dataMutasiAntarGudang[index].namaSatuan.toString(),
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
                                                flexLeftRow: 12,
                                                flexRightRow: 20,
                                              ),
                                              SizedBox(height: getProportionateScreenHeight(10)),
                                              CardFieldItemStatus(
                                                contentData: dataMutasiAntarGudang[index].statusApproval,
                                              ),
                                            ],
                                          ),
                                        ), 
                                        onTap: () {
                                          Get.to(
                                            DetailMutasiAntarGudangView(
                                              noMutasiAntarGudang: dataMutasiAntarGudang[index].noMutasiAntarGudang.toString(),
                                              statusMenu: "History",
                                            )
                                          );
                                        },
                                      ),
                                    );
                                  }
                                ),
                              ),
                              if(loading)...[
                                Positioned(
                                  left: 0,
                                  bottom: 0,
                                  child: SizedBox(
                                    height: getProportionateScreenHeight(80),
                                    width: constraints.maxWidth,
                                    child: const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  ),
                                ),
                              ]
                            ],
                          );
                        }
                      ),
                    );
                  } else {
                    return Center(
                      child: Column(
                        children: const <Widget>[
                          Text("Tidak Ada Data")
                        ],
                      ),
                    );
                  }
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }
            ),
          ],
        ),
      ),
    );
  }
}
