class GetUserData {
  List<Result>? result;
  String? error;

  GetUserData({this.result, this.error});

  GetUserData.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(Result.fromJson(v));
      });
    }
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    data['error'] = error;
    return data;
  }
}

class Result {
  int? id;
  String? nom;
  String? adresse;
  String? email;
  String? username;
  bool? isactivated;
  String? role;
  String? tel1;
  String? profilepicture;
  String? profilepath;
  String? status;

  Result(
      {this.id,
      this.nom,
      this.adresse,
      this.email,
      this.username,
      this.isactivated,
      this.role,
      this.tel1,
      this.profilepicture,
      this.profilepath,
      this.status});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nom = json['nom'];
    adresse = json['adresse'];
    email = json['email'];
    username = json['username'];
    isactivated = json['isactivated'];
    role = json['role'];
    tel1 = json['tel1'];
    profilepicture = json['profilepicture'];
    profilepath = json['profilepath'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nom'] = nom;
    data['adresse'] = adresse;
    data['email'] = email;
    data['username'] = username;
    data['isactivated'] = isactivated;
    data['role'] = role;
    data['tel1'] = tel1;
    data['profilepicture'] = profilepicture;
    data['profilepath'] = profilepath;
    data['status'] = status;
    return data;
  }
}
