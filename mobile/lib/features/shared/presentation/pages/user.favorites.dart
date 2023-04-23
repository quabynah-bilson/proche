import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/utils/extensions.dart';
import 'package:mobile/features/task/presentation/manager/task_bloc.dart';
import 'package:mobile/generated/assets.dart';
import 'package:shared_utils/shared_utils.dart';

// todo -> build user's favorites
class UserFavoritesPage extends StatefulWidget {
  const UserFavoritesPage({Key? key}) : super(key: key);

  @override
  State<UserFavoritesPage> createState() => _UserFavoritesPageState();
}

class _UserFavoritesPageState extends State<UserFavoritesPage> {
  final _quickHelpBloc = TaskBloc();
  var _loading = false;

  @override
  Widget build(BuildContext context) => BlocListener(
        bloc: _quickHelpBloc,
        listener: (context, state) {
          if (!mounted) return;
        },
        child: Scaffold(
          appBar: AppBar(),
          extendBodyBehindAppBar: true,
          body: LoadingIndicator(
            isLoading: _loading,
            loadingAnimIsAsset: true,
            lottieAnimResource: Assets.animLoading,
            child: EmptyContentPlaceholder(
                icon: TablerIcons.heart_off,
                title: context.localizer.underMaintenanceHeader,
                subtitle: context.localizer.underMaintenanceSubhead),
          ),
        ),
      );
}
