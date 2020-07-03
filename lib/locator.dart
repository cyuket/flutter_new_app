import 'package:get_it/get_it.dart';
import 'package:news_api/services/navigtion_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  // locator.registerLazySingleton(() => DialogService());
  // locator.registerLazySingleton(() => AuthenticationService());
  // locator.registerLazySingleton(() => FirestoreService());
}
