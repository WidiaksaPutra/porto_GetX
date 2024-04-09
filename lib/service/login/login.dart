import 'dart:convert';
import 'package:mgp_mobile_app/model/login/login.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/mgp_api_hrdu.dart';

mixin login{
  late String status, tokenLogin;

  Future loginUser({required String username, required String password}) async {
    try {
      final responseBody = await MGPAPI.client.post(Uri.parse('${MGPAPI.baseUrlHrdu}/auth/login'),
        headers: <String, String> {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{"username": username, "password": password}),
      );
      if (responseBody.statusCode == 200){
        final jsonData = responseBody.body;
        final loginResponse = loginUserFromJson(jsonData);
        if (loginResponse.message == "login sukses") {
          status = "berhasil";
          tokenLogin = loginResponse.token;
          return status;
        } else {
          return status = "gagal";
        }
      } else {
        return status = "gagal";
      }
    } catch (e) {
      return status = "error";
    }
  }
}
