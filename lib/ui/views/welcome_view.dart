import 'package:flutter/material.dart';
import 'package:news_api/constant/app_assets.dart';
import 'package:news_api/constant/route_names.dart';
import 'package:news_api/ui/shared/app_colors.dart';
import 'package:news_api/ui/shared/shared_styles.dart';
import 'package:news_api/ui/shared/ui_helpers.dart';

class WelcomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 309,
                    height: 309,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(309),
                        color: Color(0xffFFF4CC)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Image.asset(AppAssets.onboarding3),
                  ),
                ],
              ),
              verticalSpace(20),
              Text(
                "WELCOME",
                style: textStyle.copyWith(
                  color: Color(0xff969BAB),
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),
              verticalSpace(5),
              SizedBox(
                width: 300,
                child: Text(
                  "Absolute pleasure to have you",
                  style: textStyle.copyWith(
                    color: AppColors.textColor,
                    fontSize: 44,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              verticalSpace(20),
              InkWell(
                onTap: () =>
                    Navigator.pushReplacementNamed(context, LoginViewRoute),
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: AppColors.textColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Get Started",
                        style: textStyle.copyWith(
                            fontSize: 21,
                            fontWeight: FontWeight.w800,
                            color: Colors.white),
                      ),
                      horizontalSpaceSmall,
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
