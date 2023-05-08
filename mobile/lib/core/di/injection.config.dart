// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:device_info_plus/device_info_plus.dart' as _i9;
import 'package:flutter_local_notifications/flutter_local_notifications.dart'
    as _i11;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i12;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mobile/core/di/modules.dart' as _i36;
import 'package:mobile/core/network/config.dart' as _i37;
import 'package:mobile/core/network/log.interceptor.dart' as _i14;
import 'package:mobile/core/network/token.interceptor.dart' as _i20;
import 'package:mobile/features/business/data/repositories/business.dart'
    as _i5;
import 'package:mobile/features/business/domain/repositories/business.dart'
    as _i4;
import 'package:mobile/features/event/data/repositories/event.dart' as _i7;
import 'package:mobile/features/event/domain/repositories/event.dart' as _i6;
import 'package:mobile/features/shared/data/repositories/auth.dart' as _i35;
import 'package:mobile/features/shared/data/repositories/local.storage.dart'
    as _i23;
import 'package:mobile/features/shared/data/repositories/media.dart' as _i25;
import 'package:mobile/features/shared/data/repositories/messaging.dart'
    as _i27;
import 'package:mobile/features/shared/data/repositories/posts.dart' as _i29;
import 'package:mobile/features/shared/data/repositories/shared.dart' as _i31;
import 'package:mobile/features/shared/domain/repositories/auth.dart' as _i34;
import 'package:mobile/features/shared/domain/repositories/local.storage.dart'
    as _i22;
import 'package:mobile/features/shared/domain/repositories/media.dart' as _i24;
import 'package:mobile/features/shared/domain/repositories/messaging.dart'
    as _i26;
import 'package:mobile/features/shared/domain/repositories/posts.dart' as _i28;
import 'package:mobile/features/shared/domain/repositories/shared.dart' as _i30;
import 'package:mobile/features/task/data/repositories/task.dart' as _i33;
import 'package:mobile/features/task/domain/repositories/task.dart' as _i32;
import 'package:mobile/generated/protos/auth.pbgrpc.dart' as _i3;
import 'package:mobile/generated/protos/core_shared.pbgrpc.dart' as _i8;
import 'package:mobile/generated/protos/event.pbgrpc.dart' as _i10;
import 'package:mobile/generated/protos/giveaway.pbgrpc.dart' as _i13;
import 'package:mobile/generated/protos/media.pbgrpc.dart' as _i15;
import 'package:mobile/generated/protos/notification.pbgrpc.dart' as _i16;
import 'package:mobile/generated/protos/shared.pbgrpc.dart' as _i17;
import 'package:mobile/generated/protos/sms.pbgrpc.dart' as _i18;
import 'package:mobile/generated/protos/task.pbgrpc.dart' as _i19;
import 'package:mobile/generated/protos/trip.pbgrpc.dart' as _i21;

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
    gh.factory<_i4.BaseBusinessRepository>(
        () => _i5.ProcheBusinessRepository(gh<_i3.AuthServiceClient>()));
    gh.factory<_i6.BaseEventRepository>(() => _i7.ProcheEventRepository());
    gh.factory<_i8.CoreSharedServiceClient>(
        () => networkConfigModule.coreSharedServiceClient);
    gh.factory<_i9.DeviceInfoPlugin>(() => sharedAppModule.deviceInfo);
    gh.factory<_i10.EventServiceClient>(
        () => networkConfigModule.eventServiceClient);
    gh.factory<_i11.FlutterLocalNotificationsPlugin>(
        () => sharedAppModule.notificationPlugin);
    gh.factory<_i12.FlutterSecureStorage>(
        () => persistentStorageModule.localStorage);
    gh.factory<_i13.GiveAwayServiceClient>(
        () => networkConfigModule.giveAwayServiceClient);
    gh.factory<_i14.LogGrpcInterceptor>(() => _i14.LogGrpcInterceptor());
    gh.factory<_i15.MediaServiceClient>(
        () => networkConfigModule.mediaServiceClient);
    gh.factory<_i16.NotificationServiceClient>(
        () => networkConfigModule.notificationServiceClient);
    gh.factory<_i17.SharedServiceClient>(
        () => networkConfigModule.sharedServiceClient);
    gh.factory<_i18.SmsServiceClient>(
        () => networkConfigModule.smsServiceClient);
    await gh.factoryAsync<String>(
      () => sharedAppModule.appVersion,
      instanceName: 'app_version',
      preResolve: true,
    );
    await gh.factoryAsync<String>(
      () => persistentStorageModule.locale,
      instanceName: 'locale',
      preResolve: true,
    );
    await gh.factoryAsync<String>(
      () => persistentStorageModule.accessToken,
      instanceName: 'access_token',
      preResolve: true,
    );
    gh.factory<_i19.TaskServiceClient>(
        () => networkConfigModule.taskServiceClient);
    gh.factory<_i20.TokenGrpcInterceptor>(() => _i20.TokenGrpcInterceptor());
    gh.factory<_i21.TripServiceClient>(
        () => networkConfigModule.tripServiceClient);
    gh.factory<_i22.BaseLocalStorageRepository>(() =>
        _i23.ProcheLocalStorageRepository(gh<_i12.FlutterSecureStorage>()));
    gh.factory<_i24.BaseMediaRepository>(
        () => _i25.ProcheMediaRepository(gh<_i15.MediaServiceClient>()));
    gh.factory<_i26.BaseMessagingRepository>(
        () => _i27.ProcheMessagingRepository(
              client: gh<_i16.NotificationServiceClient>(),
              storage: gh<_i22.BaseLocalStorageRepository>(),
              deviceInfoPlugin: gh<_i9.DeviceInfoPlugin>(),
              flutterLocalNotificationsPlugin:
                  gh<_i11.FlutterLocalNotificationsPlugin>(),
            ));
    gh.factory<_i28.BasePostsRepository>(
        () => _i29.ProchePostsRepository(gh<_i8.CoreSharedServiceClient>()));
    gh.factory<_i30.BaseSharedRepository>(
        () => _i31.ProcheSharedRepository(gh<_i17.SharedServiceClient>()));
    gh.factory<_i32.BaseTaskRepository>(
        () => _i33.ProcheTaskRepository(gh<_i19.TaskServiceClient>()));
    gh.factory<_i34.BaseAuthRepository>(() => _i35.ProcheAuthRepository(
          authClient: gh<_i3.AuthServiceClient>(),
          smsClient: gh<_i18.SmsServiceClient>(),
          mediaClient: gh<_i15.MediaServiceClient>(),
          storage: gh<_i22.BaseLocalStorageRepository>(),
          messaging: gh<_i26.BaseMessagingRepository>(),
        ));
    return this;
  }
}

class _$PersistentStorageModule extends _i36.PersistentStorageModule {}

class _$SharedAppModule extends _i36.SharedAppModule {}

class _$NetworkConfigModule extends _i37.NetworkConfigModule {}
