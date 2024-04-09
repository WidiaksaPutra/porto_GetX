import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mgp_mobile_app/modul/hrdu/dashboard_hrdu/bar_chart_vertical/bar_chart.dart';
import 'package:mgp_mobile_app/modul/hrdu/dashboard_hrdu/bar_chart_vertical/default_chart_vertical.dart';
import 'package:mgp_mobile_app/modul/hrdu/dashboard_hrdu/bar_chart_vertical/index_bar_chart.dart';
import 'package:mgp_mobile_app/modul/hrdu/dashboard_hrdu/dummy_data.dart';
import 'package:mgp_mobile_app/service/mgp_api_inv/api_dashboard/kelompok_barang.dart';
import 'package:mgp_mobile_app/shared/theme_color.dart';
import 'package:mgp_mobile_app/widget/theme/appbar_theme_color.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class OnTapBarChartVertical extends StatefulWidget{
  const OnTapBarChartVertical({Key? key}) : super(key: key);

  @override
  State<OnTapBarChartVertical> createState() => _OnTapBarChartVerticalState();
}

class _OnTapBarChartVerticalState extends State<OnTapBarChartVertical> with KelompokBarang{
  late int currentTop = 1;
  late bool hiddenValue = true;
  late List listDataBulan = [];
  late List listBarData = [];
  late Future<List<dynamic>> dataKelompokBarang;

  @override
  void initState(){
    super.initState();
    initializeDateFormatting();
    dataKelompokBarang = fetchNilaiKelompokBarang(tanggalAwal: '2023-04-30', tanggalAkhir: '2023-06-30');
    bulanDataBasic;
    bulanData;
  }

  late List titleLeft = bulanDataBasic['dataFirst']!;
  late String bulan = bulanDataBasic['bulan']![0].toString();

  Widget buttonUpBarChart({
    required int index,  
    required List listBarData,
  }){
    return GestureDetector(
      onTap:(){ 
        setState((){
          if(index != 0){
            currentTop = index;
            int currentTop2 = index-1;
            titleLeft.clear();
            if(listDataBulan[currentTop2] == bulanData[0]['bulan']){
              bulan = listDataBulan[currentTop2];
              titleLeft.addAll(bulanData[0]['data']);
            }else if(listDataBulan[currentTop2] == bulanData[1]['bulan']){
              bulan = listDataBulan[currentTop2];
              titleLeft.addAll(bulanData[1]['data']);
            }else if(listDataBulan[currentTop2] == bulanData[2]['bulan']){
              bulan = listDataBulan[currentTop2];
              titleLeft.addAll(bulanData[2]['data']);
            }else{
              bulan = listDataBulan[currentTop2];
              titleLeft.addAll(bulanDataBasic['dataFirst']!);
            }
          }else{
            if(index == 0 && hiddenValue == true){
              hiddenValue = false;
            }
            else if(index == 0 && hiddenValue == false){
              hiddenValue = true;
            }
          }
        }); 
      },
      child: AnimatedContainer(//perbedaannya continer tidak menyediakan duration yang mendukung pembuatan animasi, adanya duratian
      //menyebabkan tansisi dari bentuk 1 ke bentuk ke 2 menjadi lebih halus seperti animasi.
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.only(left: 16),
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        decoration: BoxDecoration(
          color: (index == 0) 
          ? (hiddenValue == true) 
            ? kPrimaryColor   
            : Colors.white
          : (currentTop == index) 
            ? kPrimaryColor   
            : Colors.white,
          border: Border.all(color: Colors.black, width: (currentTop == index) ? 0 : 1),
          borderRadius: BorderRadius.circular(12)
        ),
        child: (index == 0)
        ? Center(
          child: SvgPicture.asset(
            (hiddenValue == true) ? 
            listBarData[index] : 
            "assets/icons/eye.svg",
            height: getProportionateScreenHeight(20),
            color:(hiddenValue == true) ? Colors.white : kPrimaryColor,
          ))
        : Center(child: Text(listBarData[index], style: (currentTop == index)
            ? const TextStyle(fontSize: 13, color: Colors.white, fontWeight: FontWeight.bold)
            : const TextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.bold)
          )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    listDataBulan.clear();
    listDataBulan.addAll(bulanDataBasic['bulan']!);
    
    listBarData = ["assets/icons/eye_hide.svg"];
    for(var index in listDataBulan){
      List<String> showBulan = index.split(RegExp(r"[0-9,' ']*$",caseSensitive: false)); 
      listBarData.add(showBulan[0]);
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bar Chat"),
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back
          ),
        ),
        flexibleSpace: const AppBarThemeColor(),
      ),    
      body: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: SizedBox(
              height: 40,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: listBarData.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) => buttonUpBarChart( 
                  index: index, 
                  listBarData: listBarData,
                )
              ),
            ),
          ),  
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Text("Nilai Persediaan Barang Bulan $bulan Berdasarkan Kelompok Barang",
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Center(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 500,
                      child: ComponenBarChartVertical(hiddenValue: hiddenValue, dataObjek: titleLeft),
                    ),
                    const IndexBarChartRow(),
                  ],
                ),
              ),
            ),
          )
        ]
      ),
    );
  }
}