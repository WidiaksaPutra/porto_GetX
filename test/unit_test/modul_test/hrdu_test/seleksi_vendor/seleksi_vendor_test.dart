import 'package:flutter_test/flutter_test.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/seleksi_vendor/getX_default_subtotal.dart';

import '../../../default_test/dummy_data_variabel_test.dart';

void main(){
  group("Unit Test Detail Seleksi Vendor", () {
    GetxSeleksiVendor v;
    v = GetxSeleksiVendor();

    test("Test Harga", () async{
      await v.defaultHarga(hargaKesepakatan, qtyOrder);
      expect(v.totalHarga.value, equals(76123.40000000001));
    });
  });
}