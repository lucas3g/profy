import 'package:brasil_fields/brasil_fields.dart';

import '../../../../../core/domain/entities/either_of.dart';
import '../../../../../core/domain/vos/value_object.dart';

class CnpjVO extends ValueObject<String> {
  const CnpjVO(super.value);

  @override
  EitherOf<String, CnpjVO> validate([Object? object]) {
    if (value.isEmpty) {
      return reject('$object não pode ser vazio');
    }

    if (!UtilBrasilFields.isCNPJValido(value)) {
      return reject('$object Inválido');
    }

    return resolve(this);
  }
}
