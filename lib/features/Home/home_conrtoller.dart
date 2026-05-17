import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:newsapp/core/enumes/request_statues_enum.dart';
import 'package:newsapp/data_source/remote_data/api_cpnfig.dart';
import 'package:newsapp/data_source/remote_data/api_service.dart';
import 'package:newsapp/models/news_article_model.dart';

class HomeController with ChangeNotifier {
  List<NewsArticleModel> topHEadArticleList = [];
  List<NewsArticleModel> everyThingArticleList = [];

  RequestStatuesEnum everythingstatues = RequestStatuesEnum.loading;
  RequestStatuesEnum topHeadlinestatues = RequestStatuesEnum.loading;
  int cureentindex = 0;
  List<String> categories = [
    "business",
    "entertainment",
    "general",
    "health",
    "science",
    "sports",
    "technology",
  ];
  String? selectedcategory;

  String? errormessage;
  ApiService apiService = ApiService();

  void init() {
    callEveryThing();
    callTopHeadLines(null);
  }

  //("",params:  {})
  void callTopHeadLines(String? category) async {
    try {
      Map<String, dynamic> queryParams = {"country": "us"};

      if (category != null) {
        queryParams = {"category": "$category"};

        log(queryParams.hashCode.toString());
        //queryParams["category"] = category;
      }

      final result = await apiService.get(
        ApiCpnfig.topheadlines,
        params: queryParams,
      );
      final decodingArticles = result['articles'] as List<dynamic>;

      topHEadArticleList = decodingArticles.map((e) {
        return NewsArticleModel.fromjson(e);
      }).toList();
      topHeadlinestatues = RequestStatuesEnum.loaded;
      errormessage = null;
      notifyListeners();
    } catch (e) {
      topHeadlinestatues = RequestStatuesEnum.error;
      errormessage = e.toString();
      notifyListeners();
    }

    notifyListeners();
  }

  void callEveryThing() async {
    try {
      final result = await apiService.get(
        ApiCpnfig.everything,
        params: {"q": "trending health"},
      );
      final decodingArticles = result[ApiCpnfig.articles] as List<dynamic>;

      everyThingArticleList = decodingArticles.map((e) {
        return NewsArticleModel.fromjson(e);
      }).toList();
      everythingstatues = RequestStatuesEnum.loaded;

      errormessage = null;
      notifyListeners();
    } catch (e) {
      everythingstatues = RequestStatuesEnum.error;
      errormessage = e.toString();
      notifyListeners();
    }
    notifyListeners();
  }

  void focuse(int index) {
    cureentindex = index;
    notifyListeners();
  }

  String formatTimeAgo(String? publishedAtStr) {
    try {
      if (publishedAtStr == null) return "";

      Duration difference = DateTime.now().difference(
        DateTime.parse(publishedAtStr).toLocal(),
      );

      if (difference.inSeconds < 60) {
        return 'a second ago';
      } else if (difference.inMinutes < 60) {
        return ' ${difference.inMinutes}ago minute';
      } else if (difference.inHours < 24) {
        return ' ${difference.inHours}ago hour';
      } else if (difference.inDays < 30) {
        return ' ${difference.inDays} day ago';
      } else {
        return DateFormat(
          'yyyy-MM-dd',
        ).format(DateTime.parse(publishedAtStr).toLocal());
      }
    } catch (e) {
      return 'unknown date';
    }
  }

  void updatedSelectedCategory(int index) {
    selectedcategory = categories[index];
    callTopHeadLines(categories[index]);
    notifyListeners();
  }
}
