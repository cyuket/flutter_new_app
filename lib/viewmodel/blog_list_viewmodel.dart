import 'package:news_api/locator.dart';
import 'package:news_api/model/article_model.dart';
import 'package:news_api/services/news_service.dart';
import 'package:news_api/viewmodel/base_model.dart';

class BlogListViewModel extends BaseModel {
  final NewsService _newsService = locator<NewsService>();

  List<ArticleModel> get articles => _newsService.articles;

  Future fetchArticle() async {
    setBusy(true);

    await _newsService.fetchNews();

    setBusy(false);
  }
}
