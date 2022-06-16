
import 'package:demo_use/app/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:demo_use/app/modules/dashboard/views/dashboard_view.dart';
import 'package:demo_use/app/modules/settings/bindings/settings_binding.dart';
import 'package:demo_use/app/modules/settings/views/settings_views.dart';
import 'package:demo_use/app/modules/splash/bindings/splash_screen_binding.dart';
import 'package:demo_use/app/modules/splash/views/splash_screen_view.dart';
import 'package:get/get.dart';
 part 'app_routes.dart';

abstract class AppPages{
  static final pages = [
    GetPage(
        name: AppRoutes.splashscreen,
        page: () => const SplashScreenView(),
        binding: SplashScreenBinding()
    ),
    GetPage(
        name: AppRoutes.dashboard,
        page: ()=> DashboardView(),
        binding: DashboardBinding()
    ),
    GetPage(
        name: AppRoutes.settings,
        page: ()=> const SettingsView(),
        binding: SettingsBinding()
    )
  ];
}