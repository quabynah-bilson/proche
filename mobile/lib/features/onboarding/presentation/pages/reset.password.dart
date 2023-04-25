import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile/core/routing/router.dart';
import 'package:mobile/core/utils/extensions.dart';
import 'package:mobile/core/utils/validator.dart';
import 'package:mobile/features/onboarding/presentation/manager/auth/auth_bloc.dart';
import 'package:mobile/generated/assets.dart';
import 'package:mobile/generated/protos/auth.pb.dart';
import 'package:protobuf_google/protobuf_google.dart';
import 'package:shared_utils/shared_utils.dart';

/// reset password flow
class ResetPasswordPage extends StatefulWidget {
  final bool isPublic;

  const ResetPasswordPage({Key? key, required this.isPublic}) : super(key: key);

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final _formKey = GlobalKey<FormState>(),
      _passwordController = TextEditingController(),
      _confirmPasswordController = TextEditingController(),
      _phoneNumberController = TextEditingController(),
      _verifyPhoneNumberBloc = AuthBloc(),
      _authBloc = AuthBloc();
  var _loading = false, _showPasswordEntryField = false;

  @override
  Widget build(BuildContext context) => MultiBlocListener(
        listeners: [
          BlocListener(
            bloc: _authBloc,
            listener: (context, state) {
              if (!mounted) return;

              setState(() => _loading = state is LoadingState);

              if (state is ErrorState<String>) {
                context.showMessageDialog(state.failure);
              }

              if (state is SuccessState<Empty>) {
                context.showMessageDialog(
                  context.localizer.resetPasswordSuccess,
                  showAsError: false,
                  onTap: () =>
                      context.navigator.popUntil((route) => route.isFirst),
                  title: context.localizer.success,
                );
              }
            },
          ),
          BlocListener(
            bloc: _verifyPhoneNumberBloc,
            listener: (context, state) {
              if (!mounted) return;

              setState(() => _loading = state is LoadingState);

              if (state is ErrorState<String>) {
                context.showMessageDialog(state.failure);
              }

              if (state is SuccessState<Account>) {
                var phoneNumber = state.data.phoneNumber;
                if (_showPasswordEntryField) {
                  var password = _passwordController.text.trim();
                  _authBloc.add(ResetPasswordAuthEvent(
                    phoneNumber: phoneNumber,
                    password: password,
                    isPublic: widget.isPublic,
                  ));
                } else {
                  _verifyPhoneNumberBloc.add(
                      SendVerificationCodeAuthEvent(phoneNumber: phoneNumber));
                }
                return;
              }

              if (state is SuccessState<Empty>) _resetPassword();
            },
          ),
        ],
        child: Scaffold(
          appBar: AppBar(
              elevation: 0, backgroundColor: context.colorScheme.background),
          body: LoadingIndicator(
            isLoading: _loading,
            loadingAnimIsAsset: true,
            lottieAnimResource: Assets.animRecoverPassword,
            child: AnimatedListView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              animateType: AnimateType.slideDown,
              children: [
                Lottie.asset(Assets.animRecoverPassword,
                        repeat: false, height: context.height * 0.15)
                    .bottom(20),
                context.localizer.resetPassword
                    .h5(context, weight: FontWeight.bold)
                    .centered(),
                context.localizer.forgotPasswordSubhead
                    .subtitle1(context,
                        emphasis: kEmphasisMedium, alignment: TextAlign.center)
                    .centered(),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppTextField(
                        context.localizer.phoneNumber,
                        controller: _phoneNumberController,
                        validator: (input) =>
                            Validators.validatePhone(context, input),
                        prefixIcon: const Icon(TablerIcons.phone_plus),
                        textFieldType: AppTextFieldType.phone,
                        maxLength: 16,
                        floatLabel: true,
                        enabled: !_loading && !_showPasswordEntryField,
                      ),
                      if (_showPasswordEntryField) ...{
                        AppTextField(
                          context.localizer.password,
                          controller: _passwordController,
                          floatLabel: true,
                          validator: (input) =>
                              Validators.validatePassword(context, input),
                          prefixIcon: const Icon(Icons.password),
                          textFieldType: AppTextFieldType.password,
                          enabled: !_loading,
                        ),
                        AppTextField(
                          context.localizer.confirmPassword,
                          controller: _confirmPasswordController,
                          floatLabel: true,
                          validator: (value) => Validators.validatePassword(
                              context, value, _passwordController.text.trim()),
                          prefixIcon: const Icon(Icons.password),
                          textFieldType: AppTextFieldType.password,
                          enabled: !_loading,
                        ),
                      },
                    ],
                  ),
                ).top(40),
                AppRoundedButton(
                  text: context.localizer.resetPassword,
                  enabled: !_loading,
                  onTap: _validateAndSubmit,
                ).centered(),
              ],
            ),
          ),
        ),
      );

  /// Validate and submit the form
  void _validateAndSubmit() async {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      _formKey.currentState?.save();
      var phoneNumber = _phoneNumberController.text.trim();
      _verifyPhoneNumberBloc
          .add(GetAccountByPhoneNumberAuthEvent(phoneNumber));
    }
  }

  /// Verify phone number and reset password
  void _resetPassword() async {
    var phoneNumber = _phoneNumberController.text.trim();
    var success = await context.navigator
        .pushNamed(AppRouter.phoneVerificationRoute, arguments: phoneNumber);

    if (success is bool && success) {
      setState(() => _showPasswordEntryField = true);
    }
  }
}
