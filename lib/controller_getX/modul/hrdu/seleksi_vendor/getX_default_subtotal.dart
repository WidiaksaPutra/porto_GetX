import 'package:get/get.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/api_seleksi_vendor/api_detail_seleksi_vendor.dart';

class GetxSeleksiVendor extends GetxController with SeleksiVendorDetail{
  late var gambar = [].obs;
  late var totalHarga = 0.0.obs;

  defaultGambarLinkSingle(List foto){
    print(foto[0].pathGambar);
    gambar.clear();
    if (foto.isNotEmpty) {
      for(int indexG = 0; indexG < foto.length; indexG++){
        gambar.add("https://devuploads.mgp.bhawanaerp.com/${foto[indexG].pathGambar}");
      }
    }
  }

  defaultHarga(String hargaKesepakatan, String qtyOrder){
    totalHarga.value = (double.parse(hargaKesepakatan.toString()) * double.parse(qtyOrder.toString()));
  }
}

// //yang kurang adalah : 
// //class untuk membuat snapshot.hasData