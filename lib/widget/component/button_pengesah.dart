import 'package:flutter/material.dart';
import 'package:mgp_mobile_app/widget/component/button_approval.dart';
import 'package:mgp_mobile_app/widget/theme/constants.dart';

class ButtonPengesah extends StatelessWidget {
  final bool visibilityPengesah;
  final Function() onClickedReject;
  final Function() onClickedApprove;
  const ButtonPengesah({
    Key? key,
    required this.visibilityPengesah,
    required this.onClickedReject,
    required this.onClickedApprove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visibilityPengesah,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget> [
              Expanded(
                child: ButtonApproval(
                  label: "REJECT",
                  color: rejectButtonColor,
                  onClicked: onClickedReject,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ButtonApproval(
                  label: "APPROVE",
                  color: verifyButtonColor,
                  onClicked: onClickedApprove,
                )
              )
            ],
          ),
        ],
      )
    );
  }
}