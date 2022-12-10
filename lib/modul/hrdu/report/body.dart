import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:mgp_mobile_app/modul/hrdu/menu_report_hrdu/report_harga_perkiraan_sendiri/report_harga_perkiraan_sendiri.dart';
import 'package:mgp_mobile_app/widget/component/card_menu_approval.dart';
import 'package:mgp_mobile_app/widget/component/icon_menu_approval.dart';
import 'package:mgp_mobile_app/widget/component/icon_trailing_menu_approval.dart';
import 'package:mgp_mobile_app/widget/component/text_menu_approval.dart';
import 'package:mgp_mobile_app/widget/theme/constants.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late String tokenUser;
  late SharedPreferences loginData;
  late String? deviceToken;
  late List dataHakAkses = [];
  late List hakAksesReport = [];

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
  }

  @override
  void initState(){
    getHakAksesUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: getProportionateScreenHeight(15)),
          CardMenuApproval(
            child: ListView.separated(
              separatorBuilder: (context, index) => const Divider(
                color: Colors.black,
              ),
              itemCount: hakAksesReport.length,
              itemBuilder: (BuildContext context, index){
                return ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15.0)),
                  leading: const IconMenuApproval(),
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      if(hakAksesReport[index] == hakAksesHrduMasterData[0])...[
                        const TextMenuApproval(
                          label: "Harga Perkiraan Sendiri"
                        ),
                      ],
                    ],
                  ),
                  trailing: const IconTrailingMenuApproval(),
                  onTap: () {
                    if (hakAksesReport[index] == hakAksesHrduMasterData[0]) {
                      Get.to(const HargaPerkiraanSendiriView());
                    }
                  },
                );
              },
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
            ),
          ),
        ],
      ),
    );
  }
}