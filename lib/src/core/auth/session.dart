enum AudienceType { individual, corporate }

enum UserRole { worker, employer, admin }

class Session {
  const Session({
    required this.accessToken,
    required this.refreshToken,
    required this.audience,
    required this.systemUserType,
  });

  final String accessToken;
  final String refreshToken;
  final AudienceType audience;
  final String systemUserType;

  UserRole resolveRole(List<String> adminTypes) {
    if (adminTypes.contains(systemUserType)) {
      return UserRole.admin;
    }
    if (audience == AudienceType.corporate) {
      return UserRole.employer;
    }
    return UserRole.worker;
  }
}
