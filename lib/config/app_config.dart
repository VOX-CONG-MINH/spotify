import 'flavor.dart';

class AppConfig {
  final Flavor flavor;
  final String baseUrl;

  static late AppConfig _instance;

  AppConfig._internal({required this.flavor, required this.baseUrl});

  static void initialize({required Flavor flavor}) {
    _instance = AppConfig._internal(
      flavor: flavor,
      baseUrl: _getBaseUrl(flavor),
    );
  }

  static AppConfig get instance => _instance;

  static String _getBaseUrl(Flavor flavor) {
    switch (flavor) {
      case Flavor.development:
        return 'https://dev.api.example.com';
      case Flavor.staging:
        return 'https://staging.api.example.com';
      case Flavor.production:
        return 'https://api.example.com';
    }
  }

  static bool get isDev => _instance.flavor == Flavor.development;
  static bool get isStaging => _instance.flavor == Flavor.staging;
  static bool get isProd => _instance.flavor == Flavor.production;
}
