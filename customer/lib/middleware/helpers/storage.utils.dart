import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorage{

 static Future<String?> read({required String key}) async {
return await const FlutterSecureStorage().read(key: key);
  }
 static Future<void> write({required String key, required String value}) async {
    await const FlutterSecureStorage().write(key: key, value: value);
  }
 static Future<void> delete({required String key}) async {
    await const FlutterSecureStorage().delete(key: key);
  }

 static Future<void> clear() async {
    await const FlutterSecureStorage().deleteAll();
  }
}