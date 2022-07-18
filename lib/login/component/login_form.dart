import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/service/mgp_api_constant.dart';
import 'package:mgp_mobile_app/widget/component/button_login.dart';
import 'package:mgp_mobile_app/widget/theme/constants.dart';
import 'package:mgp_mobile_app/widget/component/error_form.dart';
import 'package:mgp_mobile_app/main_page/main_page.dart';
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
  final List<String> errors = [];
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
      child: Column(
        children: <Widget> [
          TextFormField(
            controller: _usernameTextController,
            keyboardType: TextInputType.text,
            style: const TextStyle(
              fontSize: 14
            ),
            onChanged: (value) {
              if (value.isNotEmpty) {
                setState(() {
                  usernameError = false;
                });
              }
              return;
            },
            validator: (value) {
              if (value!.isEmpty) {
                setState(() {
                  usernameError = true;
                });
              }
              return null;
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
                padding: const EdgeInsets.fromLTRB(
                  10,
                  20,
                  0,
                  20
                ),
                child: SvgPicture.asset("assets/icons/briefcase.svg",
                  height: 20,
                ),
              ),
            ),
          ),
          Visibility(
            visible: usernameError,
            child: Column(
              children: const <Widget>[
                SizedBox(height: 5),
                FormErrors(errors: kUsernameNullError),
              ],
            )
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          TextFormField(
            controller: _passwordTextController,
            keyboardType: TextInputType.text,
            style: const TextStyle(
              fontSize: 14
            ),
            obscureText: passwordVisible,
            onChanged: (value) {
              if (value.isNotEmpty) {
                setState(() {
                  passwordError = false;
                });
              }
              return; 
            },
            validator: (value) {
              if (value!.isEmpty) {
                setState(() {
                  passwordError = true;
                });
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: "Password",
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
                padding: const EdgeInsets.fromLTRB(
                  10,
                  20,
                  0,
                  20
                ),
                child: SvgPicture.asset("assets/icons/locked.svg",
                  height: 20,
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
                    height: 20,
                    color: (passwordVisible) ? const Color.fromRGBO(217, 217, 217, 1) : Colors.green,
                  ),
                ),
              )
            ),
          ),
          Visibility(
            visible: passwordError,
            child: Column(
              children: const <Widget>[
                SizedBox(height: 5),
                FormErrors(errors: kPassNullError),
                SizedBox(height: 8),
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
            onClicked: () async {
              if (_formKey.currentState!.validate()) {
                if (_usernameTextController.text != "" && _passwordTextController.text != "") {
                  setState(() {
                    isLoading = true;
                  });
                  await Future.delayed(const Duration(milliseconds: 1000));
                  final loginProses = await MGPAPICONSTANT().loginUser(
                  username: _usernameTextController.text,
                  password: _passwordTextController.text
                  );
                  if (loginProses == "berhasil") {
                    Get.offAll(const MainPage());
                  } else {
                    Get.snackbar(
                      "Login Gagal",
                      "Username atau Password Salah",
                      snackPosition: SnackPosition.BOTTOM,
                      animationDuration: const Duration(milliseconds: 400),
                      duration: const Duration(milliseconds: 1500),
                      padding: const EdgeInsets.all(20)
                    );
                    setState(() {
                      isLoading = false;
                    });
                  }
                }
              }
            },
            isLoading: isLoading,
          ),
        ],
      ),
    );
  }
}