import 'package:flutter_test/flutter_test.dart';
import 'package:mgp_mobile_app/controller_getX/login/getX_validasi_form.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/purchase_order/getX_item_purchase_order.dart';

import '../../../default_test/dummy_data_variabel_test.dart';

void main(){
  group("Unit Test Detail Purchase Order",(){
    ValidasiForm v;
    v = ValidasiForm();

    GetxItemPurchaseOrder po;
    po = GetxItemPurchaseOrder();
    
    test("Test Sub Total Harga Purchase Order", () async{
      await v.postLogin(usernamePO, passwordVariabelTrue);
      await Future.delayed(const Duration(milliseconds: 1000), () => expect(v.loginP.value.toString(), equals("berhasil")));
      await po.fetchDataItemPurchaseOrderDetail(noPurchaseOrder);
      expect(po.subTotalHarga.length, equals(1));
      expect(po.subTotalHarga[0].toString(), equals("1590000.0"));
    });

    test("Test Sub Total Harga Purchase Order", () async{
      await v.postLogin(usernamePO, passwordVariabelTrue);
      await Future.delayed(const Duration(milliseconds: 1000), () => expect(v.loginP.value.toString(), equals("berhasil")));
      await po.fetchDataItemPurchaseOrderDetail(noPurchaseOrder);
      expect(po.subTotalHarga[0].toString(), equals("1590000.0"));
    });
    
    test("Test Grand Total Harga Purchase Order", () async{
      await v.postLogin(usernamePO, passwordVariabelTrue);
      await Future.delayed(const Duration(milliseconds: 1000), () => expect(v.loginP.value.toString(), equals("berhasil")));
      await po.fetchDataItemPurchaseOrderDetail(noPurchaseOrder);
      expect(po.grandTotalHarga.toString(), equals("1590000.0"));
    });

    test("Test Diskon Harga Purchase Order", () async{
      await v.postLogin(usernamePO, passwordVariabelTrue);
      await Future.delayed(const Duration(milliseconds: 1000), () => expect(v.loginP.value.toString(), equals("berhasil")));
      await po.fetchDataItemPurchaseOrderDetail(noPurchaseOrder);
      expect(po.diskonHarga.toString(), equals("159000.0"));
    });

    test("Test Total Setelah Diskon Purchase Order", () async{
      await v.postLogin(usernamePO, passwordVariabelTrue);
      await Future.delayed(const Duration(milliseconds: 1000), () => expect(v.loginP.value.toString(), equals("berhasil")));
      await po.fetchDataItemPurchaseOrderDetail(noPurchaseOrder);
      expect(po.totalSetelahDiskon.toString(), equals("1431000.0"));
    });
    
    test("Test PPN Harga Purchase Order", () async{
      await v.postLogin(usernamePO, passwordVariabelTrue);
      await Future.delayed(const Duration(milliseconds: 1000), () => expect(v.loginP.value.toString(), equals("berhasil")));
      await po.fetchDataItemPurchaseOrderDetail(noPurchaseOrder);
      expect(po.ppnHarga.toString(), equals("157410.0"));
    });

    test("Test Total Setelah PPN Purchase Order", () async{
      await v.postLogin(usernamePO, passwordVariabelTrue);
      await Future.delayed(const Duration(milliseconds: 1000), () => expect(v.loginP.value.toString(), equals("berhasil")));
      await po.fetchDataItemPurchaseOrderDetail(noPurchaseOrder);
      expect(po.totalSetelahPpn.toString(), equals("1588410.0"));
    });

    test("Test DP Harga Purchase Order", () async{
      await v.postLogin(usernamePO, passwordVariabelTrue);
      await Future.delayed(const Duration(milliseconds: 1000), () => expect(v.loginP.value.toString(), equals("berhasil")));
      await po.fetchDataItemPurchaseOrderDetail(noPurchaseOrder);
      expect(po.dpHarga.toString(), equals("174725.1"));
    });

    test("Test Total Setelah DP Purchase Order", () async{
      await v.postLogin(usernamePO, passwordVariabelTrue);
      await Future.delayed(const Duration(milliseconds: 1000), () => expect(v.loginP.value.toString(), equals("berhasil")));
      await po.fetchDataItemPurchaseOrderDetail(noPurchaseOrder);
      expect(po.totalSetelahDp.toString(), equals("1413684.9"));
    });
  });
}