import 'package:ada_is_akademi_mobile/src/core/di/app_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppSettings {
  const AppSettings({required this.themeMode, required this.locale});

  final ThemeMode themeMode;
  final Locale locale;
}

final settingsControllerProvider =
    AsyncNotifierProvider<SettingsController, AppSettings>(
  SettingsController.new,
);

class SettingsController extends AsyncNotifier<AppSettings> {
  @override
  Future<AppSettings> build() async {
    final storage = await ref.read(appStorageProvider.future);
    final mode = storage.themeMode == ThemeMode.dark.name
        ? ThemeMode.dark
        : ThemeMode.light;
    final locale = Locale(storage.localeCode ?? 'tr');
    return AppSettings(themeMode: mode, locale: locale);
  }

  Future<void> setTheme(ThemeMode themeMode) async {
    final current = state.valueOrNull;
    if (current == null) return;
    final storage = await ref.read(appStorageProvider.future);
    await storage.saveThemeMode(themeMode.name);
    state = AsyncValue.data(
      AppSettings(themeMode: themeMode, locale: current.locale),
    );
  }

  Future<void> setLocale(Locale locale) async {
    final current = state.valueOrNull;
    if (current == null) return;
    final storage = await ref.read(appStorageProvider.future);
    await storage.saveLocaleCode(locale.languageCode);
    state = AsyncValue.data(
      AppSettings(themeMode: current.themeMode, locale: locale),
    );
  }
}
