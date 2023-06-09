import 'package:flutter/material.dart';
import 'package:mobile/core/utils/extensions.dart';
import 'package:mobile/core/utils/service.type.dart';
import 'package:mobile/features/business/presentation/pages/create.business.dart';
import 'package:mobile/features/chat/presentation/pages/chat.dart';
import 'package:mobile/features/onboarding/presentation/pages/phone.verification.dart';
import 'package:mobile/features/onboarding/presentation/pages/register.account.dart';
import 'package:mobile/features/onboarding/presentation/pages/reset.password.dart';
import 'package:mobile/features/onboarding/presentation/pages/tutorial.dart';
import 'package:mobile/features/onboarding/presentation/pages/welcome.dart';
import 'package:mobile/features/shared/presentation/pages/dashboard.dart';
import 'package:mobile/features/shared/presentation/pages/finder.dart';
import 'package:mobile/features/shared/presentation/pages/public.profile.dart';
import 'package:mobile/features/shared/presentation/pages/user.activities.dart';
import 'package:mobile/features/shared/presentation/pages/user.favorites.dart';
import 'package:mobile/features/task/presentation/pages/task.details.dart';
import 'package:mobile/generated/protos/auth.pb.dart';
import 'package:mobile/generated/protos/core_shared.pb.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:shared_utils/shared_utils.dart';

class AppRouterConfig {
  static Route<dynamic>? setupRoutes(RouteSettings settings) {
    switch (settings.name) {
      /// region onboarding
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
      case AppRouter.resetPasswordRoute:
        return MaterialWithModalsPageRoute(
            builder: (_) => ResetPasswordPage(
                isPublic: settings.arguments is bool &&
                    settings.arguments as bool == true),
            settings: settings);

      /// endregion onboarding

      /// region shared
      case AppRouter.publicProfileRoute:
        return MaterialWithModalsPageRoute(
            builder: (_) =>
                PublicUserProfilePage(account: settings.arguments as Account),
            settings: settings);
      case AppRouter.userActivitiesRoute:
        return MaterialWithModalsPageRoute(
            builder: (_) =>
                UserActivitiesPage(account: settings.arguments as Account?),
            settings: settings);
      case AppRouter.chatRoute:
        return MaterialWithModalsPageRoute(
            builder: (_) => ChatPage(account: settings.arguments as Account),
            settings: settings);
      case AppRouter.dashboardRoute:
        return MaterialWithModalsPageRoute(
            builder: (_) => const DashboardPage(), settings: settings);
      case AppRouter.userFavoritesRoute:
        return MaterialWithModalsPageRoute(
            builder: (_) => const UserFavoritesPage(), settings: settings);
      case AppRouter.serviceFinderRoute:
        return MaterialWithModalsPageRoute(
            builder: (_) => ServiceFinderPage(
                type: settings.arguments is int
                    ? ProcheServiceType.values[settings.arguments as int]
                    : ProcheServiceType.task),
            settings: settings);

      /// endregion shared

      /// region task
      case AppRouter.taskDetailsRoute:
        return MaterialWithModalsPageRoute(
            builder: (_) =>
                ProcheTaskDetailsPage(task: settings.arguments as ProcheTask),
            settings: settings);

      /// endregion task

      /// region business
      case AppRouter.createBusinessAccountRoute:
        return MaterialWithModalsPageRoute(
            builder: (_) => CreateBusinessAccountPage(
                account: settings.arguments as Account),
            settings: settings);

      /// endregion business
    }

    return MaterialPageRoute(
      builder: (context) => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            elevation: 0, backgroundColor: context.colorScheme.background),
        body: EmptyContentPlaceholder(
          icon: TablerIcons.building_factory,
          title: context.localizer.underMaintenanceHeader,
          subtitle: context.localizer.underMaintenanceSubhead,
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
  static const editProfileRoute = '/edit-profile'; // todo
  static const userFavoritesRoute = '/favorites';
  static const publicProfileRoute = '/public-profile'; // todo
  static const notificationsRoute = '/notifications'; // todo
  static const userActivitiesRoute = '/user-activities';
  static const taskDetailsRoute = '/task-details';
  static const createBusinessAccountRoute = '/business/new'; // todo
  static const chatRoute = '/chat'; // todo
  static const newTaskRoute = '/tasks/new'; // todo
}
