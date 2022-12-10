import 'package:flutter_test/flutter_test.dart';
import 'package:mgp_mobile_app/controller_getX/login/getX_validasi_form.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/seleksi_vendor/getX_default_subtotal.dart';

import '../../../default_test/dummy_data_variabel_test.dart';

void main(){
  group("Unit Test Detail Seleksi Vendor", () {
    ValidasiForm v;
    v = ValidasiForm();

    SubTotalSeleksiVendor sv;
    sv = SubTotalSeleksiVendor();

    test("Test Sub Total Harga Purchase Request", () async{
      await v.postLogin(usernameSV, passwordVariabelTrue);
      await Future.delayed(const Duration(milliseconds: 1000), () => expect(v.loginP.value.toString(), equals("berhasil")));
      await sv.defaultSubTotal(noSeleksiVendor);
      expect(sv.subTotalHargaPr.length, equals(1));
      expect(sv.subTotalHargaPr[0], equals(subTotalHargaPr));
    });

    test("Test Sub Total Harga Seleksi Vendor", () async{
      await v.postLogin(usernameSV, passwordVariabelTrue);
      await Future.delayed(const Duration(milliseconds: 1000), () => expect(v.loginP.value.toString(), equals("berhasil")));
      await sv.defaultSubTotal(noSeleksiVendor);
      expect(sv.subTotalHargaSv.length, equals(2));
      expect(sv.subTotalHargaSv[0], equals(subTotalHargaSv));
    });
  });
}