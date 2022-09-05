import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/widget/theme/constants.dart';
import 'package:mgp_mobile_app/widget/component/button_alert.dart';
import 'package:mgp_mobile_app/widget/component/button_approval.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

import 'card_item_expansion_detail.dart';

class AlertApproval extends StatelessWidget {
  final String labelButton;
  final Color colorButton;
  final VoidCallback onClicked;
  final String title;
  final Color titleColor;
  final String contentApproval;
  const AlertApproval({
    Key? key,
    required this.labelButton,
    required this.colorButton,
    required this.onClicked,
    required this.title,
    required this.titleColor,
    required this.contentApproval,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0).r),
      child: SizedBox(
        height: getProportionateScreenHeight(220).h,
        width: getProportionateScreenWidth(450).w,
        child: Column(
          children: <Widget> [
            Padding(
              padding: EdgeInsets.only(top: getProportionateScreenHeight(15).h),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 18.sp,
                  color: titleColor,
                  fontWeight: FontWeight.w700
                ),
              ),
            ),
            const Divider(
              color: colorCardItem,
              thickness: 1.5,
            ),
            Padding(
              padding: EdgeInsets.only(top: getProportionateScreenHeight(5).h, bottom: getProportionateScreenHeight(10).h, left: getProportionateScreenWidth(10).w, right: getProportionateScreenWidth(10).w),
              child: CardItemExpansionDetail(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w, vertical: getProportionateScreenHeight(10).h),
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
              padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w, vertical: getProportionateScreenHeight(10).h),
              child: Row(
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
                  SizedBox(width: getProportionateScreenWidth(10).w),
                  Expanded(
                    child: ButtonApproval(
                      label: labelButton,
                      color: colorButton,
                      onClicked: onClicked
                    )
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}