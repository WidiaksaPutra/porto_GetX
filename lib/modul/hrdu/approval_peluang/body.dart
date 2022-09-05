import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_peluang/detail_approval_peluang.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/class_peluang.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_date.dart';
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

class _BodyState extends State<Body> with PeluangClass{
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
    _future = fetchApprovalPeluang(page: pages);
  }

  @override
  initState(){
    _future = fetchApprovalPeluang(page: pages);
    initializeDateFormatting();
    super.initState();
    _scrollController.addListener(() async {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent &&!loading) {
        setState(() {
          loading = true;
        });
        await Future.delayed(const Duration(milliseconds: 500));
        setState(() {
          _future = fetchApprovalPeluang(page: pages);
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
        EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20).w),
        child: Column(
          children: <Widget>[
            SizedBox(height: getProportionateScreenHeight(15).h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
              child: const SearchField(),
            ),
            SizedBox(height: getProportionateScreenHeight(5).h),
            FutureBuilder(
              future: _future,
              builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot){
                if (snapshot.hasData) {
                  var dataPeluang = snapshot.data;
                  if (dataPeluang!.isNotEmpty) {
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
                                  itemCount: dataPeluang.length,
                                  itemBuilder: (context, index){
                                    return CardList(
                                      child: ListTile(
                                        contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0).w, vertical: getProportionateScreenHeight(10.0).h),
                                        title: HighlightItemName(
                                          child: Text(
                                            dataPeluang[index].noPeluang.toString(),
                                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
                                                label: 'Diajukan oleh',
                                                contentData: dataPeluang[index].namaKaryawanPengaju,
                                                flexLeftRow: 12,
                                                flexRightRow: 20,
                                              ),
                                              SizedBox(height: getProportionateScreenHeight(10).h),
                                              CardFieldItemText(
                                                label: "Jabatan",
                                                contentData: dataPeluang[index].namaJabatanPengaju,
                                                flexLeftRow: 12,
                                                flexRightRow: 20,
                                              ),
                                              SizedBox(height: getProportionateScreenHeight(10).h),
                                              CardFieldItemDate(
                                                label: "Tgl. Peluang",
                                                date: dataPeluang[index].tglPeluang,
                                                flexLeftRow: 12,
                                                flexRightRow: 20,
                                              ),
                                              SizedBox(height: getProportionateScreenHeight(10).h),
                                              CardFieldItemText(
                                                label: "Peringkat Peluang",
                                                contentData: dataPeluang[index].namaPeringkatPeluang,
                                                flexLeftRow: 12,
                                                flexRightRow: 20,
                                              ),
                                              SizedBox(height: getProportionateScreenHeight(10).h),
                                              CardFieldItemText(
                                                label: "Customer",
                                                contentData: dataPeluang[index].namaCustomer,
                                                flexLeftRow: 12,
                                                flexRightRow: 20,
                                              ),
                                              SizedBox(height: getProportionateScreenHeight(10).h),
                                              CardFieldItemText(
                                                label: "Proyek",
                                                contentData: dataPeluang[index].namaProyek,
                                                flexLeftRow: 12,
                                                flexRightRow: 20,
                                              ),
                                              SizedBox(height: getProportionateScreenHeight(10).h),
                                              CardFieldItemDate(
                                                label: "Tgl. Selesai",
                                                date: dataPeluang[index].tglSelesai,
                                                flexLeftRow: 12,
                                                flexRightRow: 20,
                                              ),
                                              SizedBox(height: getProportionateScreenHeight(10).h),
                                              CardFieldItemStatus(
                                                contentData: dataPeluang[index].statusApproval,
                                              ),
                                            ],
                                          ),
                                        ), 
                                        onTap: () {
                                          Get.to(
                                            DetailPeluangView(
                                              noPeluang: dataPeluang[index].noPeluang.toString(),
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
                                    height: getProportionateScreenHeight(80).h,
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
                          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: getProportionateScreenHeight(5).h),
                              Skeleton(
                                width: double.infinity,
                                height: getProportionateScreenHeight(390).h,
                              ),
                              SizedBox(height: getProportionateScreenHeight(5).h),
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