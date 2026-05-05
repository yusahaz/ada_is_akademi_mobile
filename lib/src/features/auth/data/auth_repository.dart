import 'package:ada_is_akademi_mobile/src/core/auth/session.dart';
import 'package:ada_is_akademi_mobile/src/core/config/app_env.dart';
import 'package:ada_is_akademi_mobile/src/core/network/api_envelope.dart';
import 'package:dio/dio.dart';

class AuthRepository {
  AuthRepository(this._dio);

  final Dio _dio;

  Future<Session> login({
    required String email,
    required String password,
    required AudienceType audience,
  }) async {
    final response = await _dio.post(
      AppEnv.authLoginPath,
      data: <String, dynamic>{
        'email': email,
        'password': password,
        'audience': audience.name,
      },
    );
    final envelope = ApiEnvelope<Session>.fromJson(
      response.data as Map<String, dynamic>,
      (raw) => _sessionFromJson(raw as Map<String, dynamic>, audience),
    );
    _throwIfInvalid(response.statusCode, envelope);
    return envelope.data!;
  }

  Future<Session> register({
    required String email,
    required String password,
    required String name,
  }) async {
    final response = await _dio.post(
      AppEnv.authRegisterPath,
      data: <String, dynamic>{
        'email': email,
        'password': password,
        'name': name,
        'audience': AudienceType.individual.name,
      },
    );
    final envelope = ApiEnvelope<Session>.fromJson(
      response.data as Map<String, dynamic>,
      (raw) => _sessionFromJson(
        raw as Map<String, dynamic>,
        AudienceType.individual,
      ),
    );
    _throwIfInvalid(response.statusCode, envelope);
    return envelope.data!;
  }

  Future<Session> refreshToken({
    required String refreshToken,
    required AudienceType audience,
  }) async {
    final response = await _dio.post(
      AppEnv.authRefreshPath,
      data: <String, dynamic>{'refreshToken': refreshToken},
    );
    final envelope = ApiEnvelope<Session>.fromJson(
      response.data as Map<String, dynamic>,
      (raw) => _sessionFromJson(raw as Map<String, dynamic>, audience),
    );
    _throwIfInvalid(response.statusCode, envelope);
    return envelope.data!;
  }

  Session _sessionFromJson(Map<String, dynamic> json, AudienceType audience) {
    return Session(
      accessToken: json['accessToken'] as String? ?? '',
      refreshToken: json['refreshToken'] as String? ?? '',
      systemUserType: json['systemUserType'] as String? ?? '',
      audience: audience,
    );
  }

  void _throwIfInvalid(int? statusCode, ApiEnvelope<dynamic> envelope) {
    if ((statusCode ?? 500) >= 400 || envelope.success == false) {
      throw DioException(
        requestOptions: RequestOptions(path: ''),
        message: envelope.message ?? envelope.code ?? 'ApiError',
      );
    }
  }
}
