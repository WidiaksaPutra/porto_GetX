
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_penerimaan_barang/detail_approval_penerimaan_barang.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/api_penerimaan_barang/api_approval_penerimaan_barang.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_date.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_format_decimal.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_status.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_text.dart';
import 'package:mgp_mobile_app/widget/component/card_list.dart';
import 'package:mgp_mobile_app/widget/component/highlight_item_name.dart';
import 'package:mgp_mobile_app/widget/component/search_field.dart';
import 'package:mgp_mobile_app/widget/component/skeleton.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> with PenerimaanBarangApprovalClass{
  final formatDecimal = NumberFormat("###.###", "id_ID");
  late Future<List<dynamic>> _future;
  final ScrollController _scrollController = ScrollController();
  bool loading = false;
  int pages = 1;

  Future _refreshPage() async{
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      loadingData = false;
      dataList.clear();
      pages = 1;
    });
    _future = fetchApprovalPenerimaanBarang(page: pages);
  }

  @override
  initState(){
    _future = fetchApprovalPenerimaanBarang(page: pages);
    initializeDateFormatting();
    super.initState();
    _scrollController.addListener(() async {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent &&!loading) {
        setState(() {
          loading = true;
        });
        await Future.delayed(const Duration(milliseconds: 500));
        setState(() {
          _future = fetchApprovalPenerimaanBarang(page: pages);
        });
        setState(() {
          loading = false;
        });
      }
    });
  }

  void searchApproval(dynamic value){
    Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      loadingData = false;
      dataList.clear();
      pages = 1;
    });
    if(value.contains("/")){
      _future = fetchApprovalPenerimaanBarang(page: pages, noPenerimaanBarang: value);
    }
    else if(value.contains("PEN") || value.contains("PENDING") || value.contains("Pending") || value.contains("pending") || value.contains("Pen") || value.contains("pen")
    || value.contains("VER") || value.contains("VERIFIED") || value.contains("Verified") || value.contains("verified") || value.contains("Ver") || value.contains("ver")){
      _future = fetchApprovalPenerimaanBarang(page: pages, statusApproval: value);
    }
    else{
      _future = fetchApprovalPenerimaanBarang(page: pages, namaVendor: value);
    }
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
            SearchFieldData(search: searchApproval, refresh: _refreshPage),
            SizedBox(height: getProportionateScreenHeight(5)),
            FutureBuilder(
              future: _future,
              builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot){
                if (snapshot.hasData) {
                  var dataPenerimaanBarang = snapshot.data;
                  if (dataPenerimaanBarang!.isNotEmpty) {
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
                                  itemCount: dataPenerimaanBarang.length,
                                  itemBuilder: (context, index){
                                    return CardList(
                                      child: ListTile(
                                        contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0), vertical: getProportionateScreenHeight(10.0)),
                                        title: HighlightItemName(
                                          child: Text(
                                            dataPenerimaanBarang[index].noPenerimaanBarang.toString(),
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
                                                contentData: dataPenerimaanBarang[index].namaKaryawanPengaju,
                                                flexLeftRow: 12,
                                                flexRightRow: 20,
                                              ),
                                              SizedBox(height: getProportionateScreenHeight(10)),
                                              CardFieldItemText(
                                                label: "Jabatan",
                                                contentData: dataPenerimaanBarang[index].namaJabatanPengaju,
                                                flexLeftRow: 12,
                                                flexRightRow: 20,
                                              ),
                                              SizedBox(height: getProportionateScreenHeight(10)),
                                              CardFieldItemDate(
                                                label: "Tgl. Penerimaan Barang",
                                                date: dataPenerimaanBarang[index].tglPenerimaanBarang,
                                                flexLeftRow: 12,
                                                flexRightRow: 20,
                                              ),
                                              SizedBox(height: getProportionateScreenHeight(10)),
                                              CardFieldItemText(
                                                label: "Vendor",
                                                contentData: dataPenerimaanBarang[index].namaVendor,
                                                flexLeftRow: 12,
                                                flexRightRow: 20,
                                              ),
                                              SizedBox(height: getProportionateScreenHeight(10)),
                                              CardFieldItemText(
                                                label: "Item",
                                                contentData: dataPenerimaanBarang[index].namaItem,
                                                flexLeftRow: 12,
                                                flexRightRow: 20,
                                              ),
                                              SizedBox(height: getProportionateScreenHeight(10)),
                                              CardFieldItemFormatDecimal(
                                                label: "Qty Pakai",
                                                contentData: dataPenerimaanBarang[index].qtyPakai,
                                                flexLeftRow: 12,
                                                flexRightRow: 20,
                                              ),
                                              SizedBox(height: getProportionateScreenHeight(10)),
                                              CardFieldItemStatus(
                                                contentData: dataPenerimaanBarang[index].statusApproval,
                                              ),
                                            ],
                                          ),
                                        ), 
                                        onTap: () {
                                          Get.to(
                                            DetailPenerimaanBarangView(
                                              noPenerimaanBarang: dataPenerimaanBarang[index].noPenerimaanBarang.toString(),
                                              statusMenu: "Approval",
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
                  } else if(loadingData == false){
                    return Positioned(
                      left: 0,
                      bottom: 0,
                      child: SizedBox(
                        height: getProportionateScreenHeight(80),
                        width: double.maxFinite,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    );
                  }
                  else {
                    return Center(
                      child: Column(
                        children: const <Widget>[
                          Text("Tidak Ada Data")
                        ],
                      ),
                    );
                  }
                } else {
                  return Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: getProportionateScreenHeight(5)),
                              Skeleton(
                                width: double.infinity,
                                height: getProportionateScreenHeight(350),
                              ),
                              SizedBox(height: getProportionateScreenHeight(5)),
                            ],
                          ),
                        );
                      }
                    ),
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
