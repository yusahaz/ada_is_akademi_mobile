import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppStorage {
  AppStorage(this._prefs, this._secureStorage);

  final SharedPreferences _prefs;
  final FlutterSecureStorage _secureStorage;

  static const _kThemeMode = 'theme_mode';
  static const _kLocaleCode = 'locale_code';
  static const _kOnboardingSeen = 'onboarding_seen';
  static const _kAccessToken = 'access_token';
  static const _kRefreshToken = 'refresh_token';
  static const _kAudience = 'audience';
  static const _kSystemUserType = 'system_user_type';

  String? get themeMode => _prefs.getString(_kThemeMode);
  Future<void> saveThemeMode(String value) => _prefs.setString(_kThemeMode, value);

  String? get localeCode => _prefs.getString(_kLocaleCode);
  Future<void> saveLocaleCode(String value) => _prefs.setString(_kLocaleCode, value);

  bool get hasSeenOnboarding => _prefs.getBool(_kOnboardingSeen) ?? false;
  Future<void> saveOnboardingSeen(bool value) => _prefs.setBool(_kOnboardingSeen, value);

  Future<void> saveSession({
    required String accessToken,
    required String refreshToken,
    required String audience,
    required String systemUserType,
  }) async {
    await _secureStorage.write(key: _kAccessToken, value: accessToken);
    await _secureStorage.write(key: _kRefreshToken, value: refreshToken);
    await _secureStorage.write(key: _kAudience, value: audience);
    await _secureStorage.write(key: _kSystemUserType, value: systemUserType);
  }

  Future<Map<String, String?>> loadSession() async {
    return <String, String?>{
      _kAccessToken: await _secureStorage.read(key: _kAccessToken),
      _kRefreshToken: await _secureStorage.read(key: _kRefreshToken),
      _kAudience: await _secureStorage.read(key: _kAudience),
      _kSystemUserType: await _secureStorage.read(key: _kSystemUserType),
    };
  }

  Future<void> clearSession() async {
    await _secureStorage.delete(key: _kAccessToken);
    await _secureStorage.delete(key: _kRefreshToken);
    await _secureStorage.delete(key: _kAudience);
    await _secureStorage.delete(key: _kSystemUserType);
  }
}
