import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:news_api/model/article_model.dart';
import 'package:news_api/utills/news_api.dart';

class NewsService extends ChangeNotifier {
  List<ArticleModel> _articleList = [];
  List<ArticleModel> _favouriteArticleList = [];

  List<ArticleModel> get articles {
    return _articleList;
  }

  UnmodifiableListView<ArticleModel> get favouriteArticles {
    return UnmodifiableListView(_favouriteArticleList);
  }

  Future fetchNews() async {
    try {
      var value = await fetchArticle();
      _articleList = ArticleList.fromData(value["articles"]).articleList;
    } catch (e) {
      print(e);
    }
  }

  void addFavourite(ArticleModel article) {
    if (_favouriteArticleList.contains(article)) return;
    _favouriteArticleList.add(article);
  }

  bool checkFavourite(ArticleModel article) {
    var result = _favouriteArticleList.contains(article);
    print(result);
    return result;
  }
}
