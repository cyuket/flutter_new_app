import 'package:flutter/material.dart';
import 'package:news_api/ui/shared/app_colors.dart';
import 'package:news_api/ui/shared/shared_styles.dart';
import 'package:news_api/ui/shared/ui_helpers.dart';

class NewsDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                    border: Border.all(color: AppColors.textColor, width: 2),
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
                            "This is a news headline and you noticed",
                            style: textStyle.copyWith(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textColor,
                            ),
                          ),
                        ),
                        verticalSpace(20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.favorite_border,
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
                                "Make this card transition in from the bottom, Just include the description from the API here and thats it. The image you see below is also available using the API. Implement a local store to save the like ",
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
                                  border: Border.all(
                                      color: AppColors.textColor, width: 2),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              verticalSpace(20),
                              Text(
                                "Alisa Red",
                                style: textStyle.copyWith(
                                  color: AppColors.textColor,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "33 March, 20",
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
  }
}
