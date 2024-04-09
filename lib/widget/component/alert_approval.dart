import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mgp_mobile_app/widget/theme/constants.dart';
import 'package:mgp_mobile_app/widget/component/button_alert.dart';
import 'package:mgp_mobile_app/widget/component/button_approval.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';
import 'package:sizer/sizer.dart';

import 'card_item_expansion_detail.dart';

class AlertApproval extends StatelessWidget {
  final String labelButton;
  final Color colorButton;
  final VoidCallback onClicked;
  final String title;
  final Color titleColor;
  final String contentApproval;
  final bool isLoading;
  const AlertApproval({
    Key? key,
    required this.labelButton,
    required this.colorButton,
    required this.onClicked,
    required this.title,
    required this.titleColor,
    required this.contentApproval, 
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0)),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) { 
          return ConstrainedBox(
            constraints: BoxConstraints(maxHeight: constraints.maxHeight - getProportionateScreenHeight(500)),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              scrollDirection:Axis.vertical,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: titleColor,
                    fontWeight: FontWeight.w700
                  ),
                  textAlign: TextAlign.center,
                ),
                const Divider(
                  color: colorCardItem,
                  thickness: 1.5,
                ),    
                Padding(
                  padding: EdgeInsets.only(left: getProportionateScreenWidth(10), right: getProportionateScreenWidth(10)),
                  child: CardItemExpansionDetail(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10), vertical: getProportionateScreenHeight(10)),
                      child: Row(
                        children: <Widget> [
                          Expanded(
                            child: Text(
                              "Apakah anda yakin melakukan "+contentApproval+" dokumen ini?",
                              style: TextStyle(
                                fontSize: 15.sp,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: getProportionateScreenWidth(10), right: getProportionateScreenWidth(10)),
                  child: (size.height > 800 )
                  ? Row(
                      children: <Widget> [
                        Expanded(
                          child: ButtonAlert(
                            label: "Batal",
                            color: rejectButtonColor,
                            onClicked: () {
                              // Get.back();
                              Navigator.of(Get.overlayContext!, rootNavigator: true).pop();
                            }
                          )
                        ),
                        SizedBox(width: getProportionateScreenWidth(10)),
                        Expanded(
                          child: ButtonApproval(
                            label: labelButton,
                            color: colorButton,
                            onClicked: onClicked, 
                          )
                        ),
                      ],
                    )
                  : Row(
                    children: <Widget> [
                      Expanded(
                        child: IconAlert(color: rejectButtonColor, onClicked: () {  
                          // Get.back();
                          Navigator.of(Get.overlayContext!, rootNavigator: true).pop();
                        },)
                      ),
                      SizedBox(width: getProportionateScreenWidth(10)),
                      Expanded(
                        child: IconApproval(
                          color: colorButton,
                          onClicked: onClicked, 
                        )
                      ),
                    ],
                  )
                ),        
              ],
            ),
          );
        },
      ),
    );
  }
}