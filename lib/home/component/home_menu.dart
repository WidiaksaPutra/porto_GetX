import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/modul/hrdu/homepage_hrdu/homepage_hrdu.dart';
import 'package:mgp_mobile_app/widget/component/icon_modul.dart';

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
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: <Widget>[
          const SizedBox(height: 10),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: MediaQuery.of(context).size.height <= 600.0 ? 1 : MediaQuery.of(context).size.height >= 650.0 ? 1.2 : 1.2,
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
                      const SizedBox(height: 2),
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