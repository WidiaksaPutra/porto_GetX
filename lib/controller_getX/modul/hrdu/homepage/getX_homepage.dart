import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/controller_getX/login/getX_validasi_form.dart';
import 'package:mgp_mobile_app/modul/hrdu/approval/approval.dart';
import 'package:mgp_mobile_app/modul/hrdu/dashboard_hrdu/dashboard_hrdu.dart';
import 'package:mgp_mobile_app/modul/hrdu/report/report.dart';
import 'package:mgp_mobile_app/widget/component/bottom_navigation_box.dart';
import 'package:mgp_mobile_app/widget/theme/constants.dart';

class HomepageHrdu extends GetxController{
  late var screensHRDU = <Widget>[].obs;
  late var bottomItemsHRDU = <BottomNavigationItem>[].obs;

  homepageHrdu(Widget getHomePageHrdu) {
    List hasilHakAksesReport = komputasiHomepageHrdu();
    if(hasilHakAksesReport.isNotEmpty) {
      homepageHrdu3();
      Get.to(getHomePageHrdu);
    } else {
      homepageHrdu2();
      Get.to(getHomePageHrdu);
    }
  }

  List komputasiHomepageHrdu(){
    late List hakAksesReport = [];
    late List dataHakAkses = [];
    for(var i = 0; i < ValidasiForm.decodeToken["hak"].length; i++) {
      dataHakAkses.add(ValidasiForm.decodeToken["hak"][i]);
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