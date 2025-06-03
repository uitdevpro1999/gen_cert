// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import 'core/local_storage/share_preferences.dart' as _i138;
import 'core/managers/analytics/google_analytics_manager.dart' as _i169;
import 'core/managers/notifications/notifications_manager.dart' as _i763;
import 'core/network/network_provider/network_provider.dart' as _i987;
import 'core/routes/app_navigator_observer.dart' as _i1024;
import 'features/app/presentation/bloc/app_cubit.dart' as _i393;
import 'features/auth/data/datasources/auth_remote_data_sources.dart' as _i375;
import 'features/auth/data/repositories/auth_repository_impl.dart' as _i111;
import 'features/auth/domain/repository/auth_repository.dart' as _i279;
import 'features/auth/domain/usecases/user_login_usecase.dart' as _i1037;
import 'features/auth/presentation/login/bloc/login_cubit.dart' as _i301;
import 'features/main/presentation/bloc/main_cubit.dart' as _i419;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> injection_container({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    final networkProvider = _$NetworkProvider();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i138.AppPreferences>(
        () => _i138.AppPreferences(gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i987.AppNetworkClient>(() => _i987.AppNetworkClient());
    gh.singleton<_i361.Dio>(() => networkProvider.service());
    gh.lazySingleton<_i169.GoogleAnalyticsManager>(
        () => _i169.GoogleAnalyticsManager());
    gh.lazySingleton<_i763.NotificationsManager>(
        () => _i763.NotificationsManager());
    gh.lazySingleton<_i1024.AppNavigatorObserver>(
        () => _i1024.AppNavigatorObserver());
    gh.lazySingleton<_i419.MainCubit>(() => _i419.MainCubit());
    gh.lazySingleton<_i393.AppCubit>(
        () => _i393.AppCubit(gh<_i138.AppPreferences>()));
    gh.factory<_i375.AuthRemoteDataSources>(
        () => _i375.AuthRemoteDataSourcesImpl(gh<_i361.Dio>()));
    gh.lazySingleton<_i279.AuthRepository>(
        () => _i111.AuthRepositoryImpl(gh<_i375.AuthRemoteDataSources>()));
    gh.factory<_i1037.UserLoginUseCase>(
        () => _i1037.UserLoginUseCase(gh<_i279.AuthRepository>()));
    gh.factory<_i301.LoginCubit>(
        () => _i301.LoginCubit(gh<_i1037.UserLoginUseCase>()));
    return this;
  }
}

class _$RegisterModule extends _i138.RegisterModule {}

class _$NetworkProvider extends _i987.NetworkProvider {}
