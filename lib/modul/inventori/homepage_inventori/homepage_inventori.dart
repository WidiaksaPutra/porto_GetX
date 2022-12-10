
import 'package:flutter_svg/svg.dart';
import 'package:mgp_mobile_app/widget/theme/constants.dart';
import 'package:mgp_mobile_app/modul/hrdu/approval/approval.dart';
import 'package:mgp_mobile_app/modul/hrdu/dashboard_hrdu/dashboard_hrdu.dart';
import 'package:mgp_mobile_app/modul/hrdu/report/report.dart';
import 'package:flutter/material.dart';
import 'package:mgp_mobile_app/widget/component/bottom_navigation_box.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class HomePageInventori extends StatefulWidget {
  const HomePageInventori({Key? key}) : super(key: key);

  @override
  _HomePageInventoriState createState() => _HomePageInventoriState();
}

class _HomePageInventoriState extends State<HomePageInventori> {
  int selectedIndex = 0;
  PageController pageController = PageController();
  List<Widget> screens = [
    const DashboardHRDUView(),
    const ApprovalView(),
    const ReportView(),
    const ReportView(),
  ];
  List<BottomNavigationItem> bottomItems = [
    BottomNavigationItem("Dashboard", "assets/icons/Dashboard.svg"),
    BottomNavigationItem("Master Data", "assets/icons/master_data.svg"),
    BottomNavigationItem("Transaksi", "assets/icons/transaksi.svg"),
    BottomNavigationItem("Report", "assets/icons/report.svg"),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    pageController.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  @override
  void initState(){
    pageController =  PageController(
      initialPage: selectedIndex,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: pageController,
        itemCount: screens.length,
        onPageChanged: (newPage){
          setState((){
            selectedIndex = newPage;
          });
        },
        itemBuilder: (BuildContext context, int index) {
          return screens[index];
        },
      ),
      bottomNavigationBar: BottomNavigationBox(
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          items: bottomItems.map(
            (item) => BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(7)),
                child: SvgPicture.asset(
                  item.icon,
                  width: getProportionateScreenWidth(25),
                  height: getProportionateScreenHeight(25),
                  color: selectedIndex == bottomItems.indexOf(item) ? kPrimaryColor : kInActiveIconColor,
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
    );
  }
}