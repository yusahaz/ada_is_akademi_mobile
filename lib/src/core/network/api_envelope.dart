class ApiEnvelope<T> {
  const ApiEnvelope({
    required this.success,
    required this.message,
    required this.code,
    required this.data,
    required this.fieldErrors,
  });

  final bool success;
  final String? message;
  final String? code;
  final T? data;
  final List<Map<String, dynamic>>? fieldErrors;

  factory ApiEnvelope.fromJson(
    Map<String, dynamic> json,
    T Function(Object? source) mapper,
  ) {
    return ApiEnvelope<T>(
      success: json['success'] as bool? ?? false,
      message: json['message'] as String?,
      code: json['code'] as String?,
      data: mapper(json['data']),
      fieldErrors: (json['fieldErrors'] as List<dynamic>?)
          ?.map((e) => (e as Map).cast<String, dynamic>())
          .toList(),
    );
  }
}
