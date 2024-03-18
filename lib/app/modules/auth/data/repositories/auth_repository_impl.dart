import 'package:injectable/injectable.dart';
import 'package:profy/app/core/domain/entities/either_of.dart';
import 'package:profy/app/core/domain/entities/failure.dart';
import 'package:profy/app/modules/auth/data/datasources/auth_datasource.dart';
import 'package:profy/app/modules/auth/domain/entities/auth_failure.dart';
import 'package:profy/app/modules/auth/domain/repositories/auth_repository.dart';
import 'package:profy/app/modules/user/domain/entities/user_entity.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource _authDataSource;

  AuthRepositoryImpl({required AuthDataSource authDataSource})
      : _authDataSource = authDataSource;

  @override
  Future<EitherOf<AppFailure, UserEntity>> signUpWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final UserEntity user = await _authDataSource.signUpWithEmailAndPassword(
        email: email,
        password: password,
      );

      return resolve(user);
    } on AppFailure catch (e) {
      return reject(e);
    } catch (e) {
      return reject(AuthFailure(message: e.toString()));
    }
  }

  @override
  Future<EitherOf<AppFailure, UserEntity>> signInWithEmailAndPassword(
      {required String email, required String password}) {
    // TODO: implement signInWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<EitherOf<AppFailure, UserEntity?>> autoLogin() async {
    try {
      final UserEntity? user = await _authDataSource.autoLogin();
      return resolve(user);
    } on AppFailure catch (error) {
      return reject(AuthFailure(message: error.message));
    } catch (error) {
      return reject(AuthFailure(message: 'Erro ao tentar fazer login'));
    }
  }
}
