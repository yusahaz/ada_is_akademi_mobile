import 'package:ada_is_akademi_mobile/src/core/auth/session.dart';
import 'package:ada_is_akademi_mobile/src/features/auth/data/auth_repository.dart';

class LoginUseCase {
  LoginUseCase(this._repository);
  final AuthRepository _repository;

  Future<Session> call({
    required String email,
    required String password,
    required AudienceType audience,
  }) {
    return _repository.login(
      email: email,
      password: password,
      audience: audience,
    );
  }
}

class RegisterUseCase {
  RegisterUseCase(this._repository);
  final AuthRepository _repository;

  Future<Session> call({
    required String email,
    required String password,
    required String name,
  }) {
    return _repository.register(
      email: email,
      password: password,
      name: name,
    );
  }
}

class RefreshTokenUseCase {
  RefreshTokenUseCase(this._repository);
  final AuthRepository _repository;

  Future<Session> call({
    required String refreshToken,
    required AudienceType audience,
  }) {
    return _repository.refreshToken(
      refreshToken: refreshToken,
      audience: audience,
    );
  }
}
