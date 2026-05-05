import 'package:ada_is_akademi_mobile/l10n/app_localizations.dart';
import 'package:ada_is_akademi_mobile/src/app/theme/app_colors.dart';
import 'package:ada_is_akademi_mobile/src/core/constants/app_spacing.dart';
import 'package:ada_is_akademi_mobile/src/core/di/app_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _index = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final steps = <_StepData>[
      _StepData(
        icon: Icons.bolt_outlined,
        title: l10n.onboardingStep1Title,
        subtitle: l10n.onboardingStep1Subtitle,
      ),
      _StepData(
        icon: Icons.qr_code_scanner_outlined,
        title: l10n.onboardingStep2Title,
        subtitle: l10n.onboardingStep2Subtitle,
      ),
      _StepData(
        icon: Icons.account_tree_outlined,
        title: l10n.onboardingStep3Title,
        subtitle: l10n.onboardingStep3Subtitle,
      ),
    ];
    final isLast = _index == steps.length - 1;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: Theme.of(context).brightness == Brightness.dark
                      ? AppGradients.heroDarkLayer2
                      : AppGradients.heroLightLayer2,
                ),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.x2),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: _completeOnboarding,
                      child: Text(l10n.onboardingSkip),
                    ),
                  ),
                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      onPageChanged: (value) => setState(() => _index = value),
                      itemCount: steps.length,
                      itemBuilder: (context, i) {
                        final step = steps[i];
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 92,
                              height: 92,
                              decoration: BoxDecoration(
                                color: Theme.of(context).brightness == Brightness.dark
                                    ? AppColors.darkGlass
                                    : AppColors.lightSurfaceAlt,
                                borderRadius: BorderRadius.circular(24),
                                border: Border.all(
                                  color: Theme.of(context).colorScheme.outline,
                                ),
                              ),
                              child: Icon(step.icon, size: 44, color: AppColors.oceanMint),
                            ),
                            const SizedBox(height: AppSpacing.x3),
                            Text(
                              step.title,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                            const SizedBox(height: AppSpacing.x1),
                            Text(
                              step.subtitle,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      steps.length,
                      (i) => AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: _index == i ? 20 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: _index == i
                              ? AppColors.oceanMint
                              : Theme.of(context).colorScheme.outline,
                          borderRadius: BorderRadius.circular(99),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.x2),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: FilledButton(
                      onPressed: () async {
                        if (isLast) {
                          await _completeOnboarding();
                          return;
                        }
                        await _pageController.nextPage(
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: Text(isLast ? l10n.onboardingStart : l10n.onboardingNext),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _completeOnboarding() async {
    final storage = await ref.read(appStorageProvider.future);
    await storage.saveOnboardingSeen(true);
    if (mounted) {
      context.go('/dashboard-simple');
    }
  }
}

class _StepData {
  const _StepData({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;
}
