import 'package:ada_is_akademi_mobile/src/core/network/api_envelope.dart';
import 'package:ada_is_akademi_mobile/src/core/utils/app_logger.dart';
import 'package:dio/dio.dart';

class DashboardStatisticsModel {
  const DashboardStatisticsModel({
    required this.totalSystemUsers,
    required this.activeSystemUserCount,
    required this.pendingSystemUserCount,
    required this.totalWorkerCount,
    required this.activeWorkerCount,
    required this.totalEmployerCount,
    required this.activeEmployerCount,
    required this.totalJobPostingCount,
    required this.openJobPostingCount,
    required this.completedJobPostingCount,
    required this.totalJobApplicationCount,
    required this.pendingJobApplicationCount,
    required this.acceptedJobApplicationCount,
    required this.rejectedJobApplicationCount,
  });

  final int totalSystemUsers;
  final int activeSystemUserCount;
  final int pendingSystemUserCount;
  final int totalWorkerCount;
  final int activeWorkerCount;
  final int totalEmployerCount;
  final int activeEmployerCount;
  final int totalJobPostingCount;
  final int openJobPostingCount;
  final int completedJobPostingCount;
  final int totalJobApplicationCount;
  final int pendingJobApplicationCount;
  final int acceptedJobApplicationCount;
  final int rejectedJobApplicationCount;

  factory DashboardStatisticsModel.fromJson(Map<String, dynamic> json) {
    int toInt(Object? value) {
      if (value is int) return value;
      if (value is String) return int.tryParse(value) ?? 0;
      return 0;
    }

    return DashboardStatisticsModel(
      totalSystemUsers: toInt(json['totalSystemUsers']),
      activeSystemUserCount: toInt(json['activeSystemUserCount']),
      pendingSystemUserCount: toInt(json['pendingSystemUserCount']),
      totalWorkerCount: toInt(json['totalWorkerCount']),
      activeWorkerCount: toInt(json['activeWorkerCount']),
      totalEmployerCount: toInt(json['totalEmployerCount']),
      activeEmployerCount: toInt(json['activeEmployerCount']),
      totalJobPostingCount: toInt(json['totalJobPostingCount']),
      openJobPostingCount: toInt(json['openJobPostingCount']),
      completedJobPostingCount: toInt(json['completedJobPostingCount']),
      totalJobApplicationCount: toInt(json['totalJobApplicationCount']),
      pendingJobApplicationCount: toInt(json['pendingJobApplicationCount']),
      acceptedJobApplicationCount: toInt(json['acceptedJobApplicationCount']),
      rejectedJobApplicationCount: toInt(json['rejectedJobApplicationCount']),
    );
  }
}

class DashboardStatisticsRepository {
  DashboardStatisticsRepository(this._dio);

  final Dio _dio;

  Future<DashboardStatisticsModel> getOverview() async {
    AppLogger.info('Fetching dashboard overview statistics');
    final response = await _dio.post('/Statistics/Overview', data: <String, dynamic>{});
    final envelope = ApiEnvelope<DashboardStatisticsModel>.fromJson(
      response.data as Map<String, dynamic>,
      (raw) => DashboardStatisticsModel.fromJson((raw as Map).cast<String, dynamic>()),
    );
    if ((response.statusCode ?? 500) >= 400 || envelope.success == false || envelope.data == null) {
      AppLogger.warn('Statistics overview failed: ${envelope.message ?? envelope.code}');
      throw DioException(
        requestOptions: RequestOptions(path: '/Statistics/Overview'),
        message: envelope.message ?? envelope.code ?? 'StatisticsError',
      );
    }
    AppLogger.info('Statistics overview fetched successfully');
    return envelope.data!;
  }
}
