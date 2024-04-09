import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:mgp_mobile_app/service/login/login.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ValidasiForm extends GetxController with login{
  var username = false.obs;
  var password = false.obs;
  var snackbar = false.obs;
  late var loginP = "-".obs;
  static late Map<String, dynamic> decodeToken = {};

  user(var value){
    (value != "") ? username = false.obs : username = true.obs;
  }

  pass(var value){
    (value != "") ? password = false.obs : password = true.obs;
  }

  postValidasiForm(String user, String pass, Widget getMainPage) async{
    await postLogin(user, pass);
    await Future.delayed(const Duration(milliseconds: 1000));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", tokenLogin);
    prefs.setBool("login", true);
    await hasil(getMainPage);
  }

  postLogin(String user, String pass) async{
    final String loginProses = await loginUser(
      username: user,
      password: pass,
    );
    await Future.delayed(const Duration(milliseconds: 3000));
    loginP.value = status;
    decodeToken = JwtDecoder.decode(tokenLogin);
  }

  hasil(Widget getMainPage){
    (loginP.value.toString() == "berhasil") 
    ? validasiSnackbarBerhasil(getMainPage) 
    : validasiSnackbarGagal();
  }

  validasiSnackbarBerhasil(Widget getMainPage){
    Get.offAll(getMainPage);
    snackbar;
  }

  validasiSnackbarGagal(){
    Get.snackbar(
      "Login Gagal",
      "Username atau Password Salah",
      snackPosition: SnackPosition.BOTTOM,
      animationDuration: const Duration(milliseconds: 400),
      duration: const Duration(milliseconds: 1500),
      padding: EdgeInsets.symmetric(horizontal:getProportionateScreenWidth(20), vertical:getProportionateScreenHeight(20)),
    );
    snackbar;
  }
}