// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i4;
import 'package:supabase_flutter/supabase_flutter.dart' as _i5;

import '../core/data/clients/database/client_database.dart' as _i6;
import '../core/data/clients/database/supabase/supabase_client.dart' as _i7;
import '../core/data/clients/http/client_http.dart' as _i8;
import '../core/data/clients/http/dio_http_client_impl.dart' as _i9;
import '../core/data/clients/local_storage/local_storage.dart' as _i10;
import '../core/data/clients/local_storage/shared_preferences_service.dart'
    as _i11;
import '../modules/auth/data/datasources/auth_datasource.dart' as _i14;
import '../modules/auth/data/datasources/auth_datasource_impl.dart' as _i15;
import '../modules/auth/data/repositories/auth_repository_impl.dart' as _i17;
import '../modules/auth/domain/repositories/auth_repository.dart' as _i16;
import '../modules/auth/domain/usecases/signup_user.dart' as _i18;
import '../modules/user/data/datasources/local/shared_prefs_local_datasource_impl.dart'
    as _i13;
import '../modules/user/data/datasources/local/user_local_datasource.dart'
    as _i12;
import 'dependency_injection.dart' as _i19;

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
    final registerModule = _$RegisterModule();
    gh.factory<_i3.Dio>(() => registerModule.dio);
    await gh.factoryAsync<_i4.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    await gh.factoryAsync<_i5.SupabaseClient>(
      () => registerModule.supabase,
      preResolve: true,
    );
    gh.factory<_i6.ClientDataBase>(
        () => _i7.SupaBaseService(supa: gh<_i5.SupabaseClient>()));
    gh.singleton<_i8.ClientHttp>(_i9.DioClientHttpImpl(dio: gh<_i3.Dio>()));
    gh.factory<_i10.LocalStorage>(() => _i11.SharedPreferencesService(
        preferences: gh<_i4.SharedPreferences>()));
    gh.factory<_i12.UserLocalDataSource>(() =>
        _i13.SharedPrefsUserLocalDatasourceImpl(
            localStorage: gh<_i10.LocalStorage>()));
    gh.factory<_i14.AuthDataSource>(() =>
        _i15.AuthDataSourceImpl(clientDataBase: gh<_i6.ClientDataBase>()));
    gh.factory<_i16.AuthRepository>(() =>
        _i17.AuthRepositoryImpl(authDataSource: gh<_i14.AuthDataSource>()));
    gh.factory<_i18.SignUpUseCase>(
        () => _i18.SignUpUseCase(authRepository: gh<_i16.AuthRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i19.RegisterModule {}
