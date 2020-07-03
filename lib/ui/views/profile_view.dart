import 'package:flutter/material.dart';
import 'package:news_api/constant/app_assets.dart';
import 'package:news_api/ui/shared/app_colors.dart';
import 'package:news_api/ui/shared/screen_util.dart';
import 'package:news_api/ui/shared/shared_styles.dart';
import 'package:news_api/ui/shared/ui_helpers.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.onboardingRed,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: AppColors.onboardingRed,
              expandedHeight: 400,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(AppAssets.profile),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                ),
                child: Container(
                  height: screenHeight(context) - 410,
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
                      Center(
                        child: Container(
                          width: 61,
                          height: 6,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: AppColors.textColor),
                        ),
                      ),
                      verticalSpaceSmall,
                      Text(
                        "ME THIS IS ME",
                        style: textStyle.copyWith(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: AppColors.contraBlue,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "Genbai Benno",
                            style: textStyle.copyWith(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textColor,
                            ),
                          ),
                          Icon(
                            Icons.star,
                            color: AppColors.onboardingRed,
                          )
                        ],
                      ),
                      verticalSpace(10),
                      Text(
                        "This is going to be a small description about you here, dont have to store it anywhere, just static placement ",
                        style: textStyle.copyWith(
                          color: AppColors.textColor2,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
