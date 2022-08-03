class CretaeGetModel {
  CretaeGetModel({
    required this.isSuccess,
    required this.statusCode,
    required this.message,
  });

  final bool isSuccess;
  final int statusCode;
  final Message message;

  factory CretaeGetModel.fromJson(Map<String, dynamic> json) => CretaeGetModel(
        isSuccess: json["isSuccess"],
        statusCode: json["statusCode"],
        message: Message.fromJson(json["message"]),
      );

  Map<String, dynamic> toJson() => {
        "isSuccess": isSuccess,
        "statusCode": statusCode,
        "message": message.toJson(),
      };
}

class Message {
  Message({
    required this.userId,
    required this.username,
    required this.email,
    required this.role,
    required this.deviceToken,
    required this.id,
    required this.createdOn,
    required this.updatedOn,
    required this.v,
  });

  final String userId;
  final String username;
  final String email;
  final String role;
  final String deviceToken;
  final String id;
  final DateTime createdOn;
  final DateTime updatedOn;
  final int v;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        userId: json["userId"],
        username: json["username"],
        email: json["email"],
        role: json["role"],
        deviceToken: json["deviceToken"],
        id: json["_id"],
        createdOn: DateTime.parse(json["createdOn"]),
        updatedOn: DateTime.parse(json["updatedOn"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "username": username,
        "email": email,
        "role": role,
        "deviceToken": deviceToken,
        "_id": id,
        "createdOn": createdOn.toIso8601String(),
        "updatedOn": updatedOn.toIso8601String(),
        "__v": v,
      };
}
