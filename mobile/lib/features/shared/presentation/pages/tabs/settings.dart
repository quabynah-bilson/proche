part of '../dashboard.dart';

class _SettingsTab extends StatefulWidget {
  final Account? account;

  const _SettingsTab({Key? key, this.account}) : super(key: key);

  @override
  State<_SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<_SettingsTab> {
  final _authBloc = AuthBloc(), _deviceCubit = DeviceInfoCubit();
  late final _tabs = [context.localizer.personal, context.localizer.business];
  late var _account = widget.account;
  var _loading = false, _activeTab = 0;

  @override
  void initState() {
    super.initState();
    _deviceCubit.getAppVersion();
    _authBloc.add(GetCurrentAccountAuthEvent());
  }

  @override
  Widget build(BuildContext context) => MultiBlocListener(
        listeners: [
          BlocListener(
            bloc: _authBloc,
            listener: (context, state) {
              if (!mounted) return;

              setState(() => _loading = state is LoadingState);

              if (state is SuccessState<Account>) {
                setState(() => _account = state.data);
              }
            },
          ),
        ],
        child: LoadingIndicator(
          lottieAnimResource: Assets.animLoading,
          loadingAnimIsAsset: true,
          isLoading: _loading,
          child: _account == null
              ? Assets.imgAppLogoAnimated.asAssetImage().centered()
              : SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(24, 20, 24, 40),
                  child: SafeArea(
                    bottom: false,
                    child: Column(
                      children: [
                        Container(
                          width: context.width,
                          height: 64,
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: context.colorScheme.surface,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: context.colorScheme.background,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: context.localizer.personal
                                      .button(context)
                                      .centered(),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: context.colorScheme.surface,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      );
}

/*
Positioned.fill(
                      child: CustomScrollView(
                        slivers: [
                          /// user personal info
                          SliverSafeArea(
                            bottom: false,
                            sliver: SliverToBoxAdapter(
                              child: AnimatedColumn(
                                animateType: AnimateType.slideDown,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: context
                                              .theme.colorScheme.onSurface
                                              .withOpacity(kEmphasisLowest)),
                                      shape: BoxShape.circle,
                                    ),
                                    child: _account!.avatarUrl
                                        .avatar(
                                            size: context.height * 0.15,
                                            fit: BoxFit.contain,
                                            circular: true)
                                        .top(24),
                                  ),
                                  _account!.displayName.h6(context),
                                  '@${_account!.displayName.toLowerCase().replaceAll(' ', '-')}'
                                      .subtitle2(context,
                                          emphasis: kEmphasisMedium),

                                  /// app version
                                  BlocBuilder(
                                    bloc: _deviceCubit,
                                    builder: (context, state) {
                                      if (state is SuccessState<String>) {
                                        return 'v${state.data}'
                                            .caption(context,
                                                emphasis: kEmphasisMedium)
                                            .centered()
                                            .top(8);
                                      }
                                      return const SizedBox.shrink();
                                    },
                                  )
                                ],
                              ),
                            ),
                          ),

                          SliverToBoxAdapter(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ListTile(
                                  // onTap: () => context.navigator
                                  //     .pushNamed(AppRouter.editProfileRoute),
                                  onTap: () async => await context
                                      .showVerifyPasswordSheet(_account!),
                                  leading: const Icon(TablerIcons.user),

                                  title: context.localizer.editProfile
                                      .subtitle1(context),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    /// sign out button
                    Positioned(
                      top: 0,
                      right: 24,
                      child: SafeArea(
                        bottom: false,
                        child: RoundedIconButton(
                          onTap: context.showLogoutDialog,
                          icon: Icons.exit_to_app_sharp,
                        ),
                      ),
                    ),
* */
