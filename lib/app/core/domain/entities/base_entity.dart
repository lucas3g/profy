import '../vos/text_vo.dart';

abstract class BaseEntity {
  final TextVO id;

  BaseEntity({
    required this.id,
  });
}
