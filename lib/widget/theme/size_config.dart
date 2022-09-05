import 'package:flutter/material.dart';

class SizeConfig {
  static late MediaQueryData mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double? defaultSize;
  static Orientation? orientation;

  void init(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    screenWidth = mediaQueryData.size.width;
    screenHeight = mediaQueryData.size.height;
    orientation = mediaQueryData.orientation;
  }
}

double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  if (screenHeight <= 450) {
    return (inputHeight / 612.0) * screenHeight;
  } else if (screenHeight >= 650 && screenHeight < 1000) {
    return (inputHeight / 712.0) * screenHeight;
  } else {
    return (inputHeight / 812.0) * screenHeight;
  }
}

double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  return (inputWidth / 375.0) * screenWidth;
}

double getProportionateScreenRatio() {
  double screenHeight = SizeConfig.screenHeight;
  if (screenHeight <= 450) {
    return 1;
  } else if (screenHeight >= 650 && screenHeight < 1000) {
    return 1.2;
  } else {
    return 1.3;
  }
}

bool getHidentHeight(){
  double screenHeight = SizeConfig.screenHeight;
  if(screenHeight <= 1000){
    return false;
  }
  else{
    return true;
  }
}