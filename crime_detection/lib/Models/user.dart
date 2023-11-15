class Users {
  String name;
  String email;
  String password;
  String username;
  String userId;
  String role;
  DateTime createDate;
  DateTime updateDate;
  bool active;
  Users({
    required this.name,
    required this.userId,
    required this.username,
    required this.role,
    required this.createDate,
    required this.updateDate,
    required this.active,
    required this.email,
    required this.password,
  });

  Map<String, String> toMap() {
    return {
      "name": name,
      "email": email,
      "password": password,
      "username": username,
      "userId": userId,
      "role": role,
      "createDate": createDate.toIso8601String(),
      "updateDate": updateDate.toIso8601String(),
      "active": active.toString(),
    };
  }
}
