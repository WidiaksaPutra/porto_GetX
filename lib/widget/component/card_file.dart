import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:mgp_mobile_app/widget/theme/constants.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class CardFile extends StatelessWidget {
  final String label;
  final String contentData;
  final Function()? onPressed;
  const CardFile({Key? key, required this.label, required this.contentData, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(3.0).w, vertical: getProportionateScreenHeight(6.0).h),
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(25.r),
        side: BorderSide(
          width: getProportionateScreenWidth(0.4).w, color: Colors.grey
        ),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20).w),
        title: Padding(
          padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10).h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget> [
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 0),
                          child: Text(label,
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
                          child: const Text(":",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 0),
                          child: Text(contentData.toString(),
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(15).h),
              Container(
                width: getProportionateScreenWidth(125).w,
                height: getProportionateScreenHeight(35).h,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      kPrimaryColor,
                      kSecondaryColor,
                    ]
                  ),
                  borderRadius: BorderRadius.circular(25.r),
                ),
                child: TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.r))
                  ),
                  onPressed: onPressed,
                  child: Text("Download",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp,
                      color: Colors.white,
                    ),
                  )
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(10).h)
            ],
          ),
        ),
      ),
    );
  }
}