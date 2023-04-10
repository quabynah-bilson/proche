import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/routing/router.dart';
import 'package:mobile/core/theme.dart';
import 'package:mobile/core/utils/constants.dart';
import 'package:mobile/features/shared/presentation/manager/auth/auth_bloc.dart';
import 'package:shared_utils/shared_utils.dart';

/// root widget for application
class ProcheApp extends StatefulWidget {
  const ProcheApp({Key? key}) : super(key: key);

  @override
  State<ProcheApp> createState() => _ProcheAppState();
}

class _ProcheAppState extends State<ProcheApp> {
  @override
  Widget build(BuildContext context) => DismissKeyboard(
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => AuthBloc()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: kAppName,
            theme: context.useLightTheme,
            darkTheme: context.useDarkTheme,
            themeMode: ThemeMode.system,
            onGenerateRoute: AppRouterConfig.setupRoutes,
          ),
        ),
      );
}
