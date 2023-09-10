class User {
  final int userID;
  final String? username;
  final String? contact;
  final String? room;

  User({
    required this.userID,
    this.username,
    this.contact,
    this.room,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    print('fromjsonrunning');
    return User(
      userID: json['id'] as int,
      username: json['username'] as String?,
      contact: json['contact'] as String?,
      room: json['room'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = userID;
    data['username'] = username;
    data['contact'] = contact;
    data['room'] = room;
    return data;
  }
}
