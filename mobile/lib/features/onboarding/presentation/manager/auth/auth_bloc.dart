import 'package:bloc/bloc.dart';
import 'package:mobile/core/di/injection.dart';
import 'package:mobile/core/utils/session.dart';
import 'package:mobile/features/shared/domain/repositories/auth.dart';
import 'package:mobile/generated/protos/auth.pb.dart';
import 'package:shared_utils/shared_utils.dart';

part 'auth_event.dart';

class AuthBloc extends Bloc<AuthEvent, BlocState> {
  final _repo = getIt<BaseAuthRepository>();

  AuthBloc() : super(BlocState.initialState()) {
    on<LoginAuthEvent>((event, emit) async {
      emit(BlocState.loadingState());
      var either = await _repo.login(
        phoneNumber: event.phoneNumber,
        password: event.password,
        countryId: event.countryId,
      );
      either.fold(
        (l) => emit(BlocState<void>.successState(data: null)),
        (r) => emit(BlocState<String>.errorState(failure: r)),
      );
    });

    on<UpdateAccountAuthEvent>((event, emit) async {
      emit(BlocState.loadingState());
      var either = await _repo.updateAccount(event.account);
      either.fold(
        (l) => emit(BlocState<Account>.successState(data: l)),
        (r) => emit(BlocState<String>.errorState(failure: r)),
      );
    });

    on<VerifyPasswordAuthEvent>((event, emit) async {
      emit(BlocState.loadingState());
      var either = await _repo.verifyPassword(event.password);
      either.fold(
        (l) => emit(BlocState<void>.successState(data: null)),
        (r) => emit(BlocState<String>.errorState(failure: r)),
      );
    });

    on<LogoutAuthEvent>((event, emit) async {
      emit(BlocState.loadingState());
      var either = await _repo.logout();
      either.fold(
        (l) => emit(BlocState<void>.successState(data: null)),
        (r) => emit(BlocState<String>.errorState(failure: r)),
      );
    });

    on<RegisterAuthEvent>((event, emit) async {
      emit(BlocState.loadingState());
      var either = await _repo.register(
        phoneNumber: event.phoneNumber,
        password: event.password,
        displayName: event.displayName,
        avatar: event.avatar,
        countryId: event.countryId,
      );
      either.fold(
        (l) => emit(BlocState<void>.successState(data: null)),
        (r) => emit(BlocState<String>.errorState(failure: r)),
      );
    });

    on<GetAccountByPhoneNumberAuthEvent>((event, emit) async {
      emit(BlocState.loadingState());
      var either = await _repo.getAccountByPhoneNumber(event.phoneNumber);
      either.fold(
        (l) => emit(BlocState<Account>.successState(data: l)),
        (r) => emit(BlocState<String>.errorState(failure: r)),
      );
    });
    on<GetAccountByIdAuthEvent>((event, emit) async {
      emit(BlocState.loadingState());
      var either = await _repo.getAccountById(event.id);
      either.fold(
        (l) => emit(BlocState<Account>.successState(data: l)),
        (r) => emit(BlocState<String>.errorState(failure: r)),
      );
    });

    on<ResetPasswordAuthEvent>((event, emit) async {
      emit(BlocState.loadingState());
      var either = await _repo.resetPassword(
        phoneNumber: event.phoneNumber,
        password: event.password,
        isPublic: event.isPublic,
      );
      either.fold(
        (l) => emit(BlocState<void>.successState(data: null)),
        (r) => emit(BlocState<String>.errorState(failure: r)),
      );
    });

    on<SendVerificationCodeAuthEvent>((event, emit) async {
      emit(BlocState.loadingState());
      var either = await _repo.sendVerificationCode(event.phoneNumber);
      either.fold(
        (l) => emit(BlocState<void>.successState(data: null)),
        (r) => emit(BlocState<String>.errorState(failure: r)),
      );
    });

    on<VerifyPhoneNumberAuthEvent>((event, emit) async {
      emit(BlocState.loadingState());
      var either = await _repo.verifyPhoneNumber(
          phoneNumber: event.phoneNumber, code: event.code);
      either.fold(
        (l) => emit(BlocState<void>.successState(data: null)),
        (r) => emit(BlocState<String>.errorState(failure: r)),
      );
    });

    on<GetPublicAccessTokenAuthEvent>((event, emit) async {
      emit(BlocState.loadingState());
      var either = await _repo.getPublicAccessToken();
      UserSession.kIsLoggedIn = false;
      either.fold(
        (l) => emit(BlocState<void>.successState(data: null)),
        (r) => emit(BlocState<String>.errorState(failure: r)),
      );
    });

    on<GetReferralCodeAuthEvent>((event, emit) async {
      emit(BlocState.loadingState());
      var either = await _repo.getReferralCode();
      either.fold(
        (l) => emit(BlocState<String>.successState(data: l)),
        (r) => emit(BlocState<String>.errorState(failure: r)),
      );
    });

    on<GetCurrentAccountAuthEvent>((event, emit) async {
      emit(BlocState.loadingState());
      var either = await _repo.getCurrentAccount();
      either.fold(
        (l) => emit(BlocState<Account>.successState(data: l)),
        (r) => emit(BlocState<String>.errorState(failure: r)),
      );
    });

    on<GetCountriesAuthEvent>((event, emit) async {
      emit(BlocState.loadingState());
      var either = await _repo.getCountries();
      either.fold(
        (l) => emit(BlocState<List<Country>>.successState(data: l)),
        (r) => emit(BlocState<String>.errorState(failure: r)),
      );
    });

    on<GetCountryByIdAuthEvent>((event, emit) async {
      emit(BlocState.loadingState());
      var either = await _repo.getCountryById(event.id);
      either.fold(
        (l) => emit(BlocState<Country>.successState(data: l)),
        (r) => emit(BlocState<String>.errorState(failure: r)),
      );
    });
  }
}
