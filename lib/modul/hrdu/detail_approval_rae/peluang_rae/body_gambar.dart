import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mgp_mobile_app/model/hrdu/rae/detail_peluang_rae.dart';
import 'package:mgp_mobile_app/widget/component/card_gambar.dart';
import 'package:mgp_mobile_app/widget/component/preview_image.dart';
import 'package:mgp_mobile_app/widget/theme/constants.dart';
import 'package:mgp_mobile_app/widget/component/skeleton.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class BodyGambar extends StatefulWidget {
  final Future<DetailPeluangRegrae> futureAnalisaSingleGambar;
  const BodyGambar({Key? key, required this.futureAnalisaSingleGambar }) : super(key: key);

  @override
  State<BodyGambar> createState() => _BodyGambarState();
}

class _BodyGambarState extends State<BodyGambar> {
  late List gambar = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
      child: FutureBuilder(
        future: widget.futureAnalisaSingleGambar,
        builder: (BuildContext context, AsyncSnapshot<DetailPeluangRegrae> snapshot) {
          if (snapshot.hasData) {
            var listGambar = snapshot.data;
            if (listGambar!.data!.gambar!.isNotEmpty) {
              gambar.clear();
              for (var i = 0; i < extensionGambar.length; i++) {
                for (var j = 0; j < listGambar.data!.gambar!.length; j++) {
                  if (listGambar.data!.gambar![j].pathGambar!.contains(extensionGambar[i])) {
                    gambar.add(listGambar.data!.gambar![j].pathGambar);
                  }
                }
              }
            }
            if (gambar.isNotEmpty) {
              return Column(
                children: <Widget>[
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 3 / 2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                      ),
                      itemCount: gambar.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return CardGambar(
                          imageLink: gambar[index].toString(),
                          onTap: () {
                            Get.to(PreviewImage(imageLink: gambar));
                          },
                        );
                      }
                    ),
                  ),
                ],
              );
            } else {
              return const Center(
                child: Text("Tidak Ada File Gambar"),
              );
            }
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