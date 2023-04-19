import 'package:flutter/material.dart';
import 'package:mobile/features/onboarding/presentation/pages/phone.verification.dart';
import 'package:mobile/features/onboarding/presentation/pages/register.account.dart';
import 'package:mobile/features/onboarding/presentation/pages/tutorial.dart';
import 'package:mobile/features/onboarding/presentation/pages/welcome.dart';
import 'package:mobile/features/shared/presentation/pages/dashboard.dart';
import 'package:mobile/features/shared/presentation/pages/finder.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:shared_utils/shared_utils.dart';

class AppRouterConfig {
  static Route<dynamic>? setupRoutes(RouteSettings settings) {
    switch (settings.name) {
      case AppRouter.welcomeRoute:
        return MaterialWithModalsPageRoute(
            builder: (_) => const WelcomePage(), settings: settings);
      case AppRouter.tutorialRoute:
        return MaterialWithModalsPageRoute(
            builder: (_) => const TutorialPage(), settings: settings);
      case AppRouter.phoneVerificationRoute:
        return MaterialWithModalsPageRoute(
            builder: (_) => PhoneNumberVerificationPage(
                phoneNumber: settings.arguments.toString()),
            settings: settings);
      case AppRouter.registerNewAccountRoute:
        return MaterialWithModalsPageRoute(
            builder: (_) => const RegisterAccountPage(), settings: settings);
      case AppRouter.dashboardRoute:
        return MaterialWithModalsPageRoute(
            builder: (_) => const DashboardPage(), settings: settings);
      case AppRouter.serviceFinderRoute:
        return MaterialWithModalsPageRoute(
            builder: (_) => const ServiceFinderPage(), settings: settings);
    }

    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(
            elevation: 0, backgroundColor: context.colorScheme.background),
        body: const EmptyContentPlaceholder(
          icon: TablerIcons.mood_empty,
          title: 'Oops...you seem far from home',
          subtitle:
              'An error occurred while getting your content. Please try again later',
        ),
      ),
    );
  }
}

class AppRouter {
  static const welcomeRoute = '/';
  static const tutorialRoute = '/tutorial';
  static const dashboardRoute = '/dashboard';
  static const serviceFinderRoute = '/dashboard/finder';
  static const registerNewAccountRoute = '/account/new';
  static const resetPasswordRoute = '/account/reset-password'; // todo
  static const phoneVerificationRoute = '/phone-verification';
}
