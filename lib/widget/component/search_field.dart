import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:mgp_mobile_app/widget/theme/constants.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class SearchField extends StatelessWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: 'Search',
       hintStyle: TextStyle(
          fontSize: 16.sp,
          color: const Color.fromRGBO(194, 194, 194, 1)
        ),
        prefixIcon: const Icon(Icons.search, color: Colors.black),
        filled: true,
        fillColor: colorCardSearch,
        contentPadding: EdgeInsets.fromLTRB(getProportionateScreenWidth(10).w, getProportionateScreenHeight(5).h, getProportionateScreenWidth(10).w, getProportionateScreenHeight(5).h),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: Colors.grey[350]!),
          gapPadding: 10,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: Colors.grey[350]!),
          gapPadding: 10,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: Colors.grey[350]!),
          gapPadding: 10,
        ),
      ),
    );
  }
}