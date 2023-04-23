part of '../dashboard.dart';

class _SettingsTab extends StatefulWidget {
  final Account? account;

  const _SettingsTab({Key? key, this.account}) : super(key: key);

  @override
  State<_SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<_SettingsTab> {
  final _authBloc = AuthBloc(), _deviceCubit = DeviceInfoCubit();
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
              : Padding(
                  padding: const EdgeInsets.fromLTRB(24, 8, 24, 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SafeArea(
                        bottom: false,
                        child: TextButton.icon(
                          onPressed: () => context.navigator
                              .pushNamed(AppRouter.userFavoritesRoute),
                          icon: Icon(TablerIcons.heart,
                              color: context.colorScheme.onBackground),
                          label: context.localizer.favorites.button(context),
                        ).bottom(8),
                      ),
                      PilledTabContainer(
                        labels: [
                          context.localizer.personal,
                          context.localizer.business,
                        ],
                        selectedIndex: _activeTab,
                        onTabSelected: (index) =>
                            setState(() => _activeTab = index),
                      ),
                      const SizedBox(height: 24),
                      Expanded(
                        child: _activeTab == 0
                            ? _PersonalProfileTab(account: _account)
                            : _BusinessProfileTab(account: _account),
                      ),
                    ],
                  ),
                ),
        ),
      );
}
