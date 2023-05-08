import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile/core/routing/router.dart';
import 'package:mobile/core/utils/actions.dart';
import 'package:mobile/core/utils/extensions.dart';
import 'package:mobile/features/business/presentation/manager/business_bloc.dart';
import 'package:mobile/features/onboarding/presentation/manager/auth/auth_bloc.dart';
import 'package:mobile/features/shared/presentation/manager/post/posts_bloc.dart';
import 'package:mobile/features/shared/presentation/widgets/buttons.dart';
import 'package:mobile/features/shared/presentation/widgets/service.request.tile.dart';
import 'package:mobile/features/shared/presentation/widgets/tab.container.dart';
import 'package:mobile/features/shared/presentation/widgets/user.posts.for.profile.dart';
import 'package:mobile/generated/assets.dart';
import 'package:mobile/generated/protos/auth.pb.dart';
import 'package:mobile/generated/protos/core_shared.pb.dart';
import 'package:shared_utils/shared_utils.dart';

// todo -> build UI
class PublicUserProfilePage extends StatefulWidget {
  final Account account;

  const PublicUserProfilePage({Key? key, required this.account})
      : super(key: key);

  @override
  State<PublicUserProfilePage> createState() => _PublicUserProfilePageState();
}

class _PublicUserProfilePageState extends State<PublicUserProfilePage> {
  var _loading = false, _selectedIndex = 0;
  late var _account = widget.account;
  BusinessAccount? _businessAccount;
  final _businessBloc = BusinessBloc(),
      _postsBloc = PostsBloc(),
      _authBloc = AuthBloc();

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
                child: _account.avatarUrl.avatar(
                    size: context.width * 0.3,
                    fit: BoxFit.contain,
                    circular: true),
              ),
            ),
            Positioned.fill(
              right: 16,
              top: 12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  AnimatedColumn(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      _account.displayName
                          .subtitle1(context, weight: FontWeight.bold),
                      '@${_account.displayName.toLowerCase().replaceAll(' ', '-')}'
                          .subtitle2(context, emphasis: kEmphasisMedium),
                    ],
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: AppRoundedButton(
                            text: context.localizer.message,
                            backgroundColor: context.colorScheme.onBackground,
                            textColor: context.colorScheme.surface,
                            onTap: () => context.navigator.pushNamed(
                                AppRouter.chatRoute,
                                arguments: _account),
                          ),
                        ),
                        const SizedBox(width: 16),
                        RoundedIconButton(
                          icon: TablerIcons.dots_vertical,
                          color: context.colorScheme.onBackground,
                          onTap: () {
                            // todo -> show options popup menu
                          },
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

  Widget get _buildPersonalTab => AnimatedListView(
        padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
        children: [
          _buildProfileHeader,
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              context.localizer
                  .userPosts(_account.displayName)
                  .subtitle1(context, weight: FontWeight.w600),
              TextButton(
                onPressed: () => context.navigator.pushNamed(
                    AppRouter.userActivitiesRoute,
                    arguments: _account),
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
                    subtitle: context.localizer.nothingAvailableSubhead,
                  ),
                );
              }

              return SafeArea(
                  child: const CircularProgressIndicator.adaptive().centered());
            },
          ),
        ],
      );

  Widget get _buildBusinessTab => AnimatedListView(
        children: [
          if (_account.isPublicAccount) ...{
            Container(
              width: context.width * 0.3,
              height: context.width * 0.3,
              margin: const EdgeInsets.only(top: 16, bottom: 24),
              decoration: BoxDecoration(
                color: context.colorScheme.background,
                shape: BoxShape.circle,
                border: Border.all(
                    color: context.colorScheme.secondaryContainer, width: 2.5),
              ),
              child: _account.avatarUrl.avatar(
                  size: context.width * 0.3,
                  fit: BoxFit.contain,
                  circular: true),
            ),
            context.localizer
                .hireProfessional(_account.displayName)
                .h6(context, weight: FontWeight.bold)
                .centered(),
            if (_businessAccount != null) ...{
              _businessAccount!.specialization
                  .subtitle1(context, emphasis: kEmphasisMedium)
                  .centered()
                  .top(8),
              const Divider(),
              EmptyContentPlaceholder(
                      icon: TablerIcons.briefcase,
                      title: context.localizer.promptToHire,
                      subtitle: '')
                  .vertical(24),
              ServiceRequestOptionTile(
                title: context.localizer.newTask,
                subtitle: context.localizer.newTaskSubhead,
                color: context.colorScheme.secondary,
                iconColor: context.colorScheme.onSecondary,
                onTap: () => context.navigator
                    .pushNamed(AppRouter.newTaskRoute, arguments: _account),
              ),
              SafeArea(
                top: false,
                child: ServiceRequestOptionTile(
                  title: context.localizer.fromYourPost,
                  subtitle: context.localizer.fromYourPostSubhead,
                  color: context.colorScheme.onBackground,
                  iconColor: context.colorScheme.background,
                  onTap: () => context.navigator
                      .pushNamed(AppRouter.newTaskRoute, arguments: _account),
                ),
              ),
            },
          } else ...{
            Lottie.asset(Assets.animBlockedAccount,
                repeat: false,
                height: context.height * 0.35,
                width: context.width),
            EmptyContentPlaceholder(
              title: context.localizer.accountLocked(_account.displayName),
              subtitle: context.localizer.accountLockedSubhead,
            ),
            // TODO -> send a request to view a user's business account
            AppRoundedButton(
                    text: context.localizer.sendAccountViewRequest,
                    onTap: context.showFeatureUnderDevSheet)
                .centered()
                .top(40),
          },
        ],
      );

  @override
  void initState() {
    super.initState();
    _businessBloc.add(GetCurrentUserBusinessEvent());
    _authBloc.add(GetCountryByIdAuthEvent(_account.id));
    _postsBloc.add(GetUserPostsEvent(_account.id));
  }

  @override
  Widget build(BuildContext context) => MultiBlocListener(
        listeners: [
          BlocListener(
            bloc: _businessBloc,
            listener: (context, state) {
              if (!mounted) return;

              setState(() => _loading = state is LoadingState);

              if (state is ErrorState<String>) {
                context.showMessageDialog(state.failure);
              }

              if (state is SuccessState<BusinessAccount>) {
                setState(() => _businessAccount = state.data);
              }
            },
          ),
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
        child: Scaffold(
          appBar: AppBar(
            actions: [
              TextButton(
                  onPressed: openTermsOfService,
                  child: context.localizer.termsOfService
                      .button(context, emphasis: kEmphasisMedium))
            ],
          ),
          body: LoadingIndicator(
            isLoading: _loading,
            loadingAnimIsAsset: true,
            lottieAnimResource: Assets.animLoading,
            child: Column(
              children: [
                PilledTabContainer(
                    labels: [
                      context.localizer.personal,
                      context.localizer.business
                    ],
                    selectedIndex: _selectedIndex,
                    onTabSelected: (index) {
                      if (_businessAccount == null && index == 1) {
                        context.showMessageDialog(
                          context.localizer
                              .noBusinessAccountForUser(_account.displayName),
                          title: 'Oops!',
                          animationAsset: Assets.animNotFound,
                        );
                        return;
                      }
                      setState(() => _selectedIndex = index);
                    }).horizontal(24),
                Expanded(
                    child: _selectedIndex == 0
                        ? _buildPersonalTab
                        : _buildBusinessTab),
              ],
            ),
          ),
        ),
      );
}
