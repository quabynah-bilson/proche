import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile/core/di/injection.config.dart';

/// service locator
final GetIt getIt = GetIt.instance;

@InjectableInit(generateForDir: ['lib', 'test'])
Future<void> configureDependencies() async => getIt.init();
