import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mgp_mobile_app/controller_getX/default/getX_default_gambar.dart';
import 'package:mgp_mobile_app/model/hrdu/peluang/analisa_single_peluang_gambar.dart';
import 'package:mgp_mobile_app/widget/component/card_gambar.dart';
import 'package:mgp_mobile_app/widget/component/preview_image.dart';
import 'package:mgp_mobile_app/widget/component/skeleton.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class BodyGambar extends StatefulWidget {
  final Future<AnalisaSingleRegplgGambar> futureAnalisaSingleGambar;
  const BodyGambar({Key? key, required this.futureAnalisaSingleGambar}) : super(key: key);

  @override
  State<BodyGambar> createState() => _BodyGambarState();
}

class _BodyGambarState extends State<BodyGambar> {
  late List<Gambar>? gambarIn;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
      child: FutureBuilder(
        future: widget.futureAnalisaSingleGambar,
        builder: (BuildContext context, AsyncSnapshot<AnalisaSingleRegplgGambar> snapshot) {
          if (snapshot.hasData) {
            var listGambar = snapshot.data;
            gambarIn = listGambar!.data!.gambar;
            Get.put(DefaultGambar()).defaultGambar2(gambarIn!);
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
          } else {
            return Center(
              child: Column(
                children: <Widget>[
                  SizedBox(height: getProportionateScreenHeight(5)),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Skeleton(height: getProportionateScreenHeight(100), width: getProportionateScreenWidth(100))
                      ),
                      SizedBox(width: getProportionateScreenWidth(10)),
                      Expanded(
                        child: Skeleton(height: getProportionateScreenHeight(100), width: getProportionateScreenWidth(100))
                      ),
                    ],
                  ),
                  SizedBox(height: getProportionateScreenHeight(20)),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Skeleton(height: getProportionateScreenHeight(100), width: getProportionateScreenWidth(100))
                      ),
                      SizedBox(width: getProportionateScreenWidth(10)),
                      Expanded(
                        child: Skeleton(height: getProportionateScreenHeight(100), width: getProportionateScreenWidth(100))
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
        }
      ),
    );
  }
}