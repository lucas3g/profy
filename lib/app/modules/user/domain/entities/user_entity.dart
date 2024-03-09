import 'package:profy/app/core/domain/vos/email_vo.dart';

import '../../../../core/domain/entities/base_entity.dart';
import '../../../../core/domain/vos/text_vo.dart';

class UserEntity extends BaseEntity {
  EmailVO _email;
  TextVO _password;

  EmailVO get email => _email;
  void setEmail(String value) => _email = EmailVO(value);

  TextVO get password => _password;
  void setPassword(String value) => _password = TextVO(value);

  UserEntity({
    required super.id,
    required String email,
    String? password,
  })  : _email = EmailVO(email),
        _password = TextVO(password ?? '');

  @override
  int get hashCode => email.hashCode ^ password.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserEntity &&
          runtimeType == other.runtimeType &&
          email == other.email &&
          password == other.password;
}
