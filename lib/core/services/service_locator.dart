import 'package:get_it/get_it.dart';
import 'package:pp_750/core/services/database/database_service.dart';
import 'package:pp_750/core/services/preferences_service.dart';
import 'package:pp_750/core/services/remote_config.dart';


class ServiceLocator {
  static Future<void> setup() async {
    GetIt.I.registerSingletonAsync(() => DatabaseService().init());
    await GetIt.I.isReady<DatabaseService>();
    GetIt.I.registerSingletonAsync(() => FeatureData.I.init());
    await GetIt.I.isReady<FeatureData>();
    GetIt.I.registerSingletonAsync(() => AppPreferences.I.init());
    await GetIt.I.isReady<AppPreferences>();
  }
}