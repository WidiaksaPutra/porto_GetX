import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/controller_getX/default/default_konstanta.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/purchase_request/getX_detail_approval_purchase_request.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_purchase_request/detail_approval_purchase_request.dart';
import 'package:mgp_mobile_app/widget/component/card_expansion_detail.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_right_row.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_text.dart';
import 'package:mgp_mobile_app/widget/component/card_item_expansion_detail.dart';
import 'package:mgp_mobile_app/widget/component/highlight_item_name.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class BodyCardItem extends StatelessWidget with defaultKonstanta{
  final GetxDetailPurchaseRequest controllerData;
  BodyCardItem({Key? key, required this.controllerData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardExpansionDetail(
      label: "Item Purchase Request",
      children: <Widget> [
        ListView.separated(
          separatorBuilder: (context, index) => SizedBox(
            height: getProportionateScreenHeight(10),
          ),
          itemCount: controllerData.listDataDetailPurchaseRequest.length,
          itemBuilder: (BuildContext context, index){
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
              child: CardItemExpansionDetail(
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0), vertical: getProportionateScreenHeight(10.0)),
                  title: HighlightItemName(
                    child: Text(
                      controllerData.listDataDetailPurchaseRequest[index].kodeItem.toString(),
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  subtitle: Padding(
                    padding: EdgeInsets.only(top: getProportionateScreenHeight(15)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CardFieldItemText(
                          label: "Nama Item",
                          contentData: controllerData.listDataDetailPurchaseRequest[index].namaItem,
                          flexLeftRow: 12,
                          flexRightRow: 20,
                        ),
                        SizedBox(height: getProportionateScreenHeight(10)),
                        CardFieldItemRightRow(
                          label: "Qty",
                          rightRow: <Widget> [
                            Padding(
                              padding: const EdgeInsets.only(left: 0),
                              child: (controllerData.listDataDetailPurchaseRequest[index].qty != "-")
                              ? (controllerData.listDataDetailPurchaseRequest[index].namaSatuan != "-")
                                ? Text(
                                    formatDecimalNol.format(double.parse(controllerData.listDataDetailPurchaseRequest[index].qty.toString())).toString()
                                    +" "+ controllerData.listDataDetailPurchaseRequest[index].namaSatuan.toString(),
                                    style: const TextStyle(color: Colors.black),
                                    textAlign: TextAlign.left,
                                  )
                                : Text(
                                    formatDecimalNol.format(double.parse(controllerData.listDataDetailPurchaseRequest[index].qty.toString())).toString(),
                                    style: const TextStyle(color: Colors.black),
                                    textAlign: TextAlign.left,
                                  )
                              : const Text(
                                  "-",
                                  style: TextStyle(color: Colors.black),
                                  textAlign: TextAlign.left,
                                )
                            ),
                          ],
                          flexLeftRow: 12,
                          flexRightRow: 20,
                        ),
                      ],
                    ),
                  ),
                  onTap : () {
                    List<String> gambarIn = controllerData.listDataDetailPurchaseRequest[index].pathGambar;
                    Get.to(DetailGambarPurchaseRequestView(gambarIndex: gambarIn));
                  },
                ),
              ),
            );
          },
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
        ),
        SizedBox(height: getProportionateScreenHeight(10))
      ],
    );
  }
}