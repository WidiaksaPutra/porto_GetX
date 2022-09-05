import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:mgp_mobile_app/model/hrdu/analisa_barang_jadi/detail_analisa_barang_jadi_model.dart';
import 'package:mgp_mobile_app/model/hrdu/delivery_order/detail_delivery_order_model.dart';
import 'package:mgp_mobile_app/model/hrdu/faktur_penjualan/detail_faktur_penjualan_model.dart';
import 'package:mgp_mobile_app/model/hrdu/kegiatan/detail_kegiatan_model.dart';
import 'package:mgp_mobile_app/model/hrdu/peluang/analisa_single_peluang_baku.dart';
import 'package:mgp_mobile_app/model/hrdu/peluang/analisa_single_peluang_fin.dart';
import 'package:mgp_mobile_app/model/hrdu/peluang/analisa_single_peluang_gambar.dart';
import 'package:mgp_mobile_app/model/hrdu/peluang/analisa_single_peluang_penunjang.dart';
import 'package:mgp_mobile_app/model/hrdu/peluang/analisa_single_peluang_umum.dart';
import 'package:mgp_mobile_app/model/hrdu/rap/analisa_single_rap.dart';
import 'package:mgp_mobile_app/model/hrdu/sales_order_spk/detail_sales_order_spk_model.dart';
import 'package:mgp_mobile_app/model/hrdu/sales_order_spk/list_kelompok_prelim_sales_order_spk.dart';
import 'package:mgp_mobile_app/model/hrdu/mutasi_antar_gudang/detail_mutasi_antar_gudang.dart';
import 'package:mgp_mobile_app/model/hrdu/peluang/detail_peluang_model.dart';
import 'package:mgp_mobile_app/model/hrdu/penawaran/detail_penawaran_model.dart';
import 'package:mgp_mobile_app/model/hrdu/penerimaan_barang/detail_penerimaan_barang.dart';
import 'package:mgp_mobile_app/model/hrdu/ppa/detail_ppa_model.dart';
import 'package:mgp_mobile_app/model/hrdu/purchase_order/detail_purchase_order_model.dart';
import 'package:mgp_mobile_app/model/hrdu/purchase_request/detail_purchase_request_model.dart';
import 'package:mgp_mobile_app/model/hrdu/rab/analisa_single_rab.dart';
import 'package:mgp_mobile_app/model/hrdu/rab/detail_rab_model.dart';
import 'package:mgp_mobile_app/model/hrdu/rab/list_kelompok_prelim.dart';
import 'package:mgp_mobile_app/model/hrdu/rae/analisa_single_rae.dart';
import 'package:mgp_mobile_app/model/hrdu/rae/detail_peluang_rae.dart';
import 'package:mgp_mobile_app/model/hrdu/rae/detail_rae_model.dart';
import 'package:mgp_mobile_app/model/hrdu/rae/list_kelompok_prelim.dart';
import 'package:mgp_mobile_app/model/hrdu/rap/detail_rap_model.dart';
import 'package:mgp_mobile_app/model/hrdu/sales_order/detail_sales_order_model.dart';
import 'package:mgp_mobile_app/model/hrdu/seleksi_vendor/detail_seleksi_vendor_model.dart';
import 'package:mgp_mobile_app/model/hrdu/surat_jalan/detail_surat_jalan_model.dart';
import 'package:mgp_mobile_app/model/hrdu/surat_perjanjian_kerja/detail_surat_perjanjian_kerja_model.dart';
import 'package:http/http.dart' as http;
import 'package:mgp_mobile_app/model/login/login.dart';
import 'package:mgp_mobile_app/model/profil/profil_model.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class MGPAPI {
  static var client = http.Client();
  static var baseURL = "https://devapi.mgp.bhawanaerp.com/v1/hrdu";
  // static var baseURL = "https://api.mgp.bhawanaerp.com/v1/hrdu";
  late String? tokens;
  var status = "";

  //Login
  Future loginUser({required String username, required String password}) async {
    try {
      final responseBody = await client.post(Uri.parse('$baseURL/auth/login'),
        headers: <String, String> {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{"username": username, "password": password}
        )
      );
      if (responseBody.statusCode == 200) {
        final jsonData = responseBody.body;
        final loginResponse = loginUserFromJson(jsonData);
        if (loginResponse.message == "login sukses") {
          final prefs = await SharedPreferences.getInstance();
          prefs.setString("token", loginResponse.token);
          prefs.setBool("login", true);
          return status = "berhasil";
        } else {
          return status = "gagal";
        }
      } else {
      }
    } catch (e) {
      return status = "gagal";
    }
  }
  //Register Token Notification
  Future registerTokenDevice({required String tokenDevice}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      tokens = prefs.getString("token")!;
      final responseBody = await client.post(Uri.parse('$baseURL/notification/register_device_token'),
        headers: <String, String> {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $tokens',
        },
        body: jsonEncode(<String, String>{"device_token": tokenDevice}
        )
      );
      if (responseBody.statusCode == 200) {
        return status = "berhasil";
      } else {
        return status = "gagal";
      }
    } catch (e) {
      return status = "gagal";
    }
  }
  //Unregister Token Notification
  Future unregisterTokenDevice({required String tokenDevice}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      tokens = prefs.getString("token")!;
      final responseBody = await client.post(Uri.parse('$baseURL/notification/unregister_device_token'),
        headers: <String, String> {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $tokens',
        },
        body: jsonEncode(<String, String>{"device_token": tokenDevice}
        )
      );
      if (responseBody.statusCode == 200) {
        return status = "berhasil";
      } else {
        return status = "gagal";
      }
    } catch (e) {
      return status = "gagal";
    }
  }
  // Change Password Profil
  Future changePassword({required String idKaryawan, required String password}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    try {
      final responseBody = await client.put(Uri.parse('$baseURL/profile/update_password'),
        headers: <String, String> {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $tokens',
        },
        body: jsonEncode(<String, String>{"id_karyawan": idKaryawan, "password": password}
        )
      );
      if (responseBody.statusCode == 200) {
        return status = "berhasil";
      } else {
        return status = "gagal";
      }
    } catch (e) {
      return status = "gagal";
    }
  }
  // Data Profil User
  Future<Profil> fetchDataProfilUser() async {
    await Future.delayed(const Duration(milliseconds: 500));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    Map<String, dynamic> decodeToken = JwtDecoder.decode(tokens!);
    String idKaryawan = decodeToken["id"].toString();
    Map<String, String>? queryParams = {
      'id_karyawan' : idKaryawan,
    };
    String? queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = baseURL + '/profile/single/?' + queryString;
    final response = 
      await client.get(Uri.parse(requestUrl),
      headers: {
        'Authorization': 'Bearer $tokens',
      }
    );
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      Profil dataProfil = Profil.fromJson(parsed);
      return dataProfil;
    } else {
      throw Exception('Failed to load album');
    }
  }

  // Detail Deliver Order
  Future<DetailRegdo> fetchApprovalDetailDeliveryOrder({required String noDeliveryOrder}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    Map<String, String>? queryParams = {
      'no_delivery_order' : noDeliveryOrder,
    };
    String? queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = baseURL + '/approval_delivery_order/detail/?' + queryString;
    final response = 
      await client.get(Uri.parse(requestUrl),
      headers: {
        'Authorization': 'Bearer $tokens',
      }
    );
    
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      DetailRegdo detailDeliveryOrderData = DetailRegdo.fromJson(parsed);
      return detailDeliveryOrderData;
    } else {
      throw Exception('Failed to load album');
    }
  }
  // Approve Detail Delivery Order
  Future postDeliveryOrder({required String noTransaksi, required String statusApproval, required String catatan, required String tglApproval, required String approvalBaseline}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    final response = 
      await client.post(Uri.parse("$baseURL/approval_delivery_order/approve"),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokens',
      },
      body: jsonEncode(<String, String>{"no_transaksi": noTransaksi, "status_approval": statusApproval, "catatan" : catatan, "tgl_approval" : tglApproval, "approval_baseline" : approvalBaseline}
      )
    );
    if (response.statusCode == 200) {
      return status = "berhasil";
    } else {
    }
  }
  // Detail Mutasi Antar Gudang
  Future<DetailMag> fetchApprovalDetailMutasiAntarGudang({required String noMutasiAntarGudang}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    Map<String, String>? queryParams = {
      'no_mutasi_antar_gudang' : noMutasiAntarGudang,
    };
    String? queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = baseURL + '/approval_mutasi_antar_gudang/detail/?' + queryString;
    final response = 
      await client.get(Uri.parse(requestUrl),
      headers: {
        'Authorization': 'Bearer $tokens',
      }
    );
    
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      DetailMag detailMutasiAntarGudangData = DetailMag.fromJson(parsed);
      return detailMutasiAntarGudangData;
    } else {
      throw Exception('Failed to load album');
    }
  }
  // Approve Detail Mutasi Antar Gudang
  Future postMutasiAntarGudang({required String noTransaksi, required String statusApproval, required String catatan, required String tglApproval, required String approvalBaseline}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    final response = 
      await client.post(Uri.parse("$baseURL/approval_mutasi_antar_gudang/approve"),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokens',
      },
      body: jsonEncode(<String, String>{"no_transaksi": noTransaksi, "status_approval": statusApproval, "catatan" : catatan, "tgl_approval" : tglApproval, "approval_baseline" : approvalBaseline}
      )
    );
    if (response.statusCode == 200) {
      return status = "berhasil";
    } else {
    }
  }
  // Detail Faktur Penjualan
  Future<DetailRegfpnj> fetchApprovalDetailFakturPenjualan({required String noFaktur}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    print(noFaktur);
    Map<String, String>? queryParams = {
      'no_faktur' : noFaktur,
    };
    String? queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = baseURL + '/approval_faktur_penjualan/detail/?' + queryString;
    final response = 
      await client.get(Uri.parse(requestUrl),
      headers: {
        'Authorization': 'Bearer $tokens',
      }
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      DetailRegfpnj detailFakturPenjualanData = DetailRegfpnj.fromJson(parsed);
      print(detailFakturPenjualanData);
      return detailFakturPenjualanData;
    } else {
      throw Exception('Failed to load album');
    }
  }
  // Approve Detail Faktur Penjualan
  Future postFakturPenjualan({required String noTransaksi, required String statusApproval, required String catatan, required String tglApproval, required String approvalBaseline}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    final response = 
      await client.post(Uri.parse("$baseURL/approval_faktur_penjualan/approve"),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokens',
      },
      body: jsonEncode(<String, String>{"no_transaksi": noTransaksi, "status_approval": statusApproval, "catatan" : catatan, "tgl_approval" : tglApproval, "approval_baseline": approvalBaseline}
      )
    );
    if (response.statusCode == 200) {
      return status = "berhasil";
    } else {
    }
  }
  // Detail Kegiatan
  Future<DetailRk> fetchApprovalDetailKegiatan({required String noKegiatan}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    Map<String, String>? queryParams = {
      'no_kegiatan' : noKegiatan,
    };
    String? queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = baseURL + '/approval_kegiatan/detail/?' + queryString;
    final response = 
      await client.get(Uri.parse(requestUrl),
      headers: {
        'Authorization': 'Bearer $tokens',
      }
    );
    
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      DetailRk detailFakturPenjualanData = DetailRk.fromJson(parsed);
      return detailFakturPenjualanData;
    } else {
      throw Exception('Failed to load album');
    }
  }
  // Approve Detail Kegiatan
  Future postKegiatan({required String noTransaksi, required String statusApproval, required String catatan, required String tglApproval, required String approvalBaseline}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    final response = 
      await client.post(Uri.parse("$baseURL/approval_kegiatan/approve"),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokens',
      },
      body: jsonEncode(<String, String>{"no_transaksi": noTransaksi, "status_approval": statusApproval, "catatan" : catatan, "tgl_approval" : tglApproval, "approval_baseline": approvalBaseline}
      )
    );
    if (response.statusCode == 200) {
      return status = "berhasil";
    } else {
    }
  }
  // Detail Penerimaan Barang
  Future<DetailPenpo> fetchApprovalDetailPenerimaanBarang({required String noPenerimaanBarang}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    Map<String, String>? queryParams = {
      'no_penerimaan_barang' : noPenerimaanBarang,
    };
    String? queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = baseURL + '/approval_penerimaan_barang/detail/?' + queryString;
    final response = 
      await client.get(Uri.parse(requestUrl),
      headers: {
        'Authorization': 'Bearer $tokens',
      }
    );
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      DetailPenpo detailPenerimaanBarangData = DetailPenpo.fromJson(parsed);
      return detailPenerimaanBarangData;
    } else {
      throw Exception('Failed to load data');
    }
  }
  // Approve Detail Penerimaan Barang
  Future postPenerimaanBarang({required String noTransaksi, required String statusApproval, required String catatan, required String tglApproval}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    final response = 
      await client.post(Uri.parse("$baseURL/approval_penerimaan_barang/approve"),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokens',
      },
      body: jsonEncode(<String, String>{"no_transaksi": noTransaksi, "status_approval": statusApproval, "catatan" : catatan, "tgl_approval" : tglApproval}
      )
    );
    if (response.statusCode == 200) {
      return status = "berhasil";
    } else {
    }
  }
  // Detail PPA
  Future<DetailRegppa> fetchApprovalDetailPPA({required String noPPA}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    SharedPreferences prefs = await SharedPreferences.getInstance();
      tokens = prefs.getString("token")!;
    Map<String, String>? queryParams = {
      'no_ppa' : noPPA,
    };
    String? queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = baseURL + '/approval_ppa/detail/?' + queryString;
    final response = 
      await client.get(Uri.parse(requestUrl),
      headers: {
        'Authorization': 'Bearer $tokens',
      }
    );
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      DetailRegppa detailFakturPenjualanData = DetailRegppa.fromJson(parsed);
      return detailFakturPenjualanData;
    } else {
      throw Exception('Failed to load album');
    }
  }
  // Approve Detail PPA
  Future postPPA({required String noTransaksi, required String statusApproval, required String catatan, required String tglApproval, required String approvalBaseline}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    final response = 
      await client.post(Uri.parse("$baseURL/approval_ppa/approve"),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokens',
      },
      body: jsonEncode(<String, String>{"no_transaksi": noTransaksi, "status_approval": statusApproval, "catatan" : catatan, "tgl_approval" : tglApproval, "approval_baseline":approvalBaseline}
      )
    );
    if (response.statusCode == 200) {
      return status = "berhasil";
    } else {
    }
  }
  // Detail Purchaser Order
  Future<DetailRegpo> fetchApprovalDetailPurchaseOrder({required String noPurchaseOrder}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    Map<String, String>? queryParams = {
      'no_purchase_order' : noPurchaseOrder,
    };
    String? queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = baseURL + '/approval_purchase_order/detail/?' + queryString;
    final response = 
      await client.get(Uri.parse(requestUrl),
      headers: {
        'Authorization': 'Bearer $tokens',
      }
    );
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      // ignore: avoid_print
      print(parsed);
      DetailRegpo detailPurchaseOrderData = DetailRegpo.fromJson(parsed);
      return detailPurchaseOrderData;
    } else {
      throw Exception('Failed to load album');
    }
  }
  // Approve Detail Purchase Order
  Future postPurchaseOrder({required String noTransaksi, required String statusApproval, required String catatan, required String tglApproval, required String approvalBaseline}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    final response = 
      await client.post(Uri.parse("$baseURL/approval_purchase_order/approve"),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokens',
      },
      body: jsonEncode(<String, String>{"no_transaksi": noTransaksi, "status_approval": statusApproval, "catatan" : catatan, "tgl_approval" : tglApproval, "approval_baseline":approvalBaseline}
      )
    );
    if (response.statusCode == 200) {
      return status = "berhasil";
    } else {
    }
  }
  // Detail Purchase Request
  Future<DetailPr> fetchApprovalDetailPurchaseRequest({required String noPurchaseRequest}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    Map<String, String>? queryParams = {
      'no_purchase_request' : noPurchaseRequest,
    };
    String? queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = baseURL + '/approval_purchase_request/detail/?' + queryString;
    final response = 
      await client.get(Uri.parse(requestUrl),
      headers: {
        'Authorization': 'Bearer $tokens',
      }
    );
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      DetailPr detailPurchaseRequestData = DetailPr.fromJson(parsed);
      return detailPurchaseRequestData;
    } else {
      throw Exception('Failed to load album');
    }
  }
  // Approve Detail Purchase Request
  Future postPurchaseRequest({required String noTransaksi, required String statusApproval, required String catatan, required String tglApproval, required String approvalBaseline}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    final response = 
      await client.post(Uri.parse("$baseURL/approval_purchase_request/approve"),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokens',
      },
      body: jsonEncode(<String, String>{"no_transaksi": noTransaksi, "status_approval": statusApproval, "catatan" : catatan, "tgl_approval" : tglApproval, "approval_baseline" : approvalBaseline}
      )
    );
    if (response.statusCode == 200) {
      return status = "berhasil";
    } else {
    }
  }
  // Detail Rencana Anggaran Biaya
  Future<DetailRegrab> fetchApprovalDetailRencanaAnggaranBiaya({required String noRab, required String baseline}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    Map<String, String>? queryParams = {
      'no_rab' : noRab,
      'baseline': baseline,
    };
    String? queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = baseURL + '/approval_rab/detail/?' + queryString;
    final response = 
      await client.get(Uri.parse(requestUrl),
      headers: {
        'Authorization': 'Bearer $tokens',
      }
    );
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      DetailRegrab detailFakturPenjualanData = DetailRegrab.fromJson(parsed);
      return detailFakturPenjualanData;
    } else {
      throw Exception('Failed to load album');
    }
  }
  // Approve Detail Rencana Anggaran Biaya
  Future postRAB({required String noTransaksi, required String statusApproval, required String catatan, required String tglApproval, required String approvalBaseline}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    final response = 
      await client.post(Uri.parse("$baseURL/approval_rab/approve"),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokens',
      },
      body: jsonEncode(<String, String>{"no_transaksi": noTransaksi, "status_approval": statusApproval, "catatan" : catatan, "tgl_approval" : tglApproval, "approval_baseline": approvalBaseline}
      )
    );
    if (response.statusCode == 200) {
      return status = "berhasil";
    } else {
    }
  }
  // Detail Rencana Anggaran Estimasi
  Future<DetailRegrae> fetchApprovalDetailRencanaAnggaranEstimasi({required String noRae, required String baseline}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    Map<String, String>? queryParams = {
      'no_rae' : noRae,
      'baseline' : baseline,
    };
    String? queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = baseURL + '/approval_rae/detail/?' + queryString;
    final response = 
      await client.get(Uri.parse(requestUrl),
      headers: {
        'Authorization': 'Bearer $tokens',
      }
    );
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      DetailRegrae detailFakturPenjualanData = DetailRegrae.fromJson(parsed);
      return detailFakturPenjualanData;
    } else {
      throw Exception('Failed to load album');
    }
  }
  // Approve Detail Rencana Anggaran Estimasi
  Future postRAE({required String noTransaksi, required String statusApproval, required String catatan, required String tglApproval, required String approvalBaseline}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    final response = 
      await client.post(Uri.parse("$baseURL/approval_rae/approve"),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokens',
      },
      body: jsonEncode(<String, String>{"no_transaksi": noTransaksi, "status_approval": statusApproval, "catatan" : catatan, "tgl_approval" : tglApproval, "approval_baseline": approvalBaseline}
      )
    );
    if (response.statusCode == 200) {
      return status = "berhasil";
    } else {
    }
  }
  // Detail Sales Order
  Future<DetailRegso> fetchApprovalDetailSalesOrder({required String noSalesOrder}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    Map<String, String>? queryParams = {
      'no_sales_order' : noSalesOrder,
    };
    String? queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = baseURL + '/approval_sales_order/detail/?' + queryString;
    final response = 
      await client.get(Uri.parse(requestUrl),
      headers: {
        'Authorization': 'Bearer $tokens',
      }
    );
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      DetailRegso detailDeliveryOrderData = DetailRegso.fromJson(parsed);
      return detailDeliveryOrderData;
    } else {
      throw Exception('Failed to load album');
    }
  }
  // Approve Detail Sales Order
  Future postSalesOrder({required String noTransaksi, required String statusApproval, required String catatan, required String tglApproval, required String approvalBaseline}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    final response = 
      await client.post(Uri.parse("$baseURL/approval_sales_order/approve"),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokens',
      },
      body: jsonEncode(<String, String>{"no_transaksi": noTransaksi, "status_approval": statusApproval, "catatan" : catatan, "tgl_approval" : tglApproval, "approval_baseline" : approvalBaseline}
      )
    );
    if (response.statusCode == 200) {
      return status = "berhasil";
    } else {
    }
  }
  // Detail Sales Order SPK
  Future<DetailRegsospk> fetchApprovalDetailSalesOrderSPK({required String noSalesOrderSpk, required String idSalesOrderSpk}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    Map<String, String>? queryParams = {
      'no_sales_order_spk' : noSalesOrderSpk,
      'id_sales_order_spk' : idSalesOrderSpk,
    };
    String? queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = baseURL + '/approval_sales_order_spk/detail?' + queryString;
    final response = 
      await client.get(Uri.parse(requestUrl),
      headers: {
        'Authorization': 'Bearer $tokens',
      }
    );
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      DetailRegsospk detailSalesOrderSPK = DetailRegsospk.fromJson(parsed);
      return detailSalesOrderSPK;
    } else {
      throw Exception('Failed to load album');
    }
  }
  // Approve Detail Sales Order SPK
  Future postSalesOrderSPK({required String noTransaksi, required String statusApproval, required String catatan, required String tglApproval, required String approvalBaseline}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    final response = 
      await client.post(Uri.parse("$baseURL/approval_sales_order_spk/approve"),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokens',
      },
      body: jsonEncode(<String, String>{"no_transaksi": noTransaksi, "status_approval": statusApproval, "catatan" : catatan, "tgl_approval" : tglApproval, "approval_baseline" : approvalBaseline}
      )
    );
    if (response.statusCode == 200) {
      return status = "berhasil";
    } else {
    }
  }
  // Detail Seleksi Vendor
  Future<DetailPvspr> fetchApprovalDetailSeleksiVendor({required String noSeleksiVendor}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    Map<String, String>? queryParams = {
      'no_seleksi_vendor' : noSeleksiVendor,
    };
    String? queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = baseURL + '/approval_seleksi_vendor/detail/?' + queryString;
    final response = 
      await client.get(Uri.parse(requestUrl),
      headers: {
        'Authorization': 'Bearer $tokens',
      }
    );
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      DetailPvspr detailDeliveryOrderData = DetailPvspr.fromJson(parsed);
      return detailDeliveryOrderData;
    } else {
      throw Exception('Failed to load album');
    }
  }
  // Approve Detail Seleksi Vendor
  Future postSeleksiVendor({required String noTransaksi, required String statusApproval, required String catatan, required String tglApproval, required String approvalBaseline}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    final response = 
      await client.post(Uri.parse("$baseURL/approval_seleksi_vendor/approve"),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokens',
      },
      body: jsonEncode(<String, String>{"no_transaksi": noTransaksi, "status_approval": statusApproval, "catatan" : catatan, "tgl_approval" : tglApproval, "approval_baseline": approvalBaseline}
      )
    );
    if (response.statusCode == 200) {
      return status = "berhasil";
    } else {
    }
  }
  // Detail Surat Jalan
  Future<DetailRegsj> fetchApprovalDetailRegsj({required String noSuratJalan}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    Map<String, String>? queryParams = {
      'no_surat_jalan' : noSuratJalan,
    };
    String? queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = baseURL + '/approval_surat_jalan/detail/?' + queryString;
    final response = 
      await client.get(Uri.parse(requestUrl),
      headers: {
        'Authorization': 'Bearer $tokens',
      }
    );
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      DetailRegsj detailSuratJalanData = DetailRegsj.fromJson(parsed);
      return detailSuratJalanData;
    } else {
      throw Exception('Failed to load album');
    }
  }
  // Approve Detail Surat Jalan
  Future postSuratJalan({required String noTransaksi, required String statusApproval, required String catatan, required String tglApproval, required String approvalBaseline}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    final response = 
      await client.post(Uri.parse("$baseURL/approval_surat_jalan/approve"),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokens',
      },
      body: jsonEncode(<String, String>{"no_transaksi": noTransaksi, "status_approval": statusApproval, "catatan" : catatan, "tgl_approval" : tglApproval, "approval_baseline" : approvalBaseline}
      )
    );
    if (response.statusCode == 200) {
      return status = "berhasil";
    } else {
    }
  }
  // Detail Surat Perjanjian Kerja
  Future<DetailRegspk> fetchApprovalDetailSPK({required String noSpk, required String baseline}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    Map<String, String>? queryParams = {
      'no_spk' : noSpk,
      'baseline' : baseline,
    };
    String? queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = baseURL + '/approval_spk/detail/?' + queryString;
    final response = 
      await client.get(Uri.parse(requestUrl),
      headers: {
        'Authorization': 'Bearer $tokens',
      }
    );
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      DetailRegspk detailFakturPenjualanData = DetailRegspk.fromJson(parsed);
      return detailFakturPenjualanData;
    } else {
      throw Exception('Failed to load album');
    }
  }
  // Approve Detail Surat Perjanjian Kerja
  Future postSPK({required String noTransaksi, required String statusApproval, required String catatan, required String tglApproval, required String approvalBaseline}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    final response = 
      await client.post(Uri.parse("$baseURL/approval_spk/approve"),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokens',
      },
      body: jsonEncode(<String, String>{"no_transaksi": noTransaksi, "status_approval": statusApproval, "catatan" : catatan, "tgl_approval" : tglApproval, "approval_baseline": approvalBaseline}
      )
    );
    if (response.statusCode == 200) {
      return status = "berhasil";
    } else {
    }
  }
  // Detail Rencana Anggaran Produksi
  Future<DetailRegrap> fetchApprovalDetailRAP({required String noRap, required String baseline}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    Map<String, String>? queryParams = {
      'no_rap' : noRap,
      'baseline' : baseline,
    };
    String? queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = baseURL + '/approval_rap/detail/?' + queryString;
    final response = 
      await client.get(Uri.parse(requestUrl),
      headers: {
        'Authorization': 'Bearer $tokens',
      }
    );
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      DetailRegrap detailFakturPenjualanData = DetailRegrap.fromJson(parsed);
      return detailFakturPenjualanData;
    } else {
      throw Exception('Failed to load album');
    }
  }
  // Approve Detail Rencana Anggaran Produksi
  Future postRAP({required String noTransaksi, required String statusApproval, required String catatan, required String tglApproval, required String approvalBaseline}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    final response = 
      await client.post(Uri.parse("$baseURL/approval_rap/approve"),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokens',
      },
      body: jsonEncode(<String, String>{"no_transaksi": noTransaksi, "status_approval": statusApproval, "catatan" : catatan, "tgl_approval" : tglApproval, "approval_baseline": approvalBaseline}
      )
    );
    if (response.statusCode == 200) {
      return status = "berhasil";
    } else {
    }
  }
  // Detail Penawaran
  Future<DetailRegpnw> fetchApprovalDetailPenawaran({required String noPenawaran, required String baseline}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    Map<String, String>? queryParams = {
      'no_penawaran' : noPenawaran,
      'baseline' : baseline
    };
    String? queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = baseURL + '/approval_penawaran/detail/?' + queryString;
    final response = 
      await client.get(Uri.parse(requestUrl),
      headers: {
        'Authorization': 'Bearer $tokens',
      }
    );
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      DetailRegpnw detailFakturPenjualanData = DetailRegpnw.fromJson(parsed);
      return detailFakturPenjualanData;
    } else {
      throw Exception('Failed to load album');
    }
  }
  // Approve Detail Penawaran
  Future postPenawaran({required String noTransaksi, required String statusApproval, required String catatan, required String tglApproval, required String approvalBaseline}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    final response = 
      await client.post(Uri.parse("$baseURL/approval_penawaran/approve"),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokens',
      },
      body: jsonEncode(<String, String>{"no_transaksi": noTransaksi, "status_approval": statusApproval, "catatan" : catatan, "tgl_approval" : tglApproval, "approval_baseline": approvalBaseline}
      )
    );
    if (response.statusCode == 200) {
      return status = "berhasil";
    } else {
    }
  }

  Future<AnalisaSingleRegplgGambar> fetchAnalisaSinglePeluangGambar({required String idBarangJadi}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    Map<String, String>? queryParams = {
      'id_barang_jadi' : idBarangJadi,
      'tipe' : 'gambar',
    };
    String? queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = baseURL + '/approval_peluang/analisa_barang_jadi_single/?' + queryString;
    final response = 
      await client.get(Uri.parse(requestUrl),
      headers: {
        'Authorization': 'Bearer $tokens',
      }
    );
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      AnalisaSingleRegplgGambar analisaSingleRegplgGambar = AnalisaSingleRegplgGambar.fromJson(parsed);
      return analisaSingleRegplgGambar;
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<AnalisaSingleRegplgUmum> fetchAnalisaSinglePeluangUmum({required String idBarangJadi}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    Map<String, String>? queryParams = {
      'id_barang_jadi' : idBarangJadi,
      'tipe' : 'umum',
    };
    String? queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = baseURL + '/approval_peluang/analisa_barang_jadi_single/?' + queryString;
    final response = 
      await client.get(Uri.parse(requestUrl),
      headers: {
        'Authorization': 'Bearer $tokens',
      }
    );
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      AnalisaSingleRegplgUmum analisaSingleRegplgUmum = AnalisaSingleRegplgUmum.fromJson(parsed);
      return analisaSingleRegplgUmum;
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<AnalisaSingleRegplgBaku> fetchAnalisaSinglePeluangBaku({required String idBarangJadi}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    Map<String, String>? queryParams = {
      'id_barang_jadi' : idBarangJadi,
      'tipe' : 'baku',
    };
    String? queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = baseURL + '/approval_peluang/analisa_barang_jadi_single/?' + queryString;
    final response = 
      await client.get(Uri.parse(requestUrl),
      headers: {
        'Authorization': 'Bearer $tokens',
      }
    );
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      AnalisaSingleRegplgBaku analisaSingleRegplgBaku = AnalisaSingleRegplgBaku.fromJson(parsed);
      return analisaSingleRegplgBaku;
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<AnalisaSingleRegplgPenunjang> fetchAnalisaSinglePeluangPenunjang({required String idBarangJadi}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    Map<String, String>? queryParams = {
      'id_barang_jadi' : idBarangJadi,
      'tipe' : 'penunjang',
    };
    String? queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = baseURL + '/approval_peluang/analisa_barang_jadi_single/?' + queryString;
    final response = 
      await client.get(Uri.parse(requestUrl),
      headers: {
        'Authorization': 'Bearer $tokens',
      }
    );
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      AnalisaSingleRegplgPenunjang analisaSingleRegplgPenunjang = AnalisaSingleRegplgPenunjang.fromJson(parsed);
      return analisaSingleRegplgPenunjang;
    } else {
      throw Exception('Failed to load album');
    }
  }
  
  Future<AnalisaSingleRegplgFinishing> fetchAnalisaSinglePeluangFinishing({required String idBarangJadi}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    Map<String, String>? queryParams = {
      'id_barang_jadi' : idBarangJadi,
      'tipe' : 'fin',
    };
    String? queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = baseURL + '/approval_peluang/analisa_barang_jadi_single/?' + queryString;
    final response = 
      await client.get(Uri.parse(requestUrl),
      headers: {
        'Authorization': 'Bearer $tokens',
      }
    );
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      AnalisaSingleRegplgFinishing analisaSingleRegplgFinishing = AnalisaSingleRegplgFinishing.fromJson(parsed);
      return analisaSingleRegplgFinishing;
    } else {
      throw Exception('Failed to load album');
    }
  }
  

  // Analisa Single Rencana Anggaran Estimasi
  Future<AnalisaSingleRegrae> fetchAnalisaSingleRAE({required String idRaeDetail}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    Map<String, String>? queryParams = {
      'id_rae_detail' : idRaeDetail,
    };
    String? queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = baseURL + '/approval_rae/analisa_barang_jadi_single/?' + queryString;
    final response = 
      await client.get(Uri.parse(requestUrl),
      headers: {
        'Authorization': 'Bearer $tokens',
      }
    );
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      AnalisaSingleRegrae analisaSingleRAE = AnalisaSingleRegrae.fromJson(parsed);
      return analisaSingleRAE;
    } else {
      throw Exception('Failed to load album');
    }
  }
  // List Kelompok Prelim Rencana Anggaran Estimasi
  Future<ListKelompokPrelimRegrae> fetchAnalisaPrelimRAE() async {
    await Future.delayed(const Duration(milliseconds: 500));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    var requestUrl = baseURL + '/approval_rae/list_kelompok_prelim';
    final response = 
      await client.get(Uri.parse(requestUrl),
      headers: {
        'Authorization': 'Bearer $tokens',
      }
    );
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      ListKelompokPrelimRegrae listKelompokPrelimRAE = ListKelompokPrelimRegrae.fromJson(parsed);
      return listKelompokPrelimRAE;
    } else {
      throw Exception('Failed to load album');
    }
  }
  // Detail Peluang Rencana Anggaran Estimasi
  Future<DetailPeluangRegrae> fetchDetailPeluangRAE({required String noPeluang}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    Map<String, String>? queryParams = {
      'no_peluang' : noPeluang,
    };
    String? queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = baseURL + '/approval_rae/detail_peluang/?' + queryString;
    final response = 
      await client.get(Uri.parse(requestUrl),
      headers: {
        'Authorization': 'Bearer $tokens',
      }
    );
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      DetailPeluangRegrae detailPeluangRAE = DetailPeluangRegrae.fromJson(parsed);
      return detailPeluangRAE;
    } else {
      throw Exception('Failed to load album');
    }
  }
  // Detail Peluang
  Future<DetailRegplg> fetchApprovalDetailPeluang({required String noPeluang}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    Map<String, String>? queryParams = {
      'no_peluang' : noPeluang,
    };
    String? queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = baseURL + '/approval_peluang/detail/?' + queryString;
    final response = 
      await client.get(Uri.parse(requestUrl),
      headers: {
        'Authorization': 'Bearer $tokens',
      }
    );
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      DetailRegplg detailPeluang = DetailRegplg.fromJson(parsed);
      return detailPeluang;
    } else {
      throw Exception('Failed to load album');
    }
  }
  // Approve Detail Peluang
  Future postPeluang({required String noTransaksi, required String statusApproval, required String catatan, required String tglApproval}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    final response = 
      await client.post(Uri.parse("$baseURL/approval_peluang/approve"),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokens',
      },
      body: jsonEncode(<String, String>{"no_transaksi": noTransaksi, "status_approval": statusApproval, "catatan" : catatan, "tgl_approval" : tglApproval}
      )
    );
    if (response.statusCode == 200) {
      return status = "berhasil";
    } else {
    }
  }
  // List Kelompok Prelim Rencana Anggaran Estimasi
  Future<ListKelompokPrelimRegrab> fetchAnalisaPrelimRAB() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    var requestUrl = baseURL + '/approval_rab/list_kelompok_prelim';
    final response = 
      await client.get(Uri.parse(requestUrl),
      headers: {
        'Authorization': 'Bearer $tokens',
      }
    );
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      ListKelompokPrelimRegrab listKelompokPrelimRAB = ListKelompokPrelimRegrab.fromJson(parsed);
      return listKelompokPrelimRAB;
    } else {
      throw Exception('Failed to load album');
    }
  }
  // Analisa Single Rencana Anggaran Estimasi
  Future<AnalisaSingleRegrab> fetchAnalisaSingleRAB({required String idRabDetail}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    Map<String, String>? queryParams = {
      'id_rab_detail' : idRabDetail,
    };
    String? queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = baseURL + '/approval_rab/analisa_barang_jadi_single/?' + queryString;
    final response = 
      await client.get(Uri.parse(requestUrl),
      headers: {
        'Authorization': 'Bearer $tokens',
      }
    );
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      AnalisaSingleRegrab analisaSingleRAB = AnalisaSingleRegrab.fromJson(parsed);
      return analisaSingleRAB;
    } else {
      throw Exception('Failed to load album');
    }
  }
  // List Kelompok Prelim Rencana Anggaran Estimasi
  Future<ListKelompokPrelimRegsospk> fetchAnalisaPrelimSOSPK() async {
    await Future.delayed(const Duration(milliseconds: 500));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    var requestUrl = baseURL + '/approval_sales_order_spk/list_kelompok_prelim';
    final response = 
      await client.get(Uri.parse(requestUrl),
      headers: {
        'Authorization': 'Bearer $tokens',
      }
    );
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      ListKelompokPrelimRegsospk listKelompokPrelimSoSPK = ListKelompokPrelimRegsospk.fromJson(parsed);
      return listKelompokPrelimSoSPK;
    } else {
      throw Exception('Failed to load album');
    }
  }
  // Analisa Single Rencana Anggaran Produksi
  Future<AnalisaSingleRegrap> fetchAnalisaSingleRAP({required String idRapDetail}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    Map<String, String>? queryParams = {
      'id_rap_detail' : idRapDetail,
    };
    String? queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = baseURL + '/approval_rap/analisa_barang_jadi_single/?' + queryString;
    final response = 
      await client.get(Uri.parse(requestUrl),
      headers: {
        'Authorization': 'Bearer $tokens',
      }
    );
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      AnalisaSingleRegrap analisaSingleRAP = AnalisaSingleRegrap.fromJson(parsed);
      return analisaSingleRAP;
    } else {
      throw Exception('Failed to load album');
    }
  }
  // Analisa Barang Jadi
  Future<DetailRegabj> fetchAnalisaBarangJadi({required String idItemBuaso}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    Map<String, String>? queryParams = {
      'id_item_buaso' : idItemBuaso,
    };
    String? queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = baseURL + '/approval_analisa_barang_jadi/detail?' + queryString;
    final response = 
      await client.get(Uri.parse(requestUrl),
      headers: {
        'Authorization': 'Bearer $tokens',
      }
    );
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      DetailRegabj analisaBarangJadi = DetailRegabj.fromJson(parsed);
      return analisaBarangJadi;
    } else {
      throw Exception('Failed to load album');
    }
  }
  // Approve Detail Analisa Barang Jadi
  Future postAnalisaBarangJadi({required String noTransaksi, required String statusApproval, required String catatan, required String tglApproval}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    final response = 
      await client.post(Uri.parse("$baseURL/approval_analisa_barang_jadi/approve"),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokens',
      },
      body: jsonEncode(<String, String>{"no_transaksi": noTransaksi, "status_approval": statusApproval, "catatan" : catatan, "tgl_approval" : tglApproval}
      )
    );
    if (response.statusCode == 200) {
      return status = "berhasil";
    } else {
    }
  }
}