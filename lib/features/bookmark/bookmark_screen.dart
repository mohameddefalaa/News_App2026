import 'package:flutter/material.dart';
import 'package:newsapp/core/Theme/light_colors.dart';
import 'package:newsapp/core/constant/app_size.dart';
import 'package:newsapp/features/Home/components/news_item.dart';
import 'package:newsapp/features/NewsDetails/news_details.dart';
import 'package:newsapp/features/bookmark/bookmark_controller.dart';
import 'package:provider/provider.dart';

class BookMarkScreen extends StatelessWidget {
  const BookMarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Bookmarks",
          style: TextTheme.of(context).titleMedium!.copyWith(
            fontSize: AppSize.sp16,
            color: AppLightColor.textPrimary,
          ),
        ),
      ),
      body: Consumer<BookmarkController>(
        builder: (context, controller, _) {
          final bookmarks = controller.bookmarks;

          // ── Empty state ─────────────────────────────────────────────────────
          if (bookmarks.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.bookmark_outline_rounded,
                    size: AppSize.r1 * 80,
                    color: AppLightColor.border,
                  ),
                  SizedBox(height: AppSize.h16),
                  Text(
                    "No bookmarks yet",
                    style: TextTheme.of(context).titleMedium!.copyWith(
                      color: AppLightColor.textPrimary,
                      fontSize: AppSize.sp16,
                    ),
                  ),
                  SizedBox(height: AppSize.h4),
                  Text(
                    "Tap the bookmark icon on any article\nto save it here.",
                    textAlign: TextAlign.center,
                    style: TextTheme.of(context).displayMedium!.copyWith(
                      color: AppLightColor.textsecondry,
                      fontSize: AppSize.sp14,
                    ),
                  ),
                ],
              ),
            );
          }

          // ── Bookmark list ───────────────────────────────────────────────────
          return ListView.builder(
            padding: EdgeInsets.symmetric(vertical: AppSize.h8),
            itemCount: bookmarks.length,
            itemBuilder: (context, index) {
              final bookmarked = bookmarks[index];
              final article = bookmarked.toArticle();

              return Dismissible(
                key: ValueKey(bookmarked.url),
                direction: DismissDirection.endToStart,
                background: Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: AppSize.w16),
                  color: AppLightColor.primaryColor,
                  child: Icon(
                    Icons.delete_outline_rounded,
                    color: Colors.white,
                    size: AppSize.r1 * 28,
                  ),
                ),
                onDismissed: (_) => controller.toggleBookmark(article),
                child: GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => NewsDetails(article: article),
                    ),
                  ),
                  child: NewsItem(article: article),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
