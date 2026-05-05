import 'package:ada_is_akademi_mobile/src/core/auth/session.dart';
import 'package:ada_is_akademi_mobile/src/core/di/app_providers.dart';
import 'package:ada_is_akademi_mobile/src/features/auth/application/auth_controller.dart';
import 'package:ada_is_akademi_mobile/src/features/auth/presentation/auth_screen.dart';
import 'package:ada_is_akademi_mobile/src/features/dashboard/presentation/dashboard_screen.dart';
import 'package:ada_is_akademi_mobile/src/features/dashboard/presentation/simple_dashboard_screen.dart';
import 'package:ada_is_akademi_mobile/src/features/jobs/presentation/job_applications_screen.dart';
import 'package:ada_is_akademi_mobile/src/features/jobs/presentation/job_posting_detail_screen.dart';
import 'package:ada_is_akademi_mobile/src/features/jobs/presentation/job_postings_screen.dart';
import 'package:ada_is_akademi_mobile/src/features/landing/presentation/intro_screen.dart';
import 'package:ada_is_akademi_mobile/src/features/landing/presentation/landing_screen.dart';
import 'package:ada_is_akademi_mobile/src/features/landing/presentation/onboarding_screen.dart';
import 'package:ada_is_akademi_mobile/src/features/landing/presentation/splash_screen.dart';
import 'package:ada_is_akademi_mobile/src/features/settings/presentation/settings_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  final auth = ref.watch(authControllerProvider);
  return GoRouter(
    initialLocation: '/splash',
    redirect: (context, state) {
      final isSplash = state.matchedLocation == '/splash';
      final isAuth = state.matchedLocation.startsWith('/auth');
      final isPublic = state.matchedLocation == '/landing' ||
          state.matchedLocation == '/intro' ||
          state.matchedLocation == '/onboarding' ||
          state.matchedLocation == '/dashboard-simple' ||
          isSplash;
      final isLoggedIn = auth.valueOrNull != null;
      if (auth.isLoading && isSplash) return null;
      if (!isLoggedIn && !isAuth && !isPublic) return '/splash';
      if (isLoggedIn && (isAuth || state.matchedLocation == '/landing')) {
        final role = ref.read(resolvedRoleProvider);
        if (role == UserRole.admin) return '/dashboard/admin';
        if (role == UserRole.employer) return '/dashboard/employer';
        return '/dashboard/worker';
      }
      if (isSplash) return null;
      return null;
    },
    routes: [
      GoRoute(path: '/splash', builder: (_, __) => const SplashScreen()),
      GoRoute(path: '/onboarding', builder: (_, __) => const OnboardingScreen()),
      GoRoute(path: '/dashboard-simple', builder: (_, __) => const SimpleDashboardScreen()),
      GoRoute(path: '/landing', builder: (_, __) => const LandingScreen()),
      GoRoute(path: '/intro', builder: (_, __) => const IntroScreen()),
      GoRoute(path: '/auth', builder: (_, __) => const AuthScreen()),
      GoRoute(path: '/dashboard/:role', builder: (_, s) => DashboardScreen(role: s.pathParameters['role']!)),
      GoRoute(path: '/dashboard', redirect: (_, __) => '/dashboard/worker'),
      GoRoute(path: '/jobs', builder: (_, __) => const JobPostingsScreen()),
      GoRoute(path: '/jobs/:id', builder: (_, s) => JobPostingDetailScreen(id: s.pathParameters['id']!)),
      GoRoute(path: '/applications', builder: (_, __) => const JobApplicationsScreen()),
      GoRoute(path: '/settings', builder: (_, __) => const SettingsScreen()),
    ],
  );
});
