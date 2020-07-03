import 'package:flutter/material.dart';
import 'package:news_api/ui/shared/app_colors.dart';
import 'package:news_api/ui/shared/shared_styles.dart';
import 'package:news_api/ui/shared/ui_helpers.dart';
import 'package:news_api/ui/widgets/busy_button.dart';
import 'package:news_api/ui/widgets/input_field.dart';

class SignupView extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.textColor, width: 2),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.textColor,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sign up",
                      style: textStyle.copyWith(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    verticalSpace(10),
                    Text(
                      "You have chance to create new account if you really want to.",
                      style: textStyle.copyWith(
                          color: AppColors.textColor2, fontSize: 17),
                    ),
                    verticalSpace(20),
                    InputField(
                      controller: emailController,
                      placeholder: "Full Name",
                      icon: Icons.person,
                    ),
                    verticalSpace(20),
                    InputField(
                      controller: emailController,
                      placeholder: "Email address",
                      icon: Icons.email,
                    ),
                    verticalSpace(20),
                    InputField(
                      controller: passwordController,
                      placeholder: "●●●●●●●",
                      password: true,
                    ),
                    verticalSpace(20),
                    BusyButton(
                      title: "Sign in",
                      onPressed: null,
                      color: AppColors.yellow,
                    ),
                    verticalSpace(30),
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Row(
                        children: [
                          Text(
                            "Already have account? ",
                            style: textStyle.copyWith(
                              fontSize: 13,
                              color: AppColors.textColor,
                            ),
                          ),
                          Text(
                            "Go here ",
                            style: textStyle.copyWith(
                              fontSize: 13,
                              color: AppColors.onboardingRed,
                            ),
                          )
                        ],
                      ),
                    )
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
