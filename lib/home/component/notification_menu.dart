import 'dart:convert';
import 'package:mgp_mobile_app/model/history_notification/history_notification_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu.dart';
import 'package:mgp_mobile_app/widget/component/card_list.dart';
import 'package:mgp_mobile_app/widget/component/skeleton.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationMenu extends StatefulWidget {
  const NotificationMenu({Key? key}) : super(key: key);

  @override
  _NotificationMenuState createState() => _NotificationMenuState();
}

class _NotificationMenuState extends State<NotificationMenu> {
  late String? tokens;
  late List<Datum> dataList = [];
  late Future<List<Datum>> _future;
  final ScrollController _scrollController = ScrollController();
  bool loading = false;
  int pages = 1;

  Future<List<Datum>> fetchHistoryNotification({required int page}) async {
    await Future.delayed(const Duration(milliseconds: 800));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    int? perPage = 10;
    Map<String, String>? queryParams = {
      'page' : page.toString(),
      'per_page' : perPage.toString(),
    };
    String? queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = MGPAPI.baseURL + '/notification/page/?' + queryString;
    final response =
      await MGPAPI.client.get(Uri.parse(requestUrl),
      headers: {
        'Authorization': 'Bearer $tokens',
      }
    ).timeout(const Duration(seconds: 10));
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      HistoryNotification deliveryOrderData = HistoryNotification.fromJson(parsed);
      dataList.addAll(deliveryOrderData.data);
      pages++;
      return dataList;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future _refreshPage() async{
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      dataList.clear();
      pages = 1;
    });
    _future = fetchHistoryNotification(page: pages);
  }

  @override
  initState() {
    _future = fetchHistoryNotification(page: pages);
    initializeDateFormatting();
    super.initState();
    _scrollController.addListener(() async {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent &&!loading) {
        setState(() {
          loading = true;
        });
        await Future.delayed(const Duration(milliseconds: 500));
        setState(() {
          _future = fetchHistoryNotification(page: pages);
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
        const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 10),
            FutureBuilder(
              future: _future,
              builder: (BuildContext context, AsyncSnapshot<List<Datum>> snapshot){
                if (snapshot.hasData) {
                  var dataHistoryNotification = snapshot.data;
                  if (dataHistoryNotification!.isNotEmpty) {
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
                                  itemCount: dataHistoryNotification.length,
                                  itemBuilder: (context, index){
                                    return CardList(
                                      child: ListTile(
                                        contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                                        leading: SizedBox(
                                          height: 60,
                                          width: 60,
                                          child: CircleAvatar(
                                            backgroundColor: Colors.white,
                                            child: ClipRRect(
                                              child: Image.asset("assets/images/LogoMGP.png"),
                                              borderRadius: BorderRadius.circular(50),
                                            ),
                                          ),
                                        ),
                                        title: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(top: 5),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Row(
                                                    children: <Widget>[
                                                      Expanded(
                                                        flex: 40,
                                                        child: Column(
                                                          children: <Widget>[
                                                            Padding(
                                                              padding: const EdgeInsets.only(left: 0.0),
                                                              child: Text(
                                                                dataHistoryNotification[index].title.toString()
                                                                +" diajukan oleh "+
                                                                dataHistoryNotification[index].namaPengaju.toString()
                                                                +" dengan No.Transaksi "+
                                                                dataHistoryNotification[index].noTransaksi.toString(),
                                                                style: const TextStyle(
                                                                  color: Colors.black,
                                                                  fontSize: 14,
                                                                  fontWeight: FontWeight.w600
                                                                ),
                                                                textAlign: TextAlign.left,
                                                              )
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: <Widget>[
                                                Text(
                                                  DateFormat(
                                                    'dd MMMM yyyy', 'id').format(
                                                      DateTime.parse(dataHistoryNotification[index].createdAt.toString()
                                                    )
                                                  ).toString(),
                                                  style: const TextStyle(
                                                    color: Color.fromRGBO(119, 119, 119, 1),
                                                    fontSize: 12
                                                  ),
                                                  textAlign: TextAlign.right,
                                                ),
                                                Text(
                                                  DateFormat(
                                                    'HH:mm a').format(
                                                      DateTime.parse(dataHistoryNotification[index].createdAt.toString()
                                                    )
                                                  ).toString(),
                                                  style: const TextStyle(
                                                    color: Colors.black, 
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12
                                                  ),
                                                  textAlign: TextAlign.right,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        onTap: () {
                                          
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
                              Skeleton(
                                width: double.infinity,
                                height: 125,
                              ),
                              SizedBox(height: 15),
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
  Widget buildSearchField() {
    const color = Colors.black;
    return TextFormField(
      keyboardType: TextInputType.text,
      style: const TextStyle(color: color),
      decoration: const InputDecoration(
        hintText: 'Search',
        prefixIcon: Icon(Icons.search, color: color),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}