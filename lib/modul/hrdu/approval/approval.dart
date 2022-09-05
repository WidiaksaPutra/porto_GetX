import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/main_page/main_page.dart';
import 'package:mgp_mobile_app/widget/theme/appbar_theme_color.dart';
import 'package:mgp_mobile_app/widget/theme/constants.dart';
import 'package:mgp_mobile_app/modul/hrdu/approval/body_approval.dart';
import 'package:mgp_mobile_app/modul/hrdu/approval/body_history.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class ApprovalView extends StatefulWidget {
  const ApprovalView({Key? key}) : super(key: key);

  @override
  _ApprovalViewState createState() => _ApprovalViewState();
}

class _ApprovalViewState extends State<ApprovalView> with SingleTickerProviderStateMixin {
  late TabController controller;
  String title = "Approval";

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
    controller.addListener(() { 
      setState(() {
        if (controller.index == 0) {
          title = "Approval";
        } else {
          title = "History";
        }
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(title.toString(),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: GestureDetector(
            onTap: () {
              Get.offAll(const MainPage());
            },
            child: const Icon(
              Icons.arrow_back
            ),
          ),
          flexibleSpace: const AppBarThemeColor(),
        ),
        body: Column(
          children: <Widget>[
            Material(
              elevation: 2,
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: getProportionateScreenWidth(1).w,
                      color: const Color.fromRGBO(0, 0, 0, 0.08)
                    )
                  )
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: getProportionateScreenHeight(40).h,
                  child: TabBar(
                    controller: controller,
                    indicatorColor: kPrimaryColor,
                    labelStyle: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Poppins"
                    ),
                    labelColor: kPrimaryColor,
                    unselectedLabelColor: const Color.fromRGBO(0, 0, 0, 0.61),
                    tabs: const <Widget>[
                      Tab(text: "Approval"),
                      Tab(text: "History"),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: controller,
                children: const <Widget>[
                  BodyApproval(),
                  BodyHistory(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}