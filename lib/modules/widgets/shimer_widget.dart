import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:simple_app/core/utils/helper.dart';

class BuildShimmerWidget extends StatelessWidget {
  final double height;
  final double width;
  const BuildShimmerWidget({super.key, this.height = 0.1, this.width = 0.22});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[850]!,
      highlightColor: Colors.grey[800]!,
      child: Container(
        height: context.height * height,
        width: context.width * width,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
