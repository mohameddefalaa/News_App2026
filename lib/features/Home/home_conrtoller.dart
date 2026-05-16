import 'package:flutter/foundation.dart';
import 'package:newsapp/data_source/remote_data/api_cpnfig.dart';
import 'package:newsapp/data_source/remote_data/api_service.dart';
import 'package:newsapp/models/news_article_model.dart';

class HomeController with ChangeNotifier {
  List<NewsArticleModel> topHEadArticleList = [];
  List<NewsArticleModel> everyThingArticleList = [];
  bool isTopHealineLoading = true;
  bool isEveryThingLoading = true;

  String? errormessage;
  ApiService apiService = ApiService();

  void init() {
    callEveryThing();
    callTopHeadLines();
  }

  //("",params:  {})
  void callTopHeadLines() async {
    try {
      final result = await apiService.get(
        ApiCpnfig.topheadlines,
        params: {"country": "us"},
      );
      final decodingArticles = result['articles'] as List<dynamic>;

      topHEadArticleList = decodingArticles.map((e) {
        return NewsArticleModel.fromjson(e);
      }).toList();
      isTopHealineLoading = false;
      errormessage = null;
    } catch (e) {
      isTopHealineLoading = false;
      errormessage = e.toString();
    }

    notifyListeners();
  }

  void callEveryThing() async {
    try {
      final result = await apiService.get(
        ApiCpnfig.everything,
        params: {"q": "news"},
      );
      final decodingArticles = result[ApiCpnfig.articles] as List<dynamic>;

      everyThingArticleList = decodingArticles.map((e) {
        return NewsArticleModel.fromjson(e);
      }).toList();

      isEveryThingLoading = false;
      errormessage = null;
    } catch (e) {
      isEveryThingLoading = false;
      errormessage = e.toString();
    }
    notifyListeners();
  }
}
