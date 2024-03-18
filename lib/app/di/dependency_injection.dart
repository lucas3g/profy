import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:profy/app/core/domain/entities/app_global.dart';
import 'package:profy/app/core/domain/entities/database_keys.dart';
import 'package:profy/app/core/domain/entities/either_of.dart';
import 'package:profy/app/core/domain/entities/failure.dart';
import 'package:profy/app/core/domain/entities/usecase.dart';
import 'package:profy/app/di/dependency_injection.config.dart';
import 'package:profy/app/modules/auth/domain/usecases/auto_login.dart';
import 'package:profy/app/modules/user/domain/entities/user_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> configureDependencies() async {
  _initAppGlobal();

  await getIt.init();

  await _tryAutoLogin();

  // if (user != null && hasDevice) {
  //   // await _verifyDependenciesRegistered();
  //   // _registerDependeciesOnline();
  // }
}

@module
abstract class RegisterModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @preResolve
  Future<SupabaseClient> get supabase => _initializeSupaBase();

  Dio get dio => _dioFactory();
}

Future<SupabaseClient> _initializeSupaBase() async {
  await Supabase.initialize(
    url: DatabaseKeys.baseUrl,
    anonKey: DatabaseKeys.apiKey,
  );

  return Supabase.instance.client;
}

Dio _dioFactory() {
  final BaseOptions baseOptions = BaseOptions(
    headers: <String, dynamic>{'Content-Type': 'application/json'},
  );

  return Dio(baseOptions);
}

void _initAppGlobal() {
  AppGlobal(
    baseUrl: '',
    user: null,
  );
}

Future<UserEntity?> _tryAutoLogin() async {
  final AutoLoginUseCase autoLoginUsecase = getIt<AutoLoginUseCase>();

  final EitherOf<AppFailure, UserEntity?> response =
      await autoLoginUsecase(const NoArgs());

  final Object? result = response.get(
    (AppFailure reject) => reject,
    (UserEntity? resolve) => resolve,
  );

  if (result is UserEntity) {
    AppGlobal.instance.setUser(result);

    return result;
  }

  return null;
}

// Future<void> _verifyLicense() async {
//   final VerifyLicenseUseCase verifyLicenseUseCase =
//       getIt<VerifyLicenseUseCase>();

//   final VerifyLicenseUseCaseArgs args = VerifyLicenseUseCaseArgs(
//     license: AppGlobal.instance.device!.deviceId.value,
//   );

//   await verifyLicenseUseCase(args);
// }

// void _persistFakeUser() {
//   AppGlobal.instance.setUser(
//     UserEntity(
//       id: const TextVO('1'),
//       username: 'Fake User',
//       ccusto: 1,
//     ),
//   );
// }

// Future<void> _verifyDependenciesRegistered() async {

//   if (getIt.isRegistered<ProductDataSource>()) {
//     await getIt.unregister<ProductDataSource>();
//   }
// }

// void _registerDependeciesOnline() {

//   getIt.registerFactory<ProductDataSource>(
//     () => ProductDataSourceImpl(
//       clientHttp: getIt(),
//     ),
//   );
// }

// void _registerDependeciesLocal() {
//   getIt.registerFactory<ProductDataSource>(
//     () => ProductDataSourceLocalImpl(
//       localDatabase: getIt(),
//     ),
//   );
// }


