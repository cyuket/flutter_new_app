import 'package:flutter/material.dart';
import 'package:news_api/ui/shared/app_colors.dart';
import 'package:news_api/ui/shared/shared_styles.dart';
import 'package:news_api/ui/shared/ui_helpers.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 144,
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
              Text(
                "by Lara Trina",
                style: textStyle.copyWith(
                  fontSize: 12,
                  color: AppColors.textColor2,
                  fontWeight: FontWeight.bold,
                ),
              ),
              horizontalSpaceSmall,
              CircleAvatar(
                radius: 2,
                backgroundColor: AppColors.textColor2,
              ),
              horizontalSpaceSmall,
              Text(
                "2 March, 20",
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
              "This is also another news headline",
              style: textStyle.copyWith(
                color: AppColors.textColor,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          )
        ],
      ),
    );
  }
}
