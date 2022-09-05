import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/mgp_api_hrdu.dart';
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
            style: TextStyle(
              fontSize: 14.sp,
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
              hintStyle: TextStyle(
                fontSize: 14.sp,
                color: const Color.fromRGBO(217, 217, 217, 1)
              ),
              filled: true,
              fillColor: colorCardItem,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5).r,
                borderSide: const BorderSide(color: Colors.transparent),
                gapPadding: 10,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5).r,
                borderSide: const BorderSide(color: Colors.transparent),
                gapPadding: 10,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5).r,
                borderSide: const BorderSide(color: Colors.transparent),
                gapPadding: 10,
              ),
              prefixIcon: Padding(
                padding: EdgeInsets.fromLTRB(
                  getProportionateScreenWidth(10).w,
                  getProportionateScreenHeight(20).h,
                  getProportionateScreenWidth(0).w,
                  getProportionateScreenHeight(20).h,
                ),
                child: SvgPicture.asset("assets/icons/briefcase.svg",
                  height: getProportionateScreenHeight(20).h,
                ),
              ),
            ),
          ),
          Visibility(
            visible: usernameError,
            child: Column(
              children: <Widget>[
                SizedBox(height: getProportionateScreenHeight(5).h),
                const FormErrors(errors: kUsernameNullError),
              ],
            )
          ),
          SizedBox(height: getProportionateScreenHeight(20).h),
          TextFormField(
            controller: _passwordTextController,
            keyboardType: TextInputType.text,
            style: TextStyle(
              fontSize: 14.sp
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
              hintStyle: TextStyle(
                fontSize: 14.sp,
                color: const Color.fromRGBO(217, 217, 217, 1),
              ),
              filled: true,
              fillColor: colorCardItem,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5).r,
                borderSide: const BorderSide(color: Colors.transparent),
                gapPadding: 10,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5).r,
                borderSide: const BorderSide(color: Colors.transparent),
                gapPadding: 10,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5).r,
                borderSide: const BorderSide(color: Colors.transparent),
                gapPadding: 10,
              ),
              prefixIcon: Padding(
                padding: EdgeInsets.fromLTRB(
                  getProportionateScreenWidth(10).w,
                  getProportionateScreenHeight(20).h,
                  getProportionateScreenWidth(0).w,
                  getProportionateScreenHeight(20).h,
                ),
                child: SvgPicture.asset("assets/icons/locked.svg",
                  height: getProportionateScreenHeight(20).h,
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
                    height: getProportionateScreenHeight(20).h,
                    color: (passwordVisible) ? const Color.fromRGBO(217, 217, 217, 1) : Colors.green,
                  ),
                ),
              )
            ),
          ),
          Visibility(
            visible: passwordError,
            child: Column(
              children: <Widget>[
                SizedBox(height: getProportionateScreenHeight(5).h),
                const FormErrors(errors: kPassNullError),
                SizedBox(height: getProportionateScreenHeight(8).h),
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
                  final loginProses = await MGPAPI().loginUser(
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
                      padding: EdgeInsets.symmetric(horizontal:getProportionateScreenWidth(20).w, vertical:getProportionateScreenHeight(20).h),
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