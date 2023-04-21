import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile/core/app.dart';
import 'package:mobile/core/di/injection.dart';
import 'package:mobile/firebase_options.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_utils/shared_utils.dart';

void main() async {
  // ensure that the binding is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // load environment variables
  await dotenv.load(fileName: ".env");

  // initialize dependency injection
  await configureDependencies();

  // initialize firebase
  var firebaseApp = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform);
  logger.i('firebase initialized: ${firebaseApp.name}');

  // initialize Sentry
  await SentryFlutter.init(
    (options) {
      options.dsn = dotenv.env['SENTRY_DSN'];
      // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
      // We recommend adjusting this value in production.
      options.tracesSampleRate = 0.1;
    },
    // run the app
    appRunner: () => runZonedGuarded(
        () => runApp(const ProcheApp()), (error, stack) => logger.e(error)),
    // appRunner: () => runApp(const ProcheApp()),
  );
}
