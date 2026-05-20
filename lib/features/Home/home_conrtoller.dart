import 'package:flutter/foundation.dart';
import 'package:newsapp/core/enumes/request_statues_enum.dart';
import 'package:newsapp/features/Home/models/news_article_model.dart';
import 'package:newsapp/features/Home/repos/news_repository.dart';

class HomeController with ChangeNotifier {
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
      notifyListeners();

      topHEadArticleList = await NewsRepository().getTopHeadLine(
        category ?? null,
      );
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
      everythingstatues = RequestStatuesEnum.loading;
      notifyListeners();

      everyThingArticleList = await NewsRepository().getEveryThing();
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

  void updatedSelectedCategory(int index) {
    selectedcategory = categories[index];
    callTopHeadLines(categories[index]);
  }
}
