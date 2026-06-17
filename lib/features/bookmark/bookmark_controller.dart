import 'package:flutter/material.dart';
import 'package:newsapp/core/mixins/notify_seafty.dart';
import 'package:newsapp/features/bookmark/bookmark_repository.dart';
import 'package:newsapp/features/bookmark/model/bookmarked_article_model.dart';
import 'package:newsapp/features/Home/models/news_article_model.dart';

class BookmarkController extends ChangeNotifier with notifyseafty {
  final BookmarkRepository _repo = BookmarkRepository();

  // ── State ──────────────────────────────────────────────────────────────────

  /// Live in-memory list of saved articles.
  /// UI rebuilds whenever this list changes.
  List<BookmarkedArticle> bookmarks = [];

  // ── Init ───────────────────────────────────────────────────────────────────

  BookmarkController() {
    _loadBookmarks();
  }

  /// Loads all bookmarks from Hive into [bookmarks] and notifies listeners.
  void _loadBookmarks() {
    bookmarks = _repo.getAllBookmarks();
    safeNotify();
  }

  // ── Actions ────────────────────────────────────────────────────────────────

  /// Toggles the bookmark state of [article].
  /// - Not bookmarked → saves it.
  /// - Already bookmarked → removes it.
  Future<void> toggleBookmark(NewsArticleModel article) async {
    final bookmarked = BookmarkedArticle.fromArticle(article);
    await _repo.toggleBookmark(bookmarked);
    _loadBookmarks(); // refreshes the list and rebuilds all listeners
  }

  // ── Queries ────────────────────────────────────────────────────────────────

  /// Returns `true` if the article with the given [url] is bookmarked.
  /// Used by widgets to decide which icon to display (filled vs outlined).
  bool isBookmarked(String url) {
    return _repo.isBookmarked(url);
  }
}
