import 'package:mgp_mobile_app/model/hrdu/sales_order/detail_sales_order_model.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/mgp_api_hrdu.dart';

mixin SeleksiSalesOrder{
  final MGPAPI _mgpapi = MGPAPI();
  DetailRegso? futureDetailSo;

  Future<DetailRegso> fetchDataSalesOrderDetail ({required String noSalesOrder}) async {
    return futureDetailSo = await _mgpapi.fetchApprovalDetailSalesOrder(noSalesOrder: noSalesOrder);
  }
}