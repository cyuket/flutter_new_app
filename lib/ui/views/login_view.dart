import 'package:flutter/material.dart';
import 'package:news_api/constant/route_names.dart';
import 'package:news_api/ui/shared/app_colors.dart';
import 'package:news_api/ui/shared/shared_styles.dart';
import 'package:news_api/ui/shared/ui_helpers.dart';
import 'package:news_api/ui/widgets/busy_button.dart';
import 'package:news_api/ui/widgets/input_field.dart';
import 'package:news_api/viewmodel/login_viewmodel.dart';
import 'package:provider_architecture/_viewmodel_provider.dart';

class LoginView extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<LoginViewModel>.withConsumer(
        viewModelBuilder: () => LoginViewModel(),
        builder: (context, data, snapshot) {
          return Scaffold(
            key: _scaffoldKey,
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
                      busy: data.busy,
                      title: "Sign in",
                      onPressed: () async {
                        await data.signIn(
                          email: emailController.text,
                          password: passwordController.text,
                          scaffloldKey: _scaffoldKey,
                        );
                        //  Navigator.pushReplacementNamed(context, HomeContainerRoute)
                      },
                      color: AppColors.yellow,
                    ),
                    verticalSpace(30),
                    InkWell(
                      onTap: () =>
                          Navigator.pushNamed(context, SignupViewRoute),
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
        });
  }
}
