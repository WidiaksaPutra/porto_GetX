import 'package:flutter/material.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/purchase_request/getX_detail_approval_purchase_request.dart';
import 'package:mgp_mobile_app/widget/component/card_detail.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_date.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_text.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class BodyCardDetail extends StatelessWidget {
  final GetxDetailPurchaseRequest controllerData;
  const BodyCardDetail({Key? key, required this.controllerData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardDetail(
      child: ListTile(
        subtitle: Column(
          children: <Widget>[
            CardFieldItemDate(
              label: "Tgl. Purchase Request",
              date: DateTime.parse(controllerData.dataDetailPurchaseRequest['tglPr']),
              flexLeftRow: 12,
              flexRightRow: 20,
            ),
            SizedBox(height: getProportionateScreenHeight(5)),
            CardFieldItemText(
              label: "No. Purchase Request",
              contentData: controllerData.dataDetailPurchaseRequest['noPr'],
              flexLeftRow: 12,
              flexRightRow: 20,
            ),
            SizedBox(height: getProportionateScreenHeight(5)),
            CardFieldItemText(
              label: "Keperluan",
              contentData: controllerData.dataDetailPurchaseRequest['keperluan'],
              flexLeftRow: 12,
              flexRightRow: 20,
            ),
            SizedBox(height: getProportionateScreenHeight(5)),
            CardFieldItemDate(
              label: "Tgl. Pemakaian",
              date: DateTime.parse(controllerData.dataDetailPurchaseRequest['tglPemakaian']),
              flexLeftRow: 12,
              flexRightRow: 20,
            ),
            SizedBox(height: getProportionateScreenHeight(5)),
            CardFieldItemText(
              label: "Nama Proyek",
              contentData: controllerData.dataDetailPurchaseRequest['namaProyek'],
              flexLeftRow: 12,
              flexRightRow: 20,
            ),
          ],
        ),
      ),
    );
  }
}