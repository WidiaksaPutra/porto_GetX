import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/seleksi_vendor/getX_history_seleksi_vendor.dart';
import 'package:mgp_mobile_app/modul/hrdu/history_seleksi_vendor/body_has_data.dart';
import 'package:mgp_mobile_app/widget/component/search_field.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';
class BodyBasic extends StatelessWidget {
  const BodyBasic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(padding: 
        EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Column(
          children: <Widget>[
            SizedBox(height: getProportionateScreenHeight(15)),            
            GetBuilder<GetxHistorySeleksiVendor>(
              init: GetxHistorySeleksiVendor(),
              builder: (controller) => SearchFieldData(search: controller.searchHistory, refresh: controller.refreshHistorySeleksiVendor),
            ),
            SizedBox(height: getProportionateScreenHeight(5)),
            const BodyHasData(),
          ],
        ),
      ),
    );
  }
}
