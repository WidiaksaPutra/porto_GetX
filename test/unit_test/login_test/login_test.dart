import 'package:flutter_test/flutter_test.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:mgp_mobile_app/controller_getX/login/getX_validasi_form.dart';
import '../default_test/dummy_data_variabel_test.dart';

void main(){
  group("Unit Test Controller Login", (){
    ValidasiForm v;
    v = ValidasiForm();
    test("Test Validasi Username Kosong", (){
      v.user(emptyVariabel);
      expect(v.username, equals(true.obs));
    });
    test("Test Validasi Username Isi", (){
      v.user(variabelFalse);
      expect(v.username, equals(false.obs));
    });
    test("Test Validasi Password Kosong", (){
      v.pass(emptyVariabel);
      expect(v.password, equals(true.obs));
    });
    test("Test Validasi Password Isi", (){
      v.pass(variabelFalse);
      expect(v.password, equals(false.obs));
    });
    test("Test Validasi Button Login Berhasil", () async{
      await v.postLogin(usernameVariabelTrue, passwordVariabelTrue);
      await Future.delayed(const Duration(milliseconds: 1000), () => expect(v.loginP.value.toString(), equals("berhasil")));
    });
    test("Test Validasi Button Login Gagal", () async{
      await v.postLogin(variabelFalse, variabelFalse);
      await Future.delayed(const Duration(milliseconds: 1000), () => expect(v.loginP.value.toString(), equals("gagal")));      
    });
    test("Test Validasi Snackbar False", (){
      expect(v.snackbar, equals(false.obs));
    });
  });
}