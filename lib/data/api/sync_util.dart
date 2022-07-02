import 'package:cle_app/data/database/models/role.dart';

import '../database/local_database/database.dart';

class SyncUtil {
  static Map<String, dynamic> mapUser(User user) {
    return <String, dynamic>{
      "nom": user.lastname,
      "prenom": user.firstname,
      "adresse": user.address,
      "email": user.email,
      "username": user.username,
      "password": user.password,
      "roleId": roleToId(user.role),
      "ville": user.city,
      "pays": user.country,
      "etat": user.state,
      "code postal": user.zipCode,
      "tel1": user.telephoneOne,
      "tel2": user.telephoneTwo,
      "note": ''
    };
  }

  static Map<String, dynamic> mapReport(User user) {
    return <String, dynamic>{
      "location": user.lastname,
      "notes": user.firstname,
      "Docbase64Image": user.address,
    };
  }

//   {
//   "location": "string",
//   "notes": "string",
//   "Docbase64Image": "string"
// }
}
