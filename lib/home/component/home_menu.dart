import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/homepage/getX_homepage.dart';
import 'package:mgp_mobile_app/modul/hrdu/homepage_hrdu/homepage_hrdu.dart';
import 'package:mgp_mobile_app/widget/component/icon_modul.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeMenu extends StatelessWidget {
  HomeMenu({Key? key}) : super(key: key);

  List modulName = [
    "HRDU",
  ];

  List iconModuls = ["assets/icons/hrdu.svg"];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
      child: Column(
        children: <Widget>[
          SizedBox(height: getProportionateScreenHeight(10)),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: (MediaQuery.of(context).size.height <= getProportionateScreenHeight(600.0)) ? 1 : (MediaQuery.of(context).size.height >= getProportionateScreenHeight(650.0)) ? 1.2 : 1.2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 6,
              ),
              itemCount: modulName.length,
              itemBuilder: (BuildContext ctx, index) {
                return GestureDetector(
                  onTap: () async{
                    Get.put(HomepageHrdu()).homepageHrdu(const HomePageHRDU(selectedIndexPage: 0,));
                  },
                  child: Column(
                    children: <Widget>[
                      BoxIconModul(
                        icon: iconModuls[index].toString()
                      ),
                      (getHidentHeight() == false) ? SizedBox(height: getProportionateScreenHeight(0)) : SizedBox(height: getProportionateScreenHeight(12)),
                      TextIconModul(
                        label: modulName[index].toString()
                      ),
                    ],
                  ),
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}