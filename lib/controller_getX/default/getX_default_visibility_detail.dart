import 'package:get/get.dart';

class DefaultVisibilityDetail extends GetxController{
  var visibilityPemeriksa = false.obs;
  var visibilityPengesah = false.obs;
  var visibilityStatusMenu = false.obs;
  var catatanError = false.obs;

  defaultButtonVisibilityDetail(String status){
    if (status == "V") {
      visibilityPemeriksa = true.obs;
    } else {
      visibilityPengesah = true.obs;
    }
  }

  defaultApprovalVisibilityDetail(String statusMenu){
    if (statusMenu == "Approval") {
      visibilityStatusMenu = true.obs;
    } else {
      visibilityStatusMenu = false.obs;
    }
  }

  defaultCatatanVisibilityDetail(var value){
    if (value!.isNotEmpty) {
      catatanError = false.obs;
    }
    else if(value!.isEmpty){
      catatanError = true.obs;
    }        
  }
}