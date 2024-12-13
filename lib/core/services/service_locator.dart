import 'package:get_it/get_it.dart';
import 'package:pp_750/core/services/database/database_service.dart';



class ServiceLocator {
  static Future<void> setup() async {
    GetIt.I.registerSingletonAsync(() => DatabaseService().init());
    await GetIt.I.isReady<DatabaseService>();
  /*  GetIt.I.registerSingletonAsync(() => RemoteConfigService().init());
    await GetIt.I.isReady<RemoteConfigService>();*/

  }
}