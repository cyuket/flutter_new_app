import 'package:flutter/material.dart';
import 'package:news_api/constant/app_assets.dart';
import 'package:news_api/ui/shared/app_colors.dart';
import 'package:news_api/ui/shared/shared_styles.dart';
import 'package:news_api/ui/shared/ui_helpers.dart';
import 'package:news_api/ui/views/blog_list_view.dart';
import 'package:news_api/ui/views/news_detail_view.dart';
import 'package:news_api/ui/widgets/news_card.dart';

class FavouriteView extends StatelessWidget {
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Your Favs",
                    style: textStyle.copyWith(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textColor,
                    ),
                  ),
                  Text(
                    "These are some of the posts that you’ve liked! Go on and add more.",
                    style: textStyle.copyWith(
                      color: AppColors.textColor2,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
              verticalSpace(20),
              Expanded(
                child: ListView(
                  children: [
                    InkWell(
                      onTap: () {
                        showBottomSheet(
                            context: context,
                            builder: (context) => NewsDetail());
                      },
                      child: NewsCard(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
