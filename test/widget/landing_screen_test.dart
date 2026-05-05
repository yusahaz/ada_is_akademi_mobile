import 'package:ada_is_akademi_mobile/l10n/app_localizations.dart';
import 'package:ada_is_akademi_mobile/src/features/landing/presentation/landing_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('landing shows primary CTA', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        home: const LandingScreen(),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byType(FilledButton), findsOneWidget);
  });
}
