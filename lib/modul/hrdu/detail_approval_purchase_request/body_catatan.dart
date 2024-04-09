import 'package:flutter/material.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/purchase_request/getX_detail_approval_purchase_request.dart';
import 'package:mgp_mobile_app/widget/component/card_expansion_detail.dart';
import 'package:mgp_mobile_app/widget/component/card_item_expansion_detail.dart';
import 'package:mgp_mobile_app/widget/component/field_catatan_approval.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class BodyCatatan extends StatelessWidget {
  final GetxDetailPurchaseRequest controllerData;
  const BodyCatatan({Key? key, required this.controllerData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CardExpansionDetail(
          label: "Catatan Purchase Request",
          children: <Widget> [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
              child: CardItemExpansionDetail(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10), vertical: getProportionateScreenHeight(10)),
                  child: (controllerData.dataDetailPurchaseRequest['catatanPr'] != null)
                  ? Text(controllerData.dataDetailPurchaseRequest['catatanPr'].toString(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  )
                  :  const Text("-",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.left,
                  )
                ),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(10)),
          ],
        ),
        if (controllerData.listDataApprovalPurchaseRequest.isNotEmpty)...[
          CardExpansionDetail(
            label: "Catatan Approval",
            children: <Widget> [
              ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                itemCount: controllerData.listDataApprovalPurchaseRequest.length,
                itemBuilder: (context, index){
                  return FieldCatatanApproval(
                    index: index,
                    statusApproval: controllerData.listDataApprovalPurchaseRequest[index].statusApproval,
                    namaKaryawan: controllerData.listDataApprovalPurchaseRequest[index].namaKaryawan,
                    catatanApproval: controllerData.listDataApprovalPurchaseRequest[index].catatan,
                    tglApproval: controllerData.listDataApprovalPurchaseRequest[index].tglApproval,
                  );
                },
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              ),
              SizedBox(height: getProportionateScreenHeight(10)),
            ]
          ),
        ],
      ],
    );
  }
}