import 'package:ada_is_akademi_mobile/src/core/network/api_envelope.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('parses envelope data', () {
    final envelope = ApiEnvelope<String>.fromJson(
      <String, dynamic>{
        'success': true,
        'message': null,
        'code': null,
        'data': 'ok',
        'fieldErrors': null,
      },
      (raw) => (raw as String?) ?? '',
    );
    expect(envelope.success, isTrue);
    expect(envelope.data, 'ok');
  });
}
