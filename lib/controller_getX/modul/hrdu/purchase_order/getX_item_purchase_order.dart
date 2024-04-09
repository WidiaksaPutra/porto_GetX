import 'package:get/get.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/mgp_api_hrdu.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/api_purchase_order/api_detail_purchase_order.dart';
class GetxItemPurchaseOrder extends GetxController with PurchaseOrderDetail{
  late var subTotalHarga = <String>[].obs;
  late var grandTotalHarga = "0.0".obs;
  late var diskonHarga = "0.0".obs;
  late var totalSetelahDiskon = "0.0".obs;
  late var ppnHarga = "0.0".obs;
  late var totalSetelahPpn = "0.0".obs;
  late var dpHarga = "0.0".obs;
  late var totalSetelahDp = "0.0".obs;

  functSharedPrefPo({required String noPurchaseOrder}){
    fetchDataItemPurchaseOrderDetail(noPurchaseOrder: noPurchaseOrder, getToken: MGPAPI.tokens.toString());
  }

  fetchDataItemPurchaseOrderDetail({required String noPurchaseOrder, required String getToken}) async{
    await fetchDetailPurchaseOrder(noPurchaseOrder: noPurchaseOrder.toString(), getToken: getToken);
    double totalHarga = 0.0;
    double valuePPN = double.parse(futureDetailPo!.data!.detail!.ppn.toString());
    double valueDiskon = double.parse(futureDetailPo!.data!.detail!.diskon.toString());
    double valueDP = double.parse(futureDetailPo!.data!.detail!.dp.toString());
    processItemPurchaseOrder(valuePPN, valueDiskon, valueDP, totalHarga);
  }

  processItemPurchaseOrder(double valuePPN, double valueDiskon, double valueDP, double totalHarga) {
    for(var i = 0; i < futureDetailPo!.data!.detail!.poDetail!.length; i++){
      double subTotal = (double.parse(futureDetailPo!.data!.detail!.poDetail![i]!.hargaKesepakatan.toString())) * double.parse(futureDetailPo!.data!.detail!.poDetail![i]!.qtyOrder.toString());
      totalHarga = totalHarga + (double.parse(futureDetailPo!.data!.detail!.poDetail![i]!.hargaKesepakatan.toString())) * double.parse(futureDetailPo!.data!.detail!.poDetail![i]!.qtyOrder.toString());
      subTotalHarga.add(subTotal.toString());            
    }
    double diskonTotal = (totalHarga * valueDiskon)/100;
    double totalDiskon = (totalHarga - diskonTotal);
    double ppnTotal = (totalDiskon * valuePPN)/100;
    double totalPPN = (totalDiskon + ppnTotal);
    double dpTotal = (totalPPN * valueDP)/100;
    double totalDP = (totalPPN - dpTotal);
    hasilItemPurchaseOrder(diskonTotal, totalDiskon, ppnTotal, totalPPN, dpTotal, totalDP, totalHarga);
  }

  hasilItemPurchaseOrder(double diskonTotal, double totalDiskon, double ppnTotal, double totalPPN, double dpTotal, double totalDP, double totalHarga){
    grandTotalHarga.value = totalHarga.toString();
    diskonHarga.value = diskonTotal.toString();
    totalSetelahDiskon.value = totalDiskon.toString();
    ppnHarga.value = ppnTotal.toString();
    totalSetelahPpn.value = totalPPN.toString();
    dpHarga.value = dpTotal.toString();
    totalSetelahDp.value = totalDP.toString();
  }
}