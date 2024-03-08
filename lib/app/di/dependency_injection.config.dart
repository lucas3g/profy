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

import '../core/data/clients/http/client_http.dart' as _i5;
import '../core/data/clients/http/dio_http_client_impl.dart' as _i6;
import '../core/data/clients/local_storage/local_storage.dart' as _i7;
import '../core/data/clients/local_storage/shared_preferences_service.dart'
    as _i8;
import '../modules/user/data/datasources/local/shared_prefs_local_datasource_impl.dart'
    as _i10;
import '../modules/user/data/datasources/local/user_local_datasource.dart'
    as _i9;
import 'dependency_injection.dart' as _i11;

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
    gh.singleton<_i5.ClientHttp>(_i6.DioClientHttpImpl(dio: gh<_i3.Dio>()));
    gh.factory<_i7.LocalStorage>(() =>
        _i8.SharedPreferencesService(preferences: gh<_i4.SharedPreferences>()));
    gh.factory<_i9.UserLocalDataSource>(() =>
        _i10.SharedPrefsUserLocalDatasourceImpl(
            localStorage: gh<_i7.LocalStorage>()));
    return this;
  }
}

class _$RegisterModule extends _i11.RegisterModule {}
