import 'package:mgp_mobile_app/service/mgp_api_constant.dart';
import 'package:mgp_mobile_app/widget/theme/constants.dart';
import 'package:mgp_mobile_app/model/profil/profil_model.dart';
import 'package:mgp_mobile_app/profile/component/form_account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mgp_mobile_app/widget/component/skeleton.dart';
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
    _future = MGPAPICONSTANT().fetchDataProfilUser();
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
                  const SizedBox(height: 5),
                  Container(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 1,
                          color: Color.fromRGBO(0, 0, 0, 0.08)
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
                                  const Padding(
                                    padding: EdgeInsets.only(left: 30),
                                    child: SizedBox(
                                      height: 105,
                                      width: 105,
                                      child: CircleAvatar(
                                        backgroundImage: NetworkImage("https://picsum.photos/250?image=9"),
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: (profilData!.data!.namaKaryawan != null)
                                      ? Text(profilData.data!.namaKaryawan.toString(),
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w800,
                                          fontSize: 17
                                        ),
                                      )
                                      : const Text("-",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w800,
                                          fontSize: 18
                                        ),
                                      )
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: <Widget>[
                            Flexible(
                              flex: 10,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 30),
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
                                        width: 25,
                                        height: 25,
                                        color: kPrimaryColor,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    child: (profilData.data!.email != null) 
                                    ? Text(profilData.data!.email.toString(),
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14
                                      ),
                                    )
                                    : const Text("-",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14
                                      ),
                                    )
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: <Widget>[
                            Flexible(
                              flex: 10,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 30),
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
                                        width: 25,
                                        height: 25,
                                        color: kPrimaryColor,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    child: (profilData.data!.noHp != null) 
                                    ? Text(profilData.data!.noHp.toString(),
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14
                                      ),
                                    )
                                    : const Text("-",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14
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
                  const SizedBox(height: 15),
                  const FormAccount(),
                ],
              ),
            ],
          );
        } else {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10, left: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: const <Widget> [
                      CircleSkeleton(
                        size: 105,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Skeleton(
                          width: 230,
                          height: 35,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Skeleton(
                    width: 270,
                    height: 30,
                  ),
                  const SizedBox(height: 10),
                  const Skeleton(
                    width: 200,
                    height: 30,
                  ),
                  const SizedBox(height: 40),
                  const Skeleton(
                    width: 350,
                    height: 45,
                  ),
                  const SizedBox(height: 10),
                  const Skeleton(
                    width: 350,
                    height: 45,
                  ),
                  const SizedBox(height: 10),
                  const Skeleton(
                    width: 350,
                    height: 45,
                  ),
                  const SizedBox(height: 10),
                  const Skeleton(
                    width: 350,
                    height: 45,
                  ),
                  const SizedBox(height: 10),
                  const Skeleton(
                    width: 350,
                    height: 45,
                  ),
                  const SizedBox(height: 10),
                  const Skeleton(
                    width: 350,
                    height: 45,
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