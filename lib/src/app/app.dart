import 'package:ada_is_akademi_mobile/l10n/app_localizations.dart';
import 'package:ada_is_akademi_mobile/src/app/router/app_router.dart';
import 'package:ada_is_akademi_mobile/src/app/theme/app_theme.dart';
import 'package:ada_is_akademi_mobile/src/features/settings/application/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AdaMobileApp extends ConsumerWidget {
  const AdaMobileApp({super.key});

  static const supportedLocales = <Locale>[
    Locale('tr'),
    Locale('en'),
    Locale('es'),
    Locale('it'),
    Locale('ru'),
    Locale('ar'),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsControllerProvider).valueOrNull;
    final router = ref.watch(appRouterProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: settings?.themeMode ?? ThemeMode.light,
      locale: settings?.locale,
      supportedLocales: supportedLocales,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      builder: (context, child) {
        final locale = Localizations.localeOf(context);
        final textDirection =
            locale.languageCode == 'ar' ? TextDirection.rtl : TextDirection.ltr;
        return Directionality(
          textDirection: textDirection,
          child: child ?? const SizedBox.shrink(),
        );
      },
      routerConfig: router,
    );
  }
}
