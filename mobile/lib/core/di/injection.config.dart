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
import 'package:mobile/core/di/modules.dart' as _i17;
import 'package:mobile/core/network/config.dart' as _i18;
import 'package:mobile/core/network/token.interceptor.dart' as _i9;
import 'package:mobile/features/shared/data/repositories/auth.dart' as _i16;
import 'package:mobile/features/shared/data/repositories/customer.dart' as _i12;
import 'package:mobile/features/shared/data/repositories/local.storage.dart'
    as _i14;
import 'package:mobile/features/shared/domain/repositories/auth.dart' as _i15;
import 'package:mobile/features/shared/domain/repositories/customer.dart'
    as _i11;
import 'package:mobile/features/shared/domain/repositories/local.storage.dart'
    as _i13;
import 'package:mobile/generated/protos/auth.pbgrpc.dart' as _i3;
import 'package:mobile/generated/protos/event.pbgrpc.dart' as _i4;
import 'package:mobile/generated/protos/giveaway.pbgrpc.dart' as _i6;
import 'package:mobile/generated/protos/shared.pbgrpc.dart' as _i7;
import 'package:mobile/generated/protos/task.pbgrpc.dart' as _i8;
import 'package:mobile/generated/protos/trip.pbgrpc.dart' as _i10;

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
    gh.factory<_i3.AuthServiceClient>(
        () => networkConfigModule.authServiceClient);
    gh.factory<_i4.EventServiceClient>(
        () => networkConfigModule.eventServiceClient);
    gh.factory<_i5.FlutterSecureStorage>(
        () => persistentStorageModule.localStorage);
    gh.factory<_i6.GiveAwayServiceClient>(
        () => networkConfigModule.giveAwayServiceClient);
    gh.factory<_i7.SharedServiceClient>(
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
    gh.factory<_i8.TaskServiceClient>(
        () => networkConfigModule.taskServiceClient);
    gh.factory<_i9.TokenGrpcInterceptor>(
        () => _i9.TokenGrpcInterceptor(gh<String>(instanceName: 'locale')));
    gh.factory<_i10.TripServiceClient>(
        () => networkConfigModule.tripServiceClient);
    gh.factory<_i11.BaseEventRepository>(
        () => _i12.ProcheEventRepository(gh<_i4.EventServiceClient>()));
    gh.factory<_i13.BaseLocalStorageRepository>(() =>
        _i14.ProcheLocalStorageRepository(gh<_i5.FlutterSecureStorage>()));
    gh.factory<_i15.BaseAuthRepository>(() => _i16.ProcheAuthRepository(
          client: gh<_i3.AuthServiceClient>(),
          storage: gh<_i13.BaseLocalStorageRepository>(),
        ));
    return this;
  }
}

class _$PersistentStorageModule extends _i17.PersistentStorageModule {}

class _$NetworkConfigModule extends _i18.NetworkConfigModule {}
