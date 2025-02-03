import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_it/get_it.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:pp_750/core/services/remote_config.dart';
import 'package:pp_750/routes/app_router.dart';
import '../../core/services/database/database_keys.dart';
import '../../core/services/database/database_service.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();

  static Widget builder(BuildContext context) {
    return SplashScreen();
  }
}

class _SplashScreenState extends State<SplashScreen> {
  final _remoteConfigService = GetIt.instance<FlagSmithService>();
  final _databaseService = GetIt.instance<DatabaseService>();

  bool usePrivacy = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _init();
    });
  }

  Future<void> _init() async {
    usePrivacy = _remoteConfigService.usePrivacy;

    _navigate();
  }

  void _navigate() {
    final seenRateDialog =
        _databaseService.get(DatabaseKeys.seenRateDialog) ?? false;
    if (!seenRateDialog) {
      InAppReview.instance.requestReview();
      _databaseService.put(DatabaseKeys.seenRateDialog, true);
    }
    if (usePrivacy) {
      _databaseService.put(DatabaseKeys.seenOnboarding, false);
      final seenOnboarding =
          _databaseService.get(DatabaseKeys.seenOnboarding) ?? false;

      if (!seenOnboarding) {
        context.replaceRoute(OnboardingRoute());
      } else {
        context.replaceRoute(HomeRoute());
      }
    } else {
      context.replaceRoute(PrivacyRoute());
    }

    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
