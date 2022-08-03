import 'dart:convert';

List<GetUser> postFromJson(String str) =>
    List<GetUser>.from(json.decode(str).map((x) => GetUser.fromMap(x)));

class GetUser {
  GetUser({
    required this.id,
    required this.username,
  });

  int id;
  String username;

  factory GetUser.fromMap(Map<String, dynamic> json) => GetUser(
        id: json["id"],
        username: json["username"],
      );
}
