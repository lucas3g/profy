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
import 'package:supabase_flutter/supabase_flutter.dart' as _i7;

import '../core/data/clients/database/client_database.dart' as _i8;
import '../core/data/clients/database/supabase/supabase_client.dart' as _i6;
import '../core/data/clients/http/client_http.dart' as _i9;
import '../core/data/clients/http/dio_http_client_impl.dart' as _i10;
import '../core/data/clients/local_storage/local_storage.dart' as _i11;
import '../core/data/clients/local_storage/shared_preferences_service.dart'
    as _i12;
import '../modules/auth/domain/usecases/signup_user.dart' as _i5;
import '../modules/user/data/datasources/local/shared_prefs_local_datasource_impl.dart'
    as _i14;
import '../modules/user/data/datasources/local/user_local_datasource.dart'
    as _i13;
import 'dependency_injection.dart' as _i15;

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
    await gh.factoryAsync<_i7.SupabaseClient>(
      () => registerModule.supabase,
      preResolve: true,
    );

    gh.factory<_i8.ClientDataBase>(
        () => _i6.SupaBaseService(supa: gh<_i7.SupabaseClient>()));
    gh.factory<_i5.SignUpUseCase>(
        () => _i5.SignUpUseCase(supaBaseService: gh<_i6.SupaBaseService>()));
    gh.singleton<_i9.ClientHttp>(_i10.DioClientHttpImpl(dio: gh<_i3.Dio>()));
    gh.factory<_i11.LocalStorage>(() => _i12.SharedPreferencesService(
        preferences: gh<_i4.SharedPreferences>()));
    gh.factory<_i13.UserLocalDataSource>(() =>
        _i14.SharedPrefsUserLocalDatasourceImpl(
            localStorage: gh<_i11.LocalStorage>()));
    return this;
  }
}

class _$RegisterModule extends _i15.RegisterModule {}
