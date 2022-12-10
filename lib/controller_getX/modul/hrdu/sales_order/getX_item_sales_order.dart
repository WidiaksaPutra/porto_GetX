import 'package:get/get.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/sales_order/mixin_sales_order.dart';

class GetxItemSalesOrder extends GetxController with SeleksiSalesOrder{
  late var subTotalHarga = <String>[].obs;
  late var grandTotalHarga = "0.0".obs;
  late var diskonHarga = "0.0".obs;
  late var totalSetelahDiskon = "0.0".obs;
  late var ppnHarga = "0.0".obs;
  late var totalSetelahPpn = "0.0".obs;

  fetchDataItemSalesOrderDetail(String noSalesOrder) async{
    await fetchDataSalesOrderDetail(noSalesOrder: noSalesOrder.toString());
    double totalHarga = 0.0;
    double valuePPN = double.parse(futureDetailSo!.data!.detail!.ppn.toString());
    double valueDiskon = double.parse(futureDetailSo!.data!.detail!.diskon.toString());
    
    processItemSalesOrder(valuePPN, valueDiskon, totalHarga);
  }

  processItemSalesOrder(double valuePPN, double valueDiskon, double totalHarga) {
    for(var i = 0; i < futureDetailSo!.data!.detail!.detail!.length; i++){
      num subTotal = (double.parse(futureDetailSo!.data!.detail!.detail![i].hargaSatuanJual.toString())) * double.parse(futureDetailSo!.data!.detail!.detail![i].qtyItem.toString());
      totalHarga = totalHarga + (double.parse(futureDetailSo!.data!.detail!.detail![i].hargaSatuanJual.toString())) * double.parse(futureDetailSo!.data!.detail!.detail![i].qtyItem.toString());
      subTotalHarga.add(subTotal.toString());
    }
    double diskonTotal = (totalHarga * valueDiskon)/100;
    double totalDiskon = (totalHarga - diskonTotal);
    double ppnTotal = (totalDiskon * valuePPN)/100;
    double totalPPN = (totalDiskon + ppnTotal);
                    
    hasilItemSalesOrder(diskonTotal, totalDiskon, ppnTotal, totalPPN, totalHarga);
  }

  hasilItemSalesOrder(double diskonTotal, double totalDiskon, double ppnTotal, double totalPPN, double totalHarga){
    grandTotalHarga.value = totalHarga.toString();
    diskonHarga.value = diskonTotal.toString();
    totalSetelahDiskon.value = totalDiskon.toString();
    ppnHarga.value = ppnTotal.toString();
    totalSetelahPpn.value = totalPPN.toString();
  }
}