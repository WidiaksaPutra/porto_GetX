import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/controller_getX/default/getX_default_gambar.dart';
import '../default_test/dummy_data_variabel_test.dart';

void main(){
  group("Unit Test Gambar", (){
    DefaultGambar v;
    v = DefaultGambar();
    test("Test Validasi Default Gambar Single", (){
      v.defaultGambarSingle(gambar);
      expect(v.gambarString, equals(gambar.obs));
    });
  });
}