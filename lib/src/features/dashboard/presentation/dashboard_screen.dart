import 'package:ada_is_akademi_mobile/l10n/app_localizations.dart';
import 'package:ada_is_akademi_mobile/src/core/constants/app_spacing.dart';
import 'package:ada_is_akademi_mobile/src/features/auth/application/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key, required this.role});

  final String role;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final cards = switch (role) {
      'admin' => [l10n.dashboardAdminCard1, l10n.dashboardAdminCard2],
      'employer' => [l10n.dashboardEmployerCard1, l10n.dashboardEmployerCard2],
      _ => [l10n.dashboardWorkerCard1, l10n.dashboardWorkerCard2],
    };
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.dashboardTitle),
        actions: [
          IconButton(onPressed: () => context.go('/settings'), icon: const Icon(Icons.settings)),
          IconButton(
            onPressed: () => ref.read(authControllerProvider.notifier).logout(),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(AppSpacing.x2),
          children: [
            Text(l10n.dashboardWelcome),
            const SizedBox(height: AppSpacing.x2),
            ...cards.map((c) => Padding(
                  padding: const EdgeInsets.only(bottom: AppSpacing.x2),
                  child: Card(
                    child: ListTile(title: Text(c)),
                  ),
                )),
            FilledButton(onPressed: () => context.go('/jobs'), child: Text(l10n.jobPostingsTitle)),
            const SizedBox(height: AppSpacing.x1),
            OutlinedButton(onPressed: () => context.go('/applications'), child: Text(l10n.jobApplicationsTitle)),
          ],
        ),
      ),
    );
  }
}
