import 'package:flutter/material.dart';

class CardGambar extends StatelessWidget {
  final String imageLink;
  final Function()? onTap;
  const CardGambar({
    Key? key,
    required this.imageLink,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 8.0,
      margin: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 6.0),
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(25)
      ),
      child: GestureDetector(
        child: Image.network(
          imageLink,
          fit: BoxFit.fill,
        ),
        onTap: onTap,
      ),
    );
  }
}