import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:profy/app/core/domain/entities/either_of.dart';
import 'package:profy/app/core/domain/entities/failure.dart';
import 'package:profy/app/modules/auth/domain/usecases/signup_user.dart';
import 'package:profy/app/modules/auth/presenter/controllers/bloc/auth_events.dart';
import 'package:profy/app/modules/auth/presenter/controllers/bloc/auth_states.dart';
import 'package:profy/app/modules/user/domain/entities/user_entity.dart';

@injectable
class AuthBloc extends Bloc<AuthEvents, AuthStates> {
  final SignUpUseCase _signUpUseCase;

  AuthBloc({required SignUpUseCase signUpUseCase})
      : _signUpUseCase = signUpUseCase,
        super(AuthInitialState()) {
    on<SignUpWithEmailAndPasswordEvent>(_signUpWithEmailAndPassword);
  }

  Future<void> _signUpWithEmailAndPassword(
      SignUpWithEmailAndPasswordEvent event, Emitter<AuthStates> emit) async {
    emit(AuthLoadingState());

    final CreateAccountArgs args =
        CreateAccountArgs(email: event.email, password: event.password);

    final EitherOf<AppFailure, UserEntity> result = await _signUpUseCase(args);

    result.get(
      (AppFailure failure) => emit(AuthErrorState(message: failure.message)),
      (UserEntity user) => emit(AuthSucessState()),
    );
  }
}
