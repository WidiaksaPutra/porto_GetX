import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/seleksi_vendor/getX_history_seleksi_vendor.dart';
import 'package:mgp_mobile_app/modul/hrdu/history_seleksi_vendor/body_data.dart';
import 'package:mgp_mobile_app/widget/component/componen_loading.dart';

class BodyHasData extends StatelessWidget {
  const BodyHasData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<GetxHistorySeleksiVendor>(
      init: GetxHistorySeleksiVendor(),
      builder: (contoller) => (contoller.dataLoading.value == true)
      ? Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return const BodyData();
            }
          )
        )
      : ComponenLoadingListData(data: contoller.dataHistorySeleksiVendor, boolLoading: contoller.dataLoading.value),
    );
  }
}