import 'package:ada_is_akademi_mobile/l10n/app_localizations.dart';
import 'package:ada_is_akademi_mobile/src/app/theme/app_colors.dart';
import 'package:ada_is_akademi_mobile/src/core/constants/app_spacing.dart';
import 'package:ada_is_akademi_mobile/src/core/di/app_providers.dart';
import 'package:ada_is_akademi_mobile/src/features/dashboard/application/dashboard_statistics_provider.dart';
import 'package:ada_is_akademi_mobile/src/features/dashboard/data/dashboard_statistics_repository.dart';
import 'package:ada_is_akademi_mobile/src/features/settings/application/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SimpleDashboardScreen extends ConsumerStatefulWidget {
  const SimpleDashboardScreen({super.key});

  @override
  ConsumerState<SimpleDashboardScreen> createState() => _SimpleDashboardScreenState();
}

class _SimpleDashboardScreenState extends ConsumerState<SimpleDashboardScreen> {
  @override
  void initState() {
    super.initState();
    _markOnboardingSeen();
  }

  Future<void> _markOnboardingSeen() async {
    final storage = await ref.read(appStorageProvider.future);
    await storage.saveOnboardingSeen(true);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final settings = ref.watch(settingsControllerProvider).valueOrNull;
    final isDark = settings?.themeMode == ThemeMode.dark;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.simpleDashboardTitle),
        actions: [
          IconButton(
            tooltip: l10n.settingsThemeTitle,
            onPressed: () {
              ref.read(settingsControllerProvider.notifier).setTheme(
                    isDark ? ThemeMode.light : ThemeMode.dark,
                  );
            },
            icon: Icon(
              isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
            ),
          ),
          IconButton(
            tooltip: l10n.simpleDashboardRefresh,
            onPressed: () => ref.invalidate(dashboardStatisticsProvider),
            icon: const Icon(Icons.refresh_rounded),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(AppSpacing.x2),
          children: [
            Text(
              l10n.simpleDashboardWelcome,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
            const SizedBox(height: AppSpacing.x1),
            Text(
              l10n.simpleDashboardSubtitle,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.brightness == Brightness.dark
                    ? AppColors.darkTextSecondary
                    : AppColors.lightTextSecondary,
              ),
            ),
            const SizedBox(height: AppSpacing.x2),
            ref.watch(dashboardStatisticsProvider).when(
              data: (stats) => _statsContent(context, l10n, stats, theme),
              loading: () => const Padding(
                padding: EdgeInsets.all(AppSpacing.x3),
                child: Center(child: CircularProgressIndicator()),
              ),
              error: (_, __) => Container(
                padding: const EdgeInsets.all(AppSpacing.x2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  border: Border.all(color: Theme.of(context).colorScheme.outline),
                ),
                child: Text(
                  l10n.simpleDashboardStatsError,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? AppColors.darkTextSecondary
                            : AppColors.lightTextSecondary,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _statsContent(
    BuildContext context,
    AppLocalizations l10n,
    DashboardStatisticsModel stats,
    ThemeData theme,
  ) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _metricCard(
                context,
                icon: Icons.person_search_rounded,
                title: l10n.simpleDashboardActiveCandidates,
                value: stats.activeWorkerCount.toString(),
              ),
            ),
            const SizedBox(width: AppSpacing.x1),
            Expanded(
              child: _metricCard(
                context,
                icon: Icons.business_rounded,
                title: l10n.simpleDashboardActiveEmployers,
                value: stats.activeEmployerCount.toString(),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.x1),
        _metricCard(
          context,
          icon: Icons.work_outline_rounded,
          title: l10n.simpleDashboardTotalPostings,
          value: stats.totalJobPostingCount.toString(),
          fullWidth: true,
        ),
      ],
    );
  }

  Widget _metricCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String value,
    bool fullWidth = false,
  }) {
    final theme = Theme.of(context);
    return Container(
      width: fullWidth ? double.infinity : null,
      padding: const EdgeInsets.all(AppSpacing.x2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: theme.colorScheme.surfaceContainerHighest,
        border: Border.all(color: theme.colorScheme.outline),
        boxShadow: [
          if (theme.brightness == Brightness.light)
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 14,
              offset: const Offset(0, 4),
            ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: theme.brightness == Brightness.dark
                  ? AppColors.darkGlass
                  : AppColors.lightSurface,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: theme.colorScheme.outline),
            ),
            child: Icon(icon, size: 20, color: AppColors.oceanMint),
          ),
          const SizedBox(height: AppSpacing.x1),
          Text(
            title,
            style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.brightness == Brightness.dark
                      ? AppColors.darkTextSecondary
                      : AppColors.lightTextSecondary,
                ),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
