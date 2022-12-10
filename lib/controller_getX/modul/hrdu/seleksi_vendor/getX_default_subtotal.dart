import 'package:get/get.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/seleksi_vendor/mixin_seleksi_vendor.dart';

class SubTotalSeleksiVendor extends GetxController with SeleksiVendorDetail{
  late var subTotalHargaPr = <String>[].obs;
  late var subTotalHargaSv = <String>[].obs;
  late var hasilHasData = false.obs;
  
  defaultSubTotal(String noSeleksiVendor) async{
    // subTotalHargaPr.clear();
    // subTotalHargaSv.clear();
    await fetchDataSeleksiVendorDetail(noSeleksiVendor: noSeleksiVendor.toString());
    await Future.delayed(const Duration(milliseconds: 1000));
    subHargaPr();
    subHargaSv();
  }

  subHargaPr(){
    for (var i = 0; i < futureDetailSv!.data!.detail!.prDetail!.length; i++) {
      num subTotalPr = (double.parse(futureDetailSv!.data!.detail!.prDetail![i].hargaPerkiraanSendiri.toString())) * double.parse(futureDetailSv!.data!.detail!.prDetail![i].qtyPr.toString());
      subTotalHargaPr.add(subTotalPr.toString());
    }
  }

  subHargaSv(){
    for (var i = 0; i < futureDetailSv!.data!.detail!.detail!.length; i++) {
      num subTotalSv = (double.parse(futureDetailSv!.data!.detail!.detail![i].hargaKesepakatan.toString())) * double.parse(futureDetailSv!.data!.detail!.detail![i].qtyOrder.toString());
      subTotalHargaSv.add(subTotalSv.toString());
    }    // print(subTotalHargaSv);
  }
}

//yang kurang adalah : 
//class untuk membuat snapshot.hasData