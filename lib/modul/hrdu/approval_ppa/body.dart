
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_ppa/detail_approval_ppa.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/class_ppa.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class Body extends StatefulWidget{
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> with PPAClass {
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
    _future = fetchApprovalPPA(page: pages);
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
        EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Column(
          children: <Widget>[
            SizedBox(height: getProportionateScreenHeight(15)),
            buildSearchField(),
            SizedBox(height: getProportionateScreenHeight(15)),
            FutureBuilder(
              future: _future,
              builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot){
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
                                      margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10.0), vertical: getProportionateScreenHeight(6.0)),
                                      shape: ContinuousRectangleBorder(
                                        borderRadius: BorderRadius.circular(25),
                                        side: BorderSide(
                                          width: getProportionateScreenWidth(0.4), color: Colors.grey
                                        )
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        child: ListTile(
                                          contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0), vertical: getProportionateScreenHeight(10.0)),
                                          title: Text(
                                            dataPPA[index].noPpa.toString(),
                                            style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          subtitle: Padding(
                                            padding: EdgeInsets.only(top: getProportionateScreenHeight(15)),
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
                                                        children: <Widget>[
                                                          Padding(
                                                            padding: EdgeInsets.only(left: getProportionateScreenWidth(0.0)),
                                                            child: const Text("Diajukan oleh",
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
                                                            padding: EdgeInsets.only(right: getProportionateScreenWidth(0.0)),
                                                            child: (dataPPA[index].namaKaryawanPengaju != null) 
                                                            ? Text(dataPPA[index].namaKaryawanPengaju.toString(), style: const TextStyle(color: Colors.black), textAlign: TextAlign.right)
                                                            : const Text("-", style: TextStyle(color: Colors.black), textAlign: TextAlign.right),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: getProportionateScreenHeight(10)),
                                                Row(
                                                  children: <Widget>[
                                                    Expanded(
                                                      flex: 10,
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: <Widget>[
                                                          Padding(
                                                            padding: EdgeInsets.only(left: getProportionateScreenWidth(0.0)),
                                                            child: const Text("Jabatan",
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
                                                            padding: EdgeInsets.only(right: getProportionateScreenWidth(0.0)),
                                                            child: (dataPPA[index].namaJabatanPengaju != null) 
                                                              ? Text(dataPPA[index].namaJabatanPengaju.toString(), style: const TextStyle(color: Colors.black), textAlign: TextAlign.right)
                                                              : const Text("-", style: TextStyle(color: Colors.black), textAlign: TextAlign.right),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: getProportionateScreenHeight(10)),
                                                Row(
                                                  children: <Widget>[
                                                    Expanded(
                                                      flex: 10,
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: <Widget>[
                                                          Padding(
                                                            padding: EdgeInsets.only(left: getProportionateScreenWidth(0.0)),
                                                            child: const Text("Tgl. PPA",
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
                                                            padding: EdgeInsets.only(right: getProportionateScreenWidth(0.0)),
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
                                                SizedBox(height: getProportionateScreenHeight(10)),
                                                Row(
                                                  children: <Widget>[
                                                    Expanded(
                                                      flex: 10,
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: <Widget>[
                                                          Padding(
                                                            padding: EdgeInsets.only(left: getProportionateScreenWidth(0.0)),
                                                            child: const Text("Sumber Daya",
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
                                                            padding: EdgeInsets.only(right: getProportionateScreenWidth(0.0)),
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
                                                SizedBox(height: getProportionateScreenHeight(10)),
                                                Row(
                                                  children: <Widget>[
                                                    Expanded(
                                                      flex: 10,
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: <Widget>[
                                                          Padding(
                                                            padding: EdgeInsets.only(left: getProportionateScreenWidth(0.0)),
                                                            child: const Text("Unit Organisasi",
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
                                                            padding: EdgeInsets.only(right: getProportionateScreenWidth(0.0)),
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
                                                SizedBox(height: getProportionateScreenHeight(10)),
                                                Row(
                                                  children: <Widget>[
                                                    Expanded(
                                                      flex: 10,
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: <Widget>[
                                                          Padding(
                                                            padding: EdgeInsets.only(left: getProportionateScreenWidth(0.0)),
                                                            child: const Text("Status Approval",
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
                                                              padding: EdgeInsets.only(right: getProportionateScreenWidth(0.0)),
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
                                                              padding: EdgeInsets.only(right: getProportionateScreenWidth(0.0)),
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
                                                              padding: EdgeInsets.only(right: getProportionateScreenWidth(0.0)),
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
                                                              padding: EdgeInsets.only(right: getProportionateScreenWidth(0.0)),
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