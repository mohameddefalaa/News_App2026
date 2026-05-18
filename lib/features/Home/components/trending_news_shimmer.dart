import 'package:flutter/material.dart';
import 'package:newsapp/core/Theme/light_colors.dart';
import 'package:newsapp/core/widgets/custome_cash_networkImage.dart';
import 'package:newsapp/features/Home/components/source_data.dart';
import 'package:shimmer/shimmer.dart';

class TrendingShimmer extends StatelessWidget {
  const TrendingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(width: 8);
      },
      itemCount: 8,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          clipBehavior: Clip.antiAlias,
          margin: EdgeInsets.all(4),
          height: 140,
          width: 235,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
          child: Shimmer.fromColors(
            child: Column(
              children: [
                Container(height: 140, width: 235, color: Colors.white),

                Container(
                  width: double.infinity,
                  height: 14,
                  color: Colors.white,
                ),
                const SizedBox(height: 6),
                Container(width: 150, height: 14, color: Colors.white),
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
