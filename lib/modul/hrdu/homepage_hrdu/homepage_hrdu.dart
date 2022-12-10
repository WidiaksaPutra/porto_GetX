
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/homepage/getX_homepage.dart';
import 'package:mgp_mobile_app/widget/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:mgp_mobile_app/widget/component/bottom_navigation_box.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class HomePageHRDU extends StatefulWidget {
  final int selectedIndexPage;
  const HomePageHRDU({
    Key? key,
    required this.selectedIndexPage
  }) : super(key: key);

  @override
  _HomePageHRDUState createState() => _HomePageHRDUState();
}

class _HomePageHRDUState extends State<HomePageHRDU> {
  int selectedIndex = 0;
  PageController pageController = PageController();

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    pageController.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  @override
  void initState(){
    selectedIndex = widget.selectedIndexPage;
    pageController =  PageController(
      initialPage: selectedIndex,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetX<HomepageHrdu>(
      init: HomepageHrdu(),
      builder: (controller) => Scaffold(
        body: PageView.builder(
          controller: pageController,
          itemCount: controller.screensHRDU.length,
          onPageChanged: (newPage){
            setState((){
              selectedIndex = newPage;
            });
          },
          itemBuilder: (BuildContext context, int index) {
            return controller.screensHRDU[index];
          },
        ),
        bottomNavigationBar: BottomNavigationBox(
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            items: controller.bottomItemsHRDU.map(
              (item) => BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(7)),
                  child: SvgPicture.asset(
                    item.icon,
                    width: getProportionateScreenWidth(25),
                    height: getProportionateScreenHeight(25),
                    color: selectedIndex == controller.bottomItemsHRDU.indexOf(item) ? kPrimaryColor : kInActiveIconColor,
                  ),
                ),
                label: item.label,
              ),
            ).toList(),
            currentIndex: selectedIndex,
            selectedItemColor: kPrimaryColor,
            onTap: _onItemTapped,
            selectedFontSize: 14,
            unselectedFontSize: 14,
          ),
        ),
      ),
    );
  }
}