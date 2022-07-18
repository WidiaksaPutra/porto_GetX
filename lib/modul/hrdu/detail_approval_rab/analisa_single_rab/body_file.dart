import 'dart:io';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:mgp_mobile_app/model/hrdu/rab/analisa_single_rab.dart';
import 'package:mgp_mobile_app/widget/component/card_file.dart';
import 'package:mgp_mobile_app/widget/theme/constants.dart';
import 'package:mgp_mobile_app/widget/component/skeleton.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class BodyFile extends StatefulWidget {
  final Future<AnalisaSingleRegrab> futureAnalisaSingleRab;
  const BodyFile({Key? key, required this.futureAnalisaSingleRab}) : super(key: key);

  @override
  State<BodyFile> createState() => _BodyFileState();
}

class _BodyFileState extends State<BodyFile> {
  late List file = [];
  late List linkFile = [];

  Future fetchOpenDownloadFile({required String urlDownload, required String nameFile}) async {
    final fileDocument = await downloadFile(url: urlDownload, nameFile: nameFile);
    if (fileDocument == null) {
      return;
    }
    OpenFile.open(fileDocument.path);
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
          receiveTimeout: 0,
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
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: FutureBuilder(
        future: widget.futureAnalisaSingleRab,
        builder: (BuildContext context, AsyncSnapshot<AnalisaSingleRegrab> snapshot) {
          if (snapshot.hasData) {
            var listFile = snapshot.data;
            if (listFile!.data!.gambar!.isNotEmpty) {
              file.clear();
              for (var i = 0; i < extensionFile.length; i++) {
                for (var j = 0; j < listFile.data!.gambar!.length; j++) {
                  if (listFile.data!.gambar![j]!.pathGambar!.contains(extensionFile[i])) {
                    var completePath = listFile.data!.gambar![j]!.pathGambar.toString();
                    var fileName = (completePath.split('/').last);
                    file.add(fileName);
                    linkFile.add(completePath);
                  }
                }
              }
            }
            if (file.isNotEmpty) {
              return Column(
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: file.length,
                      itemBuilder: (context, index) {
                        return CardFile(
                          label: "Nama File",
                          contentData: file[index],
                          onPressed: () async {
                            fetchOpenDownloadFile(
                              urlDownload: linkFile[index],
                              nameFile: file[index],
                            );
                          },
                        );
                      }
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              );
            } else {
              return const Center(
                child: Text("Tidak Ada File"),
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