import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/core/enumes/request_statues_enum.dart';
import 'package:newsapp/core/mixins/notify_seafty.dart';
import 'package:newsapp/core/repos/news_repository.dart';
import 'package:newsapp/features/Home/models/news_article_model.dart';

class Searchcontroller extends ChangeNotifier with notifyseafty {
  List<NewsArticleModel> everyThingArticleList = [];
  RequestStatuesEnum everythingstatues = RequestStatuesEnum.loading;
  late TextEditingController serchcontroller;

  void init() {
    serchcontroller = TextEditingController();
  }

  String? errormessage;
  @override
  void dispose() {
    serchcontroller.dispose();
    super.dispose();
  }

  Searchcontroller(this.newsRepository);

  final NewsRepository newsRepository;
  void callEveryThing() async {
    try {
      everythingstatues = RequestStatuesEnum.loading;
      safeNotify();

      everyThingArticleList = await newsRepository.getEveryThing(
        serchcontroller.text,
      );
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
}
