import 'package:flutter/material.dart';
import 'package:news_api/constant/app_assets.dart';
import 'package:news_api/model/article_model.dart';
import 'package:news_api/ui/shared/ui_helpers.dart';
import 'package:news_api/ui/views/news_detail_view.dart';
import 'package:news_api/ui/widgets/news_card.dart';
import 'package:news_api/utills/news_api.dart';

class BlogList extends StatefulWidget {
  @override
  _BlogListState createState() => _BlogListState();
}

class _BlogListState extends State<BlogList> {
  List<ArticleModel> articleList;
  bool loading = false;
  bool error = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchNews();
  }

  void fetchNews() async {
    try {
      setState(() {
        loading = true;
      });
      fetchArticle().then((value) {
        setState(() {
          loading = false;
          articleList = ArticleList.fromData(value["articles"]).articleList;
        });
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
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
                child: Image.asset(AppAssets.logo),
              ),
              verticalSpace(20),
              Expanded(
                child: loading
                    ? Center(
                        child: CircularProgressIndicator(
                          valueColor:
                              new AlwaysStoppedAnimation<Color>(Colors.blue),
                          strokeWidth: 2,
                        ),
                      )
                    : ListView.builder(
                        itemCount: articleList.length,
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            showBottomSheet(
                                context: context,
                                builder: (context) => NewsDetail(
                                      article: articleList[index],
                                    ));
                          },
                          child: NewsCard(
                            article: articleList[index],
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
