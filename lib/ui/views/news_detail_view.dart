import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_api/model/article_model.dart';
import 'package:news_api/ui/shared/app_colors.dart';
import 'package:news_api/ui/shared/shared_styles.dart';
import 'package:news_api/ui/shared/ui_helpers.dart';
import 'package:news_api/viewmodel/fav_viewmodel.dart';
import 'package:provider_architecture/_viewmodel_provider.dart';

class NewsDetail extends StatefulWidget {
  final ArticleModel article;
  NewsDetail({@required this.article});

  @override
  _NewsDetailState createState() => _NewsDetailState();
}

class _NewsDetailState extends State<NewsDetail> {
  bool fav = false;
  @override
  Widget build(BuildContext context) {
    var name =
        widget.article.author != null ? widget.article.author : "Unknown";
    var time = DateFormat.yMMMMd('en_US')
        .format(DateTime.parse(widget.article.publisedAt));
    return ViewModelProvider<FavViewModel>.withConsumer(
        viewModelBuilder: () => FavViewModel(),
        builder: (context, data, child) {
          return SafeArea(
            child: Container(
              color: Color.fromRGBO(24, 25, 31, 0.3),
              child: Container(
                child: Column(
                  children: [
                    verticalSpace(50),
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: AppColors.textColor, width: 2),
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.white,
                        ),
                        child: Center(
                            child: Text(
                          "X",
                          style: textStyle.copyWith(
                            color: AppColors.textColor,
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                      ),
                    ),
                    verticalSpace(10),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(16),
                          ),
                        ),
                        child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(16),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                child: Text(
                                  "${widget.article.title}",
                                  style: textStyle.copyWith(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.textColor,
                                  ),
                                ),
                              ),
                              verticalSpace(20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      if (!fav) {
                                        data.addToFav(widget.article);
                                        setState(() {
                                          fav = true;
                                        });
                                      }
                                    },
                                    child: Row(
                                      children: [
                                        Icon(
                                          !fav
                                              ? Icons.favorite_border
                                              : Icons.favorite,
                                          color: AppColors.textColor,
                                        ),
                                        horizontalSpaceSmall,
                                        Text(
                                          "Like",
                                          style: textStyle.copyWith(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.textColor,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 1,
                                    height: 28,
                                    color: AppColors.textColor,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.file_upload,
                                        color: AppColors.textColor,
                                      ),
                                      horizontalSpaceSmall,
                                      Text(
                                        "Share",
                                        style: textStyle.copyWith(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.textColor,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              verticalSpace(20),
                              Expanded(
                                child: ListView(
                                  children: [
                                    Text(
                                      "${widget.article.content}",
                                      style: textStyle.copyWith(
                                        color: AppColors.textColor2,
                                        fontSize: 17,
                                      ),
                                    ),
                                    verticalSpace(10),
                                    Container(
                                      height: 240,
                                      decoration: BoxDecoration(
                                        color: AppColors.onboardingRed,
                                        image: widget.article.imageUrl != null
                                            ? DecorationImage(
                                                image: NetworkImage(
                                                    widget.article.imageUrl),
                                                fit: BoxFit.cover)
                                            : null,
                                        border: Border.all(
                                            color: AppColors.textColor,
                                            width: 2),
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                    ),
                                    verticalSpace(20),
                                    Text(
                                      "$name",
                                      style: textStyle.copyWith(
                                        color: AppColors.textColor,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "$time",
                                      style: textStyle.copyWith(
                                        color: AppColors.textColor,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
