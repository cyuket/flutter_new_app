import 'package:flutter/material.dart';
import 'package:news_api/ui/shared/app_colors.dart';
import 'package:news_api/ui/shared/shared_styles.dart';
import 'package:news_api/ui/shared/ui_helpers.dart';

class SettingView extends StatefulWidget {
  @override
  _SettingViewState createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                "Settings",
                style: textStyle.copyWith(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textColor,
                ),
              ),
              verticalSpace(20),
              Container(
                height: 172,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.textColor, width: 2),
                  borderRadius: BorderRadius.circular(16),
                  color: Color(0xffFF89BB),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Happiness",
                      style: textStyle.copyWith(
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    verticalSpaceSmall,
                    Text(
                      "Search for Bitcoin related news only here!",
                      style: textStyle.copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    verticalSpaceSmall,
                    Switch(
                      activeColor: AppColors.yellow,
                      value: value,
                      onChanged: (current) {
                        setState(() {
                          value = current;
                        });
                      },
                    )
                  ],
                ),
              ),
              verticalSpace(20),
              Container(
                height: 172,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.textColor, width: 2),
                  borderRadius: BorderRadius.circular(16),
                  color: Color(0xffD6FCF7),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sadness  ",
                      style: textStyle.copyWith(
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    verticalSpaceSmall,
                    Text(
                      "Search for only COVID19 related news only!",
                      style: textStyle.copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    verticalSpaceSmall,
                    Switch(
                      activeColor: AppColors.yellow,
                      value: !value,
                      onChanged: (current) {
                        setState(() {
                          value = !current;
                        });
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
