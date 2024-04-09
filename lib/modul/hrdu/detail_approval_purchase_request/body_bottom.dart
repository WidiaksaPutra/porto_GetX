import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/controller_getX/default/getX_default_visibility_detail.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/purchase_request/getX_detail_approval_purchase_request.dart';
import 'package:mgp_mobile_app/widget/component/button_pemeriksa.dart';
import 'package:mgp_mobile_app/widget/component/button_pengesah.dart';
import 'package:mgp_mobile_app/widget/component/catatan_approval.dart';
import 'package:mgp_mobile_app/widget/component/error_form.dart';
import 'package:mgp_mobile_app/widget/theme/constants.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class BodyBottom extends StatelessWidget {
  final GetxDetailPurchaseRequest controllerData;
  const BodyBottom({Key? key, required this.controllerData}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final _catatanTextEditingController = TextEditingController();
    return GetX<DefaultVisibilityDetail>(
      init: DefaultVisibilityDetail(),
      builder:(controllerVisible) => Column(
        children: [
          Visibility(
            visible: controllerVisible.visibilityStatusMenu.value,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10), horizontal: getProportionateScreenWidth(3)),
              child: CatatanApproval(
                controller: _catatanTextEditingController,
                onChanged: (value) {
                  Get.put(DefaultVisibilityDetail()).defaultCatatanVisibilityDetail(value);
                },
                validator: (value) {
                  Get.put(DefaultVisibilityDetail()).defaultCatatanVisibilityDetail(value);
                }
              ),
            ),
          ),
          Visibility(
            visible: controllerVisible.catatanError.value,
            child: Column(
              children: <Widget>[
                SizedBox(height: getProportionateScreenHeight(5)),
                const FormErrors(errors: kCatatanError),
                SizedBox(height: getProportionateScreenHeight(8)),
              ],
            )
          ),
          Visibility(
            visible: controllerVisible.visibilityStatusMenu.value,
            child: SizedBox(height: getProportionateScreenHeight(10))
          ),
          Visibility(
            visible: controllerVisible.visibilityStatusMenu.value,
            child: ButtonPemeriksa(
              visibilityPemeriksa: controllerVisible.visibilityPemeriksa.value,
              onClickedRevise: () {
                if (_catatanTextEditingController.text != "") {
                  controllerData.showAlertDialog(
                    "REVISE Purchase Request",
                    "REVISE",
                    reviseButtonColor,
                    controllerData.dataDetailPurchaseRequest['noPr'].toString(),
                    "REV",
                    _catatanTextEditingController.text,
                    controllerData.dataDetailPurchaseRequest['baseline'].toString(),
                    context
                  );
                }
              },
              onClickedReject: () { 
                if (_catatanTextEditingController.text != "") {
                  controllerData.showAlertDialog(
                    "REJECT Purchase Request",
                    "REJECT",
                    rejectButtonColor,
                    controllerData.dataDetailPurchaseRequest['noPr'].toString(),
                    "REJ",
                    _catatanTextEditingController.text,
                    controllerData.dataDetailPurchaseRequest['baseline'].toString(),
                    context
                  );
                }
              },
              onClickedVerify: () {               
                if (_catatanTextEditingController.text != "") {
                  controllerData.showAlertDialog(
                    "VERIFY Purchase Request",
                    "VERIFY",
                    verifyButtonColor,
                    controllerData.dataDetailPurchaseRequest['noPr'].toString(),
                    "VER",
                    _catatanTextEditingController.text,
                    controllerData.dataDetailPurchaseRequest['baseline'].toString(),
                    context
                  );
                }
              }, isLoading: controllerData.isLoading.value,
            ),
          ),
          Visibility(
            visible: controllerVisible.visibilityStatusMenu.value,
            child: ButtonPengesah(
              visibilityPengesah: controllerVisible.visibilityPengesah.value,
              onClickedReject: () {
                if (_catatanTextEditingController.text != "") {
                  controllerData.showAlertDialog(
                    "REJECT Purchase Request",
                    "REJECT",
                    rejectButtonColor,
                    controllerData.dataDetailPurchaseRequest['noPr'].toString(),
                    "REJ",
                    _catatanTextEditingController.text,
                    controllerData.dataDetailPurchaseRequest['baseline'].toString(),
                    context
                  );
                } 
              },
              onClickedApprove: () {
                if (_catatanTextEditingController.text != "") {
                  controllerData.showAlertDialog(
                    "APPROVE Purchase Request",
                    "APPROVE",
                    verifyButtonColor,
                    controllerData.dataDetailPurchaseRequest['noPr'].toString(),
                    "APP",
                    _catatanTextEditingController.text,
                    controllerData.dataDetailPurchaseRequest['baseline'].toString(),
                    context
                  );
                }
              }, isLoading: controllerData.isLoading.value,
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
        ],
      )
    );
  }
}