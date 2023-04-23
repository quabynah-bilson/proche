part of '../dashboard.dart';

class _PersonalProfileTab extends StatefulWidget {
  final Account? account;

  const _PersonalProfileTab({Key? key, this.account}) : super(key: key);

  @override
  State<_PersonalProfileTab> createState() => _PersonalProfileTabState();
}

class _PersonalProfileTabState extends State<_PersonalProfileTab> {
  final _authBloc = AuthBloc(), _totalFields = 4;
  late var _account = widget.account;
  var _loading = false,
      _editingProfile = false,
      _completedFields = 0,
      _profileCompletionPercentage = 0.0;

  Widget get _buildProfileHeader => Container(
        width: context.width,
        height: context.height * 0.2,
        margin: EdgeInsets.only(top: context.height * 0.05),
        decoration: BoxDecoration(
          color: context.colorScheme.background,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
              color: context.colorScheme.secondaryContainer, width: 2.5),
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
                            _account!.displayName
                                .subtitle1(context, weight: FontWeight.bold),
                            '@${_account?.displayName.toLowerCase().replaceAll(' ', '-')}'
                                .subtitle2(context, emphasis: kEmphasisMedium),
                          ],
                        ),
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: AppRoundedButton(
                                  text: context.localizer.editProfile,
                                  backgroundColor:
                                      context.colorScheme.onBackground,
                                  textColor: context.colorScheme.surface,
                                  onTap: () => setState(
                                      () => _editingProfile = !_editingProfile),
                                ),
                              ),
                              const SizedBox(width: 16),
                              RoundedIconButton(
                                icon: TablerIcons.upload,
                                color: context.colorScheme.onBackground,
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
      );

  Widget get _buildProfileCompletion {
    var completed = _profileCompletionPercentage == 1.0;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: (completed
                ? context.colorScheme.tertiary
                : context.colorScheme.onBackground)
            .withOpacity(kEmphasisLowest),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
            color: completed
                ? context.colorScheme.tertiary
                : context.colorScheme.onBackground,
            width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          context.localizer
              .profileCompletion(
                  (_profileCompletionPercentage * 100).toStringAsFixed(0))
              .subtitle1(context,
                  color: completed
                      ? context.colorScheme.tertiary
                      : context.colorScheme.onBackground,
                  weight: FontWeight.bold),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    context.localizer.profileCompletionSubhead
                        .subtitle2(context, emphasis: kEmphasisMedium),
                    const SizedBox(height: 8),
                    LinearProgressIndicator(
                      value: _profileCompletionPercentage,
                      minHeight: 8,
                      backgroundColor: context.colorScheme.background,
                      valueColor: AlwaysStoppedAnimation(completed
                          ? context.colorScheme.tertiary
                          : context.colorScheme.onBackground),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              RoundedIconButton(
                icon: completed ? TablerIcons.checks : TablerIcons.photo_edit,
                color: completed
                    ? context.colorScheme.tertiary
                    : context.colorScheme.onBackground,
                onTap: () => setState(() => _editingProfile = true),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// show a list of options with icons to change language, theme, etc
  Widget get _buildProfileOptions => Column(
        mainAxisSize: MainAxisSize.min,
        children: ListTile.divideTiles(
          context: context,
          color: context.theme.disabledColor,
          tiles: [
            SettingListTile(
              title: context.localizer.countryOfOrigin,
              icon: TablerIcons.globe,
              subtitle: context.localizer.countryOfOriginSubhead,
              onTap: () async {
                var country = await context.showCountriesSheet();
                if (country != null) {
                  _account!.countryId = country.id;
                  _authBloc.add(UpdateAccountAuthEvent(_account!));
                }
              },
            ),
            BlocBuilder(
              bloc: context.read<LocaleCubit>(),
              builder: (context, state) => SettingListTile(
                title: context.localizer.changeLanguage(
                    state is SuccessState<String> ? state.data : 'en'),
                icon: TablerIcons.language,
                subtitle: context.localizer.changeLanguageSubhead,
                onTap: () async {
                  var locale = await context.showLocalesSheet();
                  if (locale != null) {
                    context.read<LocaleCubit>().setLocale(locale);
                  }
                },
              ),
            ),
            SettingListTile(
              title: context.localizer.themeBuilder,
              icon: TablerIcons.color_swatch,
              subtitle: context.localizer.themeBuilderSubhead,
              onTap: () async {
                var themeMode = await context.showThemePickerSheet();
                if (themeMode != null) {
                  // todo -> use theme mode
                }
              },
            ),
          ],
        ).toList(),
      );

  void _calculateProfileCompletion() {
    if (_account == null) return;
    _completedFields = 0;
    if (!_account!.avatarUrl.isNullOrEmpty()) {
      _completedFields++;
    }

    if (!_account!.displayName.isNullOrEmpty()) {
      _completedFields++;
    }

    if (!_account!.idCardUrl.isNullOrEmpty()) {
      _completedFields++;
    }

    if (!_account!.vaccineCardUrl.isNullOrEmpty()) {
      _completedFields++;
    }

    _profileCompletionPercentage = _completedFields / _totalFields;
    logger.d('profile completion: $_profileCompletionPercentage');
  }

  @override
  void initState() {
    super.initState();
    _authBloc.add(GetCurrentAccountAuthEvent());
    doAfterDelay(() => context.read<LocaleCubit>().getCurrentLocale());
    _calculateProfileCompletion();
  }

  @override
  Widget build(BuildContext context) => BlocListener(
        bloc: _authBloc,
        listener: (context, state) {
          if (!mounted) return;

          setState(() => _loading = state is LoadingState);

          if (state is SuccessState<Account>) {
            setState(() => _account = state.data);
            _calculateProfileCompletion();
          }
        },
        child: LoadingIndicator(
          child: AnimatedListView(
            children: [
              _buildProfileHeader,
              _buildProfileCompletion,
              const SizedBox(height: 16),
              _buildProfileOptions,
              SafeArea(
                top: false,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: context.colorScheme.secondaryContainer,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RoundedIconButton(
                        icon: TablerIcons.bell,
                        color: context.colorScheme.onBackground,
                        // hasBadge: true,
                        onTap: () => context.navigator
                            .pushNamed(AppRouter.notificationsRoute),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: AppRoundedButton(
                          text: context.localizer.seeActivities,
                          outlined: true,
                          backgroundColor: context.colorScheme.onBackground,
                          textColor: context.colorScheme.background,
                          icon: TablerIcons.activity,
                          onTap: () => context.navigator
                              .pushNamed(AppRouter.userActivitiesRoute),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
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
