import 'package:get/get.dart';
import 'package:mgp_mobile_app/widget/theme/constants.dart';

class DefaultFile extends GetxController{
  late var file = [].obs;
  late var linkFile = [].obs;

  defaultFile(List dataFile){
    if (dataFile.isNotEmpty) {
      file.clear();
      for (var i = 0; i < extensionFile.length; i++) {
        for (var j = 0; j < dataFile.length; j++) {
          if (dataFile[j].pathGambar!.contains(extensionFile[i])) {
            var completePath = dataFile[j].pathGambar.toString();
            var fileName = (completePath.split('/').last);
            file.add(fileName);
            linkFile.add(completePath);
          }
        }
      }
    }
  }
}