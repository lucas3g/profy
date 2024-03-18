import 'package:profy/app/modules/user/domain/entities/user_entity.dart';

abstract class AuthDataSource {
  Future<UserEntity> signInWithEmailAndPassword(
      {required String email, required String password});
  Future<UserEntity> signUpWithEmailAndPassword(
      {required String email, required String password});
  Future<void> signOut();
  Future<UserEntity?> autoLogin();
}
