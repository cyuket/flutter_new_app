import 'package:flutter/material.dart';
import 'package:news_api/ui/shared/app_colors.dart';
import 'package:news_api/ui/shared/shared_styles.dart';
import 'package:news_api/ui/shared/ui_helpers.dart';

class OnboardingPage extends StatelessWidget {
  final String heading, subHeading, image;
  final Color backgroundColor;

  const OnboardingPage(
      {this.backgroundColor, this.heading, this.subHeading, this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    color: backgroundColor),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: SizedBox(
                  height: 347,
                  width: 263,
                  child: Image.asset(image),
                ),
              ),
            ],
          ),
          verticalSpace(20),
          SizedBox(
            width: 300,
            child: Text(
              heading,
              style: textStyle.copyWith(
                color: AppColors.textColor,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          verticalSpace(10),
          Text(
            subHeading,
            style: textStyle.copyWith(
              color: AppColors.textColor2,
              fontSize: 21,
              fontWeight: FontWeight.w500,
            ),
          ),
          verticalSpace(20)
        ],
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  final int positionIndex, currentIndex;
  const Indicator({this.currentIndex, this.positionIndex});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12,
      width: 12,
      decoration: BoxDecoration(
          border: Border.all(
            color: positionIndex == currentIndex
                ? AppColors.onboardingRed
                : AppColors.textColor,
          ),
          color: positionIndex == currentIndex
              ? AppColors.onboardingRed
              : Colors.transparent,
          borderRadius: BorderRadius.circular(100)),
    );
  }
}
