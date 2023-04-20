// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mobile/core/di/modules.dart' as _i18;
import 'package:mobile/core/network/config.dart' as _i19;
import 'package:mobile/core/network/log.interceptor.dart' as _i7;
import 'package:mobile/core/network/token.interceptor.dart' as _i10;
import 'package:mobile/features/shared/data/repositories/auth.dart' as _i17;
import 'package:mobile/features/shared/data/repositories/customer.dart' as _i13;
import 'package:mobile/features/shared/data/repositories/local.storage.dart'
    as _i15;
import 'package:mobile/features/shared/domain/repositories/auth.dart' as _i16;
import 'package:mobile/features/shared/domain/repositories/customer.dart'
    as _i12;
import 'package:mobile/features/shared/domain/repositories/local.storage.dart'
    as _i14;
import 'package:mobile/generated/protos/auth.pbgrpc.dart' as _i3;
import 'package:mobile/generated/protos/event.pbgrpc.dart' as _i4;
import 'package:mobile/generated/protos/giveaway.pbgrpc.dart' as _i6;
import 'package:mobile/generated/protos/shared.pbgrpc.dart' as _i8;
import 'package:mobile/generated/protos/task.pbgrpc.dart' as _i9;
import 'package:mobile/generated/protos/trip.pbgrpc.dart' as _i11;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkConfigModule = _$NetworkConfigModule();
    final persistentStorageModule = _$PersistentStorageModule();
    final sharedAppModule = _$SharedAppModule();
    gh.factory<_i3.AuthServiceClient>(
        () => networkConfigModule.authServiceClient);
    gh.factory<_i4.EventServiceClient>(
        () => networkConfigModule.eventServiceClient);
    gh.factory<_i5.FlutterSecureStorage>(
        () => persistentStorageModule.localStorage);
    gh.factory<_i6.GiveAwayServiceClient>(
        () => networkConfigModule.giveAwayServiceClient);
    gh.factory<_i7.LogGrpcInterceptor>(() => _i7.LogGrpcInterceptor());
    gh.factory<_i8.SharedServiceClient>(
        () => networkConfigModule.sharedServiceClient);
    await gh.factoryAsync<String>(
      () => persistentStorageModule.accessToken,
      instanceName: 'access_token',
      preResolve: true,
    );
    await gh.factoryAsync<String>(
      () => persistentStorageModule.locale,
      instanceName: 'locale',
      preResolve: true,
    );
    await gh.factoryAsync<String>(
      () => sharedAppModule.appVersion,
      instanceName: 'app_version',
      preResolve: true,
    );
    gh.factory<_i9.TaskServiceClient>(
        () => networkConfigModule.taskServiceClient);
    gh.factory<_i10.TokenGrpcInterceptor>(() => _i10.TokenGrpcInterceptor());
    gh.factory<_i11.TripServiceClient>(
        () => networkConfigModule.tripServiceClient);
    gh.factory<_i12.BaseEventRepository>(
        () => _i13.ProcheEventRepository(gh<_i4.EventServiceClient>()));
    gh.factory<_i14.BaseLocalStorageRepository>(() =>
        _i15.ProcheLocalStorageRepository(gh<_i5.FlutterSecureStorage>()));
    gh.factory<_i16.BaseAuthRepository>(() => _i17.ProcheAuthRepository(
          client: gh<_i3.AuthServiceClient>(),
          storage: gh<_i14.BaseLocalStorageRepository>(),
        ));
    return this;
  }
}

class _$PersistentStorageModule extends _i18.PersistentStorageModule {}

class _$SharedAppModule extends _i18.SharedAppModule {}

class _$NetworkConfigModule extends _i19.NetworkConfigModule {}
