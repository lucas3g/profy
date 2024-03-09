import '../entities/either_of.dart';
import 'value_object.dart';

class EmailVO extends ValueObject<String> {
  const EmailVO(super.value);

  @override
  EitherOf<String, EmailVO> validate([Object? object]) {
    if (value.isEmpty) {
      return reject('$object não pode ser vazio');
    }

    return resolve(this);
  }
}
