import 'package:ada_is_akademi_mobile/src/core/di/app_providers.dart';
import 'package:ada_is_akademi_mobile/src/app/theme/app_colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _bootstrap();
  }

  Future<void> _bootstrap() async {
    await Future<void>.delayed(const Duration(milliseconds: 1200));
    if (!mounted) return;
    final storage = await ref.read(appStorageProvider.future);
    if (!mounted) return;
    if (kDebugMode) {
      context.go('/onboarding');
      return;
    }
    context.go(storage.hasSeenOnboarding ? '/dashboard-simple' : '/onboarding');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: AppGradients.heroDarkLayer2,
          ),
        ),
        child: const SafeArea(
          child: Center(
            child: Icon(
              Icons.auto_awesome,
              size: 56,
              color: AppColors.oceanMint,
            ),
          ),
        ),
      ),
    );
  }
}
