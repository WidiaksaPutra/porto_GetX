import 'package:flutter/material.dart';
import 'package:mgp_mobile_app/widget/theme/constants.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class ButtonLogin extends StatelessWidget {
  final Function()? onClicked;
  final bool isLoading;
  const ButtonLogin({
    Key? key,
    required this.onClicked,
    required this.isLoading
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: getProportionateScreenHeight(50),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            kPrimaryColor,
            kSecondaryColor,
          ]
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
        ),
        onPressed: onClicked,
        child: isLoading
        ? Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            SizedBox(
              width: 25,
              height: 25,
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
            SizedBox(width: 24),
            Text("Loading ...",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white 
              ),
            )
          ],
        )
        : const Text("Login",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        )
      ),
    );
  }
}