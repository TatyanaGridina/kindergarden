import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'package:package_info/package_info.dart';

class Config {
  static final Config _singleton = Config._();

  factory Config() {
    return _singleton;
  }

  Config._();

  static bool get isProduction => environment.toLowerCase().startsWith('prod');
  static String get environment => env['environment'] ?? 'dev';
  static String get appName => 'kindergarden-$environment';
  static String get serverUrlRust => env['serverUrlRust']!;

  Future<void> load() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    debugPrint('[PACKAGE] ${packageInfo.packageName}');

    String fileName =
        (packageInfo.packageName == 'com.gta.kindergarden' || packageInfo.packageName == 'com.gta.kindergarden')
            ? 'lib/config/env/production/.env'
            : 'lib/config/env/development/.env';

    await DotEnv.load(fileName: fileName);
    debugPrint('[ENVIRONMENT] $environment');
  }
}

Future<void> initializeConfig() {
  return Config().load();
}
