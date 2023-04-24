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
  Widget build(BuildContext context) => BlocConsumer(
        bloc: _businessBloc,
        listener: (context, state) {
          if (!mounted) return;

          setState(() => _loading = state is LoadingState);

          if (state is ErrorState<String>) {
            context.showMessageDialog(state.failure);
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
                  onTap: () => context.navigator.pushNamed(
                      AppRouter.createBusinessAccountRoute,
                      arguments: widget.account),
                  text: context.localizer.signUp,
                ).top(40),
              ],
            ).centered();
          }

          return AnimatedListView(
            padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
            children: [
              // todo: add business account details
            ],
          );
        },
      );
}
