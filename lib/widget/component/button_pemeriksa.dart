import 'package:flutter/material.dart';

import 'package:mgp_mobile_app/widget/component/button_approval.dart';
import 'package:mgp_mobile_app/widget/theme/constants.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class ButtonPemeriksa extends StatelessWidget {
  final bool visibilityPemeriksa;
  final Function() onClickedRevise;
  final Function() onClickedReject;
  final Function() onClickedVerify;
  final bool isLoading;
  const ButtonPemeriksa({
    Key? key,
    required this.visibilityPemeriksa,
    required this.onClickedRevise,
    required this.onClickedReject,
    required this.onClickedVerify,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visibilityPemeriksa,
      child: isLoading == false
      ? Column(
          children: <Widget>[
            ButtonApproval(
              label: "REVISE",
              color: reviseButtonColor,
              onClicked: onClickedRevise, 
            ),
            SizedBox(height: getProportionateScreenHeight(15)),
            Row(
              children: <Widget> [
                Expanded(
                  child: ButtonApproval(
                    label: "REJECT",
                    color: rejectButtonColor,
                    onClicked: onClickedReject, 
                  ),
                ),
                SizedBox(width: getProportionateScreenWidth(10)),
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
      : const Center(
          child: CircularProgressIndicator(),
        ),
    );
  }
}