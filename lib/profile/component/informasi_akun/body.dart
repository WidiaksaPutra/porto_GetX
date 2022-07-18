import 'package:mgp_mobile_app/login/login.dart';
import 'package:mgp_mobile_app/model/profil/profil_model.dart';
import 'package:mgp_mobile_app/service/mgp_api_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
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
  late String? idUser;

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
        var profilData = snapshot.data;
        return ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Card(
                    shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(25)
                    ),
                    elevation: 8.0,
                    margin: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 6.0),
                    child: Container(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      width: double.infinity,
                      child: Row(
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: SizedBox(
                              height: 115,
                              width: 115,
                              child: CircleAvatar(
                                backgroundImage: NetworkImage("https://picsum.photos/250?image=9"),
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: (profilData!.data!.namaKaryawan != null)
                                ? Text(profilData.data!.namaKaryawan.toString(),
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 18
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
                              const SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: (profilData.data!.noHp != null) 
                                ? Text(profilData.data!.noHp.toString(),
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15
                                  ),
                                )
                                : const Text("-",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15
                                  ),
                                )
                              ),
                              const SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: (profilData.data!.email != null)
                                ? Text(profilData.data!.email.toString(),
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 15
                                  ),
                                )
                                : const Text("-",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 15
                                  ),
                                )
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    "Pengaturan Akun",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                      fontSize: 14 
                    ),
                  )
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Card(
                    shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(25)
                    ),
                    elevation: 8.0,
                    margin: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 6.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            leading: SvgPicture.asset("assets/icons/users.svg",
                              height: 25,
                              width: 25,
                            ),
                            title: const Text("Profil",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w800,
                                fontSize: 14 
                              ),
                            ),
                            trailing: const Icon(Icons.arrow_forward_ios),
                            onTap: () {},
                          ),
                          const Divider(),
                          ListTile(
                            leading: SvgPicture.asset("assets/icons/account_1.svg",
                              height: 25,
                              width: 25,
                            ),
                            title: const Text("Informasi Akun",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w800,
                                fontSize: 14 
                              ),
                            ),
                            trailing: const Icon(Icons.arrow_forward_ios),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    "Pengaturan Keamanan",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                      fontSize: 14 
                    ),
                  )
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Card(
                    shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(25)
                    ),
                    elevation: 8.0,
                    margin: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 6.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            leading: SvgPicture.asset("assets/icons/padlock_1.svg",
                              height: 25,
                              width: 25,
                            ),
                            title: const Text("Ganti Password",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w800,
                                fontSize: 14 
                              ),
                            ),
                            trailing: const Icon(Icons.arrow_forward_ios),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    "Preferensi",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                      fontSize: 14 
                    ),
                  )
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Card(
                    shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(25)
                    ),
                    elevation: 8.0,
                    margin: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 6.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            leading: SvgPicture.asset("assets/icons/translating_1.svg",
                              height: 30,
                              width: 30,
                            ),
                            title: const Text("Bahasa",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w800,
                                fontSize: 14 
                              ),
                            ),
                            trailing: const Icon(Icons.arrow_forward_ios),
                            onTap: () {},
                          ),
                          const Divider(),
                          ListTile(
                            leading: SvgPicture.asset("assets/icons/moon_1.svg",
                              height: 25,
                              width: 25,
                            ),
                            title: const Text("Mode Gelap",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w800,
                                fontSize: 14 
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
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Card(
                    shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(25)
                    ),
                    elevation: 8.0,
                    margin: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 6.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            leading: SvgPicture.asset("assets/icons/log-out.svg",
                              height: 25,
                              width: 25,
                            ),
                            title: const Text("Keluar",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w800,
                                fontSize: 14 
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
                                });
                                Get.offAll(const LoginView());
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      }
    );
  }
}