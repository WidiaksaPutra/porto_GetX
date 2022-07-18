import 'dart:convert';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mgp_mobile_app/model/hrdu/harga_perkiraan_sendiri/harga_perkiraan_sendiri_model.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_date.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_format_currency.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_text.dart';
import 'package:mgp_mobile_app/widget/component/card_list.dart';
import 'package:mgp_mobile_app/widget/component/highlight_item_name.dart';
import 'package:mgp_mobile_app/widget/component/icon_filter.dart';
import 'package:mgp_mobile_app/widget/component/search_field.dart';
import 'package:mgp_mobile_app/widget/component/skeleton.dart';
import 'package:mgp_mobile_app/widget/theme/constants.dart';
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
  late int totalPages;
  final String groupBuaso = "";

  Future<List<Datum>> fetchReportHargaPerkiraanSendiriGroup({required int page, required String group}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    int? perPage = 10;
    Map<String, String>? queryParams = {
      'page' : page.toString(),
      'per_page' : perPage.toString(),
      'grup_buaso' : group,
    };
    String? queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = MGPAPI.baseURL + '/harga_perkiraan_sendiri/page?' + queryString;
    final response =
      await MGPAPI.client.get(Uri.parse(requestUrl),
      headers: {
        'Authorization': 'Bearer $tokens',
      }
    ).timeout(const Duration(seconds: 10));
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      MasHps hargaPerkiraanSendiriData = MasHps.fromJson(parsed);
      dataList.addAll(hargaPerkiraanSendiriData.data);
      pages++;
      return dataList;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<Datum>> fetchReportHargaPerkiraanSendiri({required int page}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    int? perPage = 10;
    Map<String, String>? queryParams = {
      'page' : page.toString(),
      'per_page' : perPage.toString(),
    };
    String? queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = MGPAPI.baseURL + '/harga_perkiraan_sendiri/page?' + queryString;
    final response =
      await MGPAPI.client.get(Uri.parse(requestUrl),
      headers: {
        'Authorization': 'Bearer $tokens',
      }
    ).timeout(const Duration(seconds: 10));
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      MasHps hargaPerkiraanSendiriData = MasHps.fromJson(parsed);
      dataList.addAll(hargaPerkiraanSendiriData.data);
      pages++;
      return dataList;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future _refreshPage() async {
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      dataList.clear();
      pages = 1;
    });
    _future = fetchReportHargaPerkiraanSendiri(page: pages);
  }

  Future _refreshPageGroup() async {
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      dataList.clear();
      pages = 1;
    });
    _future = fetchReportHargaPerkiraanSendiriGroup(page: pages, group: groupBuaso);
  }

  @override
  initState(){
    _future = fetchReportHargaPerkiraanSendiri(page: pages);
    initializeDateFormatting();
    super.initState();
    _scrollController.addListener(() async {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent &&!loading) {
        setState(() {
          loading = true;
        });
        await Future.delayed(const Duration(milliseconds: 500));
        if (groupBuaso == "") {
          setState(() {
            _future = fetchReportHargaPerkiraanSendiri(page: pages);
          });
        } else {
          setState(() {
            _future = fetchReportHargaPerkiraanSendiriGroup(page: pages, group: groupBuaso);
          });
        }
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: <Widget> [
                  const Expanded(
                    child: SearchField()
                  ),
                  DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      alignment: AlignmentDirectional.bottomEnd,
                      customButton: const IconFilter(),
                      customItemsHeight: 0,
                      items: [
                        ...FilterItems.firstItems.map(
                          (item) =>
                          DropdownMenuItem<FilterItem>(
                            value: item,
                            child: FilterItems.buildItem(item),
                          ),
                        ),
                      ],
                      onChanged: (item) {
                        // FilterItems.onChanged(context, value as FilterItem);
                        setState(() {
                          
                        });
                      },
                      itemHeight: 48,
                      itemPadding: const EdgeInsets.only(left: 16, right: 16),
                      dropdownWidth: 153,
                      dropdownPadding: const EdgeInsets.symmetric(vertical: 6),
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: colorCardItem,
                      ),
                      dropdownElevation: 8,
                      offset: const Offset(-99, -5),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            FutureBuilder(
              future: _future,
              builder: (BuildContext context, AsyncSnapshot<List<Datum>> snapshot){
                if (snapshot.hasData) {
                  var dataHargaPerkiraanSendiri = snapshot.data;
                  if (dataHargaPerkiraanSendiri!.isNotEmpty) {
                    return Expanded(
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return Stack(
                            children: <Widget>[
                              RefreshIndicator(
                                onRefresh: (groupBuaso == "") ? _refreshPage : _refreshPageGroup,
                                child: ListView.builder(
                                  controller: _scrollController,
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount: dataHargaPerkiraanSendiri.length,
                                  itemBuilder: (context, index){
                                    return CardList(
                                      child: ListTile(
                                        contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                                        title: HighlightItemName(
                                          child: Text(
                                            dataHargaPerkiraanSendiri[index].kodeItem.toString(),
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
                                                label: "Nama Item",
                                                contentData: dataHargaPerkiraanSendiri[index].namaItem,
                                                flexLeftRow: 12,
                                                flexRightRow: 20,
                                              ),
                                              const SizedBox(height: 10),
                                              CardFieldItemText(
                                                label: "Grup Buaso",
                                                contentData: dataHargaPerkiraanSendiri[index].grupBuaso,
                                                flexLeftRow: 12,
                                                flexRightRow: 20,
                                              ),
                                              const SizedBox(height: 10),
                                              CardFieldItemText(
                                                label: "Satuan Pakai",
                                                contentData: dataHargaPerkiraanSendiri[index].satuanPakai,
                                                flexLeftRow: 12,
                                                flexRightRow: 20,
                                              ),
                                              const SizedBox(height: 10),
                                              CardFieldItemFormatCurrency(
                                                label: "HPS Pakai",
                                                contentData: dataHargaPerkiraanSendiri[index].hpsPakai,
                                                flexLeftRow: 12,
                                                flexRightRow: 20,
                                              ),
                                              const SizedBox(height: 10),
                                              CardFieldItemText(
                                                label: "Satuan Beli",
                                                contentData: dataHargaPerkiraanSendiri[index].satuanBeli,
                                                flexLeftRow: 12,
                                                flexRightRow: 20,
                                              ),
                                              const SizedBox(height: 10),
                                              CardFieldItemFormatCurrency(
                                                label: "HPS Beli",
                                                contentData: dataHargaPerkiraanSendiri[index].hpsBeli,
                                                flexLeftRow: 12,
                                                flexRightRow: 20,
                                              ),
                                              const SizedBox(height: 10),
                                              CardFieldItemDate(
                                                label: "Tgl. HPS",
                                                date: dataHargaPerkiraanSendiri[index].tglHps,
                                                flexLeftRow: 12,
                                                flexRightRow: 20,
                                              ),
                                            ],
                                          ),
                                        ), 
                                        onTap: () {
                                          showDialog(
                                            context: context, 
                                            builder: (BuildContext context) {
                                              return Container();
                                            }
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
                                height: 380,
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

class FilterItem {
  final String text;

  const FilterItem({
    required this.text,
  });
}

class FilterItems {
  static const List<FilterItem> firstItems = [semuaData, bahan, upah, alatMesin, subkon, overhead];
  static const semuaData = FilterItem(text: "Semua Data");
  static const bahan = FilterItem(text: 'Bahan');
  static const upah = FilterItem(text: 'Upah');
  static const alatMesin = FilterItem(text: 'Alat dan Mesin');
  static const subkon = FilterItem(text: 'Subkon');
  static const overhead = FilterItem(text: 'Overhead');

  static Widget buildItem(FilterItem item) {
    return Row(
      children: <Widget> [
        Text(
          item.text,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  static onChanged(BuildContext context, FilterItem item) {
    switch (item) {
      case FilterItems.semuaData:
        
        break;
      case FilterItems.bahan:
      //Do something
        break;
      case FilterItems.upah:
      //Do something
        break;
      case FilterItems.alatMesin:
      //Do something
        break;
      case FilterItems.subkon:
      //Do something
        break;
      case FilterItems.overhead:
      //Do something
        break;
    }
  }
}
