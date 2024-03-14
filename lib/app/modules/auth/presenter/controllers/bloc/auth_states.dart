sealed class AuthStates {}

class AuthInitialState extends AuthStates {}

class AuthLoadingState extends AuthStates {}

class AuthSucessState extends AuthStates {}

class AuthErrorState extends AuthStates {
  final String message;

  AuthErrorState({required this.message});
}
