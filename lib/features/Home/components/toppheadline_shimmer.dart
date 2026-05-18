import 'package:flutter/material.dart';
import 'package:newsapp/features/Home/home_conrtoller.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class TopHeadLineShimmer extends StatelessWidget {
  const TopHeadLineShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (BuildContext context, HomeController value, Widget? child) {
        return SliverList.builder(
          itemCount: 12,
          itemBuilder: (BuildContext context, int index) {
            return Shimmer.fromColors(
              child: Padding(
                // نفس الـ Padding بتاع الـ Widget الحقيقي عشان المحاذاة تطلع مظبوطة
                padding: const EdgeInsets.only(left: 16, bottom: 12, right: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // 1. محاكاة لمكان الصورة (المربع اللي على الشمال)
                    Container(
                      height: 75, // نفس مقاسات صورتك الحقيقية
                      width: 122,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),

                    // 2. محاكاة للـ Column اللي فيه الكلام
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // خطين وهميين مكان العنوان
                            Container(
                              width: double.infinity,
                              height: 14,
                              color: Colors.white,
                            ),
                            const SizedBox(height: 6),
                            Container(
                              width: 150,
                              height: 14,
                              color: Colors.white,
                            ),
                            const SizedBox(height: 12),

                            // سطر وهمي مكان الدائرة والوقت
                            Row(
                              children: [
                                Container(
                                  width: 20,
                                  height: 20,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Container(
                                  width: 60,
                                  height: 12,
                                  color: Colors.white,
                                ),
                                const Spacer(),
                                Container(
                                  width: 24,
                                  height: 24,
                                  color: Colors.white,
                                ), // مكان الـ Bookmark
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
            );
          },
        );
      },
    );
  }
}


/*import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class TopHeadLineShimmer extends StatelessWidget {
  const TopHeadLineShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    // استخدمنا SliverList عادي جداً جوه السكرول
    return SliverList.builder(
      itemCount: 5, // 💡 حطينا رقم ثابت (5 عناصر وهمية وقت التحميل) بدل اللستة الفاضية
      itemBuilder: (BuildContext context, int index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Padding(
            // نفس الـ Padding بتاع الـ Widget الحقيقي عشان المحاذاة تطلع مظبوطة
            padding: const EdgeInsets.only(left: 16, bottom: 12, right: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // 1. محاكاة لمكان الصورة (المربع اللي على الشمال)
                Container(
                  height: 75, // نفس مقاسات صورتك الحقيقية
                  width: 122,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                
                // 2. محاكاة للـ Column اللي فيه الكلام
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // خطين وهميين مكان العنوان
                        Container(width: double.infinity, height: 14, color: Colors.white),
                        const SizedBox(height: 6),
                        Container(width: 150, height: 14, color: Colors.white),
                        const SizedBox(height: 12),
                        
                        // سطر وهمي مكان الدائرة والوقت
                        Row(
                          children: [
                            Container(width: 20, height: 20, decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle)),
                            const SizedBox(width: 6),
                            Container(width: 60, height: 12, color: Colors.white),
                            const Spacer(),
                            Container(width: 24, height: 24, color: Colors.white), // مكان الـ Bookmark
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}*/