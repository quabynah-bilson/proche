import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile/core/app.dart';
import 'package:mobile/core/di/injection.dart';
import 'package:shared_utils/shared_utils.dart';

void main() async {
  // ensure that the binding is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // load environment variables
  await dotenv.load(fileName: ".env");

  // initialize dependency injection
  await configureDependencies();

  // run the app
  runZonedGuarded(
      () => runApp(const ProcheApp()), (error, stack) => logger.e(error));
}
