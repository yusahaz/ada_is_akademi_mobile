import 'package:ada_is_akademi_mobile/l10n/app_localizations.dart';
import 'package:ada_is_akademi_mobile/src/app/app.dart';
import 'package:ada_is_akademi_mobile/src/core/constants/app_spacing.dart';
import 'package:ada_is_akademi_mobile/src/features/settings/application/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.watch(settingsControllerProvider).valueOrNull;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.settingsTitle)),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.x2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(l10n.settingsThemeTitle),
              const SizedBox(height: AppSpacing.x1),
              SegmentedButton<ThemeMode>(
                selected: {state?.themeMode ?? ThemeMode.light},
                onSelectionChanged: (v) => ref.read(settingsControllerProvider.notifier).setTheme(v.first),
                segments: [
                  ButtonSegment(value: ThemeMode.light, label: Text(l10n.themeLight)),
                  ButtonSegment(value: ThemeMode.dark, label: Text(l10n.themeDark)),
                ],
              ),
              const SizedBox(height: AppSpacing.x3),
              Text(l10n.settingsLanguageTitle),
              const SizedBox(height: AppSpacing.x1),
              DropdownButton<Locale>(
                value: state?.locale ?? const Locale('tr'),
                isExpanded: true,
                items: AdaMobileApp.supportedLocales
                    .map((locale) => DropdownMenuItem(value: locale, child: Text(locale.languageCode)))
                    .toList(),
                onChanged: (locale) {
                  if (locale != null) {
                    ref.read(settingsControllerProvider.notifier).setLocale(locale);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
