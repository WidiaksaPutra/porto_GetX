import 'package:flutter/material.dart';
import 'package:mgp_mobile_app/shared/theme_color.dart';
import 'package:mgp_mobile_app/shared/theme_font.dart';
import 'package:mgp_mobile_app/shared/theme_text_style.dart';

class ComponenLoadingListData extends StatelessWidget {
  final bool boolLoading;
  final List data;
  const ComponenLoadingListData({Key? key, required this.boolLoading, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (boolLoading == true && data.isEmpty)
    ? Text("saat ini tidak ada data...", style: greenTextStyle.copyWith(fontSize: 20, fontWeight: regular))
    : const Center(child: CircularProgressIndicator(color: kPrimaryColor,));
  }
}

class ComponenLoadingBasicData extends StatelessWidget {
  const ComponenLoadingBasicData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator(color: kPrimaryColor,));
  }
}