import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:newsapp/core/constant/app_size.dart';

class CustomeCashNetwork extends StatelessWidget {
  const CustomeCashNetwork({
    super.key,
    required this.imagepath,
    this.height,
    this.width,
  });
  final String imagepath;
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppSize.r4),
      child: CachedNetworkImage(
        height: height ?? AppSize.h40 * 2,
        width: width ?? AppSize.w28 * 5,
        imageUrl: imagepath,
        fit: BoxFit.cover,
        progressIndicatorBuilder: (context, url, progress) {
          return Shimmer.fromColors(
            child: Container(
              height: height ?? AppSize.h40 * 2,
              width: width ?? AppSize.w28 * 5,
              color: Colors.white,
            ),
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
          );
        },
        errorWidget: (context, url, error) =>
            Image.asset("assets/images/null.webp"),
      ),
    );
  }
}
