part of '../dashboard.dart';

class _BusinessProfileTab extends StatefulWidget {
  final Account? account;

  const _BusinessProfileTab({Key? key, this.account}) : super(key: key);

  @override
  State<_BusinessProfileTab> createState() => _BusinessProfileTabState();
}

class _BusinessProfileTabState extends State<_BusinessProfileTab> {
  final _businessBloc = BusinessBloc();
  var _loading = true;

  @override
  void initState() {
    super.initState();
    _businessBloc.add(GetCurrentUserBusinessEvent());
  }

  @override
  Widget build(BuildContext context) => LoadingIndicator(
    isLoading: _loading,
    loadingAnimIsAsset: true,
    lottieAnimResource: Assets.animLoading,
    child: BlocConsumer(
          bloc: _businessBloc,
          listener: (context, state) {
            if (!mounted) return;

            setState(() => _loading = state is LoadingState);

            if (state is SuccessState<Empty>) {
              _businessBloc.add(GetCurrentUserBusinessEvent());
            }
          },
          builder: (context, state) {
            var account =
                state is SuccessState<BusinessAccount> ? state.data : null;

            if (account == null) {
              return AnimatedColumn(
                children: [
                  EmptyContentPlaceholder(
                    icon: TablerIcons.businessplan,
                    title: context.localizer.noBusinessAccount,
                    subtitle: context.localizer.noBusinessAccountSubhead,
                  ),
                  AppRoundedButton(
                    onTap: () async {
                      var account = await context.navigator.pushNamed(
                          AppRouter.createBusinessAccountRoute,
                          arguments: widget.account);
                      if (account is BusinessAccount) {
                        _businessBloc.add(GetCurrentUserBusinessEvent());
                      }
                    },
                    text: context.localizer.signUp,
                  ).top(40),
                ],
              ).centered();
            }

            return AnimatedListView(
              padding: const EdgeInsets.only(
                  top: 16, bottom: kBottomNavigationBarHeight + 16),
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    account.owner.avatarUrl.avatar(size: 96, circular: true),
                    const SizedBox(width: 16),
                    Expanded(
                      child: AnimatedColumn(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          account.owner.displayName
                              .subtitle1(context, weight: FontWeight.w600),
                          account.owner.phoneNumber
                              .subtitle2(context, emphasis: kEmphasisMedium),
                        ],
                      ),
                    ),
                    RoundedIconButton(
                        icon: TablerIcons.share,
                        onTap: () => shareProfile(account.owner)),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: context.colorScheme.secondary
                        .withOpacity(kEmphasisLowest),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: context.localizer.businessAccountInfo.bodyText2(context,
                      alignment: TextAlign.center,
                      color: context.colorScheme.secondary),
                ),
                ...ListTile.divideTiles(
                  context: context,
                  color: context.colorScheme.secondaryContainer,
                  tiles: [
                    SettingListTile(
                      title: context.localizer.specialization,
                      icon: TablerIcons.activity,
                      subtitle: account.specialization,
                      onTap: () {
                        // todo -> update business profile
                      },
                    ),
                    SettingListTile(
                      title: context.localizer.hourlyRate,
                      icon: TablerIcons.report_money,
                      subtitle: '\$${account.hourlyRate.toStringAsFixed(2)}/hr',
                      onTap: () {
                        // todo -> update business profile
                      },
                    ),
                    SettingListTile(
                      title: context.localizer.jobsCompleted,
                      icon: TablerIcons.history_toggle,
                      subtitle: '${account.jobsCompleted} jobs',
                    ),
                    SettingListTile(
                      title: context.localizer.ratingsAndReviews,
                      icon: TablerIcons.star,
                      subtitle: account.ratings.toStringAsFixed(1),
                    ),
                  ],
                ).toList(),
                const SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: AppRoundedButton(
                            text: context.localizer.editProfile,
                            outlined: true,
                            // TODO -> edit business account
                            onTap: context.showFeatureUnderDevSheet)),
                    const SizedBox(width: 16),
                    Expanded(
                      child: AppRoundedButton(
                        text: context.localizer.delete,
                        backgroundColor: context.colorScheme.errorContainer,
                        textColor: context.colorScheme.onErrorContainer,
                        onTap: () async => context.showMessageDialog(
                          context.localizer.deleteAccount,
                          actionLabel: context.localizer.delete,
                          title: context.localizer.confirm,
                          onTap: () => _businessBloc.add(DeleteBusinessEvent(account.owner.id))
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
  );
}
