import 'package:news_api/locator.dart';
import 'package:news_api/model/article_model.dart';
import 'package:news_api/services/news_service.dart';
import 'package:news_api/viewmodel/base_model.dart';

class FavViewModel extends BaseModel {
  final NewsService _newsService = locator<NewsService>();
  bool _available = false;
  bool get available => _available;
  List<ArticleModel> get favArticle => _newsService.favouriteArticles;

  void addToFav(ArticleModel article) {
    setBusy(true);
    _newsService.addFavourite(article);
    setBusy(false);
  }

  void checkFav(ArticleModel article) {
    setBusy(true);
    bool value = _newsService.checkFavourite(article);
    _available = value;
    setBusy(false);
  }
}
