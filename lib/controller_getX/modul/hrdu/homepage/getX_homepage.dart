import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:mgp_mobile_app/modul/hrdu/approval/approval.dart';
import 'package:mgp_mobile_app/modul/hrdu/dashboard_hrdu/dashboard_hrdu.dart';
import 'package:mgp_mobile_app/modul/hrdu/report/report.dart';
import 'package:mgp_mobile_app/widget/component/bottom_navigation_box.dart';
import 'package:mgp_mobile_app/widget/theme/constants.dart';

class HomepageHrdu extends GetxController{
  late var screensHRDU = <Widget>[].obs;
  late var bottomItemsHRDU = <BottomNavigationItem>[].obs;

  homepageHrdu(String tokenUser, Widget getHomePageHrdu) {
    List hasilHakAksesReport = komputasiHomepageHrdu(tokenUser);
    if(hasilHakAksesReport.isNotEmpty) {
      homepageHrdu3();
      Get.to(getHomePageHrdu);
    } else {
      homepageHrdu2();
      Get.to(getHomePageHrdu);
    }
  }

  List komputasiHomepageHrdu(String tokenUser){
    late List hakAksesReport = [];
    late List dataHakAkses = [];
    Map<String, dynamic> decodeToken = JwtDecoder.decode(tokenUser);
    for(var i = 0; i < decodeToken["hak"].length; i++) {
      dataHakAkses.add(decodeToken["hak"][i]);
    }
    for(var i = 0; i < hakAksesHrduMasterData.length; i++) {
      for (var j = 0; j < dataHakAkses.length; j++) {
        if(dataHakAkses[j].contains(hakAksesHrduMasterData[i])){
          if(!hakAksesReport.contains(hakAksesHrduMasterData[i])){
            hakAksesReport.add(hakAksesHrduMasterData[i]);
          }
        }
      }
    }
    return hakAksesReport;
  }

  homepageHrdu3(){
    screensHRDU = [
      const DashboardHRDUView(),
      const ApprovalView(),
      const ReportView(),
    ].obs;
    bottomItemsHRDU = [
      BottomNavigationItem("Dashboard", "assets/icons/Dashboard.svg"),
      BottomNavigationItem("Approval", "assets/icons/prv.svg"),
      BottomNavigationItem("Report", "assets/icons/report.svg"),
    ].obs;
  }

  homepageHrdu2(){
    screensHRDU = [
      const DashboardHRDUView(),
      const ApprovalView(),
    ].obs;
    bottomItemsHRDU = [
      BottomNavigationItem("Dashboard", "assets/icons/Dashboard.svg"),
      BottomNavigationItem("Approval", "assets/icons/prv.svg"),
    ].obs;
  }
}