// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AddSleepDataRoute.name: (routeData) {
      final args = routeData.argsAs<AddSleepDataRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddSleepDataScreen(
          key: args.key,
          sleepData: args.sleepData,
          date: args.date,
        ),
      );
    },
    AgreementRoute.name: (routeData) {
      final args = routeData.argsAs<AgreementRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AgreementScreen(
          key: args.key,
          arguments: args.arguments,
        ),
      );
    },
    ChartDataRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ChartDataScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnboardingScreen(),
      );
    },
    PrivacyRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const GeneralScreen(),
      );
    },
    SettingsRoute.name: (routeData) {
      final args = routeData.argsAs<SettingsRouteArgs>(
          orElse: () => const SettingsRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SettingsScreen(key: args.key),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [AddSleepDataScreen]
class AddSleepDataRoute extends PageRouteInfo<AddSleepDataRouteArgs> {
  AddSleepDataRoute({
    Key? key,
    SleepData? sleepData,
    required DateTime date,
    List<PageRouteInfo>? children,
  }) : super(
          AddSleepDataRoute.name,
          args: AddSleepDataRouteArgs(
            key: key,
            sleepData: sleepData,
            date: date,
          ),
          initialChildren: children,
        );

  static const String name = 'AddSleepDataRoute';

  static const PageInfo<AddSleepDataRouteArgs> page =
      PageInfo<AddSleepDataRouteArgs>(name);
}

class AddSleepDataRouteArgs {
  const AddSleepDataRouteArgs({
    this.key,
    this.sleepData,
    required this.date,
  });

  final Key? key;

  final SleepData? sleepData;

  final DateTime date;

  @override
  String toString() {
    return 'AddSleepDataRouteArgs{key: $key, sleepData: $sleepData, date: $date}';
  }
}

/// generated route for
/// [AgreementScreen]
class AgreementRoute extends PageRouteInfo<AgreementRouteArgs> {
  AgreementRoute({
    Key? key,
    required AgreementScreenArguments arguments,
    List<PageRouteInfo>? children,
  }) : super(
          AgreementRoute.name,
          args: AgreementRouteArgs(
            key: key,
            arguments: arguments,
          ),
          initialChildren: children,
        );

  static const String name = 'AgreementRoute';

  static const PageInfo<AgreementRouteArgs> page =
      PageInfo<AgreementRouteArgs>(name);
}

class AgreementRouteArgs {
  const AgreementRouteArgs({
    this.key,
    required this.arguments,
  });

  final Key? key;

  final AgreementScreenArguments arguments;

  @override
  String toString() {
    return 'AgreementRouteArgs{key: $key, arguments: $arguments}';
  }
}

/// generated route for
/// [ChartDataScreen]
class ChartDataRoute extends PageRouteInfo<void> {
  const ChartDataRoute({List<PageRouteInfo>? children})
      : super(
          ChartDataRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChartDataRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OnboardingScreen]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute({List<PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [GeneralScreen]
class PrivacyRoute extends PageRouteInfo<void> {
  const PrivacyRoute({List<PageRouteInfo>? children})
      : super(
          PrivacyRoute.name,
          initialChildren: children,
        );

  static const String name = 'PrivacyRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<SettingsRouteArgs> {
  SettingsRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          SettingsRoute.name,
          args: SettingsRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<SettingsRouteArgs> page =
      PageInfo<SettingsRouteArgs>(name);
}

class SettingsRouteArgs {
  const SettingsRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'SettingsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
