import 'package:flutter/material.dart';
import 'package:newsapp/core/constant/app_size.dart';
import 'package:shimmer/shimmer.dart';

class TrendingShimmer extends StatelessWidget {
  const TrendingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      scrollDirection: Axis.horizontal,
      itemCount: 8,
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(width: AppSize.w8);
      },
      itemBuilder: (BuildContext context, int index) {
        // نفس المقاسات بالظبط بتاعت الكارت الحقيقي
        return Container(
          width: 235,
          height: 139,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.r8),
            color: Colors.white, // خلفية عشان الـ Shimmer يظهر عليها
          ),
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end, // بنزق المحتوى لتحت
              children: [
                Padding(
                  padding: EdgeInsets.all(AppSize.dg8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // سطر للعنوان
                      Container(
                        width: double.infinity,
                        height: 12,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      const SizedBox(height: 6),
                      // سطر تاني للعنوان أصغر شوية
                      Container(
                        width: 150,
                        height: 12,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      const SizedBox(height: 12),
                      // سطر لاسم المصدر
                      Container(
                        width: 80,
                        height: 10,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
