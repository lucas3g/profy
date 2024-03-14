sealed class AuthEvents {}

class SignUpWithEmailAndPasswordEvent extends AuthEvents {
  final String email;
  final String password;

  SignUpWithEmailAndPasswordEvent(
      {required this.email, required this.password});
}
