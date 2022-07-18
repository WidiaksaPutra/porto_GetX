import 'package:flutter_svg/svg.dart';
import 'package:mgp_mobile_app/widget/theme/constants.dart';
import 'package:mgp_mobile_app/home/home.dart';
import 'package:mgp_mobile_app/notification/notification.dart';
import 'package:mgp_mobile_app/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:mgp_mobile_app/widget/component/bottom_navigation_box.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;
  PageController pageController = PageController();
  List<Widget> screens = [
    const HomeView(),
    const NotificationView(),
    const ProfilView(),
  ];
  List<BottomNavigationItem> bottomItems = [
    BottomNavigationItem("Home", "assets/icons/home.svg"),
    BottomNavigationItem("Notification", "assets/icons/notif.svg"),
    BottomNavigationItem("Profile", "assets/icons/profile.svg"),
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