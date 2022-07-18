import 'package:flutter_svg/svg.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:mgp_mobile_app/widget/theme/constants.dart';
import 'package:mgp_mobile_app/modul/hrdu/approval/approval.dart';
import 'package:mgp_mobile_app/modul/hrdu/dashboard_hrdu/dashboard_hrdu.dart';
import 'package:mgp_mobile_app/modul/hrdu/report/report.dart';
import 'package:flutter/material.dart';
import 'package:mgp_mobile_app/widget/component/bottom_navigation_box.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  late String tokenUser;
  late SharedPreferences loginData;
  late String? deviceToken;
  late List dataHakAkses = [];
  late List hakAksesReport = [];
  List<Widget> screens = [
    const DashboardHRDUView(),
    const ApprovalView(),
    const ReportView(),
  ];
  List<BottomNavigationItem> bottomItems = [
    BottomNavigationItem("Dashboard", "assets/icons/Dashboard.svg"),
    BottomNavigationItem("Approval", "assets/icons/prv.svg"),
    BottomNavigationItem("Report", "assets/icons/report.svg"),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    pageController.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  getHakAksesUser() async {
    loginData = await SharedPreferences.getInstance();
    setState(() {
      tokenUser = loginData.getString("token").toString();
    });
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
    if (hakAksesReport.isNotEmpty) {
      setState(() {
        screens = [
          const DashboardHRDUView(),
          const ApprovalView(),
          const ReportView(),
        ];
        bottomItems = [
          BottomNavigationItem("Dashboard", "assets/icons/Dashboard.svg"),
          BottomNavigationItem("Approval", "assets/icons/prv.svg"),
          BottomNavigationItem("Report", "assets/icons/report.svg"),
        ];
      });
    } else {
      setState(() {
        screens = [
          const DashboardHRDUView(),
          const ApprovalView(),
        ];
        bottomItems = [
          BottomNavigationItem("Dashboard", "assets/icons/Dashboard.svg"),
          BottomNavigationItem("Approval", "assets/icons/prv.svg"),
        ];
      });
    }
  }

  @override
  void initState(){
    getHakAksesUser();
    selectedIndex = widget.selectedIndexPage;
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
                padding: const EdgeInsets.symmetric(vertical: 7),
                child: SvgPicture.asset(
                  item.icon,
                  width: 25,
                  height: 25,
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