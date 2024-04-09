import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/purchase_request/getX_history_purchase_request.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_purchase_request/detail_approval_purchase_request.dart';
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
            GetX<GetxHistoryPurchaseRequest>(
              init: GetxHistoryPurchaseRequest(),
              builder: (controller) => RefreshIndicator(
                onRefresh: controller.refreshHistoryPurchaseRequest,
                child: ListView.builder(
                  controller: controller.scrollController,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: controller.dataHistoryPurchaseRequest.length,
                  itemBuilder: (context, index){
                    return CardList(
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0), vertical: getProportionateScreenHeight(10.0)),
                        title: Row(
                          children: <Widget> [
                            HighlightItemName(
                              child: Text(
                                controller.dataHistoryPurchaseRequest[index].noPurchaseRequest.toString(),
                                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        subtitle: Padding(
                          padding: EdgeInsets.only(top: getProportionateScreenHeight(15)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              CardFieldItemText(
                                label: "Diajukan oleh",
                                contentData: controller.dataHistoryPurchaseRequest[index].namaKaryawanPengaju,
                                flexLeftRow: 12,
                                flexRightRow: 20,
                              ),
                              SizedBox(height: getProportionateScreenHeight(10)),
                              CardFieldItemText(
                                label: "Jabatan",
                                contentData: controller.dataHistoryPurchaseRequest[index].namaJabatanPengaju,
                                flexLeftRow: 12,
                                flexRightRow: 20,
                              ),
                              SizedBox(height: getProportionateScreenHeight(10)),
                              CardFieldItemDate(
                                label: "Tgl. Purchase Request",
                                date: controller.dataHistoryPurchaseRequest[index].tglPurchaseRequest,
                                flexLeftRow: 12,
                                flexRightRow: 20,
                              ),
                              SizedBox(height: getProportionateScreenHeight(10)),
                              CardFieldItemText(
                                label: "Keperluan",
                                contentData: controller.dataHistoryPurchaseRequest[index].keperluan,
                                flexLeftRow: 12,
                                flexRightRow: 20,
                              ),
                              SizedBox(height: getProportionateScreenHeight(10)),
                              CardFieldItemDate(
                                label: "Tgl. Pemakaian",
                                date: controller.dataHistoryPurchaseRequest[index].tglPemakaian,
                                flexLeftRow: 12,
                                flexRightRow: 20,
                              ),
                              SizedBox(height: getProportionateScreenHeight(10)),
                              CardFieldItemStatus(
                                contentData: controller.dataHistoryPurchaseRequest[index].statusApproval,
                              ),
                            ],
                          ),
                        ), 
                        onTap: () {
                          Get.to(
                            DetailPurchaseRequestView(
                              noPurchaseRequest: controller.dataHistoryPurchaseRequest[index].noPurchaseRequest.toString(),
                              statusMenu: "History",
                            )
                          );
                        },
                      ),
                    );
                  }
                ),
              )
            ),

            GetX<GetxHistoryPurchaseRequest>(
              init: GetxHistoryPurchaseRequest(),
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