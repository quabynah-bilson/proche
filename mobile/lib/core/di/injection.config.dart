// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:device_info_plus/device_info_plus.dart' as _i4;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mobile/core/di/modules.dart' as _i27;
import 'package:mobile/core/network/config.dart' as _i28;
import 'package:mobile/core/network/log.interceptor.dart' as _i8;
import 'package:mobile/core/network/token.interceptor.dart' as _i13;
import 'package:mobile/features/event/data/repositories/event.dart' as _i16;
import 'package:mobile/features/event/domain/repositories/event.dart' as _i15;
import 'package:mobile/features/shared/data/repositories/auth.dart' as _i26;
import 'package:mobile/features/shared/data/repositories/local.storage.dart'
    as _i18;
import 'package:mobile/features/shared/data/repositories/messaging.dart'
    as _i20;
import 'package:mobile/features/shared/data/repositories/shared.dart' as _i22;
import 'package:mobile/features/shared/domain/repositories/auth.dart' as _i25;
import 'package:mobile/features/shared/domain/repositories/local.storage.dart'
    as _i17;
import 'package:mobile/features/shared/domain/repositories/messaging.dart'
    as _i19;
import 'package:mobile/features/shared/domain/repositories/shared.dart' as _i21;
import 'package:mobile/features/task/data/repositories/task.dart' as _i24;
import 'package:mobile/features/task/domain/repositories/task.dart' as _i23;
import 'package:mobile/generated/protos/auth.pbgrpc.dart' as _i3;
import 'package:mobile/generated/protos/event.pbgrpc.dart' as _i5;
import 'package:mobile/generated/protos/giveaway.pbgrpc.dart' as _i7;
import 'package:mobile/generated/protos/notification.pbgrpc.dart' as _i9;
import 'package:mobile/generated/protos/shared.pbgrpc.dart' as _i10;
import 'package:mobile/generated/protos/sms.pbgrpc.dart' as _i11;
import 'package:mobile/generated/protos/task.pbgrpc.dart' as _i12;
import 'package:mobile/generated/protos/trip.pbgrpc.dart' as _i14;

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
    final persistentStorageModule = _$PersistentStorageModule();
    gh.factory<_i3.AuthServiceClient>(
        () => networkConfigModule.authServiceClient);
    gh.factory<_i4.DeviceInfoPlugin>(() => sharedAppModule.deviceInfo);
    gh.factory<_i5.EventServiceClient>(
        () => networkConfigModule.eventServiceClient);
    gh.factory<_i6.FlutterSecureStorage>(
        () => persistentStorageModule.localStorage);
    gh.factory<_i7.GiveAwayServiceClient>(
        () => networkConfigModule.giveAwayServiceClient);
    gh.factory<_i8.LogGrpcInterceptor>(() => _i8.LogGrpcInterceptor());
    gh.factory<_i9.NotificationServiceClient>(
        () => networkConfigModule.notificationServiceClient);
    gh.factory<_i10.SharedServiceClient>(
        () => networkConfigModule.sharedServiceClient);
    gh.factory<_i11.SmsServiceClient>(
        () => networkConfigModule.smsServiceClient);
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
    gh.factory<_i12.TaskServiceClient>(
        () => networkConfigModule.taskServiceClient);
    gh.factory<_i13.TokenGrpcInterceptor>(() => _i13.TokenGrpcInterceptor());
    gh.factory<_i14.TripServiceClient>(
        () => networkConfigModule.tripServiceClient);
    gh.factory<_i15.BaseEventRepository>(
        () => _i16.ProcheEventRepository(gh<_i5.EventServiceClient>()));
    gh.factory<_i17.BaseLocalStorageRepository>(() =>
        _i18.ProcheLocalStorageRepository(gh<_i6.FlutterSecureStorage>()));
    gh.factory<_i19.BaseMessagingRepository>(
        () => _i20.FirebaseMessagingRepository(
              client: gh<_i9.NotificationServiceClient>(),
              storage: gh<_i17.BaseLocalStorageRepository>(),
              deviceInfoPlugin: gh<_i4.DeviceInfoPlugin>(),
            ));
    gh.factory<_i21.BaseSharedRepository>(
        () => _i22.ProcheSharedRepository(gh<_i10.SharedServiceClient>()));
    gh.factory<_i23.BaseTaskRepository>(
        () => _i24.ProcheTaskRepository(gh<_i12.TaskServiceClient>()));
    gh.factory<_i25.BaseAuthRepository>(() => _i26.ProcheAuthRepository(
          authClient: gh<_i3.AuthServiceClient>(),
          smsClient: gh<_i11.SmsServiceClient>(),
          storage: gh<_i17.BaseLocalStorageRepository>(),
          messaging: gh<_i19.BaseMessagingRepository>(),
        ));
    return this;
  }
}

class _$PersistentStorageModule extends _i27.PersistentStorageModule {}

class _$SharedAppModule extends _i27.SharedAppModule {}

class _$NetworkConfigModule extends _i28.NetworkConfigModule {}
