import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/widget/component/card_gambar.dart';
import 'package:mgp_mobile_app/widget/component/preview_image.dart';
import 'package:mgp_mobile_app/widget/theme/constants.dart';
import 'package:mgp_mobile_app/model/hrdu/rae/analisa_single_rae.dart';
import 'package:mgp_mobile_app/widget/component/skeleton.dart';

class BodyGambar extends StatefulWidget {
  final Future<AnalisaSingleRegrae> futureAnalisaSingleRae;
  const BodyGambar({Key? key, required this.futureAnalisaSingleRae }) : super(key: key);

  @override
  State<BodyGambar> createState() => _BodyGambarState();
}

class _BodyGambarState extends State<BodyGambar> {
  late List gambar = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: FutureBuilder(
        future: widget.futureAnalisaSingleRae,
        builder: (BuildContext context, AsyncSnapshot<AnalisaSingleRegrae> snapshot) {
          if (snapshot.hasData) {
            var listGambar = snapshot.data;
            if (listGambar!.data!.gambar!.isNotEmpty) {
              gambar.clear();
              for (var i = 0; i < extensionGambar.length; i++) {
                for (var j = 0; j < listGambar.data!.gambar!.length; j++) {
                  if (listGambar.data!.gambar![j]!.pathGambar!.contains(extensionGambar[i])) {
                    gambar.add(listGambar.data!.gambar![j]!.pathGambar);
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
                  const SizedBox(height: 5),
                  Row(
                    children: const <Widget>[
                      Expanded(
                        child: Skeleton(height: 100, width: 100)
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Skeleton(height: 100, width: 100)
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: const <Widget>[
                      Expanded(
                        child: Skeleton(height: 100, width: 100)
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Skeleton(height: 100, width: 100)
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