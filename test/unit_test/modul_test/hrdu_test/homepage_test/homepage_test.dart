import 'package:flutter_test/flutter_test.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:mgp_mobile_app/controller_getX/login/getX_validasi_form.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/homepage/getX_homepage.dart';
import '../../../default_test/dummy_data_variabel_test.dart';

void main(){
  group("Unit Test Controller Homepage", () {
    HomepageHrdu h;
    h = HomepageHrdu();

    ValidasiForm v;
    v = ValidasiForm();

    test("Test Hasil Hak Akses 3 Button", () async{
      int length, length2;
      bool lenghtSame = false;
      await v.postLogin(usernameVariabelTrue2, passwordVariabelTrue);
      await Future.delayed(const Duration(milliseconds: 1000), () {
        List hasilHakAksesReport = h.komputasiHomepageHrdu();
        bool hakAksesBool = hasilHakAksesReport.isNotEmpty;
        if(hakAksesBool == true){
          h.homepageHrdu3();
          length = h.screensHRDU.length;
          length2 = h.bottomItemsHRDU.length;
          lenghtSame = (length == length2) ? true : false;
        }else{
          length = 0;
        }
        expect(v.loginP.value.toString(), equals("berhasil"));
        expect(hakAksesBool, equals(true));
        expect(length.obs, equals(3.obs));
        expect(lenghtSame, equals(true));
      });
    });

    test("Test Hasil Hak Akses 2 Button", () async{
      int length, length2;
      bool lenghtSame = false;
      await v.postLogin(usernameVariabelTrue, passwordVariabelTrue);
      await Future.delayed(const Duration(milliseconds: 1000), () {
        List hasilHakAksesReport = h.komputasiHomepageHrdu();
        bool hakAksesBool = hasilHakAksesReport.isEmpty;
        if(hakAksesBool == true){
          h.homepageHrdu2();
          length = h.screensHRDU.length;
          length2 = h.bottomItemsHRDU.length;
          lenghtSame = (length == length2) ? true : false;
        }else{
          length = 0;
        }
        expect(v.loginP.value.toString(), equals("berhasil"));
        expect(hakAksesBool, equals(true));
        expect(length.obs, equals(2.obs));
        expect(lenghtSame, equals(true));
      });
    });
  });
}