import 'package:flutter/material.dart';
import 'package:mgp_mobile_app/widget/component/button_approval.dart';
import 'package:mgp_mobile_app/widget/theme/constants.dart';

class ButtonPemeriksa extends StatelessWidget {
  final bool visibilityPemeriksa;
  final Function() onClickedRevise;
  final Function() onClickedReject;
  final Function() onClickedVerify;
  const ButtonPemeriksa({
    Key? key,
    required this.visibilityPemeriksa,
    required this.onClickedRevise,
    required this.onClickedReject,
    required this.onClickedVerify,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visibilityPemeriksa,
      child: Column(
        children: <Widget>[
          ButtonApproval(
            label: "REVISE",
            color: reviseButtonColor,
            onClicked: onClickedRevise,
          ),
          const SizedBox(height: 15),
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
                  label: "VERIFY",
                  color: verifyButtonColor,
                  onClicked: onClickedVerify,
                ),
              ),
            ],
          ),
        ],
      )
    );
  }
}