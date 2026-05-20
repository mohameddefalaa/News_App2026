import 'package:newsapp/data_source/remote_data/api_cpnfig.dart';
import 'package:newsapp/data_source/remote_data/api_service.dart';
import 'package:newsapp/features/Home/models/news_article_model.dart';

class NewsRepository {
  Future<List<NewsArticleModel>> getEveryThing() async {
    final result = await ApiService().get(
      ApiCpnfig.everything,
      params: {"q": "trending health"},
    );
    return (result[ApiCpnfig.articles] as List)
        .map((e) => NewsArticleModel.fromjson(e))
        .toList();
  }

  Future<List<NewsArticleModel>> getTopHeadLine(String? category) async {
    Map<String, dynamic> queryParams = {"country": "us"};

    if (category != null) {
      queryParams['category'] = category;
    }
    Map<String, dynamic> result = await ApiService().get(
      ApiCpnfig.topheadlines,
      params: queryParams,
    );
    return (result['articles'] as List)
        .map((e) => NewsArticleModel.fromjson(e))
        .toList();
  }
}
