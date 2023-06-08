import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile/core/utils/extensions.dart';
import 'package:mobile/core/utils/validator.dart';
import 'package:mobile/features/onboarding/presentation/manager/auth/auth_bloc.dart';
import 'package:mobile/generated/assets.dart';
import 'package:pinput/pinput.dart';
import 'package:protobuf_google/protobuf_google.dart';
import 'package:shared_utils/shared_utils.dart';

/// phone number verification flow
class PhoneNumberVerificationPage extends StatefulWidget {
  final String phoneNumber;

  const PhoneNumberVerificationPage({Key? key, required this.phoneNumber})
      : super(key: key);

  @override
  State<PhoneNumberVerificationPage> createState() =>
      _PhoneNumberVerificationPageState();
}

class _PhoneNumberVerificationPageState
    extends State<PhoneNumberVerificationPage> {
  late final _authBloc = AuthBloc(),
      _formKey = GlobalKey<FormState>(),
      _pinCodeController = TextEditingController();

  var _loading = false;

  // verification code validation and submission
  Widget get _buildPinInputUI {
    final defaultPinTheme = PinTheme(
      textStyle: context.theme.textTheme.titleLarge
          ?.copyWith(color: context.colorScheme.secondary),
      decoration: BoxDecoration(
        color: context.colorScheme.secondary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      constraints: BoxConstraints(
        minWidth: context.width / 8,
        minHeight: context.width / 8,
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
        border: Border.all(color: context.colorScheme.primary),
        borderRadius: BorderRadius.circular(8));

    final submittedPinTheme = defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration
            ?.copyWith(color: context.theme.disabledColor));
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Pinput(
          defaultPinTheme: defaultPinTheme,
          focusedPinTheme: focusedPinTheme,
          submittedPinTheme: submittedPinTheme,
          enabled: !_loading,
          autofocus: true,
          controller: _pinCodeController,
          closeKeyboardWhenCompleted: true,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
          length: 6,
          validator: (input) => Validators.validateAuthCode(context, input),
          // androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsRetrieverApi,
          pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
          showCursor: true,
          onCompleted: (_) => _validateVerificationAuthCode(),
        ).top(24),
        AppRoundedButton(
          text: 'Verify auth code',
          icon: TablerIcons.shield_check,
          enabled: !_loading,
          onTap: _validateVerificationAuthCode,
        ).top(40),
      ],
    );
  }

  @override
  Widget build(BuildContext context) => BlocConsumer(
        bloc: _authBloc,
        listener: (_, state) {
          if (!mounted) return;

          setState(() => _loading = state is LoadingState);

          if (state is ErrorState<String>) {
            _pinCodeController.clear();
            context.showMessageDialog(state.failure);
          }

          if (state is SuccessState<Empty>) {
            context.navigator.pop(true);
          }
        },
        builder: (_, state) => Scaffold(
          appBar: AppBar(backgroundColor: context.colorScheme.background),
          body: SafeArea(
            bottom: false,
            child: LoadingIndicator(
              lottieAnimResource: Assets.animLoading,
              isLoading: _loading,
              loadingAnimIsAsset: true,
              child: Form(
                key: _formKey,
                child: AnimatedListView(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  animateType: AnimateType.slideDown,
                  children: [
                    Lottie.asset(Assets.animPhoneVerification,
                            repeat: false, height: context.height * 0.15)
                        .bottom(20),
                    'Verify your phone number'
                        .h6(context, weight: FontWeight.bold)
                        .centered(),
                    'A verification code was sent to your device'
                        .subtitle1(context)
                        .centered()
                        .bottom(12),
                    _buildPinInputUI,
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  void _validateVerificationAuthCode() {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      _formKey.currentState?.save();
      _authBloc.add(VerifyPhoneNumberAuthEvent(
          phoneNumber: widget.phoneNumber,
          code: _pinCodeController.text.trim()));
    }
  }
}
