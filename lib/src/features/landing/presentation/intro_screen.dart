import 'package:ada_is_akademi_mobile/l10n/app_localizations.dart';
import 'package:ada_is_akademi_mobile/src/app/theme/app_colors.dart';
import 'package:ada_is_akademi_mobile/src/core/constants/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? AppColors.darkBackground : AppColors.lightBackground,
      appBar: AppBar(title: Text(l10n.introTitle)),
      body: Stack(
        children: [
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: const Alignment(-0.8, -0.9),
                  radius: 1.0,
                  colors: isDark ? AppGradients.heroDarkLayer3 : AppGradients.heroLightLayer3,
                ),
              ),
            ),
          ),
          SafeArea(
            child: ListView(
              padding: const EdgeInsets.all(AppSpacing.x2),
              children: [
                Text(
                  l10n.introSubtitle,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: isDark
                            ? AppColors.darkTextSecondary
                            : AppColors.lightTextSecondary,
                      ),
                ),
                const SizedBox(height: AppSpacing.x2),
                _introCard(
                  context,
                  icon: Icons.flash_on_outlined,
                  title: l10n.introSpotMarketTitle,
                  subtitle: l10n.introSpotMarketSubtitle,
                ),
                const SizedBox(height: AppSpacing.x1),
                _introCard(
                  context,
                  icon: Icons.qr_code_scanner_outlined,
                  title: l10n.introQrTitle,
                  subtitle: l10n.introQrSubtitle,
                ),
                const SizedBox(height: AppSpacing.x1),
                _introCard(
                  context,
                  icon: Icons.auto_awesome_outlined,
                  title: l10n.introSemanticTitle,
                  subtitle: l10n.introSemanticSubtitle,
                ),
                const SizedBox(height: AppSpacing.x2),
                _metricRow(
                  context,
                  l10n.introMetricEmployers,
                  l10n.introMetricWorkers,
                ),
                const SizedBox(height: AppSpacing.x1),
                _metricRow(
                  context,
                  l10n.introMetricShifts,
                  l10n.introMetricScale,
                ),
                const SizedBox(height: AppSpacing.x3),
                FilledButton(
                  onPressed: () => context.go('/auth'),
                  child: Text(l10n.authLogin),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _introCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.x2),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? AppColors.darkSurface
            : AppColors.lightSurfaceAlt,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).colorScheme.outline),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.oceanMint, size: 24),
          const SizedBox(width: AppSpacing.x1),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontWeight: FontWeight.w700,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? AppColors.darkTextSecondary
                            : AppColors.lightTextSecondary,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _metricRow(BuildContext context, String left, String right) {
    return Row(
      children: [
        Expanded(child: _metricChip(context, left)),
        const SizedBox(width: AppSpacing.x1),
        Expanded(child: _metricChip(context, right)),
      ],
    );
  }

  Widget _metricChip(BuildContext context, String text) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.x1),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? AppColors.darkGlass
            : AppColors.lightSurfaceAlt,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Theme.of(context).colorScheme.outline),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.w700,
            ),
      ),
    );
  }
}
