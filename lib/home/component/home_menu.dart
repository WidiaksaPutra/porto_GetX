import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/modul/hrdu/homepage_hrdu/homepage_hrdu.dart';
import 'package:mgp_mobile_app/widget/component/icon_modul.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class HomeMenu extends StatefulWidget {
  const HomeMenu({Key? key}) : super(key: key);

  @override
  State<HomeMenu> createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  List modulName = [
    "HRDU",
  ];

  List iconModuls = ["assets/icons/hrdu.svg"];
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15).w),
      child: Column(
        children: <Widget>[
          SizedBox(height: getProportionateScreenHeight(10).h),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: (MediaQuery.of(context).size.height <= getProportionateScreenHeight(600.0).h) ? 1.r : (MediaQuery.of(context).size.height >= getProportionateScreenHeight(650.0).h) ? 1.2.r : 1.2.r,
                crossAxisSpacing: 5,
                mainAxisSpacing: 6,
              ),
              itemCount: modulName.length,
              itemBuilder: (BuildContext ctx, index) {
                return GestureDetector(
                  onTap: () {
                    Get.to(const HomePageHRDU(
                      selectedIndexPage: 0,
                    ));
                  },
                  child: Column(
                    children: <Widget>[
                      BoxIconModul(
                        icon: iconModuls[index].toString()
                      ),
                      (getHidentHeight() == false) ? SizedBox(height: getProportionateScreenHeight(0).h) : SizedBox(height: getProportionateScreenHeight(12).h),
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