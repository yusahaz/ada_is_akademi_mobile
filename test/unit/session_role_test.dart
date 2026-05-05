import 'package:ada_is_akademi_mobile/src/core/auth/session.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('admin type resolves as admin', () {
    const session = Session(
      accessToken: 'a',
      refreshToken: 'r',
      audience: AudienceType.individual,
      systemUserType: 'SuperAdmin',
    );
    expect(session.resolveRole(['Admin', 'SuperAdmin']), UserRole.admin);
  });

  test('corporate audience resolves as employer', () {
    const session = Session(
      accessToken: 'a',
      refreshToken: 'r',
      audience: AudienceType.corporate,
      systemUserType: 'Normal',
    );
    expect(session.resolveRole(['Admin']), UserRole.employer);
  });
}
