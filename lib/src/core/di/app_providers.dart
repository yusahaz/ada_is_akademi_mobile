import 'package:ada_is_akademi_mobile/src/core/auth/session.dart';
import 'package:ada_is_akademi_mobile/src/core/config/app_env.dart';
import 'package:ada_is_akademi_mobile/src/core/storage/app_storage.dart';
import 'package:ada_is_akademi_mobile/src/core/utils/app_logger.dart';
import 'package:ada_is_akademi_mobile/src/features/auth/application/auth_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider = FutureProvider<SharedPreferences>((ref) async {
  return SharedPreferences.getInstance();
});

final secureStorageProvider = Provider<FlutterSecureStorage>((ref) {
  return const FlutterSecureStorage();
});

final appStorageProvider = FutureProvider<AppStorage>((ref) async {
  final prefs = await ref.watch(sharedPreferencesProvider.future);
  final secure = ref.watch(secureStorageProvider);
  return AppStorage(prefs, secure);
});

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(BaseOptions(baseUrl: AppEnv.baseUrl));
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        final session = ref.read(authControllerProvider).valueOrNull;
        if (session != null) {
          options.headers['Authorization'] = 'Bearer ${session.accessToken}';
        }
        AppLogger.info('REQ ${options.method} ${options.path}');
        handler.next(options);
      },
      onResponse: (response, handler) {
        AppLogger.info('RES ${response.statusCode} ${response.requestOptions.path}');
        handler.next(response);
      },
      onError: (error, handler) async {
        AppLogger.error(
          'HTTP ${error.response?.statusCode} ${error.requestOptions.path}',
          error.message,
        );
        if (error.response?.statusCode == 401) {
          final refreshed = await ref
              .read(authControllerProvider.notifier)
              .refreshToken();
          if (refreshed) {
            final request = error.requestOptions;
            final token = ref.read(authControllerProvider).valueOrNull?.accessToken;
            if (token != null) {
              request.headers['Authorization'] = 'Bearer $token';
              final response = await dio.fetch(request);
              handler.resolve(response);
              return;
            }
          }
        }
        handler.next(error);
      },
    ),
  );
  return dio;
});

final adminTypesProvider = Provider<List<String>>((ref) {
  const raw = String.fromEnvironment(
    'ADMIN_SYSTEM_USER_TYPES',
    defaultValue: 'Admin,SuperAdmin',
  );
  return raw.split(',').map((e) => e.trim()).where((e) => e.isNotEmpty).toList();
});

final resolvedRoleProvider = Provider<UserRole?>((ref) {
  final session = ref.watch(authControllerProvider).valueOrNull;
  if (session == null) return null;
  final adminTypes = ref.watch(adminTypesProvider);
  return session.resolveRole(adminTypes);
});
