import 'package:flutter/material.dart';
import 'package:mgp_mobile_app/login/component/background.dart';
import 'package:mgp_mobile_app/login/component/login_form.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);


  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Card(
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: const BorderSide(
                    width: 0.4, color: Colors.grey
                  )
                ),
                elevation: 8.0,
                margin: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 6.0),
                child: Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 30, left: 20, right: 20),
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        "assets/images/LogoMGP.png",
                        height: getProportionateScreenHeight(200),
                        width: getProportionateScreenWidth(200),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const <Widget> [
                          Text("Login to your account"),
                        ],
                      ),
                      SizedBox(height: getProportionateScreenHeight(10)),
                      const LoginForm(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}