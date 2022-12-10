import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:mgp_mobile_app/widget/theme/constants.dart';

class ApprovalHrdu extends GetxController{
  late String? deviceToken;
  late List dataHakAkses = [];
  late var hakAksesMenu = <String>[].obs;
  
  approvalHrdu(String tokenUser) async{
    Map<String, dynamic> decodeToken = JwtDecoder.decode(tokenUser);
    for(var i = 0; i < decodeToken["hak"].length; i++) {
      dataHakAkses.add(decodeToken["hak"][i]);
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