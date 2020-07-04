import 'package:get_it/get_it.dart';
import 'package:news_api/services/navigtion_service.dart';
import 'package:news_api/ui/views/favourite_view.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());

  locator.registerLazySingleton(() => FavouriteView());
  // locator.registerLazySingleton(() => AuthenticationService());
  // locator.registerLazySingleton(() => FirestoreService());
}
