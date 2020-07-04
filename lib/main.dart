import 'package:flutter/material.dart';
import 'package:news_api/constant/route_names.dart';
import 'package:news_api/locator.dart';
import 'package:news_api/services/navigtion_service.dart';
import 'package:news_api/ui/router.dart';

void main() {
  // Register all the models and services before the app starts
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      navigatorKey: locator<NavigationService>().navigationKey,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: HomeContainerRoute,
      onGenerateRoute: generateRoute,
    );
  }
}
