part of '../dashboard.dart';

class _PersonalProfileTab extends StatefulWidget {
  final Account? account;

  const _PersonalProfileTab({Key? key, this.account}) : super(key: key);

  @override
  State<_PersonalProfileTab> createState() => _PersonalProfileTabState();
}

class _PersonalProfileTabState extends State<_PersonalProfileTab> {
  final _authBloc = AuthBloc();
  late var _account = widget.account;
  var _loading = false, _editingProfile = false;
  late final _profileCompletion = [];

  @override
  void initState() {
    super.initState();
    _authBloc.add(GetCurrentAccountAuthEvent());
  }

  @override
  Widget build(BuildContext context) => BlocListener(
        bloc: _authBloc,
        listener: (context, state) {
          if (!mounted) return;

          setState(() => _loading = state is LoadingState);

          if (state is SuccessState<Account>) {
            setState(() => _account = state.data);
          }
        },
        child: LoadingIndicator(
          child: SingleChildScrollView(
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                Container(
                  width: context.width,
                  height: context.height * 0.2,
                  margin: EdgeInsets.only(top: context.height * 0.05),
                  decoration: BoxDecoration(
                    color: context.colorScheme.background,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                        color: context.colorScheme.secondaryContainer,
                        width: 2.5),
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        left: 16,
                        top: -context.height * 0.05,
                        child: Container(
                          width: context.width * 0.3,
                          height: context.width * 0.3,
                          decoration: BoxDecoration(
                            color: context.colorScheme.background,
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: context.colorScheme.secondaryContainer,
                                width: 2.5),
                          ),
                          child: _account?.avatarUrl.avatar(
                              size: context.width * 0.3,
                              fit: BoxFit.contain,
                              circular: true),
                        ),
                      ),
                      Positioned.fill(
                        right: 16,
                        top: 12,
                        child: _account == null
                            ? const CircularProgressIndicator.adaptive()
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  AnimatedColumn(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      _account!.displayName.subtitle1(context,
                                          weight: FontWeight.bold),
                                      '@${_account?.displayName.toLowerCase().replaceAll(' ', '-')}'
                                          .subtitle2(context,
                                              emphasis: kEmphasisMedium),
                                    ],
                                  ),
                                  Expanded(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: AppRoundedButton(
                                            text: context.localizer.editProfile,
                                            backgroundColor: context
                                                .colorScheme.onBackground,
                                            textColor:
                                                context.colorScheme.surface,
                                            onTap: () => setState(() =>
                                                _editingProfile =
                                                    !_editingProfile),
                                          ),
                                        ),
                                        const SizedBox(width: 16),
                                        RoundedIconButton(
                                          icon: TablerIcons.upload,
                                          color:
                                              context.colorScheme.onBackground,
                                          onTap: () => shareProfile(_account!),
                                        ),
                                      ],
                                    ).top(12).left(16),
                                  ),
                                ],
                              ),
                      ),
                    ],
                  ),
                ),
              ],
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
