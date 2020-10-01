import 'package:flutter/material.dart';
import 'package:news_api/constant/app_assets.dart';
import 'package:news_api/model/article_model.dart';
import 'package:news_api/ui/shared/base_view.dart';
import 'package:news_api/ui/shared/ui_helpers.dart';
import 'package:news_api/ui/views/news_detail_view.dart';
import 'package:news_api/ui/widgets/news_card.dart';
import 'package:news_api/viewmodel/blog_list_viewmodel.dart';

class BlogList extends StatefulWidget {
  @override
  _BlogListState createState() => _BlogListState();
}

class _BlogListState extends State<BlogList> {
  List<ArticleModel> articleList = [];
  bool loading = false;
  bool error = false;

  @override
  Widget build(BuildContext context) {
    return BaseView<BlogListViewModel>(
        onModelReady: (model) => model.fetchArticle(),
        builder: (context, model, child) {
          print(model.articles);
          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10, top: 10),
                      height: 50,
                      child: SizedBox(
                          width: 86,
                          height: 23.87,
                          child: Image.asset(AppAssets.logo)),
                    ),
                    verticalSpace(20),
                    Expanded(
                      child: model.busy
                          ? Center(
                              child: CircularProgressIndicator(
                                valueColor: new AlwaysStoppedAnimation<Color>(
                                    Colors.blue),
                                strokeWidth: 2,
                              ),
                            )
                          : ListView.builder(
                              itemCount: model.articles.length,
                              itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  showBottomSheet(
                                      context: context,
                                      builder: (context) => NewsDetail(
                                            article: model.articles[index],
                                          ));
                                },
                                child: NewsCard(
                                  article: model.articles[index],
                                ),
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
