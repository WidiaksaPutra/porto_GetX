import 'package:flutter_test/flutter_test.dart';
import 'package:mgp_mobile_app/controller_getX/login/getX_validasi_form.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/sales_order/getX_item_sales_order.dart';

import '../../../default_test/dummy_data_variabel_test.dart';

void main(){
  group("Unit Test Detail Sales Order",(){
    ValidasiForm v;
    v = ValidasiForm();

    GetxItemSalesOrder so;
    so = GetxItemSalesOrder();
    
    test("Test Sub Total Harga Sales Order", () async{
      await v.postLogin(usernameSO, passwordVariabelTrue);
      await Future.delayed(const Duration(milliseconds: 1000), () => expect(v.loginP.value.toString(), equals("berhasil")));
      await so.fetchDataItemSalesOrderDetail(noSalesOrder);
      expect(so.subTotalHarga.length, equals(1));
      expect(so.subTotalHarga[0].toString(), equals("200000.0"));
    });
    
    test("Test Grand Total Harga Sales Order", () async{
      await v.postLogin(usernameSO, passwordVariabelTrue);
      await Future.delayed(const Duration(milliseconds: 1000), () => expect(v.loginP.value.toString(), equals("berhasil")));
      await so.fetchDataItemSalesOrderDetail(noSalesOrder);
      expect(so.grandTotalHarga.toString(), equals("200000.0"));
    });

    test("Test Diskon Harga Sales Order", () async{
      await v.postLogin(usernameSO, passwordVariabelTrue);
      await Future.delayed(const Duration(milliseconds: 1000), () => expect(v.loginP.value.toString(), equals("berhasil")));
      await so.fetchDataItemSalesOrderDetail(noSalesOrder);
      expect(so.diskonHarga.toString(), equals("40000.0"));
    });

    test("Test Total Setelah Diskon Sales Order", () async{
      await v.postLogin(usernameSO, passwordVariabelTrue);
      await Future.delayed(const Duration(milliseconds: 1000), () => expect(v.loginP.value.toString(), equals("berhasil")));
      await so.fetchDataItemSalesOrderDetail(noSalesOrder);
      expect(so.totalSetelahDiskon.toString(), equals("160000.0"));
    });
    
    test("Test PPN Harga Sales Order", () async{
      await v.postLogin(usernameSO, passwordVariabelTrue);
      await Future.delayed(const Duration(milliseconds: 1000), () => expect(v.loginP.value.toString(), equals("berhasil")));
      await so.fetchDataItemSalesOrderDetail(noSalesOrder);
      expect(so.ppnHarga.toString(), equals("32000.0"));
    });

    test("Test Total Setelah PPN Sales Order", () async{
      await v.postLogin(usernameSO, passwordVariabelTrue);
      await Future.delayed(const Duration(milliseconds: 1000), () => expect(v.loginP.value.toString(), equals("berhasil")));
      await so.fetchDataItemSalesOrderDetail(noSalesOrder);
      expect(so.totalSetelahPpn.toString(), equals("192000.0"));
    });

  });
}