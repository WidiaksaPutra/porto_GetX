import 'package:mgp_mobile_app/model/hrdu/purchase_order/detail_purchase_order_model.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/mgp_api_hrdu.dart';

mixin PurchaseOrderDetail{
  final MGPAPI _mgpapi = MGPAPI();
  DetailRegpo? futureDetailPo;


  Future<DetailRegpo> fetchDataPurchaseOrderDetail ({required String noPurchaseOrder}) async {
    return futureDetailPo = await _mgpapi.fetchApprovalDetailPurchaseOrder(noPurchaseOrder: noPurchaseOrder);
  }
}