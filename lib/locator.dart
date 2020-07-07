import 'package:get_it/get_it.dart';
import 'package:news_api/services/authentication_service.dart';
import 'package:news_api/services/navigtion_service.dart';
import 'package:news_api/services/news_service.dart';

GetIt locator = GetIt.instance;
void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => NewsService());
  locator.registerLazySingleton(() => AuthenticationSerivice());
}
