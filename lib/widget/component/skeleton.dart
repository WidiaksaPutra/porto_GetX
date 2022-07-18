import 'package:flutter/material.dart';
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
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.3),
          borderRadius:
            BorderRadius.circular(15
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
        height: size,
        width: size,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.3),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}