import 'package:get/get.dart';

class DefaultVisibilityDetail extends GetxController{
  var visibilityPemeriksa = false.obs;
  var visibilityPengesah = false.obs;
  var visibilityStatusMenu = false.obs;
  var catatanError = false.obs;

  defaultButtonVisibilityDetail(String status){
    if (status == "V") {
      visibilityPemeriksa.value = true;
    } else {
      visibilityPengesah.value = true;
    }
  }

  defaultApprovalVisibilityDetail(String statusMenu){
    if (statusMenu == "Approval") {
      visibilityStatusMenu.value = true;
    } else {
      visibilityStatusMenu.value = false;
    }
  }

  defaultCatatanVisibilityDetail(var value){
    if (value!.isNotEmpty) {
      catatanError.value = false;
    }
    else if(value!.isEmpty){
      catatanError.value = true;
    }        
  }
}