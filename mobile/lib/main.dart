import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobile/core/app.dart';
import 'package:mobile/core/di/injection.dart';
import 'package:shared_utils/shared_utils.dart';

void main() async {
  // ensure that the binding is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // initialize dependency injection
  await configureDependencies();

  // run the app
  runZonedGuarded(
      () => runApp(const ProcheApp()), (error, stack) => logger.e(error));
}
