import '../../../modules/user/domain/entities/user_entity.dart';

class AppGlobal {
  String baseUrl;
  UserEntity? user;

  static late AppGlobal _instance;

  static AppGlobal get instance => _instance;

  factory AppGlobal({
    required String baseUrl,
    UserEntity? user,
  }) {
    _instance = AppGlobal._internal(baseUrl, user);

    return _instance;
  }

  AppGlobal._internal(
    this.baseUrl,
    this.user,
  );

  void setBaseUrl(String baseUrlParam) => baseUrl = baseUrlParam;

  void setUser(UserEntity? userParam) => user = userParam;
}
