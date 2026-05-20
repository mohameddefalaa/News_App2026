class NewsArticleModel {
  final SourceModel? source;
  final String author;
  final String title;
  final String description;

  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  NewsArticleModel({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory NewsArticleModel.fromjson(Map<String, dynamic> json) {
    return NewsArticleModel(
      source: SourceModel.fromJson(json['source']),
      author: json['author'] ?? "",
      title: json['title'] ?? "",
      description: json['description'] ?? "",
      url: json['url'] ?? "",
      urlToImage: json['urlToImage'] ?? "",
      publishedAt: json['publishedAt'] ?? "",
      content: json['content'] ?? "",
    );
  }

  Map<String, dynamic> tojson() {
    return {
      "source": source!.toJson(),
      "author": author,
      "title": title,

      "description": description,
      "url": url,
      "urlToImage": urlToImage,
      "publishedAt": publishedAt,
      "content": content,
    };
  }
}

class SourceModel {
  final String? id;
  final String name;

  SourceModel({this.id, required this.name});

  // ميثود تحويل الـ JSON لكائن SourceModel
  factory SourceModel.fromJson(Map<String, dynamic> json) {
    return SourceModel(
      id: json['id'], // عملناه بـ ? لأنه جاي في الـ JSON بـ null
      name:
          json['name'] ??
          'Unknown Source', // لو الاسم مش موجود يحط قيمة افتراضية
    );
  }
  Map<String, dynamic> toJson() {
    return {"id": id, "name": name};
  }
}
