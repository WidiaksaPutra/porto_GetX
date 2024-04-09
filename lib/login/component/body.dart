import 'package:flutter/material.dart';

import 'package:mgp_mobile_app/login/component/background.dart';
import 'package:mgp_mobile_app/login/component/login_form.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
              child: Card(
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: BorderSide(
                    width: getProportionateScreenWidth(0.4), color: Colors.grey
                  )
                ),
                elevation: 8.0,
                margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(3.0), vertical: getProportionateScreenHeight(6.0)),
                child: Padding(
                  padding: EdgeInsets.only(top: getProportionateScreenHeight(15), bottom: getProportionateScreenHeight(30), left: getProportionateScreenWidth(20), right: getProportionateScreenWidth(20)),
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