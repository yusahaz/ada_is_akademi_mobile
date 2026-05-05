import 'package:ada_is_akademi_mobile/l10n/app_localizations.dart';
import 'package:ada_is_akademi_mobile/src/core/constants/app_spacing.dart';
import 'package:flutter/material.dart';

class JobPostingDetailScreen extends StatelessWidget {
  const JobPostingDetailScreen({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.jobPostingDetailTitle)),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.x2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${l10n.jobPostingItem} $id', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: AppSpacing.x2),
              Wrap(
                spacing: AppSpacing.x1,
                runSpacing: AppSpacing.x1,
                children: [
                  FilledButton(onPressed: () {}, child: Text(l10n.jobPostingPublish)),
                  OutlinedButton(onPressed: () {}, child: Text(l10n.jobPostingUpdate)),
                  OutlinedButton(onPressed: () {}, child: Text(l10n.jobPostingCancel)),
                  OutlinedButton(onPressed: () {}, child: Text(l10n.jobPostingComplete)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
