import 'package:flutter/material.dart';
import 'package:news_api/ui/shared/app_colors.dart';
import 'package:news_api/ui/shared/shared_styles.dart';
import 'package:news_api/ui/shared/ui_helpers.dart';
import 'package:news_api/ui/widgets/busy_button.dart';
import 'package:news_api/ui/widgets/input_field.dart';

class LoginView extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Login",
                style: textStyle.copyWith(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              verticalSpace(10),
              Text(
                "You don’t think you should login first and behave like human not robot.",
                style: textStyle.copyWith(
                    color: AppColors.textColor2, fontSize: 17),
              ),
              verticalSpace(20),
              InputField(
                controller: emailController,
                placeholder: "Email address",
                icon: Icons.person,
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
                child: Row(
                  children: [
                    Text(
                      "You are new? ",
                      style: textStyle.copyWith(
                        fontSize: 13,
                        color: AppColors.textColor,
                      ),
                    ),
                    Text(
                      "Create new",
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
      ),
    );
  }
}
