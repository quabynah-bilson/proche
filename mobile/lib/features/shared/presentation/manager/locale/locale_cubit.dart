import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobile/core/di/injection.dart';
import 'package:mobile/core/utils/extensions.dart';
import 'package:mobile/features/shared/domain/repositories/local.storage.dart';
import 'package:shared_utils/shared_utils.dart';

/// cubit for managing locale changes
class LocaleCubit extends Cubit<BlocState> {
  final BuildContext context;
  final _storage = getIt<BaseLocalStorageRepository>();

  LocaleCubit(this.context) : super(BlocState.initialState());

  // gets the locale from storage
  Future<void> getCurrentLocale() async {
    emit(BlocState.loadingState());
    final locale = await _storage.defaultLocale;
    emit(BlocState<String>.successState(data: locale));
  }

  // sets the locale and saves it to storage
  Future<void> setLocale(String languageId) async {
    emit(BlocState.loadingState());
    final locale = Locale(languageId);
    await _storage.setLocale(languageId);
    if (AppLocalizations.delegate.isSupported(locale)) {
      await AppLocalizations.delegate.load(locale);
      emit(BlocState<String>.successState(data: languageId));
    } else {
      emit(BlocState<String>.errorState(
          failure: context.localizer.unsupportedLocale));
    }
  }
}
