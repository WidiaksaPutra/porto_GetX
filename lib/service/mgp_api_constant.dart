import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:mgp_mobile_app/model/login/login.dart';
import 'package:mgp_mobile_app/model/profil/profil_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MGPAPICONSTANT {
  static var client = http.Client();
  static var baseURL = "https://api.mgp.bhawanaerp.com/v1/";
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
}