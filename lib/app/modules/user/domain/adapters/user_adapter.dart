import '../../../../core/domain/vos/text_vo.dart';
import '../entities/user_entity.dart';

class UserAdapter extends UserEntity {
  UserAdapter({
    required super.id,
    required super.email,
    super.password,
  });

  factory UserAdapter.fromJson(Map<String, dynamic> json) {
    return UserAdapter(
      id: TextVO(json['ID'].toString()),
      email: json['NOME'],
    );
  }

  static Map<String, dynamic> toJsonLogin({
    required UserEntity user,
  }) {
    return <String, dynamic>{
      'usuario': user.email.value,
      'senha': user.password.value,
    };
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'ID': id.value,
      'NOME': email.value,
    };
  }

  factory UserAdapter.fromEntity(UserEntity user) {
    return UserAdapter(
      id: user.id,
      email: user.email.value,
    );
  }

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      email: email.value,
    );
  }

  static UserEntity empty() {
    return UserEntity(
      id: const TextVO(''),
      email: '',
    );
  }
}
