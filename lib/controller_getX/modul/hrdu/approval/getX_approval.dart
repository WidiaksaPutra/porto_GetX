import 'package:get/get.dart';
import 'package:mgp_mobile_app/controller_getX/login/getX_validasi_form.dart';
import 'package:mgp_mobile_app/widget/theme/constants.dart';

class ApprovalHrdu extends GetxController{
  late String? deviceToken;
  late List dataHakAkses = [];
  late List hakAksesMenu = [].obs;
  
  approvalHrdu() async{
    for(var i = 0; i < ValidasiForm.decodeToken["hak"].length; i++) {
      dataHakAkses.add(ValidasiForm.decodeToken["hak"][i]);
    }
    for(var i = 0; i < hakAksesHrduApproval.length; i++) {
      for (var j = 0; j < dataHakAkses.length; j++) {
        if(dataHakAkses[j].contains(hakAksesHrduApproval[i])){
          if(!hakAksesMenu.contains(hakAksesHrduApproval[i])){
            hakAksesMenu.add(hakAksesHrduApproval[i]);
          }
        }
      }
    }
    dataHakAkses.clear();
  }
}