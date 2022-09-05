import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';
import 'package:shimmer/shimmer.dart';

class Skeleton extends StatelessWidget {
  const Skeleton({Key? key, this.height, this.width}) : super(key: key);
  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[600]!,
      child: Container(
        height: height,
        width: width,
        padding: EdgeInsets.symmetric(horizontal:getProportionateScreenWidth(20).w, vertical:getProportionateScreenHeight(20).h),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.3.r),
          borderRadius:
            BorderRadius.circular(15.r
          )
        ),
      ),
    );
  }
}

class CircleSkeleton extends StatelessWidget {
  const CircleSkeleton({Key? key, this.size = 24}) : super(key: key);
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[600]!,
      child: Container(
        height: size?.sp,
        width: size?.sp,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.3.r),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}