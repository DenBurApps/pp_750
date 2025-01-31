// ignore_for_file: unused_import
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/app_export.dart';
import 'core/services/service_locator.dart';
//import 'firebase_options.dart';

Future<void> main() async {
  final bindigs = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: bindigs);
  await _initApp();
  Future.wait([
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
  ]).then((value) {
    runApp(
      MyApp(),
    );
  });
}

Future<void> _initApp() async {
  await PrefUtils().init();
  await ServiceLocator.setup();
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => ThemeBloc(
                ThemeState(
                  themeType: PrefUtils().getThemeData(),
                ),
              ),
            ),
          ],
          child: BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              return MaterialApp.router(
                builder: (context, child) => MediaQuery(
                  data: MediaQuery.of(context)
                      .copyWith(alwaysUse24HourFormat: true),
                  child: child ?? Container(),
                ),
                theme: theme,
                title: 'Sleep Energy Path',
                debugShowCheckedModeBanner: false,
                routerConfig: _appRouter.config(),
              );
            },
          ),
        );
      },
    );
  }
}
