import 'package:bloc/bloc.dart';
import 'package:mobile/core/di/injection.dart';
import 'package:mobile/features/business/domain/repositories/business.dart';
import 'package:mobile/generated/protos/auth.pb.dart';
import 'package:protobuf_google/protobuf_google.dart';
import 'package:shared_utils/shared_utils.dart';

part 'business_event.dart';

class BusinessBloc extends Bloc<BusinessEvent, BlocState> {
  final _repo = getIt<BaseBusinessRepository>();

  BusinessBloc() : super(BlocState.initialState()) {
    on<RegisterBusinessEvent>((event, emit) async {
      emit(BlocState.loadingState());
      var either = await _repo.registerBusiness(
          specialization: event.specialization,
          hourlyCharge: event.hourlyCharge);
      either.fold(
        (l) => emit(BlocState<BusinessAccount>.successState(data: l)),
        (r) => emit(BlocState<String>.errorState(failure: r)),
      );
    });

    on<GetBusinessEvent>((event, emit) async {
      emit(BlocState.loadingState());
      var either = await _repo.getBusinessAccount(event.id);
      either.fold(
        (l) => emit(BlocState<BusinessAccount>.successState(data: l)),
        (r) => emit(BlocState<String>.errorState(failure: r)),
      );
    });

    on<GetCurrentUserBusinessEvent>((event, emit) async {
      emit(BlocState.loadingState());
      var either = await _repo.getBusinessAccountForCurrentUser();
      either.fold(
        (l) => emit(BlocState<BusinessAccount>.successState(data: l)),
        (r) => emit(BlocState<String>.errorState(failure: r)),
      );
    });

    on<UpdateBusinessEvent>((event, emit) async {
      emit(BlocState.loadingState());
      var either = await _repo.updateBusinessAccount(event.account);
      either.fold(
        (l) => emit(BlocState<BusinessAccount>.successState(data: l)),
        (r) => emit(BlocState<String>.errorState(failure: r)),
      );
    });

    on<DeleteBusinessEvent>((event, emit) async {
      emit(BlocState.loadingState());
      var either = await _repo.deleteBusinessAccount(event.id);
      either.fold(
        (l) => emit(BlocState<Empty>.successState(data: l)),
        (r) => emit(BlocState<String>.errorState(failure: r)),
      );
    });
  }
}
