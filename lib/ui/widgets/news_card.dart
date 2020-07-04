import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_api/model/article_model.dart';
import 'package:news_api/ui/shared/app_colors.dart';
import 'package:news_api/ui/shared/shared_styles.dart';
import 'package:news_api/ui/shared/ui_helpers.dart';

class NewsCard extends StatelessWidget {
  final ArticleModel article;
  const NewsCard({@required this.article});

  @override
  Widget build(BuildContext context) {
    var name = article.author != null ? article.author : "Unknown";
    var time =
        DateFormat.yMMMMd('en_US').format(DateTime.parse(article.publisedAt));

    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Container(
        height: 180,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.textColor, width: 2),
          borderRadius: BorderRadius.circular(16),
          color: Color(0xffE9E7FC),
          boxShadow: [
            BoxShadow(
              color: AppColors.textColor,
              spreadRadius: 0,
              blurRadius: 4,
              offset: Offset(0, 4), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 200,
                  child: Text(
                    "by $name",
                    overflow: TextOverflow.ellipsis,
                    style: textStyle.copyWith(
                      fontSize: 12,
                      color: AppColors.textColor2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                horizontalSpaceSmall,
                CircleAvatar(
                  radius: 2,
                  backgroundColor: AppColors.textColor2,
                ),
                horizontalSpaceSmall,
                Text(
                  "$time",
                  style: textStyle.copyWith(
                    fontSize: 12,
                    color: AppColors.textColor2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            verticalSpace(20),
            SizedBox(
              width: 300,
              child: Text(
                "${article.title}",
                style: textStyle.copyWith(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
