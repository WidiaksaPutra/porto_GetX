import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/seleksi_vendor/getX_history_seleksi_vendor.dart';
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
            GetX<GetxHistorySeleksiVendor>(
              init: GetxHistorySeleksiVendor(),
              builder: (controller) => RefreshIndicator(
                onRefresh: controller.refreshHistorySeleksiVendor,
                child: ListView.builder(
                  controller: controller.scrollController,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: controller.dataHistorySeleksiVendor.length,
                  itemBuilder: (context, index){
                    num hargaSatuan = double.parse(controller.dataHistorySeleksiVendor[index].detail[0].hargaKesepakatan.toString());
                    num totalHarga = (double.parse(hargaSatuan.toString())) * double.parse(controller.dataHistorySeleksiVendor[index].detail[0].qtyOrder.toString());
                    return CardList(
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20.0), vertical: getProportionateScreenHeight(10.0)),
                        title: HighlightItemName(
                          child: Text(
                            controller.dataHistorySeleksiVendor[index].noSeleksiVendor.toString(),
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
                                contentData: controller.dataHistorySeleksiVendor[index].namaKaryawanPengaju,
                                flexLeftRow: 12,
                                flexRightRow: 20,
                              ),
                              SizedBox(height: getProportionateScreenHeight(10)),
                              CardFieldItemText(
                                label: "Jabatan",
                                contentData: controller.dataHistorySeleksiVendor[index].namaJabatanPengaju,
                                flexLeftRow: 12,
                                flexRightRow: 20,
                              ),
                              SizedBox(height: getProportionateScreenHeight(10)),
                              CardFieldItemDate(
                                label: "Tgl. Seleksi Vendor",
                                date: controller.dataHistorySeleksiVendor[index].tglSeleksiVendor,
                                flexLeftRow: 12,
                                flexRightRow: 20,
                              ),
                              SizedBox(height: getProportionateScreenHeight(10)),
                              CardFieldItemText(
                                label: "Vendor",
                                contentData: controller.dataHistorySeleksiVendor[index].namaVendor,
                                flexLeftRow: 12,
                                flexRightRow: 20,
                              ),
                              CardFieldItemDate(
                                label: "Tgl. Purchase Request",
                                date: controller.dataHistorySeleksiVendor[index].tglPurchaseRequest,
                                flexLeftRow: 12,
                                flexRightRow: 20,
                              ),
                              SizedBox(height: getProportionateScreenHeight(10)),
                              CardFieldItemText(
                                label: "No Purchase Request",
                                contentData: controller.dataHistorySeleksiVendor[index].noPurchaseRequest,
                                flexLeftRow: 12,
                                flexRightRow: 20,
                              ),
                              SizedBox(height: getProportionateScreenHeight(10)),
                              CardFieldItemText(
                                label: "Item Barang",
                                contentData: controller.dataHistorySeleksiVendor[index].detail[0].namaItem,
                                flexLeftRow: 12,
                                flexRightRow: 20,
                              ),
                              SizedBox(height: getProportionateScreenHeight(10)),
                              CardFieldItemText(
                                label: "Keperluan",
                                contentData: controller.dataHistorySeleksiVendor[index].keperluan,
                                flexLeftRow: 12,
                                flexRightRow: 20,
                              ),
                              SizedBox(height: getProportionateScreenHeight(10)),
                              CardFieldItemDate(
                                label: "Tgl. Pemakaian",
                                date: controller.dataHistorySeleksiVendor[index].tglPemakaian,
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
                                contentData: controller.dataHistorySeleksiVendor[index].statusApproval,
                              ),
                            ],
                          ),
                        ), 
                        onTap: () {
                          Get.to(
                            DetailSeleksiVendorView(
                              noSeleksiVendor: controller.dataHistorySeleksiVendor[index].noSeleksiVendor.toString(),
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

            GetX<GetxHistorySeleksiVendor>(
              init: GetxHistorySeleksiVendor(),
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