import 'package:news_api/ui/shared/home_container.dart';
import 'package:flutter/material.dart';
import 'package:news_api/constant/route_names.dart';
import 'package:news_api/ui/views/login_view.dart';
import 'package:news_api/ui/views/onbording.dart';
import 'package:news_api/ui/views/signup.dart';
import 'package:news_api/ui/views/splash_view.dart';
import 'package:news_api/ui/views/welcome_view.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: SplashScreen(),
      );
    case OnboardingViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: OnboardingView(),
      );
    case WelcomeViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: WelcomeView(),
      );
    case HomeContainerRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: HomeContainer(),
      );
    case SignupViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: SignupView(),
      );
    case LoginViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: LoginView(),
      );

    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(child: Text('No route defined for ${settings.name}')),
        ),
      );
  }
}

PageRoute _getPageRoute({String routeName, Widget viewToShow}) {
  return MaterialPageRoute(
      settings: RouteSettings(
        name: routeName,
      ),
      builder: (_) => viewToShow);
}
