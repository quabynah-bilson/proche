import 'package:bloc/bloc.dart';
import 'package:mobile/core/di/injection.dart';
import 'package:mobile/features/shared/domain/repositories/local.storage.dart';
import 'package:shared_utils/shared_utils.dart';

class ThemeCubit extends Cubit<BlocState> {
  final _storage = getIt<BaseLocalStorageRepository>();

  ThemeCubit() : super(BlocState.initialState());

  Future<void> getCurrentThemeMode() async {
    emit(BlocState.loadingState());
    final themeMode = await _storage.currentThemeMode;
    emit(BlocState<int>.successState(data: themeMode));
  }

  Future<void> setCurrentThemeMode(int themeMode) async {
    emit(BlocState.loadingState());
    await _storage.setCurrentThemeMode(themeMode);
    emit(BlocState<int>.successState(data: themeMode));
  }
}
