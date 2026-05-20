import 'package:flutter/material.dart';
import 'package:newsapp/core/constant/app_size.dart';
import 'package:shimmer/shimmer.dart';

class TrendingShimmer extends StatelessWidget {
  const TrendingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(width: AppSize.w8);
      },
      itemCount: 8,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          clipBehavior: Clip.antiAlias,
          margin: EdgeInsets.all(AppSize.dg4),
          height: AppSize.h40 * 4.0,
          width: AppSize.w40 * 5.875,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.r8),
          ),
          child: Shimmer.fromColors(
            child: Column(
              children: [
                Container(
                  height: AppSize.h20 * 7,
                  width: AppSize.w40 * 5.875,
                  color: Colors.white,
                ),

                Container(
                  width: double.infinity,
                  height: AppSize.h12 * 1.16,
                  color: Colors.white,
                ),
                SizedBox(height: AppSize.h4 * 1.5),
                Container(
                  width: AppSize.w32 * 4.68,
                  height: AppSize.h12 * 1.16,
                  color: Colors.white,
                ),
              ],
            ),
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
          ),
        );
      },
    );
  }
}
