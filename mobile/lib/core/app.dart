import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobile/core/routing/router.dart';
import 'package:mobile/core/theme.dart';
import 'package:mobile/core/utils/extensions.dart';
import 'package:mobile/features/onboarding/presentation/manager/auth/auth_bloc.dart';
import 'package:mobile/features/shared/presentation/manager/locale/locale_cubit.dart';
import 'package:mobile/features/shared/presentation/manager/shared/shared_cubit.dart';
import 'package:mobile/features/shared/presentation/manager/theme/theme_cubit.dart';
import 'package:shared_utils/shared_utils.dart';

/// root widget for application
class ProcheApp extends StatefulWidget {
  const ProcheApp({Key? key}) : super(key: key);

  @override
  State<ProcheApp> createState() => _ProcheAppState();
}

class _ProcheAppState extends State<ProcheApp> {
  late final _localeBloc = LocaleCubit(context), _themeBloc = ThemeCubit();

  @override
  void initState() {
    super.initState();
    doAfterDelay(() {
      _localeBloc.getCurrentLocale();
      _themeBloc.getCurrentThemeMode();
    });
  }

  @override
  Widget build(BuildContext context) => DismissKeyboard(
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => AuthBloc()),
            BlocProvider(create: (context) => SharedCubit()),
            BlocProvider(create: (context) => _localeBloc),
            BlocProvider(create: (context) => _themeBloc),
          ],
          child: BlocBuilder(
            bloc: _localeBloc,
            builder: (context, state) => BlocBuilder(
              bloc: _themeBloc,
              builder: (context, themeState) => MaterialApp(
                debugShowCheckedModeBanner: false,
                onGenerateTitle: (context) => context.localizer.appName,
                theme: context.useLightTheme,
                darkTheme: context.useDarkTheme,
                themeMode: themeState is SuccessState<int>
                    ? ThemeMode.values
                        .firstWhere((mode) => mode.index == themeState.data)
                    : ThemeMode.light,
                // todo -> add support for dark mode
                onGenerateRoute: AppRouterConfig.setupRoutes,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                locale:
                    state is SuccessState<String> ? Locale(state.data) : null,
              ),
            ),
          ),
        ),
      );
}
