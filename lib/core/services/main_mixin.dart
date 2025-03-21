import 'package:get_it/get_it.dart';
import 'package:pp_750/core/services/database/database_service.dart';
import 'package:pp_750/core/services/remote_config.dart';


mixin MainMixin {
  final _fdataService = GetIt.instance<FlagSmithService>();
  final _db = GetIt.instance<DatabaseService>();

  void saveLastVisit(String url) => _db.put('lastUrl', url);

  String loadUrl() {
    final String lastUrl = _db.get('lastUrl') ?? '';
    final url = lastUrl.isEmpty ? link : lastUrl;

    return url;
  }

  String get link => _fdataService.link;
  bool get canShowAppInfo => !_fdataService.usePrivacy;
}
