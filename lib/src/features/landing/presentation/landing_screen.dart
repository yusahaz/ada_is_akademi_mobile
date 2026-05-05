import 'package:ada_is_akademi_mobile/l10n/app_localizations.dart';
import 'package:ada_is_akademi_mobile/src/app/theme/app_colors.dart';
import 'package:ada_is_akademi_mobile/src/core/constants/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key, this.isSplash = false});

  final bool isSplash;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final localeCode = Localizations.localeOf(context).languageCode.toUpperCase();
    if (isSplash) {
      return const Scaffold(
        body: SafeArea(
          child: Center(child: CircularProgressIndicator()),
        ),
      );
    }
    return Scaffold(
      backgroundColor: isDark ? AppColors.darkBackground : AppColors.lightBackground,
      body: Stack(
        children: [
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: isDark
                      ? const [AppColors.darkBackground, AppColors.darkSurface]
                      : const [AppColors.lightBackground, AppColors.lightSurfaceAlt],
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: const Alignment(-0.6, -0.9),
                  radius: 1.1,
                  colors: isDark ? AppGradients.heroDarkLayer1 : AppGradients.heroLightLayer1,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: const Alignment(0.9, -0.5),
                  radius: 1.0,
                  colors: isDark ? AppGradients.heroDarkLayer2 : AppGradients.heroLightLayer2,
                ),
              ),
            ),
          ),
          SafeArea(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.x2,
                AppSpacing.x2,
                AppSpacing.x2,
                AppSpacing.x3,
              ),
              children: [
                _buildTopBar(context, l10n, localeCode),
                const SizedBox(height: AppSpacing.x3),
                _pillBadge(context, l10n.landingBadgeText),
                const SizedBox(height: AppSpacing.x3),
                Text(
                  l10n.landingHeroTitle,
                  style: theme.textTheme.headlineMedium?.copyWith(
                    color: theme.colorScheme.onSurface,
                    fontWeight: FontWeight.w700,
                    height: 1.05,
                  ),
                ),
                const SizedBox(height: AppSpacing.x2),
                Text(
                  l10n.landingHeroSubtitle,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
                    height: 1.35,
                  ),
                ),
                const SizedBox(height: AppSpacing.x3),
                Semantics(
                  button: true,
                  label: l10n.landingPrimaryCta,
                  child: SizedBox(
                    height: 52,
                    child: FilledButton(
                      onPressed: () => context.go('/auth'),
                      style: FilledButton.styleFrom(
                        backgroundColor: AppColors.oceanMint,
                        foregroundColor: theme.colorScheme.onPrimary,
                      ),
                      child: Text(
                        l10n.landingPrimaryCta,
                        style: const TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: AppSpacing.x2),
                OutlinedButton.icon(
                  onPressed: () => context.go('/intro'),
                  icon: const Icon(Icons.play_arrow_rounded),
                  label: Text(l10n.landingSecondaryCta),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: theme.colorScheme.onSurface,
                    side: BorderSide(color: theme.colorScheme.outline),
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.x2,
                      vertical: AppSpacing.x2,
                    ),
                  ),
                ),
                const SizedBox(height: AppSpacing.x3),
                _buildShiftCard(context, l10n),
                const SizedBox(height: AppSpacing.x2),
                _buildValueCards(context, l10n),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopBar(
    BuildContext context,
    AppLocalizations l10n,
    String localeCode,
  ) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.dark
                ? AppColors.darkGlass
                : AppColors.lightSurfaceAlt,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(Icons.auto_awesome, color: AppColors.oceanMint, size: 20),
        ),
        const SizedBox(width: AppSpacing.x1),
        Expanded(
          child: Text(
            l10n.appTitle,
            maxLines: 2,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeight.w700,
                ),
          ),
        ),
        IconButton(
          onPressed: () => context.go('/settings'),
          icon: const Icon(Icons.wb_sunny_outlined, color: AppColors.oceanMint),
          tooltip: l10n.settingsTitle,
        ),
        Row(
          children: [
            const Icon(Icons.language, size: 18, color: AppColors.oceanMint),
            const SizedBox(width: 4),
            Text(
              localeCode,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        const SizedBox(width: AppSpacing.x1),
        Semantics(
          button: true,
          label: l10n.authLogin,
          child: OutlinedButton(
            onPressed: () => context.go('/auth'),
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: Theme.of(context).colorScheme.outline),
              foregroundColor: Theme.of(context).colorScheme.onSurface,
              minimumSize: const Size(84, 44),
            ),
            child: Text(l10n.authLogin),
          ),
        ),
      ],
    );
  }

  Widget _pillBadge(BuildContext context, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.x2, vertical: AppSpacing.x1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: Theme.of(context).colorScheme.outline),
        color: Theme.of(context).brightness == Brightness.dark
            ? AppColors.darkGlass
            : AppColors.lightSurfaceAlt,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.bolt_rounded, color: AppColors.oceanMint, size: 16),
          const SizedBox(width: AppSpacing.x1),
          Flexible(
            child: Text(
              text,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShiftCard(BuildContext context, AppLocalizations l10n) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(AppSpacing.x2),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : AppColors.lightCard,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Theme.of(context).colorScheme.outline),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.landingNearbyShiftsTitle,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontWeight: FontWeight.w700,
                      ),
                ),
                const SizedBox(height: AppSpacing.x1),
                Text(
                  l10n.landingNearbyShiftsSubtitle,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(
                        color: isDark
                            ? AppColors.darkTextSecondary
                            : AppColors.lightTextSecondary,
                      ),
                ),
              ],
            ),
          ),
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: isDark ? AppColors.darkGlass : AppColors.lightSurfaceAlt,
              borderRadius: BorderRadius.circular(28),
              border: Border.all(color: Theme.of(context).colorScheme.outline),
            ),
            alignment: Alignment.center,
            child: Text(
              l10n.landingNearbyShiftsCount,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildValueCards(BuildContext context, AppLocalizations l10n) {
    return Column(
      children: [
        _valueCard(
          context,
          title: l10n.landingWorkerValueTitle,
          subtitle: l10n.landingWorkerValueSubtitle,
          icon: Icons.school_outlined,
        ),
        const SizedBox(height: AppSpacing.x1),
        _valueCard(
          context,
          title: l10n.landingEmployerValueTitle,
          subtitle: l10n.landingEmployerValueSubtitle,
          icon: Icons.business_center_outlined,
        ),
        const SizedBox(height: AppSpacing.x1),
        _valueCard(
          context,
          title: l10n.landingPlatformValueTitle,
          subtitle: l10n.landingPlatformValueSubtitle,
          icon: Icons.verified_user_outlined,
        ),
      ],
    );
  }

  Widget _valueCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.x2),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : AppColors.lightSurfaceAlt,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).colorScheme.outline),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: isDark ? AppColors.darkGlass : AppColors.lightSurface,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: AppColors.oceanMint, size: 20),
          ),
          const SizedBox(width: AppSpacing.x1),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontWeight: FontWeight.w700,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: isDark
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
}
