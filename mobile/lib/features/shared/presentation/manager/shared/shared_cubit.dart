import 'package:bloc/bloc.dart';
import 'package:mobile/core/di/injection.dart';
import 'package:mobile/features/shared/domain/repositories/shared.dart';
import 'package:mobile/generated/protos/shared.pb.dart';
import 'package:shared_utils/shared_utils.dart';

class SharedCubit extends Cubit<BlocState> {
  final _repository = getIt<BaseSharedRepository>();

  SharedCubit() : super(BlocState.initialState());

  Future<void> checkForUpdates() async {
    emit(BlocState.loadingState());
    var either = await _repository.checkForUpdates();
    either.fold(
      (l) => emit(BlocState<AppVersion>.successState(data: l)),
      (r) => emit(BlocState<String>.errorState(failure: r)),
    );
  }
}
