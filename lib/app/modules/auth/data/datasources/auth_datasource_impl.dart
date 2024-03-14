import 'package:injectable/injectable.dart';
import 'package:profy/app/core/data/clients/database/client_database.dart';
import 'package:profy/app/core/data/clients/database/params/client_database_params.dart';
import 'package:profy/app/core/domain/entities/http_failure.dart';
import 'package:profy/app/modules/auth/data/datasources/auth_datasource.dart';
import 'package:profy/app/modules/auth/domain/entities/auth_failure.dart';
import 'package:profy/app/modules/user/domain/adapters/user_adapter.dart';
import 'package:profy/app/modules/user/domain/entities/user_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@Injectable(as: AuthDataSource)
class AuthDataSourceImpl implements AuthDataSource {
  final ClientDataBase _clientDataBase;

  AuthDataSourceImpl({required ClientDataBase clientDataBase})
      : _clientDataBase = clientDataBase;

  @override
  Future<UserEntity> signUpWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final ClientDataBaseCreateAccountParams params =
          ClientDataBaseCreateAccountParams(email: email, password: password);

      final Map<String, dynamic> result =
          await _clientDataBase.createAccount(params: params);

      final UserAdapter user = UserAdapter.fromJson(result);

      return user;
    } catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<UserEntity> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final ClientDataBaseCreateAccountParams params =
          ClientDataBaseCreateAccountParams(email: email, password: password);

      final Map<String, dynamic> result =
          await _clientDataBase.createAccount(params: params);

      final UserAdapter user = UserAdapter.fromJson(result);

      return user;
    } catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  AuthFailure _handleError(dynamic error) {
    if (error is AuthException) {
      return AuthFailure(message: error.message);
    }

    if (error is AuthFailure) {
      return error;
    }

    if (error is HttpFailure) {
      return AuthFailure(message: error.message);
    }

    return AuthFailure(message: 'Erro ao tentar fazer login!');
  }
}
