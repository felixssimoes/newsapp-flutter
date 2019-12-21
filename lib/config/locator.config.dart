import 'package:get_it/get_it.dart';
import 'package:newsapp/app/navigator.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<AppNavigator>(() => AppNavigator());
}
