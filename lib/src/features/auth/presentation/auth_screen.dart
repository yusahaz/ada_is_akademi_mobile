import 'package:ada_is_akademi_mobile/l10n/app_localizations.dart';
import 'package:ada_is_akademi_mobile/src/core/auth/session.dart';
import 'package:ada_is_akademi_mobile/src/core/constants/app_spacing.dart';
import 'package:ada_is_akademi_mobile/src/features/auth/application/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key});

  @override
  ConsumerState<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  AudienceType _audience = AudienceType.individual;
  bool _isRegister = false;
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final auth = ref.watch(authControllerProvider);
    return Scaffold(
      appBar: AppBar(title: Text(l10n.authTitle)),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(AppSpacing.x2),
          children: [
            SegmentedButton<AudienceType>(
              selected: {_audience},
              onSelectionChanged: (v) => setState(() {
                _audience = v.first;
                if (_audience == AudienceType.corporate) _isRegister = false;
              }),
              segments: [
                ButtonSegment(value: AudienceType.individual, label: Text(l10n.audienceIndividual)),
                ButtonSegment(value: AudienceType.corporate, label: Text(l10n.audienceCorporate)),
              ],
            ),
            const SizedBox(height: AppSpacing.x2),
            if (_audience == AudienceType.individual)
              SwitchListTile(
                value: _isRegister,
                onChanged: (v) => setState(() => _isRegister = v),
                title: Text(l10n.authRegisterMode),
              ),
            if (_isRegister) ...[
              TextField(controller: _name, decoration: InputDecoration(labelText: l10n.authName)),
              const SizedBox(height: AppSpacing.x1),
            ],
            TextField(controller: _email, decoration: InputDecoration(labelText: l10n.authEmail)),
            const SizedBox(height: AppSpacing.x1),
            TextField(controller: _password, obscureText: true, decoration: InputDecoration(labelText: l10n.authPassword)),
            const SizedBox(height: AppSpacing.x2),
            FilledButton(
              onPressed: auth.isLoading ? null : () => _submit(context),
              child: Text(_isRegister ? l10n.authRegister : l10n.authLogin),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _submit(BuildContext context) async {
    if (_isRegister) {
      await ref.read(authControllerProvider.notifier).register(
            email: _email.text.trim(),
            password: _password.text,
            name: _name.text.trim(),
          );
      return;
    }
    await ref.read(authControllerProvider.notifier).login(
          email: _email.text.trim(),
          password: _password.text,
          audience: _audience,
        );
  }
}
