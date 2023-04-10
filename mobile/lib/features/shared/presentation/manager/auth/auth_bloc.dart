import 'package:bloc/bloc.dart';
import 'package:mobile/core/di/injection.dart';
import 'package:mobile/features/shared/domain/repositories/auth.dart';
import 'package:shared_utils/shared_utils.dart';

part 'auth_event.dart';

class AuthBloc extends Bloc<AuthEvent, BlocState> {
  final _repo = getIt<BaseAuthRepository>();

  AuthBloc() : super(BlocState.initialState()) {
    on<AuthEvent>((event, emit) async {
      emit(BlocState.loadingState());
      // todo: handle implementation
    });
  }
}
