import 'package:flutter/material.dart';
import 'package:flutter_auth0/flutter_auth0.dart';
import 'package:news_api/constant/route_names.dart';
import 'package:news_api/ui/shared/app_colors.dart';
import 'package:news_api/ui/shared/shared_styles.dart';
import 'package:news_api/ui/shared/ui_helpers.dart';
import 'package:news_api/ui/widgets/busy_button.dart';
import 'package:news_api/ui/widgets/input_field.dart';

class SignupView extends StatefulWidget {
  @override
  _SignupViewState createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  static final String clientId = '6wHsffvYN3uy2vECisRv4jKJcjQhk131';
  static final String domain = "cyuket.auth0.com";
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool busy = false;
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final nameController = TextEditingController();

  Auth0 auth = Auth0(baseUrl: 'https://$domain/', clientId: clientId);
  void _showSnap(String message) {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: new Text(message),
      ),
    );
  }

  _signIn() async {
    try {
      setState(() {
        busy = true;
      });

      print(emailController.text);
      await auth.auth.createUser({
        'email': emailController.text,
        'password': passwordController.text,
        'connection': 'Username-Password-Authentication'
      });
      var message = 'Signup successfull';
      _showSnap(message);

      Navigator.pushReplacementNamed(context, HomeContainerRoute);

      setState(() {
        busy = false;
      });
    } catch (e) {
      print(e);

      setState(() {
        busy = false;
      });
      _showSnap("$e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
                      controller: nameController,
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
                      busy: busy,
                      title: "Sign in",
                      onPressed: () async {
                        await _signIn();
                      },
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
