import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/routing/router.dart';
import 'package:mobile/core/utils/extensions.dart';
import 'package:mobile/core/utils/validator.dart';
import 'package:mobile/features/business/presentation/manager/business_bloc.dart';
import 'package:mobile/features/onboarding/presentation/manager/auth/auth_bloc.dart';
import 'package:mobile/generated/protos/auth.pb.dart';
import 'package:shared_utils/shared_utils.dart';

class CreateBusinessAccountPage extends StatefulWidget {
  final Account account;

  const CreateBusinessAccountPage({Key? key, required this.account})
      : super(key: key);

  @override
  State<CreateBusinessAccountPage> createState() =>
      _CreateBusinessAccountPageState();
}

class _CreateBusinessAccountPageState extends State<CreateBusinessAccountPage> {
  final _formKey = GlobalKey<FormState>(),
      _specializationController = TextEditingController(),
      _hourlyChargeController = TextEditingController(),
      _authBloc = AuthBloc(),
      _countryBloc = AuthBloc(),
      _businessBloc = BusinessBloc();
  var _loading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener(
          bloc: _businessBloc,
          listener: (context, state) {
            if (!mounted) return;
            setState(() => _loading = state is LoadingState);

            if (state is ErrorState<String>) {
              context.showMessageDialog(state.failure);
            }
          },
        ),
        BlocListener(
          bloc: _countryBloc,
          listener: (context, state) {
            if (!mounted) return;
            setState(() => _loading = state is LoadingState);

            if (state is ErrorState<String>) {
              context.showMessageDialog(state.failure);
            }
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(),
        body: AnimatedListView(
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
          children: [
            context.localizer.createBusinessAccount.h6(context),
            context.localizer.createBusinessAccountSubhead.subtitle1(context),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  AppTextField(
                    context.localizer.specialization,
                    controller: _specializationController,
                    validator: Validators.validate,
                    textFieldType: AppTextFieldType.select,
                    onTap: () async {
                      var specialization =
                          await context.showSpecializationSheet();
                      if (specialization.isNullOrEmpty()) return;
                      _specializationController.text = specialization!;
                    },
                  ),
                  BlocBuilder(
                    bloc: _countryBloc,
                    builder: (context, state) => AppTextField(
                      context.localizer.hourlyRate,
                      controller: _hourlyChargeController,
                      validator: Validators.validate,
                      textFieldType: AppTextFieldType.currency,
                      prefixIcon: state is SuccessState<Country>
                          ? state.data.flagUrl.asSvg(height: 24, width: 24)
                          : null,
                    ),
                  ),
                  AppRoundedButton(
                    text: context.localizer.next,
                    onTap: () {
                      if (_formKey.currentState?.validate() == true) {
                        context.navigator.pushNamed(
                          AppRouter.createBusinessAccountRoute,
                          arguments: _hourlyChargeController.text,
                        );
                      }
                    },
                  ).top(16),
                ],
              ),
            ).top(40),
          ],
        ),
      ),
    );
  }
}
