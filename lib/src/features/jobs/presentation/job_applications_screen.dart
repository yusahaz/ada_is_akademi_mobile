import 'package:ada_is_akademi_mobile/l10n/app_localizations.dart';
import 'package:ada_is_akademi_mobile/src/core/constants/app_spacing.dart';
import 'package:flutter/material.dart';

class JobApplicationsScreen extends StatelessWidget {
  const JobApplicationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    // TODO(api): Replace mocked actions with JobApplications endpoints.
    return Scaffold(
      appBar: AppBar(title: Text(l10n.jobApplicationsTitle)),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(AppSpacing.x2),
          children: List.generate(
            6,
            (index) => Card(
              margin: const EdgeInsets.only(bottom: AppSpacing.x2),
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.x2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${l10n.jobApplicationItem} #$index'),
                    const SizedBox(height: AppSpacing.x1),
                    Wrap(
                      spacing: AppSpacing.x1,
                      runSpacing: AppSpacing.x1,
                      children: [
                        FilledButton(onPressed: () {}, child: Text(l10n.applicationSubmit)),
                        OutlinedButton(onPressed: () {}, child: Text(l10n.applicationWithdraw)),
                        OutlinedButton(onPressed: () {}, child: Text(l10n.applicationAccept)),
                        OutlinedButton(onPressed: () {}, child: Text(l10n.applicationReject)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
