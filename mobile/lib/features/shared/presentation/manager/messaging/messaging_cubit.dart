import 'package:bloc/bloc.dart';
import 'package:mobile/core/di/injection.dart';
import 'package:mobile/features/shared/domain/repositories/messaging.dart';
import 'package:shared_utils/shared_utils.dart';

class MessagingCubit extends Cubit<BlocState> {
  final _repository = getIt<BaseMessagingRepository>();

  MessagingCubit() : super(BlocState.initialState());

  Future<void> subscribeToNotifications() async {
    emit(BlocState.loadingState());
    await _repository.subscribeToNotifications();
    emit(BlocState<void>.successState(data: null));
  }

  Future<void> unsubscribeFromNotifications() async {
    emit(BlocState.loadingState());
    await _repository.unsubscribeFromNotifications();
    emit(BlocState<void>.successState(data: null));
  }
}
