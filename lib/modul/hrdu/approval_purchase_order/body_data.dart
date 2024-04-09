import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/purchase_order/getX_approval_purchase_order.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_purchase_order/detail_approval_purchase_order.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_date.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_status.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_text.dart';
import 'package:mgp_mobile_app/widget/component/card_list.dart';
import 'package:mgp_mobile_app/widget/component/highlight_item_name.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class BodyData extends StatelessWidget {
  const BodyData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: <Widget>[
            GetX<GetxApprovalPurchaseOrder>(
              init: GetxApprovalPurchaseOrder(),
              builder: (controller) => RefreshIndicator(
                onRefresh: controller.refreshApprovalPurchaseOrder,
                child: ListView.builder(
                  controller: controller.scrollController,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: controller.dataApprovalPurchaseOrder.length,
                  itemBuilder: (context, index){
                    return CardList(
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0), vertical: getProportionateScreenHeight(10.0)),
                        title: HighlightItemName(
                          child: Text(
                            controller.dataApprovalPurchaseOrder[index].noPurchaseOrder.toString(),
                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
                                label: "Diajukan oleh",
                                contentData: controller.dataApprovalPurchaseOrder[index].namaKaryawanPengaju,
                                flexLeftRow: 12,
                                flexRightRow: 20,
                              ),
                              SizedBox(height: getProportionateScreenHeight(10)),
                              CardFieldItemText(
                                label: "Jabatan",
                                contentData: controller.dataApprovalPurchaseOrder[index].namaJabatanPengaju,
                                flexLeftRow: 12,
                                flexRightRow: 20,
                              ),
                              SizedBox(height: getProportionateScreenHeight(10)),
                              CardFieldItemDate(
                                label: "Tgl. Input Data",
                                date: controller.dataApprovalPurchaseOrder[index].tglApproval,
                                flexLeftRow: 12,
                                flexRightRow: 20,
                              ),
                              SizedBox(height: getProportionateScreenHeight(10)),
                              CardFieldItemDate(
                                label: "Tgl. Purchase Order",
                                date: controller.dataApprovalPurchaseOrder[index].tglPurchaseOrder,
                                flexLeftRow: 12,
                                flexRightRow: 20,
                              ),
                              SizedBox(height: getProportionateScreenHeight(10)),
                              CardFieldItemText(
                                label: "Vendor",
                                contentData: controller.dataApprovalPurchaseOrder[index].namaVendor,
                                flexLeftRow: 12,
                                flexRightRow: 20,
                              ),
                              SizedBox(height: getProportionateScreenHeight(10)),
                              CardFieldItemDate(
                                label: "Tgl. Pengiriman",
                                date: controller.dataApprovalPurchaseOrder[index].tglPengiriman,
                                flexLeftRow: 12,
                                flexRightRow: 20,
                              ),
                              SizedBox(height: getProportionateScreenHeight(10)),
                              CardFieldItemStatus(
                                contentData: controller.dataApprovalPurchaseOrder[index].statusApproval,
                              ),
                            ],
                          ),
                        ), 
                        onTap: () {
                          Get.to(
                            DetailPurchaseOrderView(
                              noPurchaseOrder: controller.dataApprovalPurchaseOrder[index].noPurchaseOrder.toString(),
                              statusMenu: "Approval",
                            )
                          );
                        },
                      ),
                    );
                  }
                ),
              )
            ),

            GetX<GetxApprovalPurchaseOrder>(
              init: GetxApprovalPurchaseOrder(),
              builder: (controller2) => (controller2.scrollLoading.value)
              ? Positioned(
                  left: 0,
                  bottom: 0,
                  child: SizedBox(
                    height: getProportionateScreenHeight(80),
                    width: constraints.maxWidth,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                )
              : const Text(""),
            )
          ],
        );
      }
    );
  }
}