import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/controller_getX/login/getX_validasi_form.dart';
import 'package:mgp_mobile_app/main_page/main_page.dart';
import 'package:mgp_mobile_app/widget/component/button_login.dart';
import 'package:mgp_mobile_app/widget/theme/constants.dart';
import 'package:mgp_mobile_app/widget/component/error_form.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _usernameTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool passwordVisible = true;
  late SharedPreferences loginData;
  bool isLoading = false;
  bool? remember = false;
  bool usernameError = false;
  bool passwordError = false;
  
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: GetX<ValidasiForm>(
        init: ValidasiForm(),
        builder: (controller) => Column(
          children: <Widget> [
            TextFormField(
              controller: _usernameTextController,
              keyboardType: TextInputType.text,
              style: const TextStyle(
                fontSize: 14,
              ),
              onChanged: (value) {
                setState(() {
                  Get.put(ValidasiForm()).user(value);
                });
              },
              validator: (value) {
                setState(() {
                  Get.put(ValidasiForm()).user(value); 
                });
              },
              decoration: InputDecoration(
                hintText: "Username",
                hintStyle: const TextStyle(
                  fontSize: 14,
                  color: Color.fromRGBO(217, 217, 217, 1)
                ),
                filled: true,
                fillColor: colorCardItem,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(color: Colors.transparent),
                  gapPadding: 10,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(color: Colors.transparent),
                  gapPadding: 10,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(color: Colors.transparent),
                  gapPadding: 10,
                ),
                prefixIcon: Padding(
                  padding: EdgeInsets.fromLTRB(
                    getProportionateScreenWidth(10),
                    getProportionateScreenHeight(20),
                    getProportionateScreenWidth(0),
                    getProportionateScreenHeight(20),
                  ),
                  child: SvgPicture.asset("assets/icons/briefcase.svg",
                    height: getProportionateScreenHeight(20),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: controller.username.value,
              child: Column(
                children: <Widget>[
                  SizedBox(height: getProportionateScreenHeight(5)),
                  const FormErrors(errors: kUsernameNullError),
                ],
              )
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            TextFormField(
              controller: _passwordTextController,
              keyboardType: TextInputType.text,
              style: const TextStyle(
                fontSize: 14,
              ),
              obscureText: passwordVisible,
              onChanged: (value) {
                setState(() {
                  Get.put(ValidasiForm()).pass(value);
                });
              },
              validator: (value) {
                setState(() {
                  Get.put(ValidasiForm()).pass(value);
                });
              },
              decoration: InputDecoration(
                hintText: "Password",
                hintStyle: const TextStyle(
                  fontSize: 14,
                  color: Color.fromRGBO(217, 217, 217, 1),
                ),
                filled: true,
                fillColor: colorCardItem,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(color: Colors.transparent),
                  gapPadding: 10,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(color: Colors.transparent),
                  gapPadding: 10,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(color: Colors.transparent),
                  gapPadding: 10,
                ),
                prefixIcon: Padding(
                  padding: EdgeInsets.fromLTRB(
                    getProportionateScreenWidth(10),
                    getProportionateScreenHeight(20),
                    getProportionateScreenWidth(0),
                    getProportionateScreenHeight(20),
                  ),
                  child: SvgPicture.asset("assets/icons/locked.svg",
                    height: getProportionateScreenHeight(20),
                  ),
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: IconButton(
                    onPressed: (){
                      setState(() {
                        passwordVisible =! passwordVisible;
                      });
                    },
                    icon: SvgPicture.asset(
                      (passwordVisible) ? "assets/icons/eye.svg" : "assets/icons/eye_hide.svg",
                      height: getProportionateScreenHeight(20),
                      color: (passwordVisible) ? const Color.fromRGBO(217, 217, 217, 1) : Colors.green,
                    ),
                  ),
                )
              ),
            ),
            Visibility(
              visible: controller.password.value,
              child: Column(
                children: <Widget>[
                  SizedBox(height: getProportionateScreenHeight(5)),
                  const FormErrors(errors: kPassNullError),
                  SizedBox(height: getProportionateScreenHeight(8)),
                ],
              )
            ),
            Row(
              children: <Widget> [
                Checkbox(
                  value: remember,
                  activeColor: kPrimaryColor,
                  onChanged: (value) {
                    setState(() {
                      remember = value!;
                    });
                  },
                ),
                const Text("Remember Me"),
              ],
            ),
            ButtonLogin(
              onClicked: () {
                if (_formKey.currentState!.validate()) {
                  if (_usernameTextController.text != "" && _passwordTextController.text != "") {
                    setState(() {
                      isLoading = true;
                    });
                    Get.put(ValidasiForm()).postValidasiForm(_usernameTextController.text, _passwordTextController.text, const MainPage());                 
                    if(controller.snackbar.value == false){
                      Timer(const Duration(seconds: 2), 
                        () => setState(() {
                          isLoading = false;
                        }),
                      );
                    }
                  }
                }
              },
              isLoading: isLoading,
            ),
          ],
        ),
      ),
    );
  }
}