import 'package:hive_ce_flutter/adapters.dart';
import 'package:newsapp/features/Home/models/news_article_model.dart';

part 'bookmarked_article_model.g.dart';

@HiveType(typeId: 1)
class BookmarkedArticle extends HiveObject {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String description;

  @HiveField(2)
  final String url;

  @HiveField(3)
  final String urlToImage;

  @HiveField(4)
  final String publishedAt;

  @HiveField(5)
  final String author;

  @HiveField(6)
  final String sourceName;

  @HiveField(7)
  final String content;

  BookmarkedArticle({
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.author,
    required this.sourceName,
    required this.content,
  });

  /// Factory to convert a remote [NewsArticleModel] into a locally-persisted [BookmarkedArticle].
  factory BookmarkedArticle.fromArticle(NewsArticleModel article) {
    return BookmarkedArticle(
      title: article.title,
      description: article.description,
      url: article.url,
      urlToImage: article.urlToImage,
      publishedAt: article.publishedAt,
      author: article.author,
      sourceName: article.source?.name ?? 'Unknown Source',
      content: article.content,
    );
  }

  /// Convert back to a [NewsArticleModel] for reuse in shared UI widgets (e.g. [NewsItem]).
  NewsArticleModel toArticle() {
    return NewsArticleModel(
      source: SourceModel(name: sourceName),
      author: author,
      title: title,
      description: description,
      url: url,
      urlToImage: urlToImage,
      publishedAt: publishedAt,
      content: content,
    );
  }
}