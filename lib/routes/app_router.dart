import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pp_750/presentations/add_sleep_data_screen/add_sleep_data_screen.dart';
import '../data/models/models/models.dart';
import '../presentations/chart_data_screen/chart_data_screen.dart';
import '../presentations/home_screen/home_screen.dart';
import '../presentations/onboarding_screen/onboarding_screen.dart';
import '../presentations/privacy_splash_screen/privacy_view.dart';
import '../presentations/privacy_splash_screen/splash_view.dart';
import '../presentations/settings_screen/agreement_screen/agreement_screen.dart';
import '../presentations/settings_screen/settings_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: PrivacyRoute.page),
        AutoRoute(page: OnboardingRoute.page),
        AutoRoute(page: SettingsRoute.page),
        AutoRoute(page: AgreementRoute.page),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: AddSleepDataRoute.page),
        AutoRoute(page: ChartDataRoute.page),

        // AutoRoute(page: AllWorkoutsRoute.page),
        // AutoRoute(page: AddWorkoutRoute.page),
        // AutoRoute(page: AddPlanRoute.page),
      ];
}
