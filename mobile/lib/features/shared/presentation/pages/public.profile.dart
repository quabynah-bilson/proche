import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile/core/utils/extensions.dart';
import 'package:mobile/features/business/presentation/manager/business_bloc.dart';
import 'package:mobile/features/shared/presentation/widgets/buttons.dart';
import 'package:mobile/features/shared/presentation/widgets/tab.container.dart';
import 'package:mobile/generated/assets.dart';
import 'package:mobile/generated/protos/auth.pb.dart';
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
  late final _account = widget.account;
  final _businessBloc = BusinessBloc();

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
                            onTap: () {},
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

  @override
  void initState() {
    super.initState();
    _businessBloc.add(GetCurrentUserBusinessEvent());
  }

  @override
  Widget build(BuildContext context) => BlocListener(
        bloc: _businessBloc,
        listener: (context, state) {
          if (!mounted) return;

          setState(() => _loading = state is LoadingState);

          if (state is ErrorState<String>) {
            context.showMessageDialog(state.failure);
          }
        },
        child: Scaffold(
          appBar: AppBar(),
          body: LoadingIndicator(
            child: Column(
              children: [
                PilledTabContainer(
                    labels: [
                      context.localizer.personal,
                      context.localizer.business
                    ],
                    selectedIndex: _selectedIndex,
                    onTabSelected: (index) =>
                        setState(() => _selectedIndex = index)).horizontal(24),
                Expanded(
                  child: _account.isPublicAccount ? Column(
                    children: [
                      _buildProfileHeader,
                      // todo -> build UI
                    ],
                  ) : Column(
                    children: [
                      Lottie.asset(Assets.animBlockedAccount,
                          repeat: false,
                          height: context.height * 0.35,
                          width: context.width),
                      EmptyContentPlaceholder(
                        title:
                            context.localizer.accountLocked(_account.displayName),
                        subtitle: context.localizer.accountLockedSubhead,
                      ),
                      // TODO -> send a request to view a user's business account
                      AppRoundedButton(
                              text: context.localizer.sendAccountViewRequest,
                              onTap: context.showFeatureUnderDevSheet)
                          .top(40),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
