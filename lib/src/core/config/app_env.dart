class AppEnv {
  AppEnv._();

  static const String baseUrl = String.fromEnvironment(
    'BASE_URL',
    defaultValue: 'http://localhost:15080',
  );

  static const String authLoginPath = String.fromEnvironment(
    'AUTH_LOGIN_PATH',
    defaultValue: '/SystemUsers/Login',
  );
  static const String authRegisterPath = String.fromEnvironment(
    'AUTH_REGISTER_PATH',
    defaultValue: '/SystemUsers/Register',
  );
  static const String authRefreshPath = String.fromEnvironment(
    'AUTH_REFRESH_PATH',
    defaultValue: '/SystemUsers/RefreshToken',
  );
}
