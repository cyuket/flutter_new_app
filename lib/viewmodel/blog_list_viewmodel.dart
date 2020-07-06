import 'package:news_api/locator.dart';
import 'package:news_api/model/article_model.dart';
import 'package:news_api/services/news_service.dart';
import 'package:news_api/viewmodel/base_model.dart';

class BlogListViewModel extends BaseModel {
  final NewsService _newsService = locator<NewsService>();
  List<ArticleModel> list = [];
  List<ArticleModel> get articles => list;

  Future fetchArticle() async {
    setBusy(true);

    _newsService.fetchNews().then((value) => list = _newsService.articles);

    setBusy(false);
  }
}
