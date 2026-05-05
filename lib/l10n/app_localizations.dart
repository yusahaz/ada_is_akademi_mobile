import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_tr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
    Locale('es'),
    Locale('it'),
    Locale('ru'),
    Locale('tr')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Ada Is Akademi'**
  String get appTitle;

  /// No description provided for @landingHeroTitle.
  ///
  /// In en, this message translates to:
  /// **'Build your career in the right role'**
  String get landingHeroTitle;

  /// No description provided for @landingHeroSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Role-based, multilingual and modern workforce platform.'**
  String get landingHeroSubtitle;

  /// No description provided for @landingStatsTitle.
  ///
  /// In en, this message translates to:
  /// **'Stats'**
  String get landingStatsTitle;

  /// No description provided for @landingHowItWorksTitle.
  ///
  /// In en, this message translates to:
  /// **'How it works'**
  String get landingHowItWorksTitle;

  /// No description provided for @landingFeaturesTitle.
  ///
  /// In en, this message translates to:
  /// **'Features'**
  String get landingFeaturesTitle;

  /// No description provided for @landingProofTitle.
  ///
  /// In en, this message translates to:
  /// **'Proof'**
  String get landingProofTitle;

  /// No description provided for @landingBadgeText.
  ///
  /// In en, this message translates to:
  /// **'Work today, track every shift in one app'**
  String get landingBadgeText;

  /// No description provided for @landingPrimaryCta.
  ///
  /// In en, this message translates to:
  /// **'Discover job opportunities'**
  String get landingPrimaryCta;

  /// No description provided for @landingSecondaryCta.
  ///
  /// In en, this message translates to:
  /// **'How does it work?'**
  String get landingSecondaryCta;

  /// No description provided for @landingNearbyShiftsTitle.
  ///
  /// In en, this message translates to:
  /// **'Nearby shifts'**
  String get landingNearbyShiftsTitle;

  /// No description provided for @landingNearbyShiftsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Matching'**
  String get landingNearbyShiftsSubtitle;

  /// No description provided for @landingNearbyShiftsCount.
  ///
  /// In en, this message translates to:
  /// **'78'**
  String get landingNearbyShiftsCount;

  /// No description provided for @landingWorkerValueTitle.
  ///
  /// In en, this message translates to:
  /// **'For Workers'**
  String get landingWorkerValueTitle;

  /// No description provided for @landingWorkerValueSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Transparent postings, instant matching and payout tracking in one flow.'**
  String get landingWorkerValueSubtitle;

  /// No description provided for @landingEmployerValueTitle.
  ///
  /// In en, this message translates to:
  /// **'For Employers'**
  String get landingEmployerValueTitle;

  /// No description provided for @landingEmployerValueSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Semantic candidate matching, QR attendance and shift planning.'**
  String get landingEmployerValueSubtitle;

  /// No description provided for @landingPlatformValueTitle.
  ///
  /// In en, this message translates to:
  /// **'For Platform'**
  String get landingPlatformValueTitle;

  /// No description provided for @landingPlatformValueSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Commission automation, fraud protection and full audit trail.'**
  String get landingPlatformValueSubtitle;

  /// No description provided for @introTitle.
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get introTitle;

  /// No description provided for @introSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Worbi runs a spot-market model to match daily shift demand in real time.'**
  String get introSubtitle;

  /// No description provided for @introSpotMarketTitle.
  ///
  /// In en, this message translates to:
  /// **'Spot-market shift flow'**
  String get introSpotMarketTitle;

  /// No description provided for @introSpotMarketSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Create a posting, find suitable workers instantly, fill shifts quickly.'**
  String get introSpotMarketSubtitle;

  /// No description provided for @introQrTitle.
  ///
  /// In en, this message translates to:
  /// **'Mutual QR check-in/out'**
  String get introQrTitle;

  /// No description provided for @introQrSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Employer and worker confirm attendance with two-way QR validation.'**
  String get introQrSubtitle;

  /// No description provided for @introSemanticTitle.
  ///
  /// In en, this message translates to:
  /// **'Semantic matching + AI support'**
  String get introSemanticTitle;

  /// No description provided for @introSemanticSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Skill embeddings and smart notifications improve candidate fit.'**
  String get introSemanticSubtitle;

  /// No description provided for @introMetricEmployers.
  ///
  /// In en, this message translates to:
  /// **'Employers: 1,000 -> 5,000+'**
  String get introMetricEmployers;

  /// No description provided for @introMetricWorkers.
  ///
  /// In en, this message translates to:
  /// **'Workers: 10,000 -> 50,000+'**
  String get introMetricWorkers;

  /// No description provided for @introMetricShifts.
  ///
  /// In en, this message translates to:
  /// **'Daily active shifts: 3,000 -> 15,000'**
  String get introMetricShifts;

  /// No description provided for @introMetricScale.
  ///
  /// In en, this message translates to:
  /// **'Geography: Cyprus -> Mediterranean'**
  String get introMetricScale;

  /// No description provided for @onboardingStep1Title.
  ///
  /// In en, this message translates to:
  /// **'Discover instant shift opportunities'**
  String get onboardingStep1Title;

  /// No description provided for @onboardingStep1Subtitle.
  ///
  /// In en, this message translates to:
  /// **'Spot-market flow lists the best matching shifts quickly.'**
  String get onboardingStep1Subtitle;

  /// No description provided for @onboardingStep2Title.
  ///
  /// In en, this message translates to:
  /// **'Secure QR check-in/out'**
  String get onboardingStep2Title;

  /// No description provided for @onboardingStep2Subtitle.
  ///
  /// In en, this message translates to:
  /// **'Employer and worker complete two-way validation for attendance.'**
  String get onboardingStep2Subtitle;

  /// No description provided for @onboardingStep3Title.
  ///
  /// In en, this message translates to:
  /// **'Track everything in one app'**
  String get onboardingStep3Title;

  /// No description provided for @onboardingStep3Subtitle.
  ///
  /// In en, this message translates to:
  /// **'Manage applications, shifts and payouts from a single place.'**
  String get onboardingStep3Subtitle;

  /// No description provided for @onboardingSkip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get onboardingSkip;

  /// No description provided for @onboardingNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get onboardingNext;

  /// No description provided for @onboardingStart.
  ///
  /// In en, this message translates to:
  /// **'Get started'**
  String get onboardingStart;

  /// No description provided for @simpleDashboardTitle.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get simpleDashboardTitle;

  /// No description provided for @simpleDashboardWelcome.
  ///
  /// In en, this message translates to:
  /// **'Simple dashboard is ready'**
  String get simpleDashboardWelcome;

  /// No description provided for @simpleDashboardPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Share your dashboard content and we will fill this area together.'**
  String get simpleDashboardPlaceholder;

  /// No description provided for @simpleDashboardStatsError.
  ///
  /// In en, this message translates to:
  /// **'Failed to load statistics. Please try again.'**
  String get simpleDashboardStatsError;

  /// No description provided for @simpleDashboardRefresh.
  ///
  /// In en, this message translates to:
  /// **'Refresh'**
  String get simpleDashboardRefresh;

  /// No description provided for @simpleDashboardSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Overall platform overview'**
  String get simpleDashboardSubtitle;

  /// No description provided for @simpleDashboardActiveCandidates.
  ///
  /// In en, this message translates to:
  /// **'Active Candidates'**
  String get simpleDashboardActiveCandidates;

  /// No description provided for @simpleDashboardActiveEmployers.
  ///
  /// In en, this message translates to:
  /// **'Active Employers'**
  String get simpleDashboardActiveEmployers;

  /// No description provided for @simpleDashboardTotalPostings.
  ///
  /// In en, this message translates to:
  /// **'Total Job Postings'**
  String get simpleDashboardTotalPostings;

  /// No description provided for @simpleDashboardUsersProgress.
  ///
  /// In en, this message translates to:
  /// **'Active user ratio'**
  String get simpleDashboardUsersProgress;

  /// No description provided for @simpleDashboardWorkersProgress.
  ///
  /// In en, this message translates to:
  /// **'Active worker ratio'**
  String get simpleDashboardWorkersProgress;

  /// No description provided for @simpleDashboardEmployersProgress.
  ///
  /// In en, this message translates to:
  /// **'Active employer ratio'**
  String get simpleDashboardEmployersProgress;

  /// No description provided for @simpleDashboardTotalUsers.
  ///
  /// In en, this message translates to:
  /// **'Total users'**
  String get simpleDashboardTotalUsers;

  /// No description provided for @simpleDashboardActiveUsers.
  ///
  /// In en, this message translates to:
  /// **'Active users'**
  String get simpleDashboardActiveUsers;

  /// No description provided for @simpleDashboardOpenPostings.
  ///
  /// In en, this message translates to:
  /// **'Open postings'**
  String get simpleDashboardOpenPostings;

  /// No description provided for @simpleDashboardPendingApplications.
  ///
  /// In en, this message translates to:
  /// **'Pending applications'**
  String get simpleDashboardPendingApplications;

  /// No description provided for @ctaStartNow.
  ///
  /// In en, this message translates to:
  /// **'Start now'**
  String get ctaStartNow;

  /// No description provided for @authTitle.
  ///
  /// In en, this message translates to:
  /// **'Authentication'**
  String get authTitle;

  /// No description provided for @audienceIndividual.
  ///
  /// In en, this message translates to:
  /// **'Individual'**
  String get audienceIndividual;

  /// No description provided for @audienceCorporate.
  ///
  /// In en, this message translates to:
  /// **'Corporate'**
  String get audienceCorporate;

  /// No description provided for @authRegisterMode.
  ///
  /// In en, this message translates to:
  /// **'Switch to register'**
  String get authRegisterMode;

  /// No description provided for @authName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get authName;

  /// No description provided for @authEmail.
  ///
  /// In en, this message translates to:
  /// **'E-mail'**
  String get authEmail;

  /// No description provided for @authPassword.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get authPassword;

  /// No description provided for @authRegister.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get authRegister;

  /// No description provided for @authLogin.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get authLogin;

  /// No description provided for @dashboardTitle.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get dashboardTitle;

  /// No description provided for @dashboardWelcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Ada Is Akademi'**
  String get dashboardWelcome;

  /// No description provided for @dashboardWorkerCard1.
  ///
  /// In en, this message translates to:
  /// **'My applications'**
  String get dashboardWorkerCard1;

  /// No description provided for @dashboardWorkerCard2.
  ///
  /// In en, this message translates to:
  /// **'Skill profile'**
  String get dashboardWorkerCard2;

  /// No description provided for @dashboardEmployerCard1.
  ///
  /// In en, this message translates to:
  /// **'My job postings'**
  String get dashboardEmployerCard1;

  /// No description provided for @dashboardEmployerCard2.
  ///
  /// In en, this message translates to:
  /// **'Candidate pipeline'**
  String get dashboardEmployerCard2;

  /// No description provided for @dashboardAdminCard1.
  ///
  /// In en, this message translates to:
  /// **'System approvals'**
  String get dashboardAdminCard1;

  /// No description provided for @dashboardAdminCard2.
  ///
  /// In en, this message translates to:
  /// **'Permission controls'**
  String get dashboardAdminCard2;

  /// No description provided for @jobPostingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Job postings'**
  String get jobPostingsTitle;

  /// No description provided for @jobPostingItem.
  ///
  /// In en, this message translates to:
  /// **'Job Posting'**
  String get jobPostingItem;

  /// No description provided for @jobPostingListOpen.
  ///
  /// In en, this message translates to:
  /// **'Open postings'**
  String get jobPostingListOpen;

  /// No description provided for @jobPostingDetailTitle.
  ///
  /// In en, this message translates to:
  /// **'Posting detail'**
  String get jobPostingDetailTitle;

  /// No description provided for @jobPostingPublish.
  ///
  /// In en, this message translates to:
  /// **'Publish'**
  String get jobPostingPublish;

  /// No description provided for @jobPostingUpdate.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get jobPostingUpdate;

  /// No description provided for @jobPostingCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get jobPostingCancel;

  /// No description provided for @jobPostingComplete.
  ///
  /// In en, this message translates to:
  /// **'Complete'**
  String get jobPostingComplete;

  /// No description provided for @jobApplicationsTitle.
  ///
  /// In en, this message translates to:
  /// **'Applications'**
  String get jobApplicationsTitle;

  /// No description provided for @jobApplicationItem.
  ///
  /// In en, this message translates to:
  /// **'Application'**
  String get jobApplicationItem;

  /// No description provided for @applicationSubmit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get applicationSubmit;

  /// No description provided for @applicationWithdraw.
  ///
  /// In en, this message translates to:
  /// **'Withdraw'**
  String get applicationWithdraw;

  /// No description provided for @applicationAccept.
  ///
  /// In en, this message translates to:
  /// **'Accept'**
  String get applicationAccept;

  /// No description provided for @applicationReject.
  ///
  /// In en, this message translates to:
  /// **'Reject'**
  String get applicationReject;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @settingsThemeTitle.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get settingsThemeTitle;

  /// No description provided for @themeLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get themeLight;

  /// No description provided for @themeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get themeDark;

  /// No description provided for @settingsLanguageTitle.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settingsLanguageTitle;

  /// No description provided for @homeHeadline.
  ///
  /// In en, this message translates to:
  /// **'Let\'s build the app foundation'**
  String get homeHeadline;

  /// No description provided for @homeDescription.
  ///
  /// In en, this message translates to:
  /// **'Mobile-first, responsive and reusable Flutter structure is ready.'**
  String get homeDescription;

  /// No description provided for @uiUxBaselineTitle.
  ///
  /// In en, this message translates to:
  /// **'UI/UX Baseline'**
  String get uiUxBaselineTitle;

  /// No description provided for @uiUxBaselineSubtitle.
  ///
  /// In en, this message translates to:
  /// **'8pt spacing, safe-area aware layout and platform-consistent visuals.'**
  String get uiUxBaselineSubtitle;

  /// No description provided for @engineeringBaselineTitle.
  ///
  /// In en, this message translates to:
  /// **'Engineering Baseline'**
  String get engineeringBaselineTitle;

  /// No description provided for @engineeringBaselineSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Widget-based modular structure with minimal side effects.'**
  String get engineeringBaselineSubtitle;

  /// No description provided for @nextStepTitle.
  ///
  /// In en, this message translates to:
  /// **'Next Step'**
  String get nextStepTitle;

  /// No description provided for @nextStepSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Define your first feature module and we can scaffold it together.'**
  String get nextStepSubtitle;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
        'ar',
        'en',
        'es',
        'it',
        'ru',
        'tr'
      ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'it':
      return AppLocalizationsIt();
    case 'ru':
      return AppLocalizationsRu();
    case 'tr':
      return AppLocalizationsTr();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
