import 'dart:convert';

import 'package:mgp_mobile_app/service/mgp_api_hrdu/mgp_api_hrdu.dart';
import 'package:shared_preferences/shared_preferences.dart';

mixin PurchaseOrderPostClass{
  Future postPurchaseOrder({required String noTransaksi, required String statusApproval, required String catatan, required String tglApproval, required String approvalBaseline}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    MGPAPI.tokens = prefs.getString("token")!;
    final response = 
      await MGPAPI.client.post(Uri.parse("${MGPAPI.baseUrlHrdu}/approval_purchase_order/approve"),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${MGPAPI.tokens}',
      },
      body: jsonEncode(<String, String>{"no_transaksi": noTransaksi, "status_approval": statusApproval, "catatan" : catatan, "tgl_approval" : tglApproval, "approval_baseline":approvalBaseline}
      )
    );
    if (response.statusCode == 200) {
      return MGPAPI.status = "berhasil";
    } else {
    }
  }
}