import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/settings/cubit/settings_cubit.dart';
import 'navigation_service.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  locator.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  locator.registerLazySingleton<NavigationService>(() => NavigationService());

  // Cubits
  locator.registerLazySingleton<SettingsCubit>(() => SettingsCubit());
}
