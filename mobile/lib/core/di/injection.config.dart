// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:device_info_plus/device_info_plus.dart' as _i4;
import 'package:firebase_messaging/firebase_messaging.dart' as _i6;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mobile/core/di/modules.dart' as _i26;
import 'package:mobile/core/network/config.dart' as _i27;
import 'package:mobile/core/network/log.interceptor.dart' as _i9;
import 'package:mobile/core/network/token.interceptor.dart' as _i12;
import 'package:mobile/features/event/data/repositories/event.dart' as _i15;
import 'package:mobile/features/event/domain/repositories/event.dart' as _i14;
import 'package:mobile/features/shared/data/repositories/auth.dart' as _i25;
import 'package:mobile/features/shared/data/repositories/local.storage.dart'
    as _i17;
import 'package:mobile/features/shared/data/repositories/messaging.dart'
    as _i19;
import 'package:mobile/features/shared/data/repositories/shared.dart' as _i21;
import 'package:mobile/features/shared/domain/repositories/auth.dart' as _i24;
import 'package:mobile/features/shared/domain/repositories/local.storage.dart'
    as _i16;
import 'package:mobile/features/shared/domain/repositories/messaging.dart'
    as _i18;
import 'package:mobile/features/shared/domain/repositories/shared.dart' as _i20;
import 'package:mobile/features/task/data/repositories/task.dart' as _i23;
import 'package:mobile/features/task/domain/repositories/task.dart' as _i22;
import 'package:mobile/generated/protos/auth.pbgrpc.dart' as _i3;
import 'package:mobile/generated/protos/event.pbgrpc.dart' as _i5;
import 'package:mobile/generated/protos/giveaway.pbgrpc.dart' as _i8;
import 'package:mobile/generated/protos/shared.pbgrpc.dart' as _i10;
import 'package:mobile/generated/protos/task.pbgrpc.dart' as _i11;
import 'package:mobile/generated/protos/trip.pbgrpc.dart' as _i13;

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
    final sharedAppModule = _$SharedAppModule();
    final firebaseAppModule = _$FirebaseAppModule();
    final persistentStorageModule = _$PersistentStorageModule();
    gh.factory<_i3.AuthServiceClient>(
        () => networkConfigModule.authServiceClient);
    gh.factory<_i4.DeviceInfoPlugin>(() => sharedAppModule.deviceInfo);
    gh.factory<_i5.EventServiceClient>(
        () => networkConfigModule.eventServiceClient);
    gh.factory<_i6.FirebaseMessaging>(() => firebaseAppModule.messaging);
    gh.factory<_i7.FlutterSecureStorage>(
        () => persistentStorageModule.localStorage);
    gh.factory<_i8.GiveAwayServiceClient>(
        () => networkConfigModule.giveAwayServiceClient);
    gh.factory<_i9.LogGrpcInterceptor>(() => _i9.LogGrpcInterceptor());
    gh.factory<_i10.SharedServiceClient>(
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
    gh.factory<_i11.TaskServiceClient>(
        () => networkConfigModule.taskServiceClient);
    gh.factory<_i12.TokenGrpcInterceptor>(() => _i12.TokenGrpcInterceptor());
    gh.factory<_i13.TripServiceClient>(
        () => networkConfigModule.tripServiceClient);
    gh.factory<_i14.BaseEventRepository>(
        () => _i15.ProcheEventRepository(gh<_i5.EventServiceClient>()));
    gh.factory<_i16.BaseLocalStorageRepository>(() =>
        _i17.ProcheLocalStorageRepository(gh<_i7.FlutterSecureStorage>()));
    gh.factory<_i18.BaseMessagingRepository>(
        () => _i19.FirebaseMessagingRepository(
              messaging: gh<_i6.FirebaseMessaging>(),
              deviceInfoPlugin: gh<_i4.DeviceInfoPlugin>(),
            ));
    gh.factory<_i20.BaseSharedRepository>(
        () => _i21.ProcheSharedRepository(gh<_i10.SharedServiceClient>()));
    gh.factory<_i22.BaseTaskRepository>(
        () => _i23.ProcheTaskRepository(gh<_i11.TaskServiceClient>()));
    gh.factory<_i24.BaseAuthRepository>(() => _i25.ProcheAuthRepository(
          client: gh<_i3.AuthServiceClient>(),
          storage: gh<_i16.BaseLocalStorageRepository>(),
          messaging: gh<_i18.BaseMessagingRepository>(),
        ));
    return this;
  }
}

class _$PersistentStorageModule extends _i26.PersistentStorageModule {}

class _$SharedAppModule extends _i26.SharedAppModule {}

class _$FirebaseAppModule extends _i26.FirebaseAppModule {}

class _$NetworkConfigModule extends _i27.NetworkConfigModule {}
