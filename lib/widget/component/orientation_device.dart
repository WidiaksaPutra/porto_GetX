import 'package:flutter/material.dart';

class OrientationDevice extends StatelessWidget {
  final Widget landscape;
  final Widget portrait;
  const OrientationDevice({ Key? key, required this.landscape, required this.portrait }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    if(orientation == Orientation.landscape){
      return landscape;
    }
    return portrait;
  }
}