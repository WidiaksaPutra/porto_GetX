import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/widget/theme/constants.dart';
import 'package:mgp_mobile_app/widget/component/button_alert.dart';
import 'package:mgp_mobile_app/widget/component/button_approval.dart';

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
        borderRadius: BorderRadius.circular(15.0)),
      child: SizedBox(
        height: 220,
        width: 450,
        child: Column(
          children: <Widget> [
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 18,
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
              padding: const EdgeInsets.only(top: 5, bottom: 10, left: 10, right: 10),
              child: CardItemExpansionDetail(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    children: <Widget> [
                      Expanded(
                        child: Text(
                          "Apakah anda yakin melakukan "+contentApproval+" dokumen ini?",
                          style: const TextStyle(
                            fontSize: 15,
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
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                children: <Widget> [
                  Expanded(
                    child: ButtonAlert(
                      label: "Batal",
                      color: rejectButtonColor,
                      onClicked: () {
                        Get.back();
                      }
                    )
                  ),
                  const SizedBox(width: 10),
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