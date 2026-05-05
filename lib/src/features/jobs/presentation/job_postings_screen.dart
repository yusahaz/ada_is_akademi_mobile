import 'package:ada_is_akademi_mobile/l10n/app_localizations.dart';
import 'package:ada_is_akademi_mobile/src/core/constants/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class JobPostingsScreen extends StatelessWidget {
  const JobPostingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    // TODO(api): Replace mock list with JobPostings/ListOpen repository call.
    final jobs = List.generate(8, (index) => 'JOB-$index');
    return Scaffold(
      appBar: AppBar(title: Text(l10n.jobPostingsTitle)),
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.all(AppSpacing.x2),
          itemBuilder: (context, index) {
            final id = jobs[index];
            return ListTile(
              contentPadding: const EdgeInsets.all(AppSpacing.x1),
              title: Text('${l10n.jobPostingItem} $id'),
              subtitle: Text(l10n.jobPostingListOpen),
              onTap: () => context.go('/jobs/$id'),
            );
          },
          separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.x1),
          itemCount: jobs.length,
        ),
      ),
    );
  }
}
