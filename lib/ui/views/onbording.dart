import 'package:flutter/material.dart';
import 'package:news_api/constant/app_assets.dart';
import 'package:news_api/constant/route_names.dart';
import 'package:news_api/ui/shared/app_colors.dart';

import 'package:news_api/ui/shared/ui_helpers.dart';
import 'package:news_api/ui/widgets/onboarding_page.dart';

class OnboardingView extends StatefulWidget {
  @override
  _OnboardingViewState createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  PageController _pageController;
  int currentIndex = 0;

  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;

  nextFunction() {
    _pageController.nextPage(duration: _kDuration, curve: _kCurve);
  }

  onChangedFunction(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: <Widget>[
          PageView(
            controller: _pageController,
            onPageChanged: onChangedFunction,
            children: <Widget>[
              OnboardingPage(
                image: AppAssets.onboarding1,
                backgroundColor: AppColors.onboardingRed,
                heading: "News everywhere",
                subHeading:
                    "It’s important that we have news everywhere. It’s critical to know its authenticity",
              ),
              OnboardingPage(
                image: AppAssets.onboarding2,
                backgroundColor: Color(0xff00C6AE),
                heading: "It’s fresh and thrilling",
                subHeading:
                    "It’s very important to know that the news you consume is fresh and authentic",
              ),
            ],
          ),
          Positioned(
            bottom: 10,
            child: Container(
              width: screenWidth(context),
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Indicator(
                        positionIndex: 0,
                        currentIndex: currentIndex,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Indicator(
                        positionIndex: 1,
                        currentIndex: currentIndex,
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      if (currentIndex == 1) {
                        Navigator.pushReplacementNamed(
                            context, WelcomeViewRoute);
                      }
                      nextFunction();
                    },
                    child: Material(
                      elevation: 10,
                      shadowColor: Colors.black,
                      color: AppColors.yellow,
                      borderRadius: BorderRadius.circular(100),
                      child: Container(
                        height: 60,
                        width: 60,
                        child: Center(
                          child: Icon(
                            Icons.arrow_forward,
                            color: AppColors.textColor,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
