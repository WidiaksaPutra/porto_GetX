import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_kegiatan/detail_approval_kegiatan.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/class_kegiatan.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class BodyHistory extends StatefulWidget {
  const BodyHistory({Key? key}) : super(key: key);

  @override
  _BodyHistoryState createState() => _BodyHistoryState();
}

class _BodyHistoryState extends State<BodyHistory> with KegiatanClass {
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
    _future = fetchHistoryKegiatan(page: pages);
  }

  @override
  initState(){
    _future = fetchHistoryKegiatan(page: pages);
    initializeDateFormatting();
    super.initState();
    _scrollController.addListener(() async {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent &&!loading) {
        setState(() {
          loading = true;
        });
        await Future.delayed(const Duration(milliseconds: 500));
        setState(() {
          _future = fetchHistoryKegiatan(page: pages);
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
           buildSearchField(),
           SizedBox(height: getProportionateScreenHeight(15).h),
           FutureBuilder(
             future: _future,
             builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot){
               if (snapshot.hasData) {
                 var dataKegiatan = snapshot.data;
                 if (dataKegiatan!.isNotEmpty) {
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
                                 itemCount: dataKegiatan.length,
                                 itemBuilder: (context, index){
                                   return Card(
                                     elevation: 8.0,
                                     margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10.0).w, vertical: getProportionateScreenHeight(6.0).h),
                                     child: Container(
                                       decoration: BoxDecoration(
                                         color: Colors.white,
                                         borderRadius: BorderRadius.circular(15.r),
                                       ),
                                       child: ListTile(
                                         contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0).w, vertical: getProportionateScreenHeight(10.0).h),
                                         title: Text(
                                           dataKegiatan[index].noKegiatan.toString(),
                                           style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                           overflow: TextOverflow.ellipsis,
                                         ),
                                         subtitle: Padding(
                                           padding: EdgeInsets.only(top: getProportionateScreenHeight(15).h),
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
                                                           padding: EdgeInsets.only(left: getProportionateScreenWidth(0.0).w),
                                                           child: const Text("Diajukan oleh",
                                                             style: TextStyle(
                                                               color: Colors.black
                                                             ),
                                                             textAlign: TextAlign.left
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
                                                           padding: EdgeInsets.only(right: getProportionateScreenWidth(0.0).w),
                                                           child: (dataKegiatan[index].namaKaryawanPengaju != null) 
                                                           ? Text(dataKegiatan[index].namaKaryawanPengaju.toString(), style: const TextStyle(color: Colors.black), textAlign: TextAlign.right)
                                                           : const Text("-", style: TextStyle(color: Colors.black), textAlign: TextAlign.right),
                                                         ),
                                                       ],
                                                     ),
                                                   )
                                                 ],
                                               ),
                                               SizedBox(height: getProportionateScreenHeight(10).h),
                                               Row(
                                                 children: <Widget>[
                                                   Expanded(
                                                     flex: 10,
                                                     child: Column(
                                                       mainAxisAlignment: MainAxisAlignment.start,
                                                       crossAxisAlignment: CrossAxisAlignment.start,
                                                       children: <Widget>[
                                                         Padding(
                                                           padding: EdgeInsets.only(left: getProportionateScreenWidth(0.0).w),
                                                           child: const Text("Jabatan",
                                                             style: TextStyle(
                                                               color: Colors.black
                                                             ),
                                                             textAlign: TextAlign.left
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
                                                           padding: EdgeInsets.only(right: getProportionateScreenWidth(0.0).w),
                                                           child: (dataKegiatan[index].namaJabatanPengaju != null) 
                                                             ? Text(dataKegiatan[index].namaJabatanPengaju.toString(), style: const TextStyle(color: Colors.black), textAlign: TextAlign.right)
                                                             : const Text("-", style: TextStyle(color: Colors.black), textAlign: TextAlign.right),
                                                         ),
                                                       ],
                                                     ),
                                                   )
                                                 ],
                                               ),
                                               SizedBox(height: getProportionateScreenHeight(10).h),
                                               Row(
                                                 children: <Widget>[
                                                   Expanded(
                                                     flex: 10,
                                                     child: Column(
                                                       mainAxisAlignment: MainAxisAlignment.start,
                                                       crossAxisAlignment: CrossAxisAlignment.start,
                                                       children: <Widget>[
                                                         Padding(
                                                           padding: EdgeInsets.only(left: getProportionateScreenWidth(0.0).w),
                                                           child: const Text("Tgl. Pengajuan",
                                                             style: TextStyle(
                                                               color: Colors.black
                                                             ),
                                                             textAlign: TextAlign.left
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
                                                           padding: EdgeInsets.only(right: getProportionateScreenWidth(0.0).w),
                                                           child: (dataKegiatan[index].tglApproval != null) 
                                                           ? Text(
                                                             DateFormat(
                                                               'EEEE, dd MMMM yyyy', 'id').format(
                                                                 DateTime.parse(dataKegiatan[index].tglApproval.toString()
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
                                                   )
                                                 ],
                                               ),
                                               SizedBox(height: getProportionateScreenHeight(10).h),
                                               Row(
                                                 children: <Widget>[
                                                   Expanded(
                                                     flex: 10,
                                                     child: Column(
                                                       mainAxisAlignment: MainAxisAlignment.start,
                                                       crossAxisAlignment: CrossAxisAlignment.start,
                                                       children: <Widget>[
                                                         Padding(
                                                           padding: EdgeInsets.only(left: getProportionateScreenWidth(0.0).w),
                                                           child: const Text("Kegiatan",
                                                             style: TextStyle(
                                                               color: Colors.black
                                                             ),
                                                             textAlign: TextAlign.left
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
                                                           padding: EdgeInsets.only(right: getProportionateScreenWidth(0.0).w),
                                                           child: (dataKegiatan[index].namaKegiatan != null)
                                                           ? Text(dataKegiatan[index].namaKegiatan.toString(),
                                                             style: const TextStyle(
                                                               color: Colors.black
                                                             ),
                                                             textAlign: TextAlign.right
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
                                                   )
                                                 ],
                                               ),
                                               SizedBox(height: getProportionateScreenHeight(10).h),
                                               Row(
                                                 children: <Widget>[
                                                   Expanded(
                                                     flex: 10,
                                                     child: Column(
                                                       mainAxisAlignment: MainAxisAlignment.start,
                                                       crossAxisAlignment: CrossAxisAlignment.start,
                                                       children: <Widget>[
                                                         Padding(
                                                           padding: EdgeInsets.only(left: getProportionateScreenWidth(0.0).w),
                                                           child: const Text("Program",
                                                             style: TextStyle(
                                                               color: Colors.black
                                                             ),
                                                             textAlign: TextAlign.left
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
                                                           padding: EdgeInsets.only(right: getProportionateScreenWidth(0.0).w),
                                                           child: (dataKegiatan[index].namaProgram != null)
                                                           ? Text(dataKegiatan[index].namaProgram.toString(),
                                                             style: const TextStyle(
                                                               color: Colors.black
                                                             ),
                                                             textAlign: TextAlign.right
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
                                                   )
                                                 ],
                                               ),
                                               SizedBox(height: getProportionateScreenHeight(10).h),
                                               Row(
                                                 children: <Widget>[
                                                   Expanded(
                                                     flex: 10,
                                                     child: Column(
                                                       mainAxisAlignment: MainAxisAlignment.start,
                                                       crossAxisAlignment: CrossAxisAlignment.start,
                                                       children: <Widget>[
                                                         Padding(
                                                           padding: EdgeInsets.only(left: getProportionateScreenWidth(0.0).w),
                                                           child: const Text("Unit Organisasi",
                                                             style: TextStyle(
                                                               color: Colors.black
                                                             ),
                                                             textAlign: TextAlign.left
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
                                                           padding: EdgeInsets.only(right: getProportionateScreenWidth(0.0).w),
                                                           child: (dataKegiatan[index].namaUnitOrganisasi != null)
                                                           ? Text(dataKegiatan[index].namaUnitOrganisasi.toString(),
                                                             style: const TextStyle(
                                                               color: Colors.black
                                                             ),
                                                             textAlign: TextAlign.right
                                                           )
                                                           : const Text("-",
                                                             style: TextStyle(
                                                               color: Colors.black
                                                             ),
                                                             textAlign: TextAlign.right
                                                           )
                                                         ),
                                                       ],
                                                     ),
                                                   )
                                                 ],
                                               ),
                                               SizedBox(height: getProportionateScreenHeight(10).h),
                                               Row(
                                                 children: <Widget>[
                                                   Expanded(
                                                     flex: 10,
                                                     child: Column(
                                                       mainAxisAlignment: MainAxisAlignment.start,
                                                       crossAxisAlignment: CrossAxisAlignment.start,
                                                       children: <Widget>[
                                                         Padding(
                                                           padding: EdgeInsets.only(left: getProportionateScreenWidth(0.0).w),
                                                           child: const Text("Status Approval",
                                                             style: TextStyle(
                                                               color: Colors.black
                                                             ),
                                                             textAlign: TextAlign.left
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
                                                         if(dataKegiatan[index].statusApproval.toString() == 'VER')...[
                                                           Padding(
                                                             padding: EdgeInsets.only(right: getProportionateScreenWidth(0.0).w),
                                                             child: Text("VERIFIED".toString(),
                                                               style: const TextStyle(
                                                                 color: Colors.black,
                                                                 fontWeight: FontWeight.bold
                                                               ),
                                                               textAlign: TextAlign.right
                                                             )
                                                           ),
                                                         ],
                                                         if(dataKegiatan[index].statusApproval.toString() == 'PEN')...[
                                                           Padding(
                                                             padding: EdgeInsets.only(right: getProportionateScreenWidth(0.0).w),
                                                             child: Text("PENDING".toString(),
                                                               style: const TextStyle(
                                                                 color: Colors.black,
                                                                 fontWeight: FontWeight.bold
                                                               ),
                                                               textAlign: TextAlign.right
                                                             )
                                                           ),
                                                         ],
                                                         if(dataKegiatan[index].statusApproval.toString() == 'REV')...[
                                                           Padding(
                                                             padding: EdgeInsets.only(right: getProportionateScreenWidth(0.0).w),
                                                             child: Text("REVISI".toString(),
                                                               style: const TextStyle(
                                                                 color: Colors.black,
                                                                 fontWeight: FontWeight.bold
                                                               ),
                                                               textAlign: TextAlign.right
                                                             )
                                                           ),
                                                         ],
                                                         if(dataKegiatan[index].statusApproval.toString() == 'APP')...[
                                                           Padding(
                                                             padding: EdgeInsets.only(right: getProportionateScreenWidth(0.0).w),
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
                                                   )
                                                 ],
                                               ),
                                             ],
                                           ),
                                         ), 
                                         onTap: () {
                                           Get.to(DetailKegiatanView(noKegiatan: dataKegiatan[index].noKegiatan.toString()));
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