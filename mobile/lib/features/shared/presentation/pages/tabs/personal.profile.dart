part of '../dashboard.dart';

class _PersonalProfileTab extends StatefulWidget {
  final Account? account;

  const _PersonalProfileTab({Key? key, this.account}) : super(key: key);

  @override
  State<_PersonalProfileTab> createState() => _PersonalProfileTabState();
}

class _PersonalProfileTabState extends State<_PersonalProfileTab> {
  late var _account = widget.account;
  final _authBloc = AuthBloc(),
      _postsBloc = PostsBloc(),
      _totalFields = 4,
      _formKey = GlobalKey<FormState>(),
      _avatars = [
        Assets.avatarsLorelei0,
        Assets.avatarsLorelei1,
        Assets.avatarsLorelei2,
        Assets.avatarsLorelei3,
        Assets.avatarsLorelei4,
        Assets.avatarsLorelei5,
        Assets.avatarsLorelei6,
        Assets.avatarsLorelei7,
        Assets.avatarsLorelei8,
        Assets.avatarsLorelei9,
        Assets.avatarsLorelei10,
        Assets.avatarsLorelei11,
        Assets.avatarsLorelei12,
        Assets.avatarsLorelei13,
        Assets.avatarsLorelei14,
        Assets.avatarsLorelei15,
        Assets.avatarsLorelei16,
        Assets.avatarsLorelei17,
        Assets.avatarsLorelei18,
        Assets.avatarsLorelei19,
      ];
  late final _nameController =
          TextEditingController(text: _account?.displayName),
      _phoneController = TextEditingController(text: _account?.phoneNumber);
  var _loading = false,
      _editingProfile = false,
      _showPicturePickerUI = false,
      _completedFields = 0,
      _profileCompletionPercentage = 0.0;
  String? _selectedAvatarAsset;
  File? _vaccineFile, _idFile;

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
                                      context.colorScheme.secondary,
                                  textColor: context.colorScheme.onSecondary,
                                  onTap: () => setState(
                                      () => _editingProfile = !_editingProfile),
                                ),
                              ),
                              const SizedBox(width: 16),
                              RoundedIconButton(
                                icon: TablerIcons.door_exit,
                                color: context.colorScheme.errorContainer,
                                onTap: context.showLogoutDialog,
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
                : context.colorScheme.secondary)
            .withOpacity(kEmphasisLowest),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
            color: completed
                ? context.colorScheme.tertiary
                : context.colorScheme.secondary,
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
                      : context.colorScheme.secondary,
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
                          : context.colorScheme.secondary),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              RoundedIconButton(
                icon: completed ? TablerIcons.checks : TablerIcons.photo_edit,
                color: completed
                    ? context.colorScheme.tertiary
                    : context.colorScheme.secondary,
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
              title: context.localizer.publicAccount,
              icon: _account!.isPublicAccount
                  ? TablerIcons.world
                  : TablerIcons.shield_lock,
              subtitle: context.localizer.publicAccountSubhead,
              trailing: CupertinoSwitch(
                value: _account!.isPublicAccount,
                activeColor: context.colorScheme.secondary,
                onChanged: (checked) {
                  setState(() => _account!.isPublicAccount = checked);
                  _authBloc.add(UpdateAccountAuthEvent(_account!));
                },
              ),
              onTap: () async {
                var country = await context.showCountriesSheet();
                if (country != null) {
                  _account!.countryId = country.id;
                  _authBloc.add(UpdateAccountAuthEvent(_account!));
                }
              },
            ),
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
                  context
                      .read<ThemeCubit>()
                      .setCurrentThemeMode(themeMode.index);
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
    _postsBloc.add(GetCurrentUserPostsEvent());
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
            _selectedAvatarAsset = null;
            _showPicturePickerUI = false;
            _editingProfile = false;
            setState(() => _account = state.data);
            _calculateProfileCompletion();
          }
        },
        child: LoadingIndicator(
          isLoading: _loading,
          lottieAnimResource: Assets.animUploadInProgress,
          loadingAnimIsAsset: true,
          child: _editingProfile
              ? Form(
                  key: _formKey,
                  child: AnimatedListView(
                    animateType: AnimateType.slideUp,
                    padding: const EdgeInsets.only(bottom: kToolbarHeight),
                    children: [
                      SizedBox(
                        width: context.width * 0.3,
                        height: context.width * 0.3,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned.fill(
                              child: Container(
                                width: context.width * 0.3,
                                height: context.width * 0.3,
                                decoration: BoxDecoration(
                                  color: context.colorScheme.background,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: context
                                          .colorScheme.secondaryContainer,
                                      width: 2.5),
                                ),
                                child: (_selectedAvatarAsset.isNullOrEmpty()
                                        ? _account?.avatarUrl
                                        : _selectedAvatarAsset)
                                    .avatar(
                                        size: context.width * 0.3,
                                        fit: BoxFit.contain,
                                        fromAsset: !_selectedAvatarAsset
                                            .isNullOrEmpty(),
                                        circular: true),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: -8,
                              child: RoundedIconButton(
                                color: _showPicturePickerUI
                                    ? context.colorScheme.errorContainer
                                    : context.colorScheme.secondary,
                                icon: _showPicturePickerUI
                                    ? TablerIcons.x
                                    : TablerIcons.photo_edit,
                                onTap: () => setState(() =>
                                    _showPicturePickerUI =
                                        !_showPicturePickerUI),
                              ),
                            ),
                          ],
                        ),
                      ).centered(),
                      if (_showPicturePickerUI) ...{
                        /// show avatars
                        AnimationLimiter(
                          child: GridView.builder(
                            padding: const EdgeInsets.only(top: 20, bottom: 16),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 12,
                                    mainAxisSpacing: 8),
                            itemCount: _avatars.length,
                            itemBuilder: (context, index) =>
                                AnimationConfiguration.staggeredGrid(
                              position: index,
                              duration: const Duration(milliseconds: 375),
                              columnCount: 3,
                              child: ScaleAnimation(
                                child: FadeInAnimation(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() => _selectedAvatarAsset =
                                          _avatars[index]);
                                    },
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        color: _selectedAvatarAsset ==
                                                _avatars[index]
                                            ? context.colorScheme.secondary
                                            : null,
                                        border: Border.all(
                                            color: context.theme.disabledColor
                                                .withOpacity(kEmphasisMedium)),
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: AssetImage(_avatars[index])),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ).fillMaxWidth(context).fillMaxHeight(context, 0.3),
                        ),
                      },
                      context.localizer.profileEditHeader
                          .subtitle1(context, weight: FontWeight.w600)
                          .vertical(16),
                      AppTextField(
                        context.localizer.username,
                        controller: _nameController,
                        enabled: !_loading,
                        floatLabel: true,
                        capitalization: TextCapitalization.words,
                        validator: Validators.validate,
                      ),
                      AppTextField(
                        context.localizer.phoneNumber,
                        controller: _phoneController,
                        enabled: !_loading,
                        readOnly: true,
                        floatLabel: true,
                        validator: (input) =>
                            Validators.validatePhone(context, input),
                      ),
                      context.localizer.idCardRequired
                          .bodyText2(context,
                              color: context.colorScheme.secondary)
                          .bottom(16),
                      ImagePickerContainer(
                        context.localizer.idCard,
                        icon: TablerIcons.id_badge_2,
                        imageUrl: _account?.idCardUrl,
                        onImageSelected: (image) =>
                            setState(() => _idFile = image),
                        onImageRemoved: () => setState(() {
                          _account?.idCardUrl = '';
                          _idFile = null;
                        }),
                      ),
                      context.localizer.vaccineCardRequired
                          .bodyText2(context,
                              color: context.colorScheme.secondary)
                          .bottom(16),
                      ImagePickerContainer(
                        context.localizer.vaccineCard,
                        icon: TablerIcons.face_mask,
                        imageUrl: _account?.vaccineCardUrl,
                        onImageSelected: (image) =>
                            setState(() => _vaccineFile = image),
                        onImageRemoved: () => setState(() {
                          _account?.vaccineCardUrl = '';
                          _vaccineFile = null;
                        }),
                      ),
                      AppRoundedButton(
                              text: context.localizer.save,
                              enabled: !_loading,
                              onTap: _validateAndSaveProfile)
                          .top(16),
                      TextButton(
                              onPressed: () =>
                                  setState(() => _editingProfile = false),
                              child: context.localizer.cancel.button(context))
                          .centered()
                          .top(16),
                    ],
                  ),
                )
              : AnimatedListView(
                  padding: const EdgeInsets.only(bottom: kToolbarHeight),
                  children: [
                    _buildProfileHeader,
                    _buildProfileCompletion,
                    const SizedBox(height: 16),
                    context.localizer.generalSettings
                        .subtitle1(context, weight: FontWeight.w600)
                        .top(16),
                    _buildProfileOptions,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        context.localizer.myPosts
                            .subtitle1(context, weight: FontWeight.w600),
                        TextButton(
                          onPressed: () => context.navigator
                              .pushNamed(AppRouter.userActivitiesRoute),
                          child: context.localizer.showMore.button(context),
                        ),
                      ],
                    ).top(16),
                    BlocBuilder(
                      bloc: _postsBloc,
                      builder: (context, state) {
                        if (state is SuccessState<GetPostsForUserResponse>) {
                          return UserPostsForProfileView(
                            tasks: state.data.tasks,
                            events: state.data.events,
                            giveaways: state.data.giveaways,
                            trips: state.data.trips,
                          );
                        }

                        if (state is ErrorState<String>) {
                          return SafeArea(
                            child: EmptyContentPlaceholder(
                              icon: TablerIcons.subtask,
                              title: context.localizer.nothingAvailableHeader,
                              subtitle:
                                  context.localizer.nothingAvailableSubhead,
                            ),
                          );
                        }

                        return SafeArea(
                            child: const CircularProgressIndicator.adaptive()
                                .centered());
                      },
                    ),
                  ],
                ),
        ),
      );

  void _validateAndSaveProfile() async {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      _account!.displayName = _nameController.text.trim();
      if (!_selectedAvatarAsset.isNullOrEmpty()) {
        _account!.avatarUrl = _selectedAvatarAsset!;
      }

      if (_idFile != null) _account!.idCardUrl = _idFile!.absolute.path;
      if (_vaccineFile != null) {
        _account!.vaccineCardUrl = _vaccineFile!.absolute.path;
      }

      _authBloc.add(UpdateAccountAuthEvent(_account!));
    }
  }
}
