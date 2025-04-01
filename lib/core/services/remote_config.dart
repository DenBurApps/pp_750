import 'dart:convert';

import 'package:flagsmith/flagsmith.dart';

class FeatureData {
  static final FeatureData I = FeatureData._();
  FeatureData._();
  static const _apikey = 'YfURMpgrBp6ugtPZMxskEw';

  late FlagsmithClient _flagsmithClient;

  late String _featureData;
  late bool _featureDisabled;

  Future<FeatureData> init() async {
    try {
      _flagsmithClient = await FlagsmithClient.init(
        apiKey: _apikey,
        config: const FlagsmithConfig(
          caches: true,
        ),
      );
      await _flagsmithClient.getFeatureFlags(reload: true);

      final config = jsonDecode(
          await _flagsmithClient.getFeatureFlagValue(ConfigKey.feature.name) ??
              '') as Map<String, dynamic>;

      _featureData = config[ConfigKey.featureData.name];
      _featureDisabled = config[ConfigKey.featureDisabled.name];
    } catch (e, s) {
      _featureDisabled = true;
      _featureData = '';
    }
    return this;
  }

  void closeClient() async {
    _flagsmithClient.close();
  }

  bool get featureDisabled => _featureDisabled;

  String get featureData => _featureData;
}

enum ConfigKey {
  feature,
  featureData,
  featureDisabled,
}
