import 'dart:convert';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_ppa/detail_approval_ppa.dart';
import 'package:mgp_mobile_app/model/hrdu/ppa/ppa_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu.dart';
import 'package:get/get.dart';
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
    _future = fetchApprovalPPA(page: pages);
  }

  Future<List<Datum>> fetchApprovalPPA({required int page}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    int? perPage = 10;
    Map<String, String>? queryParams = {
      'page' : page.toString(),
      'per_page' : perPage.toString(),
    };
    String? queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = MGPAPI.baseURL + '/approval_ppa/list/?' + queryString;
    final response =
      await MGPAPI.client.get(Uri.parse(requestUrl),
      headers: {
        'Authorization': 'Bearer $tokens',
      }
    );
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      Regppa ppaData = Regppa.fromJson(parsed);
      dataList.addAll(ppaData.data);
      pages++;
      return dataList;
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  initState(){
    _future = fetchApprovalPPA(page: pages);
    initializeDateFormatting();
    super.initState();
    _scrollController.addListener(() async {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent &&!loading) {
        setState(() {
          loading = true;
        });
        await Future.delayed(const Duration(milliseconds: 500));
        setState(() {
          _future = fetchApprovalPPA(page: pages);
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
            buildSearchField(),
            const SizedBox(height: 15),
            FutureBuilder(
              future: _future,
              builder: (BuildContext context, AsyncSnapshot<List<Datum>> snapshot){
                if (snapshot.hasData) {
                  var dataPPA = snapshot.data;
                  if (dataPPA!.isNotEmpty) {
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
                                  itemCount: dataPPA.length,
                                  itemBuilder: (context, index){
                                    return Card(
                                      elevation: 8.0,
                                      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                                      shape: ContinuousRectangleBorder(
                                        borderRadius: BorderRadius.circular(25),
                                        side: const BorderSide(
                                          width: 0.4, color: Colors.grey
                                        )
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        child: ListTile(
                                          contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                                          title: Text(
                                            dataPPA[index].noPpa.toString(),
                                            style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          subtitle: Padding(
                                            padding: const EdgeInsets.only(top: 15),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Row(
                                                  children: <Widget>[
                                                    Expanded(
                                                      flex: 10,
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: const <Widget>[
                                                          Padding(
                                                            padding: EdgeInsets.only(left: 0.0),
                                                            child: Text("Diajukan oleh",
                                                              style: TextStyle(
                                                                color: Colors.black
                                                              ),
                                                              textAlign: TextAlign.left,
                                                            )
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 20,
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                        crossAxisAlignment: CrossAxisAlignment.end,
                                                        children: <Widget>[
                                                          Padding(
                                                            padding: const EdgeInsets.only(right: 0.0),
                                                            child: (dataPPA[index].namaKaryawanPengaju != null) 
                                                            ? Text(dataPPA[index].namaKaryawanPengaju.toString(), style: const TextStyle(color: Colors.black), textAlign: TextAlign.right)
                                                            : const Text("-", style: TextStyle(color: Colors.black), textAlign: TextAlign.right),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 10),
                                                Row(
                                                  children: <Widget>[
                                                    Expanded(
                                                      flex: 10,
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: const <Widget>[
                                                          Padding(
                                                            padding: EdgeInsets.only(left: 0.0),
                                                            child: Text("Jabatan",
                                                              style: TextStyle(
                                                                color: Colors.black
                                                              ),
                                                              textAlign: TextAlign.left,
                                                            )
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 20,
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                        crossAxisAlignment: CrossAxisAlignment.end,
                                                        children: <Widget>[
                                                          Padding(
                                                            padding: const EdgeInsets.only(right: 0.0),
                                                            child: (dataPPA[index].namaJabatanPengaju != null) 
                                                              ? Text(dataPPA[index].namaJabatanPengaju.toString(), style: const TextStyle(color: Colors.black), textAlign: TextAlign.right)
                                                              : const Text("-", style: TextStyle(color: Colors.black), textAlign: TextAlign.right),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 10),
                                                Row(
                                                  children: <Widget>[
                                                    Expanded(
                                                      flex: 10,
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: const <Widget>[
                                                          Padding(
                                                            padding: EdgeInsets.only(left: 0.0),
                                                            child: Text("Tgl. PPA",
                                                              style: TextStyle(
                                                                color: Colors.black
                                                              ),
                                                              textAlign: TextAlign.left,
                                                            )
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 20,
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                        crossAxisAlignment: CrossAxisAlignment.end,
                                                        children: <Widget>[
                                                          Padding(
                                                            padding: const EdgeInsets.only(right: 0.0),
                                                            child: (dataPPA[index].tglPpa != null)
                                                            ? Text(
                                                              DateFormat(
                                                                'EEEE, dd MMMM yyyy', 'id').format(
                                                                  DateTime.parse(dataPPA[index].tglPpa.toString()
                                                                )
                                                              ).toString(),
                                                              style: const TextStyle(
                                                                color: Colors.black
                                                              ),
                                                              textAlign: TextAlign.right,
                                                            )
                                                            : const Text("-",
                                                              style: TextStyle(
                                                                color: Colors.black
                                                              ),
                                                              textAlign: TextAlign.right,
                                                            )
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 10),
                                                Row(
                                                  children: <Widget>[
                                                    Expanded(
                                                      flex: 10,
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: const <Widget>[
                                                          Padding(
                                                            padding: EdgeInsets.only(left: 0.0),
                                                            child: Text("Sumber Daya",
                                                              style: TextStyle(
                                                                color: Colors.black
                                                              ),
                                                              textAlign: TextAlign.left,
                                                            )
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 20,
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                        crossAxisAlignment: CrossAxisAlignment.end,
                                                        children: <Widget>[
                                                          Padding(
                                                            padding: const EdgeInsets.only(right: 0.0),
                                                            child: (dataPPA[index].itemSumberDaya != null)
                                                            ? Text(dataPPA[index].itemSumberDaya.toString(),
                                                              style: const TextStyle(
                                                                color: Colors.black
                                                              ),
                                                              textAlign: TextAlign.right,
                                                            )
                                                            : const Text("-",
                                                              style: TextStyle(
                                                                color: Colors.black
                                                              ),
                                                              textAlign: TextAlign.right,
                                                            )
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 10),
                                                Row(
                                                  children: <Widget>[
                                                    Expanded(
                                                      flex: 10,
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: const <Widget>[
                                                          Padding(
                                                            padding: EdgeInsets.only(left: 0.0),
                                                            child: Text("Unit Organisasi",
                                                              style: TextStyle(
                                                                color: Colors.black
                                                              ),
                                                              textAlign: TextAlign.left,
                                                            )
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 20,
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                        crossAxisAlignment: CrossAxisAlignment.end,
                                                        children: <Widget>[
                                                          Padding(
                                                            padding: const EdgeInsets.only(right: 0.0),
                                                            child: (dataPPA[index].namaUnitOrganisasi != null)
                                                            ? Text(dataPPA[index].namaUnitOrganisasi.toString(),
                                                              style: const TextStyle(
                                                                color: Colors.black
                                                              ),
                                                              textAlign: TextAlign.right,
                                                            )
                                                            : const Text("-",
                                                              style: TextStyle(
                                                                color: Colors.black
                                                              ),
                                                              textAlign: TextAlign.right,
                                                            )
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 10),
                                                Row(
                                                  children: <Widget>[
                                                    Expanded(
                                                      flex: 10,
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: const <Widget>[
                                                          Padding(
                                                            padding: EdgeInsets.only(left: 0.0),
                                                            child: Text("Status Approval",
                                                              style: TextStyle(
                                                                color: Colors.black
                                                              ),
                                                              textAlign: TextAlign.left,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 20,
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                        crossAxisAlignment: CrossAxisAlignment.end,
                                                        children: <Widget>[
                                                          if(dataPPA[index].statusApproval.toString() == 'VER')...[
                                                            Padding(
                                                              padding: const EdgeInsets.only(right: 0.0),
                                                              child: Text("VERIFIED".toString(),
                                                                style: const TextStyle(
                                                                  color: Colors.black,
                                                                  fontWeight: FontWeight.bold
                                                                ),
                                                                textAlign: TextAlign.right
                                                              )
                                                            ),
                                                          ],
                                                          if(dataPPA[index].statusApproval.toString() == 'PEN')...[
                                                            Padding(
                                                              padding: const EdgeInsets.only(right: 0.0),
                                                              child: Text("PENDING".toString(),
                                                                style: const TextStyle(
                                                                  color: Colors.black,
                                                                  fontWeight: FontWeight.bold
                                                                ),
                                                                textAlign: TextAlign.right
                                                              )
                                                            ),
                                                          ],
                                                          if(dataPPA[index].statusApproval.toString() == 'REV')...[
                                                            Padding(
                                                              padding: const EdgeInsets.only(right: 0.0),
                                                              child: Text("REVISI".toString(),
                                                                style: const TextStyle(
                                                                  color: Colors.black,
                                                                  fontWeight: FontWeight.bold
                                                                ),
                                                                textAlign: TextAlign.right
                                                              )
                                                            ),
                                                          ],
                                                          if(dataPPA[index].statusApproval.toString() == 'APP')...[
                                                            Padding(
                                                              padding: const EdgeInsets.only(right: 0.0),
                                                              child: Text("APPROVED".toString(),
                                                                style: const TextStyle(
                                                                  color: Colors.black,
                                                                  fontWeight: FontWeight.bold
                                                                ),
                                                                textAlign: TextAlign.right
                                                              )
                                                            ),
                                                          ],
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ), 
                                          onTap: () {
                                            Get.to(DetailPPAView(noPPA: dataPPA[index].noPpa.toString()));
                                          },
                                        ),
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