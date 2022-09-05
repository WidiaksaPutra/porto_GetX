import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
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
    SizeConfig().init(context);
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20).w),
              child: Card(
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(30).r,
                  side: BorderSide(
                    width: getProportionateScreenWidth(0.4).w, color: Colors.grey
                  )
                ),
                elevation: 8.0,
                margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(3.0).w, vertical: getProportionateScreenHeight(6.0).h),
                child: Padding(
                  padding: EdgeInsets.only(top: getProportionateScreenHeight(15).h, bottom: getProportionateScreenHeight(30).h, left: getProportionateScreenWidth(20).w, right: getProportionateScreenWidth(20).w),
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        "assets/images/LogoMGP.png",
                        height: getProportionateScreenHeight(200).h,
                        width: getProportionateScreenWidth(200).w,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const <Widget> [
                          Text("Login to your account"),
                        ],
                      ),
                      SizedBox(height: getProportionateScreenHeight(10).h),
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