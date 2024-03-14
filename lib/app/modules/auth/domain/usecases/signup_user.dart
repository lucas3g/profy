import 'package:injectable/injectable.dart';
import 'package:profy/app/core/domain/entities/either_of.dart';
import 'package:profy/app/core/domain/entities/failure.dart';
import 'package:profy/app/core/domain/entities/usecase.dart';
import 'package:profy/app/modules/auth/domain/repositories/auth_repository.dart';
import 'package:profy/app/modules/user/domain/entities/user_entity.dart';

@injectable
class SignUpUseCase implements UseCase<UserEntity, CreateAccountArgs> {
  final AuthRepository _authRepository;

  SignUpUseCase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<EitherOf<AppFailure, UserEntity>> call(CreateAccountArgs args) async {
    return await _authRepository.signUpWithEmailAndPassword(
      email: args.email,
      password: args.password,
    );
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
