import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/controller_getX/default/getX_default_gambar.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/purchase_request/getX_detail_approval_purchase_request.dart';
import 'package:mgp_mobile_app/widget/component/card_gambar.dart';
import 'package:mgp_mobile_app/widget/component/componen_loading.dart';
import 'package:mgp_mobile_app/widget/component/preview_image.dart';
import 'package:mgp_mobile_app/widget/component/skeleton.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class BodyGambarItem extends StatelessWidget {
  final List<String>? gambarIndex;
  const BodyGambarItem({Key? key, required this.gambarIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
      child: GetX<GetxDetailPurchaseRequest>(
        init: GetxDetailPurchaseRequest(),
        builder: (controllerData){
        if((controllerData.loading.value == false)){
          Get.put(DefaultGambar()).defaultGambar(gambarIndex!);
          return GetX<DefaultGambar>(
            init: DefaultGambar(),
            builder: (controller) => SizedBox(
              child: (controller.gambar.isNotEmpty) 
              ? Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                  ),
                  itemCount: controller.gambar.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return CardGambar(
                      imageLink: controller.gambar[index].toString(),
                      onTap: () {
                        Get.to(PreviewImage(imageLink: controller.gambar));
                      },
                    );
                  }
                ),
              )
              : const Center(
                  child: Text("Tidak Ada File Gambar"),
                ),
            ),
          );
        }else {
          return const ComponenLoadingBasicData();
        }}
      ),
    );
  }
}