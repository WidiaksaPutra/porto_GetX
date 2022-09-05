import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/mgp_api_hrdu.dart';
import 'package:mgp_mobile_app/widget/theme/constants.dart';
import 'package:mgp_mobile_app/model/profil/profil_model.dart';
import 'package:mgp_mobile_app/profile/component/form_account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mgp_mobile_app/widget/component/skeleton.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late Future<Profil> _future;
  late String tokenUser;
  late SharedPreferences loginData;
  late String? deviceToken;
  bool value = true;

  @override
  void initState(){
    _future = MGPAPI().fetchDataProfilUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (BuildContext context, AsyncSnapshot<Profil> snapshot) {
        if (snapshot.hasData) {
          var profilData = snapshot.data;
          return ListView(
            scrollDirection: Axis.vertical,
            children: <Widget> [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: getProportionateScreenHeight(5).h),
                  Container(
                    padding: EdgeInsets.only(top: getProportionateScreenHeight(10).h, bottom: getProportionateScreenHeight(10).h),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: getProportionateScreenWidth(1).w,
                          color: const Color.fromRGBO(0, 0, 0, 0.08)
                        )
                      )
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget> [
                            Flexible(
                              flex: 10,
                              child: Row(
                                children: <Widget> [
                                  Padding(
                                    padding: EdgeInsets.only(left: getProportionateScreenWidth(30).w),
                                    child: SizedBox(
                                      height: getProportionateScreenHeight(105).h,
                                      width: getProportionateScreenWidth(105).w,
                                      child: const CircleAvatar(
                                        backgroundImage: NetworkImage("https://picsum.photos/250?image=9"),
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Padding(
                                      padding: EdgeInsets.only(left: getProportionateScreenWidth(10).w),
                                      child: (profilData!.data!.namaKaryawan != null)
                                      ? Text(profilData.data!.namaKaryawan.toString(),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w800,
                                          fontSize: 17.sp
                                        ),
                                      )
                                      : Text("-",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w800,
                                          fontSize: 18.sp
                                        ),
                                      )
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: getProportionateScreenHeight(10).h),
                        Row(
                          children: <Widget>[
                            Flexible(
                              flex: 10,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(left: getProportionateScreenWidth(30).w),
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
                                      child: SvgPicture.asset("assets/icons/email_menu_profile.svg",
                                        width: getProportionateScreenWidth(25).w,
                                        height: getProportionateScreenHeight(25).h,
                                        color: kPrimaryColor,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
                                    child: (profilData.data!.email != null) 
                                    ? Text(profilData.data!.email.toString(),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.sp
                                      ),
                                    )
                                    : Text("-",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.sp
                                      ),
                                    )
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: getProportionateScreenHeight(10).h),
                        Row(
                          children: <Widget>[
                            Flexible(
                              flex: 10,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(left: getProportionateScreenWidth(30).w),
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
                                      child: SvgPicture.asset("assets/icons/phone_menu_profile.svg",
                                        width: getProportionateScreenWidth(25).w,
                                        height: getProportionateScreenHeight(25).h,
                                        color: kPrimaryColor,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
                                    child: (profilData.data!.noHp != null) 
                                    ? Text(profilData.data!.noHp.toString(),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.sp
                                      ),
                                    )
                                    : Text("-",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.sp
                                      ),
                                    )
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(15).h),
                  const FormAccount(),
                ],
              ),
            ],
          );
        } else {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: getProportionateScreenHeight(10).h, bottom: getProportionateScreenHeight(10).h, left: getProportionateScreenWidth(30).w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget> [
                      CircleSkeleton(
                        size: 105.r,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: getProportionateScreenWidth(10).w, right: getProportionateScreenWidth(10).w),
                        child: Skeleton(
                          width: getProportionateScreenWidth(230).w,
                          height: getProportionateScreenHeight(35).h,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: getProportionateScreenHeight(10).h),
                  Skeleton(
                    width: getProportionateScreenWidth(270).w,
                    height: getProportionateScreenHeight(30).h,
                  ),
                  SizedBox(height: getProportionateScreenHeight(10).h),
                  Skeleton(
                    width: getProportionateScreenWidth(200).w,
                    height: getProportionateScreenHeight(30).h,
                  ),
                  SizedBox(height: getProportionateScreenHeight(40).h),
                  Skeleton(
                    width: getProportionateScreenWidth(350).w,
                    height: getProportionateScreenHeight(45).h,
                  ),
                  SizedBox(height: getProportionateScreenHeight(10).h),
                  Skeleton(
                    width: getProportionateScreenWidth(350).w,
                    height: getProportionateScreenHeight(45).h,
                  ),
                  SizedBox(height: getProportionateScreenHeight(10).h),
                  Skeleton(
                    width: getProportionateScreenWidth(350).w,
                    height: getProportionateScreenHeight(45).h,
                  ),
                  SizedBox(height: getProportionateScreenHeight(10).h),
                  Skeleton(
                    width: getProportionateScreenWidth(350).w,
                    height: getProportionateScreenHeight(45).h,
                  ),
                  SizedBox(height: getProportionateScreenHeight(10).h),
                  Skeleton(
                    width: getProportionateScreenWidth(350).w,
                    height: getProportionateScreenHeight(45).h,
                  ),
                  SizedBox(height: getProportionateScreenHeight(10).h),
                  Skeleton(
                    width: getProportionateScreenWidth(350).w,
                    height: getProportionateScreenHeight(45).h,
                  ),
                ],
              ),
            ),
          );
        }
      }
    );
  }
}