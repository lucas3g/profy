import 'package:profy/app/core/domain/entities/either_of.dart';
import 'package:profy/app/core/domain/entities/failure.dart';
import 'package:profy/app/modules/user/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<EitherOf<AppFailure, UserEntity>> signInWithEmailAndPassword(
      {required String email, required String password});
  Future<EitherOf<AppFailure, UserEntity>> signUpWithEmailAndPassword(
      {required String email, required String password});
  Future<void> signOut();
}
