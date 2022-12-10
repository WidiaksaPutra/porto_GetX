import 'package:mgp_mobile_app/model/hrdu/purchase_request/detail_purchase_request_model.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/mgp_api_hrdu.dart';

mixin PurchaseRequestDetail{
  final MGPAPI _mgpapi = MGPAPI();
  DetailPr? futureDetailPr;
  Future<DetailPr> fetchDataPurchaseRequestDetail({required String noPurchaseRequest})async {
    return futureDetailPr = await _mgpapi.fetchApprovalDetailPurchaseRequest(noPurchaseRequest: noPurchaseRequest);
  }
}