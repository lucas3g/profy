import 'package:injectable/injectable.dart';
import 'package:profy/app/core/data/clients/database/client_database.dart';
import 'package:profy/app/core/data/clients/database/params/client_database_params.dart';
import 'package:profy/app/core/domain/entities/either_of.dart';
import 'package:profy/app/core/domain/entities/failure.dart';
import 'package:profy/app/core/domain/entities/network_failure.dart';
import 'package:profy/app/core/domain/entities/usecase.dart';
import 'package:profy/app/modules/auth/domain/entities/auth_failure.dart';
import 'package:profy/app/modules/user/domain/adapters/user_adapter.dart';
import 'package:profy/app/modules/user/domain/entities/user_entity.dart';

@injectable
class SignUpUseCase implements UseCase<UserEntity, CreateAccountArgs> {
  final ClientDataBase _clientDataBase;

  SignUpUseCase({
    required ClientDataBase clientDataBase,
  }) : _clientDataBase = clientDataBase;

  @override
  Future<EitherOf<AppFailure, UserEntity>> call(CreateAccountArgs args) async {
    try {
      final ClientDataBaseCreateAccountParams params =
          ClientDataBaseCreateAccountParams(
              email: args.email, password: args.password);

      final Map<String, dynamic> result = await _clientDataBase.createAccount(
        params: params,
      );

      if (result.isNotEmpty) {
        final UserEntity user = UserAdapter.fromJson(result).toEntity();

        return resolve(user);
      }

      return reject(AuthFailure(message: 'auth.error.message'));
    } catch (e) {
      return reject(NetworkFailure(e.toString()));
    }
  }
}

class CreateAccountArgs {
  final String email;
  final String password;

  CreateAccountArgs({
    required this.email,
    required this.password,
  });
}
