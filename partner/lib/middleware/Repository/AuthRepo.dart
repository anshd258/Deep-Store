import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Authrepository {
  final storage = const FlutterSecureStorage();
  String accessToken = '';
  String refreshToken = '';
  void update(String access, String refresh) {
    accessToken = access;
    refreshToken = refresh;
  }

  void setLocally(String access, String refresh) async {
    await storage.write(key: "access", value: access);
    await storage.write(key: "refresh", value: refresh);
  }

  Future<Set<String>> getData() async {
    Set<String> value = <String>{};
    String? access = await storage.read(key: "access");
    String? refresh = await storage.read(key: "refresh");
    if (access == null || refresh == null) {
      value.add("no data");
      return value;
    } else {
      value.add("have data");
      value.add(access);
      value.add(refresh);
      return value;
    }
  }
  Future<void> delete()async{
    await storage.deleteAll();
  } 
}
