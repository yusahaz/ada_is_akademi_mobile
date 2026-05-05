import 'package:ada_is_akademi_mobile/src/core/auth/session.dart';
import 'package:ada_is_akademi_mobile/src/core/di/app_providers.dart';
import 'package:ada_is_akademi_mobile/src/features/auth/data/auth_repository.dart';
import 'package:ada_is_akademi_mobile/src/features/auth/domain/auth_usecases.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(ref.watch(dioProvider));
});
final loginUseCaseProvider = Provider<LoginUseCase>((ref) {
  return LoginUseCase(ref.watch(authRepositoryProvider));
});
final registerUseCaseProvider = Provider<RegisterUseCase>((ref) {
  return RegisterUseCase(ref.watch(authRepositoryProvider));
});
final refreshTokenUseCaseProvider = Provider<RefreshTokenUseCase>((ref) {
  return RefreshTokenUseCase(ref.watch(authRepositoryProvider));
});

final authControllerProvider =
    AsyncNotifierProvider<AuthController, Session?>(AuthController.new);

class AuthController extends AsyncNotifier<Session?> {
  @override
  Future<Session?> build() async {
    final storage = await ref.read(appStorageProvider.future);
    final saved = await storage.loadSession();
    final accessToken = saved['access_token'];
    final refreshToken = saved['refresh_token'];
    final audienceRaw = saved['audience'];
    final systemUserType = saved['system_user_type'];
    if (accessToken == null ||
        refreshToken == null ||
        audienceRaw == null ||
        systemUserType == null) {
      return null;
    }
    return Session(
      accessToken: accessToken,
      refreshToken: refreshToken,
      audience: audienceRaw == AudienceType.corporate.name
          ? AudienceType.corporate
          : AudienceType.individual,
      systemUserType: systemUserType,
    );
  }

  Future<void> login({
    required String email,
    required String password,
    required AudienceType audience,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final session = await ref.read(loginUseCaseProvider)(
            email: email,
            password: password,
            audience: audience,
          );
      final storage = await ref.read(appStorageProvider.future);
      await storage.saveSession(
        accessToken: session.accessToken,
        refreshToken: session.refreshToken,
        audience: session.audience.name,
        systemUserType: session.systemUserType,
      );
      return session;
    });
  }

  Future<void> register({
    required String email,
    required String password,
    required String name,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final session = await ref.read(registerUseCaseProvider)(
            email: email,
            password: password,
            name: name,
          );
      final storage = await ref.read(appStorageProvider.future);
      await storage.saveSession(
        accessToken: session.accessToken,
        refreshToken: session.refreshToken,
        audience: session.audience.name,
        systemUserType: session.systemUserType,
      );
      return session;
    });
  }

  Future<bool> refreshToken() async {
    final current = state.valueOrNull;
    if (current == null) return false;
    try {
      final session = await ref.read(refreshTokenUseCaseProvider)(
            refreshToken: current.refreshToken,
            audience: current.audience,
          );
      state = AsyncValue.data(session);
      final storage = await ref.read(appStorageProvider.future);
      await storage.saveSession(
        accessToken: session.accessToken,
        refreshToken: session.refreshToken,
        audience: session.audience.name,
        systemUserType: session.systemUserType,
      );
      return true;
    } on DioException {
      await logout();
      return false;
    }
  }

  Future<void> logout() async {
    final storage = await ref.read(appStorageProvider.future);
    await storage.clearSession();
    state = const AsyncData(null);
  }
}
