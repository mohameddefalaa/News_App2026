import 'package:flutter/foundation.dart';
import 'package:newsapp/core/enumes/request_statues_enum.dart';
import 'package:newsapp/core/mixins/notify_seafty.dart';
import 'package:newsapp/features/Home/models/news_article_model.dart';
import 'package:newsapp/features/Home/repos/news_repository.dart';

class HomeController extends ChangeNotifier with notifyseafty {
  HomeController({required this.repository});
  List<NewsArticleModel> topHEadArticleList = [];
  List<NewsArticleModel> everyThingArticleList = [];
  NewsRepository repository;
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

  void init() {
    callEveryThing();
    callTopHeadLines(null);
  }

  //("",params:  {})
  void callTopHeadLines(String? category) async {
    try {
      topHeadlinestatues = RequestStatuesEnum.loading;
      safeNotify();

      topHEadArticleList = await NewsRepository().getTopHeadLine(
        category ?? null,
      );
      topHeadlinestatues = RequestStatuesEnum.loaded;
      errormessage = null;
      safeNotify();
    } catch (e) {
      topHeadlinestatues = RequestStatuesEnum.error;
      errormessage = e.toString();
      safeNotify();
    }

    safeNotify();
  }

  void callEveryThing() async {
    try {
      everythingstatues = RequestStatuesEnum.loading;
      safeNotify();

      everyThingArticleList = await NewsRepository().getEveryThing();
      everythingstatues = RequestStatuesEnum.loaded;
      errormessage = null;
      notifyListeners();
    } catch (e) {
      everythingstatues = RequestStatuesEnum.error;
      errormessage = e.toString();
      safeNotify();
    }
    safeNotify();
  }

  void focuse(int index) {
    cureentindex = index;
    safeNotify();
  }

  void updatedSelectedCategory(int index) {
    selectedcategory = categories[index];
    callTopHeadLines(categories[index]);
  }
}
