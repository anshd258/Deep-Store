import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Authrepository {
  final storage = const FlutterSecureStorage();
  String accessToken = '';
  String refreshToken = '';
  String phoneNumber = '';
  void update({String access = '', String refresh = '', String phone = ''}) {
    accessToken = access;
    refreshToken = refresh;
    phoneNumber = phone;
  }

  void setLocally(String access, String refresh, String phone) async {
    await storage.write(key: "access", value: access);
    await storage.write(key: "refresh", value: refresh);
    await storage.write(key: "phone", value: phone);
  }

  Future<Set<String>> getData() async {
    Set<String> value = <String>{};
    String? access = await storage.read(key: "access");
    String? refresh = await storage.read(key: "refresh");
    String? phone = await storage.read(key: "phone");
    if (access == null || refresh == null || phone == null) {
      value.add("no data");
      return value;
    } else {
      value.add("have data");
      value.add(access);
      value.add(refresh);
      value.add(phone);
      return value;
    }
  }

  Future<void> delete() async {
    await storage.deleteAll();
  }
}
