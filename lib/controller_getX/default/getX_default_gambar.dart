import 'package:get/get.dart';
import 'package:mgp_mobile_app/widget/theme/constants.dart';

class DefaultGambar extends GetxController{
  late var gambar = [].obs;
  late var gambarString = "-".obs;
  defaultGambar(List dataGambar){
    if (dataGambar.isNotEmpty) {
      gambar.clear();
      for (var i = 0; i < extensionGambar.length; i++) {
        for (var j = 0; j < dataGambar.length; j++) {
          if (dataGambar[j].contains(extensionGambar[i])) {
            gambar.add(dataGambar[j]);
          }
        }
      }
    }
  }

  defaultGambar2(List dataGambar){
    if (dataGambar.isNotEmpty) {
      gambar.clear();
      for (var i = 0; i < extensionGambar.length; i++) {
        for (var j = 0; j < dataGambar.length; j++) {
          if (dataGambar[j].pathGambar!.contains(extensionGambar[i])) {
            gambar.add(dataGambar[j].pathGambar);
          }
        }
      }
    }
  }

  defaultGambarSingle(String foto){
    if (foto != null) {
      gambarString.value = foto.toString();
    }
  }
}

