import 'package:cle_app/data/database/local_database/database.dart';
import 'package:cle_app/data/database/models/role.dart';
import 'package:drift/drift.dart';

class Users extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get firstname => text()();
  TextColumn get lastname => text()();
  TextColumn get address => text().nullable()();
  TextColumn get email => text()();
  TextColumn get username => text()();
  TextColumn get password => text()();
  IntColumn get role => intEnum<Role>()();
  TextColumn get city => text().nullable()();
  TextColumn get country => text().nullable()();
  TextColumn get state => text().nullable()();
  TextColumn get zipCode => text().nullable()();
  TextColumn get telephoneOne => text().nullable()();
  TextColumn get telephoneTwo => text().nullable()();
  TextColumn get profilePicture => text()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();

  static Map<String, dynamic> toPref(User user) {
    return <String, dynamic>{
      'id': user.id,
      'firstname': user.firstname,
      'lastname': user.lastname,
      'address': user.address,
      'email': user.email,
      'username': user.username,
      'passwordhash': user.password,
      'role': user.role.name,
      'city': user.city,
      'country': user.country,
      'state': user.state,
      'zipCode': user.zipCode,
      'telephoneOne': user.telephoneOne,
      'telephoneTwo': user.telephoneTwo,
      'isActive': user.isActive,
      'profilepicture': user.profilePicture
    };
  }

  static fromPref(Map<String, dynamic> map) {
    return User(
      id: map['id']?.toInt() ?? 0,
      firstname: map['firstname'] ?? '',
      lastname: map['lastname'] ?? '',
      address: map['address'],
      email: map['email'] ?? '',
      username: map['username'] ?? '',
      password: map['password'] ?? '',
      role: Role.values.byName(map['role']),
      city: map['city'],
      country: map['country'],
      state: map['state'],
      zipCode: map['zipCode'],
      telephoneOne: map['telephoneOne'],
      telephoneTwo: map['telephoneTwo'],
      isActive: map['isActive'] ?? true,
      profilePicture: map['profilepicture'] ?? '',
    );
  }
}
