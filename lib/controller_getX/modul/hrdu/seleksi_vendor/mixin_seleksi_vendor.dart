import 'package:mgp_mobile_app/model/hrdu/seleksi_vendor/detail_seleksi_vendor_model.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/mgp_api_hrdu.dart';

mixin SeleksiVendorDetail{
  final MGPAPI _mgpapi = MGPAPI();
  DetailPvspr? futureDetailSv;

  Future<DetailPvspr> fetchDataSeleksiVendorDetail ({required String noSeleksiVendor}) async {
    return futureDetailSv = await _mgpapi.fetchApprovalDetailSeleksiVendor(noSeleksiVendor: noSeleksiVendor.toString());
  }
}