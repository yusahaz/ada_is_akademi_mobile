import 'package:ada_is_akademi_mobile/src/core/di/app_providers.dart';
import 'package:ada_is_akademi_mobile/src/core/utils/app_logger.dart';
import 'package:ada_is_akademi_mobile/src/features/dashboard/data/dashboard_statistics_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dashboardStatisticsRepositoryProvider = Provider<DashboardStatisticsRepository>((ref) {
  return DashboardStatisticsRepository(ref.watch(dioProvider));
});

final dashboardStatisticsProvider = FutureProvider<DashboardStatisticsModel>((ref) async {
  try {
    return await ref.read(dashboardStatisticsRepositoryProvider).getOverview();
  } catch (error) {
    AppLogger.warn('Falling back to local dashboard statistics: $error');
    return const DashboardStatisticsModel(
      totalSystemUsers: 0,
      activeSystemUserCount: 0,
      pendingSystemUserCount: 0,
      totalWorkerCount: 0,
      activeWorkerCount: 0,
      totalEmployerCount: 0,
      activeEmployerCount: 0,
      totalJobPostingCount: 0,
      openJobPostingCount: 0,
      completedJobPostingCount: 0,
      totalJobApplicationCount: 0,
      pendingJobApplicationCount: 0,
      acceptedJobApplicationCount: 0,
      rejectedJobApplicationCount: 0,
    );
  }
});
