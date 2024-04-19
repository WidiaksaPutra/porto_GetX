import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:mgp_mobile_app/modul/hrdu/dashboard_hrdu/bar_chart_horizontal/bar_chart.dart';
import 'package:mgp_mobile_app/modul/hrdu/dashboard_hrdu/bar_chart_vertical/bar_chart.dart';
import 'package:mgp_mobile_app/modul/hrdu/dashboard_hrdu/bar_chart_vertical/default_chart_vertical.dart';
import 'package:mgp_mobile_app/modul/hrdu/dashboard_hrdu/bar_chart_vertical/index_bar_chart.dart';
import 'package:mgp_mobile_app/modul/hrdu/dashboard_hrdu/bar_chart_vertical/onTapBarChart.dart';
import 'package:mgp_mobile_app/modul/hrdu/dashboard_hrdu/line_chart/line_chart.dart';
import 'package:mgp_mobile_app/modul/hrdu/dashboard_hrdu/line_chart/onTapLineChart.dart';
import 'package:mgp_mobile_app/modul/hrdu/dashboard_hrdu/pie_chart/default_pie_chart.dart';
import 'package:mgp_mobile_app/modul/hrdu/dashboard_hrdu/pie_chart/index_pie_chart.dart';
import 'package:mgp_mobile_app/modul/hrdu/dashboard_hrdu/pie_chart/onTapLineChart.dart';
import 'package:mgp_mobile_app/service/mgp_api_inv/api_dashboard/kelompok_barang.dart';
import 'package:mgp_mobile_app/service/mgp_api_inv/api_dashboard/keperluan.dart';
import 'package:mgp_mobile_app/service/mgp_api_inv/api_dashboard/persediaan_barang.dart';
import 'package:mgp_mobile_app/shared/theme_color.dart';
import 'package:mgp_mobile_app/widget/component/card_detail.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
class BodyDashBoardHrdu extends StatefulWidget {
  const BodyDashBoardHrdu({Key? key}) : super(key: key);

  @override
  State<BodyDashBoardHrdu> createState() => _BodyDashBoardHrduState();
}

class _BodyDashBoardHrduState extends State<BodyDashBoardHrdu> with KelompokBarang, Keperluan, PersediaanBarang{
  late int currentTop, currentTop2;
  late bool hiddenValue;
  late List listDataBulan = [];
  late List listBarData = [];
  late List listLineData = [];
  late Future<List<dynamic>> dataKelompokBarang;
  late Future dataKeperluan;
  late Future<List<dynamic>> dataPersediaanBarang;
  late DateTime? selected1;
  late DateTime? selected2;
  late List<GDPData> chartDataStacked;

  @override
  void initState(){
    chartDataStacked = getChartData();
    currentTop = 1;
    currentTop2 = 0;
    hiddenValue = true;
    String selectStart = "${DateTime.now().year}-${DateTime.now().month-3}-${DateTime.now().day}";
    selected1 = null;
    selected2 = DateTime.now();
    
    dataKelompokBarang = fetchNilaiKelompokBarang(tanggalAwal: selectStart, tanggalAkhir: DateTime.now().toString());
    dataKeperluan = fetchKeperluan(tanggalAwal: selectStart, tanggalAkhir: DateTime.now().toString());
    dataPersediaanBarang = fetchPersediaanBarang(tanggalAwal: selectStart, tanggalAkhir: DateTime.now().toString());
    super.initState();
    initializeDateFormatting();
    bulanDataBasic;
    bulanData;
    chartData;
  }

  void fetchNilaiKelompok(String tanggalAwal, String tanggalAkhir){
    Future.delayed(const Duration(milliseconds: 500));
    nilaiKelompokBarang.clear();
    setState(() {
      dataKelompokBarang = fetchNilaiKelompokBarang(tanggalAwal: tanggalAwal, tanggalAkhir: tanggalAkhir);
    }); 
  }
  
  void fetchPerluan(String tanggalAwal, String tanggalAkhir){
    Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      dataKeperluan = fetchKeperluan(tanggalAwal: tanggalAwal, tanggalAkhir: tanggalAkhir);
    }); 
  }

  void fetchNilaiPersediaanBarang(String tanggalAwal, String tanggalAkhir){
    Future.delayed(const Duration(milliseconds: 500));
    nilaiPersediaanBarang.clear();
    setState(() {
      dataPersediaanBarang = fetchPersediaanBarang(tanggalAwal: tanggalAwal, tanggalAkhir: tanggalAkhir);
    }); 
  }
  
  late List titleLeft = bulanDataBasic['dataFirst']!;
  late String bulan = bulanDataBasic['bulan']![0].toString();

  Widget buttonUpLineChart({
    required int index,  
    required List listLineData,
  }){
    return GestureDetector(
      onTap:(){ 
        setState((){
          currentTop2 = index;
        }); 
      },
      child: AnimatedContainer(//perbedaannya continer tidak menyediakan duration yang mendukung pembuatan animasi, adanya duratian
      //menyebabkan tansisi dari bentuk 1 ke bentuk ke 2 menjadi lebih halus seperti animasi.
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.only(left: 16),
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        decoration: BoxDecoration(
          color: (currentTop2 == index) 
            ? kPrimaryColor   
            : Colors.white,
          border: Border.all(color: Colors.black, width: (currentTop2 == index) ? 0 : 1),
          borderRadius: BorderRadius.circular(12)
        ),
        child: Center(child: Text(listLineData[index], style: (currentTop2 == index)
          ? const TextStyle(fontSize: 13, color: Colors.white, fontWeight: FontWeight.bold)
          : const TextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.bold)
        )),
      ),
    );
  }

  Widget buttonUpBarVerticalChart({
    required int index,  
    required List listBarData,
  }){
    return GestureDetector(
      onTap:(){ 
        setState((){
          if(index != 0){
            currentTop = index;
            late int currentTop2;
            currentTop2 = index-1;
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
            (hiddenValue == true) 
            ? listBarData[index] 
            : "assets/icons/eye.svg",
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
  Widget build(BuildContext context){
    // late Future<List<dynamic>> dataKelompokBarang;
    Future<void> onAwal(BuildContext context) async{
      final selected = await showMonthYearPicker(
        context: context,
        initialDate: selected1 ?? DateTime.now(),
        firstDate: DateTime(DateTime.now().year - 10),
        lastDate: DateTime.now(),
        locale: const Locale('in'),
      );
      if (selected != null) {
        setState(() {
          selected1 = selected;
        });
      }
    }  

    Future<void> onAkhir(BuildContext context) async{
      final selected = await showMonthYearPicker(
        context: context,
        initialDate: selected2 ?? DateTime.now(),
        firstDate: DateTime(DateTime.now().year - 10),
        lastDate: DateTime.now(),
        locale: const Locale('in'),
      );
      if (selected != null) {
        setState(() {
          selected2 = selected;
        });
      }
    }

    return SizedBox(
      height: double.infinity,
      child: Column(
        children: <Widget> [
          SizedBox(
            child: CardDetail(
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: TextFormField(
                        onTap: () => onAwal(context),
                        readOnly: true,
                        decoration: InputDecoration(
                          // ignore: unnecessary_null_comparison
                          hintText: ( selected1 == null) ? 'Awal' : DateFormat('MMMM yyyy', 'id').format(selected1!.toLocal()).toString(),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          enabledBorder: const UnderlineInputBorder(      
                            borderSide: BorderSide(color: Colors.grey),
                          ),  
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: kPrimaryColor),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: TextFormField(
                        onTap: () => onAkhir(context),
                        readOnly: true,
                        decoration: InputDecoration(
                          // ignore: unnecessary_null_comparison
                          hintText: (selected2 == null) ? 'Akhir' : DateFormat('MMMM yyyy', 'id').format(selected2!.toLocal()).toString(),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          enabledBorder: const UnderlineInputBorder(      
                            borderSide: BorderSide(color: Colors.grey),
                          ),  
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: kPrimaryColor),
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    iconSize: 20,
                    onPressed: (){
                      listDataBulan.clear();
                      titleLeft.clear();
                      bulanDataBasic['bulan']!.clear();
                      bulanDataBasic['dataFirst']!.clear();
                      bulanData[0]['bulan'] = "";
                      bulanData[1]['bulan'] = "";
                      bulanData[2]['bulan'] = "";
                      bulanData[0]['data']!.clear();
                      bulanData[1]['data']!.clear();
                      bulanData[2]['data']!.clear();
                      listBarData.clear();
                      nilaiKelompokBarang.clear();
                      fetchNilaiKelompok(selected1.toString(), selected2.toString());
                      chartData[0]['valueData'] = 0;
                      chartData[1]['valueData'] = 0;
                      chartData[2]['valueData'] = 0;
                      chartData[3]['valueData'] = 0;
                      chartData[4]['valueData'] = 0;
                      chartData[5]['valueData'] = 0;
                      chartData[0]['valueDataPersen'] = '0.0';
                      chartData[1]['valueDataPersen'] = '0.0';
                      chartData[2]['valueDataPersen'] = '0.0';
                      chartData[3]['valueDataPersen'] = '0.0';
                      chartData[4]['valueDataPersen'] = '0.0';
                      chartData[5]['valueDataPersen'] = '0.0';
                      fetchPerluan(selected1.toString(), selected2.toString());
                    },
                    icon: const Icon(Icons.date_range),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            children: [
              FutureBuilder(
                future: dataPersediaanBarang,
                builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot){
                if (snapshot.hasData) {
                  var persediaanBarang = snapshot.data;
                  listLineData = [DateFormat('yyyy', 'id').format(DateTime(DateTime.now().year-2)), DateFormat('yyyy', 'id').format(DateTime(DateTime.now().year-1)), DateFormat('yyyy', 'id').format(DateTime(DateTime.now().year))];
                  return CardDetail(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40,
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: listLineData.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) => buttonUpLineChart( 
                              index: index, 
                              listLineData: listLineData,
                            )
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
                          child: Text("Nilai Persediaan Barang Per Bulan Tahun ${(selected1 != null) ? DateFormat('MMMM', 'id').format(selected1!) : DateFormat('yyyy', 'id').format(DateTime(DateTime.now().year-2).toLocal())} ${(selected1 == null) ? "" : DateFormat('yyyy', 'id').format(DateTime(DateTime.now().year).toLocal())} - ${(selected2 != null) ? DateFormat('MMMM', 'id').format(selected2!) : DateFormat('yyyy', 'id').format(DateTime.now().toLocal())} ${(selected2 == null) ? "" : DateFormat('yyyy', 'id').format(DateTime.now().toLocal())}",
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Get.to(OnTapLineChart(selected1: selected1, selected2: selected2, currentTop2: currentTop2, listLineData: listLineData, persediaanBarang: persediaanBarang)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Center(
                              child: SingleChildScrollView(
                                child: SizedBox(
                                  height: 300,
                                  width: 300,
                                  child: ComponenLineChart(dataLine: persediaanBarang, tahun: listLineData[currentTop2].toString()),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }else{
                  return const Text("loading....");
                }
              }),
              FutureBuilder(
                future: dataKeperluan,
                builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
                if (snapshot.hasData) {
                var dataKeperluan = snapshot.data;
                if(dataKeperluan.stok != null){
                  chartData[0]['valueData'] = dataKeperluan.stok.value;
                  chartData[0]['valueDataPersen'] = dataKeperluan.stok.persen;
                }
                if(dataKeperluan.produksi != null){
                  chartData[1]['valueData'] = dataKeperluan.produksi.value;
                  chartData[1]['valueDataPersen'] = dataKeperluan.produksi.persen;
                }
                if(dataKeperluan.pengadaanAset != null){
                  chartData[2]['valueData'] = dataKeperluan.pengadaanAset.value;
                  chartData[2]['valueDataPersen'] = dataKeperluan.pengadaanAset.persen;
                }
                if(dataKeperluan.pengadaanBarangNonAset != null){
                  chartData[3]['valueData'] = dataKeperluan.pengadaanBarangNonAset.value;
                  chartData[3]['valueDataPersen'] = dataKeperluan.pengadaanBarangNonAset.persen;
                }
                if(dataKeperluan.perbaikanDanPemeliharaanAlatDanMesin != null){
                  chartData[4]['valueData'] = dataKeperluan.perbaikanDanPemeliharaanAlatDanMesin.value;
                  chartData[4]['valueDataPersen'] = dataKeperluan.perbaikanDanPemeliharaanAlatDanMesin.persen;
                }
                if(dataKeperluan.perawatanGedungDanKantor != null){
                  chartData[5]['valueData'] = dataKeperluan.perawatanGedungDanKantor.value;
                  chartData[5]['valueDataPersen'] = dataKeperluan.perawatanGedungDanKantor.persen;
                }
                Future.delayed(const Duration(milliseconds: 1000));
                return CardDetail(
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                          child: Text("Persentase PR Berdasarkan Keperluan",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Get.to(const OnTapPieChart()),
                          child: const Center(
                            child: 
                            SizedBox(
                              height: 292,
                              child: SingleChildScrollView(
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                child: IndexPieChart(),
                              ),
                            ),
                          )
                        ),
                      ]
                    )
                  );
                }else{
                  return (selected1 == null)
                  ? const Text("loading....")
                  : Text("Data Persentase PR Bulan ${DateFormat('MMMM', 'id').format(selected1!.toLocal()).toString()} hingga ${DateFormat('MMMM', 'id').format(selected2!.toLocal()).toString()} Kosong");
                }
              }),
              FutureBuilder(
                future: dataKelompokBarang,
                builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot){
                if (snapshot.hasData) {
                  var dataKelompokBarang = snapshot.data;
                  for(int index = 0; index < dataKelompokBarang!.length; index++){
                    String bulan = DateFormat('MMMM yyyy', 'id').format(DateTime.parse(dataKelompokBarang[index].tglPosting.toString()));
                    if((!bulanDataBasic['bulan']!.contains(bulan) || bulanDataBasic['bulan']!.isEmpty) && bulanDataBasic.length <= 3){
                      bulanDataBasic['bulan']!.add(bulan);
                    }
                  }
              
                  for(int i = 0; i < bulanDataBasic['bulan']!.length; i++){
                    for(int index = 0; index < longTitleBottom.length; index++){
                      for(int index2 = 0; index2 < dataKelompokBarang.length; index2++){
                        String bulan = DateFormat('MMMM yyyy', 'id').format(DateTime.parse(dataKelompokBarang[index2].tglPosting.toString()));
                        if(longTitleBottom[index] == dataKelompokBarang[index2].namaKelompok
                          && bulanDataBasic['bulan']![i] == bulan){
                          bulanData[i]['bulan'] = bulan;
                          bulanData[i]['data'].add(dataKelompokBarang[index2].summary);
                          bulanDataBasic['dataFirst']!.add(dataKelompokBarang[index2].summary);
                        }
                      }
                    }
                  }

                  listDataBulan.clear();
                  listDataBulan.addAll(bulanDataBasic['bulan']!);
                  
                  listBarData = ["assets/icons/eye_hide.svg"];
                  for(var index in listDataBulan){
                    List<String> showBulan = index.split(RegExp(r"[0-9,' ']*$",caseSensitive: false)); 
                    listBarData.add(showBulan[0]);
                  }
              
                return (titleLeft.isNotEmpty)
                ? CardDetail(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: listBarData.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) => buttonUpBarVerticalChart( 
                            index: index, 
                            listBarData: listBarData,
                          )
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                        child: Text("Nilai Persediaan Barang Bulan $bulan Berdasarkan Kelompok Barang",
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Get.to(const OnTapBarChartVertical()),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Center(
                            child: SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: 300,
                                    child: ComponenBarChartVertical(
                                      hiddenValue: hiddenValue, 
                                      dataObjek: titleLeft,
                                    ),
                                  ),
                                  const IndexBarChartColomn(),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]
                  ),
                )
                : const Text("loading");
                }else{
                  return (titleLeft.isNotEmpty || selected1 == null)
                  ? const Text("loading....")
                  : Text("Data Persediaan Barang Bulan ${DateFormat('MMMM', 'id').format(selected1!.toLocal()).toString()} hingga ${DateFormat('MMMM', 'id').format(selected2!.toLocal()).toString()} Kosong");
                }
              }),
              FutureBuilder(
                future: dataKelompokBarang,
                builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot){
                if (snapshot.hasData) {
                  var dataKelompokBarang = snapshot.data;
                  for(int index = 0; index < dataKelompokBarang!.length; index++){
                    String bulan = DateFormat('MMMM yyyy', 'id').format(DateTime.parse(dataKelompokBarang[index].tglPosting.toString()));
                    if((!bulanDataBasic['bulan']!.contains(bulan) || bulanDataBasic['bulan']!.isEmpty) && bulanDataBasic.length <= 3){
                      bulanDataBasic['bulan']!.add(bulan);
                    }
                  }
              
                  for(int i = 0; i < bulanDataBasic['bulan']!.length; i++){
                    for(int index = 0; index < longTitleBottom.length; index++){
                      for(int index2 = 0; index2 < dataKelompokBarang.length; index2++){
                        String bulan = DateFormat('MMMM yyyy', 'id').format(DateTime.parse(dataKelompokBarang[index2].tglPosting.toString()));
                        if(longTitleBottom[index] == dataKelompokBarang[index2].namaKelompok
                          && bulanDataBasic['bulan']![i] == bulan){
                          bulanData[i]['bulan'] = bulan;
                          bulanData[i]['data'].add(dataKelompokBarang[index2].summary);
                          bulanDataBasic['dataFirst']!.add(dataKelompokBarang[index2].summary);
                        }
                      }
                    }
                  }

                  listDataBulan.clear();
                  listDataBulan.addAll(bulanDataBasic['bulan']!);
                  
                  listBarData = ["assets/icons/eye_hide.svg"];
                  for(var index in listDataBulan){
                    List<String> showBulan = index.split(RegExp(r"[0-9,' ']*$",caseSensitive: false)); 
                    listBarData.add(showBulan[0]);
                  }
              
                return (titleLeft.isNotEmpty)
                ? CardDetail(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: listBarData.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) => buttonUpBarVerticalChart( 
                            index: index, 
                            listBarData: listBarData,
                          )
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                        child: Text("Nilai Persediaan Barang Bulan $bulan Berdasarkan Kelompok Barang",
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Get.to(const OnTapBarChartVertical()),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Center(
                            child: SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: 300,
                                    child: SfCartesianChart(series: <ChartSeries>[
                                      BarSeries<GDPData, String>(dataSource: chartDataStacked, xValueMapper: (GDPData gdp, _) => gdp.continent, yValueMapper: (GDPData gdp,_) => gdp.gdp),
                                    ], primaryXAxis: CategoryAxis()),
                                  ),
                                  const IndexBarChartColomn(),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]
                  ),
                )
                : const Text("loading");
                }else{
                  return (titleLeft.isNotEmpty || selected1 == null)
                  ? const Text("loading....")
                  : Text("Data Persediaan Barang Bulan ${DateFormat('MMMM', 'id').format(selected1!.toLocal()).toString()} hingga ${DateFormat('MMMM', 'id').format(selected2!.toLocal()).toString()} Kosong");
                }
              }),
            ]),
          )
        ],
      ),
    );
  }
  List<GDPData> getChartData(){
    final List<GDPData> chartDataStacked = [
      GDPData("Amplas 369 Fuji Star", 10),
      GDPData("Kayu Jati", 1.5),
      GDPData("Venner Jati Super", 2),
    ];
    return chartDataStacked;
  }
}

class GDPData{
  final String continent;
  final double gdp;
  GDPData(this.continent, this.gdp);
}
