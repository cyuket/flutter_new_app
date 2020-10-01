import 'package:flutter/material.dart';
import 'package:news_api/constant/app_assets.dart';
import 'package:news_api/constant/route_names.dart';
import 'package:news_api/ui/shared/app_colors.dart';
import 'package:news_api/ui/shared/shared_styles.dart';
import 'package:news_api/ui/shared/ui_helpers.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
        () => Navigator.pushReplacementNamed(context, HomeContainerRoute));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.contraBlue,
      body: SafeArea(
        child: Container(
          width: screenWidth(context),
          padding: EdgeInsets.symmetric(vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: SizedBox(
                  width: 163.18,
                  height: 105.61,
                  child: Image.asset(AppAssets.splash),
                ),
              ),
              Text(
                "It’s fresh and thrilling",
                style: textStyle.copyWith(fontSize: 15),
              )
            ],
          ),
        ),
      ),
    );
  }
}
