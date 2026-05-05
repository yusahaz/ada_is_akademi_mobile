import 'package:ada_is_akademi_mobile/src/core/constants/app_spacing.dart';
import 'package:ada_is_akademi_mobile/src/core/utils/responsive.dart';
import 'package:ada_is_akademi_mobile/src/features/home/presentation/widgets/info_card.dart';
import 'package:flutter/material.dart';
import 'package:ada_is_akademi_mobile/l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final sidePadding = responsiveHorizontalPadding(MediaQuery.sizeOf(context).width);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.appTitle)),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.fromLTRB(
            sidePadding,
            AppSpacing.x3,
            sidePadding,
            AppSpacing.x3,
          ),
          children: [
            Text(
              l10n.homeHeadline,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: AppSpacing.x1),
            Text(l10n.homeDescription, style: theme.textTheme.bodyLarge),
            const SizedBox(height: AppSpacing.x3),
            InfoCard(
              title: l10n.uiUxBaselineTitle,
              subtitle: l10n.uiUxBaselineSubtitle,
              icon: Icons.design_services_outlined,
            ),
            const SizedBox(height: AppSpacing.x2),
            InfoCard(
              title: l10n.engineeringBaselineTitle,
              subtitle: l10n.engineeringBaselineSubtitle,
              icon: Icons.widgets_outlined,
            ),
            const SizedBox(height: AppSpacing.x2),
            InfoCard(
              title: l10n.nextStepTitle,
              subtitle: l10n.nextStepSubtitle,
              icon: Icons.rocket_launch_outlined,
            ),
          ],
        ),
      ),
    );
  }
}
