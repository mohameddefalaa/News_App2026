import 'package:hive_ce_flutter/adapters.dart';
import 'package:newsapp/core/constant/constatnts.dart';
import 'package:newsapp/features/bookmark/model/bookmarked_article_model.dart';

class BookmarkRepository {
  // ── Singleton ──────────────────────────────────────────────────────────────
  BookmarkRepository._internal();
  static final _instance = BookmarkRepository._internal();
  factory BookmarkRepository() => _instance;

  // ── Hive box ───────────────────────────────────────────────────────────────
  late Box<BookmarkedArticle> _box;

  /// Opens the Hive box. Must be called once in [main] before the app starts.
  Future<void> init() async {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(BookmarkedArticleAdapter());
    }
    _box = await Hive.openBox<BookmarkedArticle>(Constatnts.bookmarkBox);
  }

  // ── CRUD ───────────────────────────────────────────────────────────────────

  /// Saves [article] to disk using its URL as the unique key.
  Future<void> addBookmark(BookmarkedArticle article) async {
    await _box.put(article.url, article);
  }

  /// Removes the article with the given [url] from disk.
  Future<void> removeBookmark(String url) async {
    await _box.delete(url);
  }

  /// Returns `true` if an article with the given [url] is already bookmarked.
  bool isBookmarked(String url) {
    return _box.containsKey(url);
  }

  /// Returns all bookmarked articles ordered from newest to oldest.
  List<BookmarkedArticle> getAllBookmarks() {
    return _box.values.toList().reversed.toList();
  }
}
