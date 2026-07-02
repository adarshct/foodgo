import 'package:demo/core/utils/local_storage.dart';

abstract class Auth {
  static String get accessToken => LocalStorage.getData(key: "access") ?? "";
}
