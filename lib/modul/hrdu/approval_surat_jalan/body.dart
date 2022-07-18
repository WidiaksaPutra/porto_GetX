import 'dart:convert';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_surat_jalan/detail_approval_surat_jalan.dart';
import 'package:mgp_mobile_app/model/hrdu/surat_jalan/surat_jalan_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_date.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_right_row.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_status.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_text.dart';
import 'package:mgp_mobile_app/widget/component/card_list.dart';
import 'package:mgp_mobile_app/widget/component/highlight_item_name.dart';
import 'package:mgp_mobile_app/widget/component/search_field.dart';
import 'package:mgp_mobile_app/widget/component/skeleton.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late String? tokens;
  late List<Datum> dataList = [];
  late Future<List<Datum>> _future;
  final ScrollController _scrollController = ScrollController();
  bool loading = false;
  int pages = 1;
  
  Future _refreshPage() async{
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      dataList.clear();
      pages = 1;
    });
    _future = fetchApprovalSuratJalan(page: pages);
  }

  Future<List<Datum>> fetchApprovalSuratJalan({required int page}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    int? perPage = 10;
    Map<String, String>? queryParams = {
      'page' : page.toString(),
      'per_page' : perPage.toString(),
    };
    String? queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = MGPAPI.baseURL + '/approval_surat_jalan/list/?' + queryString;
    final response =
      await MGPAPI.client.get(Uri.parse(requestUrl),
      headers: {
        'Authorization': 'Bearer $tokens',
      }
    );
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      Regsj suratJalanData = Regsj.fromJson(parsed);
      dataList.addAll(suratJalanData.data);
      pages++;
      return dataList;
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  initState(){
    _future = fetchApprovalSuratJalan(page: pages);
    initializeDateFormatting();
    super.initState();
    _scrollController.addListener(() async {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent &&!loading) {
        setState(() {
          loading = true;
        });
        await Future.delayed(const Duration(milliseconds: 500));
        setState(() {
          _future = fetchApprovalSuratJalan(page: pages);
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
        const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: SearchField(),
            ),
            const SizedBox(height: 5),
            FutureBuilder(
              future: _future,
              builder: (BuildContext context, AsyncSnapshot<List<Datum>> snapshot){
                if (snapshot.hasData) {
                  var dataSuratJalan = snapshot.data;
                  if (dataSuratJalan!.isNotEmpty) {
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
                                  itemCount: dataSuratJalan.length,
                                  itemBuilder: (context, index){
                                    return CardList(
                                      child: ListTile(
                                        contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                                        title: HighlightItemName(
                                          child: Text(
                                            dataSuratJalan[index].noSuratJalan.toString(),
                                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
                                                label: "Diajukan oleh",
                                                contentData: dataSuratJalan[index].namaKaryawanPengaju,
                                                flexLeftRow: 12,
                                                flexRightRow: 20,
                                              ),
                                              const SizedBox(height: 10),
                                              CardFieldItemText(
                                                label: "Jabatan",
                                                contentData: dataSuratJalan[index].namaJabatanPengaju,
                                                flexLeftRow: 12,
                                                flexRightRow: 20,
                                              ),
                                              const SizedBox(height: 10),
                                              CardFieldItemDate(
                                                label: "Tgl. Surat Jalan",
                                                date: dataSuratJalan[index].tglSuratJalan,
                                                flexLeftRow: 12,
                                                flexRightRow: 20,
                                              ),
                                              const SizedBox(height: 10),
                                              CardFieldItemText(
                                                label: "No. Delivery Order",
                                                contentData: dataSuratJalan[index].noDeliveryOrder,
                                                flexLeftRow: 12,
                                                flexRightRow: 20,
                                              ),
                                              const SizedBox(height: 10),
                                              CardFieldItemText(
                                                label: "Gudang",
                                                contentData: dataSuratJalan[index].namaGudang,
                                                flexLeftRow: 12,
                                                flexRightRow: 20,
                                              ),
                                              const SizedBox(height: 10),
                                              CardFieldItemText(
                                                label: "Petugas Pengiriman",
                                                contentData: dataSuratJalan[index].namaSopir,
                                                flexLeftRow: 12,
                                                flexRightRow: 20,
                                              ),
                                              const SizedBox(height: 10),
                                              CardFieldItemRightRow(
                                                label: "Armada Pengiriman",
                                                rightRow: <Widget> [
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 0.0),
                                                    child: (dataSuratJalan[index].platNomor != null)
                                                    ? Text(
                                                      dataSuratJalan[index].platNomor.toString()
                                                      +" - "+
                                                      dataSuratJalan[index].namaItemAset.toString(),
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
                                              const SizedBox(height: 10),
                                              CardFieldItemStatus(
                                                contentData: dataSuratJalan[index].statusApproval,
                                              ),
                                            ],
                                          ),
                                        ), 
                                        onTap: () {
                                          Get.to(
                                            DetailSuratJalanView(
                                              noSuratJalan : dataSuratJalan[index].noSuratJalan.toString(),
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
                                    height: 80,
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
                  return Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: const <Widget>[
                              SizedBox(height: 5),
                              Skeleton(
                                width: double.infinity,
                                height: 450,
                              ),
                              SizedBox(height: 5),
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