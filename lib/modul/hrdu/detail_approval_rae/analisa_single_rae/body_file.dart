import 'dart:io';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
// import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/controller_getX/default/getX_default_file.dart';
import 'package:mgp_mobile_app/model/hrdu/rae/analisa_single_rae.dart';
import 'package:mgp_mobile_app/widget/component/card_file.dart';
import 'package:mgp_mobile_app/widget/component/skeleton.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';
// import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class BodyFile extends StatefulWidget {
  final Future<AnalisaSingleRegrae> futureAnalisaSingleFile;
  const BodyFile({Key? key, required this.futureAnalisaSingleFile}) : super(key: key);

  @override
  State<BodyFile> createState() => _BodyFileState();
}

class _BodyFileState extends State<BodyFile> {
  late List fileIn;

  Future fetchOpenDownloadFile({required String urlDownload, required String nameFile}) async {
    final fileDocument = await downloadFile(url: urlDownload, nameFile: nameFile);
    if (fileDocument == null) {
      return;
    }
    // OpenFile.open(fileDocument.path);
  }

  Future<File?> pickFile() async {
    final pickedFile = await FilePicker.platform.pickFiles();

    if (pickedFile == null) {
      return null;
    }
    return File(pickedFile.files.first.path!);
  }

  Future<File?> downloadFile({required String url, required String nameFile}) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final file = File('${appStorage.path}/$nameFile');
    
    try {
      final response = await Dio().get(
        url,
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
          receiveTimeout: const Duration(),
        ),
      );

      final writeDocument = file.openSync(mode: FileMode.write);
      writeDocument.writeFromSync(response.data);
      await writeDocument.close();

      return file;

    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
      child: FutureBuilder(
        future: widget.futureAnalisaSingleFile,
        builder: (BuildContext context, AsyncSnapshot<AnalisaSingleRegrae> snapshot) {
          if (snapshot.hasData) {
            var listFile = snapshot.data;
            fileIn = listFile!.data!.gambar!;
            Get.put(DefaultFile()).defaultFile(fileIn);
            return GetX<DefaultFile>(
              init: DefaultFile(),
              builder: (controller) => SizedBox(
              child: (controller.file.isNotEmpty)
              ? Column(
                  children: <Widget>[
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: controller.file.length,
                        itemBuilder: (context, index) {
                          return CardFile(
                            label: "Nama File",
                            contentData: controller.file[index],
                            onPressed: () async {
                              fetchOpenDownloadFile(
                                urlDownload: controller.linkFile[index],
                                nameFile: controller.file[index],
                              );
                            },
                          );
                        }
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(10)),
                  ],
                )
              : const Center(
                  child: Text("Tidak Ada File"),
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