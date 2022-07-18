import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Image.asset(
            "assets/images/background_login.png",
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          child,
        ],
      ),
    );
  }
}