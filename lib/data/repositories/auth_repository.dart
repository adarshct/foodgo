import 'package:demo/core/utils/api_paths.dart';
import 'package:demo/core/utils/my_dio.dart';
import 'package:demo/data/models/login_model.dart';

abstract class AuthRepository {
  static Future<dynamic> login({
    required String email,
    required String password,
  }) async {
    dynamic resp = await MyDio().post(
      path: ApiPaths.login,
      data: {"email": email, "password": password},
    );
    if (resp is Map<String, dynamic> && resp.containsKey('access')) {
      return LoginModel.fromJson(resp);
    }
  }
}
