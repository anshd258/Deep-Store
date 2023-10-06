class Authrepository {
  String accessToken = '';
  String refreshToken = '';
  void update(String access, String refresh) {
    accessToken = access;
    refreshToken = refresh;
  }
}
