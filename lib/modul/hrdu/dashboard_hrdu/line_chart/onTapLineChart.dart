import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:mgp_mobile_app/modul/hrdu/dashboard_hrdu/line_chart/line_chart.dart';
import 'package:mgp_mobile_app/shared/theme_color.dart';
import 'package:mgp_mobile_app/widget/theme/appbar_theme_color.dart';

class OnTapLineChart extends StatefulWidget {
  dynamic persediaanBarang;
  List listLineData;
  DateTime? selected1, selected2;
  late int currentTop2;
  OnTapLineChart({Key? key,
    required this.persediaanBarang,
    required this.listLineData,
    required this.currentTop2,
    required this.selected1,
    required this.selected2,
  }) : super(key: key);

  @override
  State<OnTapLineChart> createState() => _OnTapLineChartState();
}

class _OnTapLineChartState extends State<OnTapLineChart> {

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
  }

  Widget buttonUpLineChart({
    required int index,  
    required List listLineData,
  }){
    return GestureDetector(
      onTap:(){ 
        setState((){
          widget.currentTop2 = index;
        }); 
      },
      child: AnimatedContainer(//perbedaannya continer tidak menyediakan duration yang mendukung pembuatan animasi, adanya duratian
      //menyebabkan tansisi dari bentuk 1 ke bentuk ke 2 menjadi lebih halus seperti animasi.
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.only(left: 16),
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        decoration: BoxDecoration(
          color: (widget.currentTop2 == index) 
            ? kPrimaryColor   
            : Colors.white,
          border: Border.all(color: Colors.black, width: (widget.currentTop2 == index) ? 0 : 1),
          borderRadius: BorderRadius.circular(12)
        ),
        child: Center(child: Text(listLineData[index], style: (widget.currentTop2 == index)
          ? const TextStyle(fontSize: 13, color: Colors.white, fontWeight: FontWeight.bold)
          : const TextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.bold)
        )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Line Chat"),
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: SizedBox(
              height: 40,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: widget.listLineData.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) => buttonUpLineChart( 
                  index: index, 
                  listLineData: widget.listLineData,
                )
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
            child: Text("Nilai Persediaan Barang Per Bulan Tahun ${(widget.selected1 != null) ? DateFormat('MMMM', 'id').format(widget.selected1!.toLocal()) : DateFormat('yyyy', 'id').format(DateTime(DateTime.now().year-2).toLocal())} ${(widget.selected1 == null) ? "" : DateFormat('yyyy', 'id').format(DateTime(DateTime.now().year).toLocal())} - ${(widget.selected2 != null) ? DateFormat('MMMM', 'id').format(widget.selected2!.toLocal()) : DateFormat('yyyy', 'id').format(DateTime.now().toLocal())} ${(widget.selected2 == null) ? "" : DateFormat('yyyy', 'id').format(DateTime.now().toLocal())}",
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
                child:Center(
                  child: SizedBox(
                    height: 400,
                    width: 400,
                    child: ComponenLineChart(dataLine: widget.persediaanBarang, tahun: widget.listLineData[widget.currentTop2]),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}