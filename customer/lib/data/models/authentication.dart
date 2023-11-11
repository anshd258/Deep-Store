class   Authentication {
  final String? accessToken;
  final String? refreshToken;
  final String? authToken;
  final bool? newUser;
  final String? phoneNumber;
  final String? userName;
  final String? userEmail;
  final String? roomNumber;

  Authentication({
    this.phoneNumber,
    this.userName,
    this.userEmail,
    this.roomNumber,
    this.accessToken,
    this.refreshToken,
    this.authToken,
    this.newUser,
  });

  // Create a factory constructor to create an Authentication object from JSON.
  factory Authentication.fromJson(Map<String, dynamic> json) {
    return Authentication(
      accessToken: json['access_token'] as String?,
      refreshToken: json['refresh_token'] as String?,
      authToken: json['jwt'] as String?,
      newUser: json['new_user'] as bool?,
      phoneNumber: json['phone_number'] as String?,
      userName: json['user_name'] as String?,
      userEmail: json['user_email'] as String?,
      roomNumber: json['room_number'] as String?,
    );
  }
}
