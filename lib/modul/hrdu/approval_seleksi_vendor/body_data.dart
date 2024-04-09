import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/seleksi_vendor/getX_approval_seleksi_vendor.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_seleksi_vendor/detail_approval_seleksi_vendor_view.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_date.dart';
import 'package:mgp_mobile_app/widget/component/card_field_item_format_currency.dart';
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
            GetX<GetxApprovalSeleksiVendor>(
              init: GetxApprovalSeleksiVendor(),
              builder: (controller) => RefreshIndicator(
                onRefresh: controller.refreshApprovalSeleksiVendor,
                child: ListView.builder(
                  controller: controller.scrollController,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: controller.dataApprovalSeleksiVendor.length,
                  itemBuilder: (context, index){
                    num hargaSatuan = double.parse(controller.dataApprovalSeleksiVendor[index].hargaKesepakatan.toString());
                    num totalHarga = (double.parse(hargaSatuan.toString())) * double.parse(controller.dataApprovalSeleksiVendor[index].qtyOrder.toString());
                    return CardList(
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0), vertical: getProportionateScreenHeight(10.0)),
                        title: HighlightItemName(
                          child: Text(
                            controller.dataApprovalSeleksiVendor[index].noSeleksiVendor.toString(),
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
                                contentData: controller.dataApprovalSeleksiVendor[index].namaKaryawanPengaju,
                                flexLeftRow: 12,
                                flexRightRow: 20,
                              ),
                              SizedBox(height: getProportionateScreenHeight(10)),
                              CardFieldItemText(
                                label: "Jabatan",
                                contentData: controller.dataApprovalSeleksiVendor[index].namaJabatanPengaju,
                                flexLeftRow: 12,
                                flexRightRow: 20,
                              ),
                              SizedBox(height: getProportionateScreenHeight(10)),
                              CardFieldItemDate(
                                label: "Tgl. Seleksi Vendor",
                                date: controller.dataApprovalSeleksiVendor[index].tglSeleksiVendor,
                                flexLeftRow: 12,
                                flexRightRow: 20,
                              ),
                              SizedBox(height: getProportionateScreenHeight(10)),
                              CardFieldItemText(
                                label: "Vendor",
                                contentData: controller.dataApprovalSeleksiVendor[index].namaVendor,
                                flexLeftRow: 12,
                                flexRightRow: 20,
                              ),
                              CardFieldItemDate(
                                label: "Tgl. Purchase Request",
                                date: controller.dataApprovalSeleksiVendor[index].tglPurchaseRequest,
                                flexLeftRow: 12,
                                flexRightRow: 20,
                              ),
                              SizedBox(height: getProportionateScreenHeight(10)),
                              CardFieldItemText(
                                label: "No Purchase Request",
                                contentData: controller.dataApprovalSeleksiVendor[index].noPurchaseRequest,
                                flexLeftRow: 12,
                                flexRightRow: 20,
                              ),
                              SizedBox(height: getProportionateScreenHeight(10)),
                              CardFieldItemText(
                                label: "Item Barang",
                                contentData: controller.dataApprovalSeleksiVendor[index].namaItem,
                                flexLeftRow: 12,
                                flexRightRow: 20,
                              ),
                              SizedBox(height: getProportionateScreenHeight(10)),
                              CardFieldItemText(
                                label: "Keperluan",
                                contentData: controller.dataApprovalSeleksiVendor[index].keperluan,
                                flexLeftRow: 12,
                                flexRightRow: 20,
                              ),
                              SizedBox(height: getProportionateScreenHeight(10)),
                              CardFieldItemDate(
                                label: "Tgl. Pemakaian",
                                date: controller.dataApprovalSeleksiVendor[index].tglPemakaian,
                                flexLeftRow: 12,
                                flexRightRow: 20,
                              ),
                              SizedBox(height: getProportionateScreenHeight(5)),
                              CardFieldItemFormatCurrency(
                                label: "Harga Satuan Kesepakatan",
                                contentData: hargaSatuan.toString(),
                                flexLeftRow: 15,
                                flexRightRow: 20,
                              ),
                              SizedBox(height: getProportionateScreenHeight(5)),
                              CardFieldItemFormatCurrency(
                                label: "Total Harga",
                                contentData: totalHarga.toString(),
                                flexLeftRow: 15,
                                flexRightRow: 20,
                              ),
                              SizedBox(height: getProportionateScreenHeight(10)),
                              CardFieldItemStatus(
                                contentData: controller.dataApprovalSeleksiVendor[index].statusApproval,
                              ),
                            ],
                          ),
                        ), 
                        onTap: () {
                          Get.to(
                            DetailSeleksiVendorView(
                              noSeleksiVendor: controller.dataApprovalSeleksiVendor[index].noSeleksiVendor.toString(),
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

            GetX<GetxApprovalSeleksiVendor>(
              init: GetxApprovalSeleksiVendor(),
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