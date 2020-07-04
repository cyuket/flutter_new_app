import 'package:news_api/model/article_model.dart';
import 'package:news_api/viewmodel/base_model.dart';

class FavViewModel extends BaseModel {
  List<ArticleModel> _favArticle = [];

  List<ArticleModel> get favArticle => _favArticle;

  void addToFav(ArticleModel article) {
    setBusy(true);
    _favArticle.add(article);
    print("wkwk");
    setBusy(false);
  }
}
