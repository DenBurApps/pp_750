import 'package:pp_750/core/services/preferences_service.dart';
import 'package:pp_750/core/services/remote_config.dart';


mixin FeatureMixin {
  final _featureData = FeatureData.I;
  final _db = AppPreferences.I;

  void saveLastVisit(String url) => _db.lastUrl = url;

  String loadUrl() {
    final String lastUrl = _db.lastUrl;
    final url = lastUrl.isEmpty ? data : lastUrl;

    return url;
  }

  String get data => _featureData.featureData;
  bool get featureDisabled => !_featureData.featureDisabled;
}
