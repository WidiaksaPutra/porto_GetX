import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/service/mgp_api_constant.dart';
import 'package:mgp_mobile_app/widget/theme/constants.dart';
import 'package:mgp_mobile_app/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FormAccount extends StatefulWidget {
  const FormAccount({Key? key}) : super(key: key);

  @override
  State<FormAccount> createState() => _FormAccountState();
}

class _FormAccountState extends State<FormAccount> {
  bool value = true;
  late String tokenUser;
  late SharedPreferences loginData;
  late String? deviceToken;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      width: double.infinity,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 1,
            color: Color.fromRGBO(0, 0, 0, 0.08)
          ),
          bottom: BorderSide(
            width: 1,
            color: Color.fromRGBO(0, 0, 0, 0.08)
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget> [
          SizedBox(
            width: double.infinity,
            child: Column(
              children: <Widget>[
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 30, right: 30),
                  leading: ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: <Color> [
                          kPrimaryColor,
                          kSecondaryColor,
                        ],
                        tileMode: TileMode.mirror,
                      ).createShader(bounds);
                    },
                    child: SvgPicture.asset("assets/icons/profile_menu.svg",
                      color: kPrimaryColor,
                      height: 25,
                      width: 25,
                    ),
                  ),
                  title: Transform.translate(
                    offset: const Offset(-20, 0),
                    child: const Text("Profile",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16
                      ),
                    ),
                  ),
                  trailing: Transform.translate(
                    offset: const Offset(-12, 0),
                    child: ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: <Color> [
                            kPrimaryColor,
                            kSecondaryColor,
                          ],
                          tileMode: TileMode.mirror,
                        ).createShader(bounds);
                      },
                      child: SvgPicture.asset("assets/icons/arrow_ios.svg",
                        height: 15,
                        width: 15,
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 30, right: 30),
                  leading: ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: <Color> [
                          kPrimaryColor,
                          kSecondaryColor,
                        ],
                        tileMode: TileMode.mirror,
                      ).createShader(bounds);
                    },
                    child: SvgPicture.asset("assets/icons/akun_informasi_menu.svg",
                      color: kPrimaryColor,
                      height: 25,
                      width: 25,
                    ),
                  ),
                  title: Transform.translate(
                    offset: const Offset(-20, 0),
                    child: const Text("Account Information",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16
                      ),
                    ),
                  ),
                  trailing: Transform.translate(
                    offset: const Offset(-12, 0),
                    child: ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: <Color> [
                            kPrimaryColor,
                            kSecondaryColor,
                          ],
                          tileMode: TileMode.mirror,
                        ).createShader(bounds);
                      },
                      child: SvgPicture.asset("assets/icons/arrow_ios.svg",
                        height: 15,
                        width: 15,
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 30, right: 30),
                  leading: ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: <Color> [
                          kPrimaryColor,
                          kSecondaryColor,
                        ],
                        tileMode: TileMode.mirror,
                      ).createShader(bounds);
                    },
                    child: SvgPicture.asset("assets/icons/change_password_menu.svg",
                      color: kPrimaryColor,
                      height: 25,
                      width: 25,
                    ),
                  ),
                  title: Transform.translate(
                    offset: const Offset(-20, 0),
                    child: const Text("Change Password",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16
                      ),
                    ),
                  ),
                  trailing: Transform.translate(
                    offset: const Offset(-12, 0),
                    child: ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: <Color> [
                            kPrimaryColor,
                            kSecondaryColor,
                          ],
                          tileMode: TileMode.mirror,
                        ).createShader(bounds);
                      },
                      child: SvgPicture.asset("assets/icons/arrow_ios.svg",
                        height: 15,
                        width: 15,
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 30, right: 30),
                  leading: ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: <Color> [
                          kPrimaryColor,
                          kSecondaryColor,
                        ],
                        tileMode: TileMode.mirror,
                      ).createShader(bounds);
                    },
                    child: SvgPicture.asset("assets/icons/language_profile.svg",
                      color: kPrimaryColor,
                      height: 25,
                      width: 25,
                    ),
                  ),
                  title: Transform.translate(
                    offset: const Offset(-20, 0),
                    child: const Text("Language",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16
                      ),
                    ),
                  ),
                  trailing: Transform.translate(
                    offset: const Offset(-12, 0),
                    child: ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: <Color> [
                            kPrimaryColor,
                            kSecondaryColor,
                          ],
                          tileMode: TileMode.mirror,
                        ).createShader(bounds);
                      },
                      child: SvgPicture.asset("assets/icons/arrow_ios.svg",
                        height: 15,
                        width: 15,
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 30, right: 30),
                  leading: ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: <Color> [
                          kPrimaryColor,
                          kSecondaryColor,
                        ],
                        tileMode: TileMode.mirror,
                      ).createShader(bounds);
                    },
                    child: SvgPicture.asset("assets/icons/darkmode_menu.svg",
                      color: kPrimaryColor,
                      height: 25,
                      width: 25,
                    ),
                  ),
                  title: Transform.translate(
                    offset: const Offset(-20, 0),
                    child: const Text("Dark Mode",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16
                      ),
                    ),
                  ),
                  trailing: Transform.scale(
                    scale: 1.1,
                    child: CupertinoSwitch(
                      value: value, 
                      onChanged: (value) {
                        setState(() {
                          this.value = value;
                        });
                      }
                    ),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 30, right: 30),
                  leading: ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: <Color> [
                          kPrimaryColor,
                          kSecondaryColor,
                        ],
                        tileMode: TileMode.mirror,
                      ).createShader(bounds);
                    },
                    child: SvgPicture.asset("assets/icons/logout_menu.svg",
                      color: kPrimaryColor,
                      height: 25,
                      width: 25,
                    ),
                  ),
                  title: Transform.translate(
                    offset: const Offset(-20, 0),
                    child: const Text("Logout",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16
                      ),
                    ),
                  ),
                  onTap: () async {
                    loginData = await SharedPreferences.getInstance();
                    deviceToken = loginData.getString("device_token");
                    final unregisterToken = await MGPAPICONSTANT().unregisterTokenDevice(tokenDevice: deviceToken.toString());
                    if (unregisterToken == "berhasil") {
                      setState(() {
                        loginData.remove("token");
                        loginData.setBool("login", false);
                        loginData.remove("idUser");
                      });
                      Get.offAll(const LoginView());
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}