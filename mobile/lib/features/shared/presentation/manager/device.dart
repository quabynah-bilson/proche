import 'package:bloc/bloc.dart';
import 'package:mobile/core/di/injection.dart';
import 'package:shared_utils/shared_utils.dart';

/// device info cubit for getting app version etc
class DeviceInfoCubit extends Cubit<BlocState> {
  DeviceInfoCubit() : super(BlocState.initialState());

  Future<void> getAppVersion() async {
    emit(BlocState.loadingState());
    try {
      final appVersion = getIt<String>(instanceName: 'app_version');
      emit(BlocState<String>.successState(data: appVersion));
    } catch (e) {
      emit(BlocState<String>.errorState(failure: 'n/a'));
    }
  }
}
