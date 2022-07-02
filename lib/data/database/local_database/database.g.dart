// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class ChatUser extends DataClass implements Insertable<ChatUser> {
  final int userId;
  final String chatUsername;
  final String chatPassword;
  ChatUser(
      {required this.userId,
      required this.chatUsername,
      required this.chatPassword});
  factory ChatUser.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return ChatUser(
      userId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user_id'])!,
      chatUsername: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}chat_username'])!,
      chatPassword: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}chat_password'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_id'] = Variable<int>(userId);
    map['chat_username'] = Variable<String>(chatUsername);
    map['chat_password'] = Variable<String>(chatPassword);
    return map;
  }

  ChatUsersCompanion toCompanion(bool nullToAbsent) {
    return ChatUsersCompanion(
      userId: Value(userId),
      chatUsername: Value(chatUsername),
      chatPassword: Value(chatPassword),
    );
  }

  factory ChatUser.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ChatUser(
      userId: serializer.fromJson<int>(json['userId']),
      chatUsername: serializer.fromJson<String>(json['chatUsername']),
      chatPassword: serializer.fromJson<String>(json['chatPassword']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userId': serializer.toJson<int>(userId),
      'chatUsername': serializer.toJson<String>(chatUsername),
      'chatPassword': serializer.toJson<String>(chatPassword),
    };
  }

  ChatUser copyWith(
          {int? userId, String? chatUsername, String? chatPassword}) =>
      ChatUser(
        userId: userId ?? this.userId,
        chatUsername: chatUsername ?? this.chatUsername,
        chatPassword: chatPassword ?? this.chatPassword,
      );
  @override
  String toString() {
    return (StringBuffer('ChatUser(')
          ..write('userId: $userId, ')
          ..write('chatUsername: $chatUsername, ')
          ..write('chatPassword: $chatPassword')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(userId, chatUsername, chatPassword);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ChatUser &&
          other.userId == this.userId &&
          other.chatUsername == this.chatUsername &&
          other.chatPassword == this.chatPassword);
}

class ChatUsersCompanion extends UpdateCompanion<ChatUser> {
  final Value<int> userId;
  final Value<String> chatUsername;
  final Value<String> chatPassword;
  const ChatUsersCompanion({
    this.userId = const Value.absent(),
    this.chatUsername = const Value.absent(),
    this.chatPassword = const Value.absent(),
  });
  ChatUsersCompanion.insert({
    required int userId,
    required String chatUsername,
    required String chatPassword,
  })  : userId = Value(userId),
        chatUsername = Value(chatUsername),
        chatPassword = Value(chatPassword);
  static Insertable<ChatUser> custom({
    Expression<int>? userId,
    Expression<String>? chatUsername,
    Expression<String>? chatPassword,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (chatUsername != null) 'chat_username': chatUsername,
      if (chatPassword != null) 'chat_password': chatPassword,
    });
  }

  ChatUsersCompanion copyWith(
      {Value<int>? userId,
      Value<String>? chatUsername,
      Value<String>? chatPassword}) {
    return ChatUsersCompanion(
      userId: userId ?? this.userId,
      chatUsername: chatUsername ?? this.chatUsername,
      chatPassword: chatPassword ?? this.chatPassword,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (chatUsername.present) {
      map['chat_username'] = Variable<String>(chatUsername.value);
    }
    if (chatPassword.present) {
      map['chat_password'] = Variable<String>(chatPassword.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChatUsersCompanion(')
          ..write('userId: $userId, ')
          ..write('chatUsername: $chatUsername, ')
          ..write('chatPassword: $chatPassword')
          ..write(')'))
        .toString();
  }
}

class $ChatUsersTable extends ChatUsers
    with TableInfo<$ChatUsersTable, ChatUser> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChatUsersTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int?> userId = GeneratedColumn<int?>(
      'user_id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _chatUsernameMeta =
      const VerificationMeta('chatUsername');
  @override
  late final GeneratedColumn<String?> chatUsername = GeneratedColumn<String?>(
      'chat_username', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _chatPasswordMeta =
      const VerificationMeta('chatPassword');
  @override
  late final GeneratedColumn<String?> chatPassword = GeneratedColumn<String?>(
      'chat_password', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [userId, chatUsername, chatPassword];
  @override
  String get aliasedName => _alias ?? 'chat_users';
  @override
  String get actualTableName => 'chat_users';
  @override
  VerificationContext validateIntegrity(Insertable<ChatUser> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('chat_username')) {
      context.handle(
          _chatUsernameMeta,
          chatUsername.isAcceptableOrUnknown(
              data['chat_username']!, _chatUsernameMeta));
    } else if (isInserting) {
      context.missing(_chatUsernameMeta);
    }
    if (data.containsKey('chat_password')) {
      context.handle(
          _chatPasswordMeta,
          chatPassword.isAcceptableOrUnknown(
              data['chat_password']!, _chatPasswordMeta));
    } else if (isInserting) {
      context.missing(_chatPasswordMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  ChatUser map(Map<String, dynamic> data, {String? tablePrefix}) {
    return ChatUser.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ChatUsersTable createAlias(String alias) {
    return $ChatUsersTable(attachedDatabase, alias);
  }
}

class DirectMessage extends DataClass implements Insertable<DirectMessage> {
  final int id;
  final String message;
  final int senderId;
  final int recieverId;
  final int? tenantid;
  final bool isDeleted;
  final bool isUpdated;
  final bool isRead;
  final DateTime createdOn;
  DirectMessage(
      {required this.id,
      required this.message,
      required this.senderId,
      required this.recieverId,
      this.tenantid,
      required this.isDeleted,
      required this.isUpdated,
      required this.isRead,
      required this.createdOn});
  factory DirectMessage.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DirectMessage(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      message: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}message'])!,
      senderId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}sender_id'])!,
      recieverId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}reciever_id'])!,
      tenantid: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tenantid']),
      isDeleted: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_deleted'])!,
      isUpdated: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_updated'])!,
      isRead: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_read'])!,
      createdOn: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_on'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['message'] = Variable<String>(message);
    map['sender_id'] = Variable<int>(senderId);
    map['reciever_id'] = Variable<int>(recieverId);
    if (!nullToAbsent || tenantid != null) {
      map['tenantid'] = Variable<int?>(tenantid);
    }
    map['is_deleted'] = Variable<bool>(isDeleted);
    map['is_updated'] = Variable<bool>(isUpdated);
    map['is_read'] = Variable<bool>(isRead);
    map['created_on'] = Variable<DateTime>(createdOn);
    return map;
  }

  DirectMessagesCompanion toCompanion(bool nullToAbsent) {
    return DirectMessagesCompanion(
      id: Value(id),
      message: Value(message),
      senderId: Value(senderId),
      recieverId: Value(recieverId),
      tenantid: tenantid == null && nullToAbsent
          ? const Value.absent()
          : Value(tenantid),
      isDeleted: Value(isDeleted),
      isUpdated: Value(isUpdated),
      isRead: Value(isRead),
      createdOn: Value(createdOn),
    );
  }

  factory DirectMessage.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DirectMessage(
      id: serializer.fromJson<int>(json['id']),
      message: serializer.fromJson<String>(json['message']),
      senderId: serializer.fromJson<int>(json['senderId']),
      recieverId: serializer.fromJson<int>(json['recieverId']),
      tenantid: serializer.fromJson<int?>(json['tenantid']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
      isUpdated: serializer.fromJson<bool>(json['isUpdated']),
      isRead: serializer.fromJson<bool>(json['isRead']),
      createdOn: serializer.fromJson<DateTime>(json['createdOn']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'message': serializer.toJson<String>(message),
      'senderId': serializer.toJson<int>(senderId),
      'recieverId': serializer.toJson<int>(recieverId),
      'tenantid': serializer.toJson<int?>(tenantid),
      'isDeleted': serializer.toJson<bool>(isDeleted),
      'isUpdated': serializer.toJson<bool>(isUpdated),
      'isRead': serializer.toJson<bool>(isRead),
      'createdOn': serializer.toJson<DateTime>(createdOn),
    };
  }

  DirectMessage copyWith(
          {int? id,
          String? message,
          int? senderId,
          int? recieverId,
          int? tenantid,
          bool? isDeleted,
          bool? isUpdated,
          bool? isRead,
          DateTime? createdOn}) =>
      DirectMessage(
        id: id ?? this.id,
        message: message ?? this.message,
        senderId: senderId ?? this.senderId,
        recieverId: recieverId ?? this.recieverId,
        tenantid: tenantid ?? this.tenantid,
        isDeleted: isDeleted ?? this.isDeleted,
        isUpdated: isUpdated ?? this.isUpdated,
        isRead: isRead ?? this.isRead,
        createdOn: createdOn ?? this.createdOn,
      );
  @override
  String toString() {
    return (StringBuffer('DirectMessage(')
          ..write('id: $id, ')
          ..write('message: $message, ')
          ..write('senderId: $senderId, ')
          ..write('recieverId: $recieverId, ')
          ..write('tenantid: $tenantid, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('isUpdated: $isUpdated, ')
          ..write('isRead: $isRead, ')
          ..write('createdOn: $createdOn')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, message, senderId, recieverId, tenantid,
      isDeleted, isUpdated, isRead, createdOn);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DirectMessage &&
          other.id == this.id &&
          other.message == this.message &&
          other.senderId == this.senderId &&
          other.recieverId == this.recieverId &&
          other.tenantid == this.tenantid &&
          other.isDeleted == this.isDeleted &&
          other.isUpdated == this.isUpdated &&
          other.isRead == this.isRead &&
          other.createdOn == this.createdOn);
}

class DirectMessagesCompanion extends UpdateCompanion<DirectMessage> {
  final Value<int> id;
  final Value<String> message;
  final Value<int> senderId;
  final Value<int> recieverId;
  final Value<int?> tenantid;
  final Value<bool> isDeleted;
  final Value<bool> isUpdated;
  final Value<bool> isRead;
  final Value<DateTime> createdOn;
  const DirectMessagesCompanion({
    this.id = const Value.absent(),
    this.message = const Value.absent(),
    this.senderId = const Value.absent(),
    this.recieverId = const Value.absent(),
    this.tenantid = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.isUpdated = const Value.absent(),
    this.isRead = const Value.absent(),
    this.createdOn = const Value.absent(),
  });
  DirectMessagesCompanion.insert({
    this.id = const Value.absent(),
    required String message,
    required int senderId,
    required int recieverId,
    this.tenantid = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.isUpdated = const Value.absent(),
    this.isRead = const Value.absent(),
    required DateTime createdOn,
  })  : message = Value(message),
        senderId = Value(senderId),
        recieverId = Value(recieverId),
        createdOn = Value(createdOn);
  static Insertable<DirectMessage> custom({
    Expression<int>? id,
    Expression<String>? message,
    Expression<int>? senderId,
    Expression<int>? recieverId,
    Expression<int?>? tenantid,
    Expression<bool>? isDeleted,
    Expression<bool>? isUpdated,
    Expression<bool>? isRead,
    Expression<DateTime>? createdOn,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (message != null) 'message': message,
      if (senderId != null) 'sender_id': senderId,
      if (recieverId != null) 'reciever_id': recieverId,
      if (tenantid != null) 'tenantid': tenantid,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (isUpdated != null) 'is_updated': isUpdated,
      if (isRead != null) 'is_read': isRead,
      if (createdOn != null) 'created_on': createdOn,
    });
  }

  DirectMessagesCompanion copyWith(
      {Value<int>? id,
      Value<String>? message,
      Value<int>? senderId,
      Value<int>? recieverId,
      Value<int?>? tenantid,
      Value<bool>? isDeleted,
      Value<bool>? isUpdated,
      Value<bool>? isRead,
      Value<DateTime>? createdOn}) {
    return DirectMessagesCompanion(
      id: id ?? this.id,
      message: message ?? this.message,
      senderId: senderId ?? this.senderId,
      recieverId: recieverId ?? this.recieverId,
      tenantid: tenantid ?? this.tenantid,
      isDeleted: isDeleted ?? this.isDeleted,
      isUpdated: isUpdated ?? this.isUpdated,
      isRead: isRead ?? this.isRead,
      createdOn: createdOn ?? this.createdOn,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (message.present) {
      map['message'] = Variable<String>(message.value);
    }
    if (senderId.present) {
      map['sender_id'] = Variable<int>(senderId.value);
    }
    if (recieverId.present) {
      map['reciever_id'] = Variable<int>(recieverId.value);
    }
    if (tenantid.present) {
      map['tenantid'] = Variable<int?>(tenantid.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (isUpdated.present) {
      map['is_updated'] = Variable<bool>(isUpdated.value);
    }
    if (isRead.present) {
      map['is_read'] = Variable<bool>(isRead.value);
    }
    if (createdOn.present) {
      map['created_on'] = Variable<DateTime>(createdOn.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DirectMessagesCompanion(')
          ..write('id: $id, ')
          ..write('message: $message, ')
          ..write('senderId: $senderId, ')
          ..write('recieverId: $recieverId, ')
          ..write('tenantid: $tenantid, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('isUpdated: $isUpdated, ')
          ..write('isRead: $isRead, ')
          ..write('createdOn: $createdOn')
          ..write(')'))
        .toString();
  }
}

class $DirectMessagesTable extends DirectMessages
    with TableInfo<$DirectMessagesTable, DirectMessage> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DirectMessagesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _messageMeta = const VerificationMeta('message');
  @override
  late final GeneratedColumn<String?> message = GeneratedColumn<String?>(
      'message', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _senderIdMeta = const VerificationMeta('senderId');
  @override
  late final GeneratedColumn<int?> senderId = GeneratedColumn<int?>(
      'sender_id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _recieverIdMeta = const VerificationMeta('recieverId');
  @override
  late final GeneratedColumn<int?> recieverId = GeneratedColumn<int?>(
      'reciever_id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _tenantidMeta = const VerificationMeta('tenantid');
  @override
  late final GeneratedColumn<int?> tenantid = GeneratedColumn<int?>(
      'tenantid', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _isDeletedMeta = const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<bool?> isDeleted = GeneratedColumn<bool?>(
      'is_deleted', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (is_deleted IN (0, 1))',
      defaultValue: const Constant(false));
  final VerificationMeta _isUpdatedMeta = const VerificationMeta('isUpdated');
  @override
  late final GeneratedColumn<bool?> isUpdated = GeneratedColumn<bool?>(
      'is_updated', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (is_updated IN (0, 1))',
      defaultValue: const Constant(false));
  final VerificationMeta _isReadMeta = const VerificationMeta('isRead');
  @override
  late final GeneratedColumn<bool?> isRead = GeneratedColumn<bool?>(
      'is_read', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (is_read IN (0, 1))',
      defaultValue: const Constant(false));
  final VerificationMeta _createdOnMeta = const VerificationMeta('createdOn');
  @override
  late final GeneratedColumn<DateTime?> createdOn = GeneratedColumn<DateTime?>(
      'created_on', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        message,
        senderId,
        recieverId,
        tenantid,
        isDeleted,
        isUpdated,
        isRead,
        createdOn
      ];
  @override
  String get aliasedName => _alias ?? 'direct_messages';
  @override
  String get actualTableName => 'direct_messages';
  @override
  VerificationContext validateIntegrity(Insertable<DirectMessage> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('message')) {
      context.handle(_messageMeta,
          message.isAcceptableOrUnknown(data['message']!, _messageMeta));
    } else if (isInserting) {
      context.missing(_messageMeta);
    }
    if (data.containsKey('sender_id')) {
      context.handle(_senderIdMeta,
          senderId.isAcceptableOrUnknown(data['sender_id']!, _senderIdMeta));
    } else if (isInserting) {
      context.missing(_senderIdMeta);
    }
    if (data.containsKey('reciever_id')) {
      context.handle(
          _recieverIdMeta,
          recieverId.isAcceptableOrUnknown(
              data['reciever_id']!, _recieverIdMeta));
    } else if (isInserting) {
      context.missing(_recieverIdMeta);
    }
    if (data.containsKey('tenantid')) {
      context.handle(_tenantidMeta,
          tenantid.isAcceptableOrUnknown(data['tenantid']!, _tenantidMeta));
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    }
    if (data.containsKey('is_updated')) {
      context.handle(_isUpdatedMeta,
          isUpdated.isAcceptableOrUnknown(data['is_updated']!, _isUpdatedMeta));
    }
    if (data.containsKey('is_read')) {
      context.handle(_isReadMeta,
          isRead.isAcceptableOrUnknown(data['is_read']!, _isReadMeta));
    }
    if (data.containsKey('created_on')) {
      context.handle(_createdOnMeta,
          createdOn.isAcceptableOrUnknown(data['created_on']!, _createdOnMeta));
    } else if (isInserting) {
      context.missing(_createdOnMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DirectMessage map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DirectMessage.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DirectMessagesTable createAlias(String alias) {
    return $DirectMessagesTable(attachedDatabase, alias);
  }
}

class Driver extends DataClass implements Insertable<Driver> {
  final int userId;
  final String shipmentId;
  Driver({required this.userId, required this.shipmentId});
  factory Driver.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Driver(
      userId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user_id'])!,
      shipmentId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}shipment_id'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_id'] = Variable<int>(userId);
    map['shipment_id'] = Variable<String>(shipmentId);
    return map;
  }

  DriversCompanion toCompanion(bool nullToAbsent) {
    return DriversCompanion(
      userId: Value(userId),
      shipmentId: Value(shipmentId),
    );
  }

  factory Driver.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Driver(
      userId: serializer.fromJson<int>(json['userId']),
      shipmentId: serializer.fromJson<String>(json['shipmentId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userId': serializer.toJson<int>(userId),
      'shipmentId': serializer.toJson<String>(shipmentId),
    };
  }

  Driver copyWith({int? userId, String? shipmentId}) => Driver(
        userId: userId ?? this.userId,
        shipmentId: shipmentId ?? this.shipmentId,
      );
  @override
  String toString() {
    return (StringBuffer('Driver(')
          ..write('userId: $userId, ')
          ..write('shipmentId: $shipmentId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(userId, shipmentId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Driver &&
          other.userId == this.userId &&
          other.shipmentId == this.shipmentId);
}

class DriversCompanion extends UpdateCompanion<Driver> {
  final Value<int> userId;
  final Value<String> shipmentId;
  const DriversCompanion({
    this.userId = const Value.absent(),
    this.shipmentId = const Value.absent(),
  });
  DriversCompanion.insert({
    required int userId,
    required String shipmentId,
  })  : userId = Value(userId),
        shipmentId = Value(shipmentId);
  static Insertable<Driver> custom({
    Expression<int>? userId,
    Expression<String>? shipmentId,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (shipmentId != null) 'shipment_id': shipmentId,
    });
  }

  DriversCompanion copyWith({Value<int>? userId, Value<String>? shipmentId}) {
    return DriversCompanion(
      userId: userId ?? this.userId,
      shipmentId: shipmentId ?? this.shipmentId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (shipmentId.present) {
      map['shipment_id'] = Variable<String>(shipmentId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DriversCompanion(')
          ..write('userId: $userId, ')
          ..write('shipmentId: $shipmentId')
          ..write(')'))
        .toString();
  }
}

class $DriversTable extends Drivers with TableInfo<$DriversTable, Driver> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DriversTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int?> userId = GeneratedColumn<int?>(
      'user_id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _shipmentIdMeta = const VerificationMeta('shipmentId');
  @override
  late final GeneratedColumn<String?> shipmentId = GeneratedColumn<String?>(
      'shipment_id', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [userId, shipmentId];
  @override
  String get aliasedName => _alias ?? 'drivers';
  @override
  String get actualTableName => 'drivers';
  @override
  VerificationContext validateIntegrity(Insertable<Driver> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('shipment_id')) {
      context.handle(
          _shipmentIdMeta,
          shipmentId.isAcceptableOrUnknown(
              data['shipment_id']!, _shipmentIdMeta));
    } else if (isInserting) {
      context.missing(_shipmentIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  Driver map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Driver.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DriversTable createAlias(String alias) {
    return $DriversTable(attachedDatabase, alias);
  }
}

class Expence extends DataClass implements Insertable<Expence> {
  final int id;
  final double amount;
  final String transaction;
  final String paymentType;
  final double amountGive;
  final double change;
  final String currency;
  final String? banque;
  final int? checkNumber;
  final int? cardNumber;
  final double? bankCardNumber;
  Expence(
      {required this.id,
      required this.amount,
      required this.transaction,
      required this.paymentType,
      required this.amountGive,
      required this.change,
      required this.currency,
      this.banque,
      this.checkNumber,
      this.cardNumber,
      this.bankCardNumber});
  factory Expence.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Expence(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      amount: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}amount'])!,
      transaction: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}transaction'])!,
      paymentType: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}payment_type'])!,
      amountGive: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}amount_give'])!,
      change: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}change'])!,
      currency: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}currency'])!,
      banque: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}banque']),
      checkNumber: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}check_number']),
      cardNumber: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}card_number']),
      bankCardNumber: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}bank_card_number']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['amount'] = Variable<double>(amount);
    map['transaction'] = Variable<String>(transaction);
    map['payment_type'] = Variable<String>(paymentType);
    map['amount_give'] = Variable<double>(amountGive);
    map['change'] = Variable<double>(change);
    map['currency'] = Variable<String>(currency);
    if (!nullToAbsent || banque != null) {
      map['banque'] = Variable<String?>(banque);
    }
    if (!nullToAbsent || checkNumber != null) {
      map['check_number'] = Variable<int?>(checkNumber);
    }
    if (!nullToAbsent || cardNumber != null) {
      map['card_number'] = Variable<int?>(cardNumber);
    }
    if (!nullToAbsent || bankCardNumber != null) {
      map['bank_card_number'] = Variable<double?>(bankCardNumber);
    }
    return map;
  }

  ExpencesCompanion toCompanion(bool nullToAbsent) {
    return ExpencesCompanion(
      id: Value(id),
      amount: Value(amount),
      transaction: Value(transaction),
      paymentType: Value(paymentType),
      amountGive: Value(amountGive),
      change: Value(change),
      currency: Value(currency),
      banque:
          banque == null && nullToAbsent ? const Value.absent() : Value(banque),
      checkNumber: checkNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(checkNumber),
      cardNumber: cardNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(cardNumber),
      bankCardNumber: bankCardNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(bankCardNumber),
    );
  }

  factory Expence.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Expence(
      id: serializer.fromJson<int>(json['id']),
      amount: serializer.fromJson<double>(json['amount']),
      transaction: serializer.fromJson<String>(json['transaction']),
      paymentType: serializer.fromJson<String>(json['paymentType']),
      amountGive: serializer.fromJson<double>(json['amountGive']),
      change: serializer.fromJson<double>(json['change']),
      currency: serializer.fromJson<String>(json['currency']),
      banque: serializer.fromJson<String?>(json['banque']),
      checkNumber: serializer.fromJson<int?>(json['checkNumber']),
      cardNumber: serializer.fromJson<int?>(json['cardNumber']),
      bankCardNumber: serializer.fromJson<double?>(json['bankCardNumber']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'amount': serializer.toJson<double>(amount),
      'transaction': serializer.toJson<String>(transaction),
      'paymentType': serializer.toJson<String>(paymentType),
      'amountGive': serializer.toJson<double>(amountGive),
      'change': serializer.toJson<double>(change),
      'currency': serializer.toJson<String>(currency),
      'banque': serializer.toJson<String?>(banque),
      'checkNumber': serializer.toJson<int?>(checkNumber),
      'cardNumber': serializer.toJson<int?>(cardNumber),
      'bankCardNumber': serializer.toJson<double?>(bankCardNumber),
    };
  }

  Expence copyWith(
          {int? id,
          double? amount,
          String? transaction,
          String? paymentType,
          double? amountGive,
          double? change,
          String? currency,
          String? banque,
          int? checkNumber,
          int? cardNumber,
          double? bankCardNumber}) =>
      Expence(
        id: id ?? this.id,
        amount: amount ?? this.amount,
        transaction: transaction ?? this.transaction,
        paymentType: paymentType ?? this.paymentType,
        amountGive: amountGive ?? this.amountGive,
        change: change ?? this.change,
        currency: currency ?? this.currency,
        banque: banque ?? this.banque,
        checkNumber: checkNumber ?? this.checkNumber,
        cardNumber: cardNumber ?? this.cardNumber,
        bankCardNumber: bankCardNumber ?? this.bankCardNumber,
      );
  @override
  String toString() {
    return (StringBuffer('Expence(')
          ..write('id: $id, ')
          ..write('amount: $amount, ')
          ..write('transaction: $transaction, ')
          ..write('paymentType: $paymentType, ')
          ..write('amountGive: $amountGive, ')
          ..write('change: $change, ')
          ..write('currency: $currency, ')
          ..write('banque: $banque, ')
          ..write('checkNumber: $checkNumber, ')
          ..write('cardNumber: $cardNumber, ')
          ..write('bankCardNumber: $bankCardNumber')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      amount,
      transaction,
      paymentType,
      amountGive,
      change,
      currency,
      banque,
      checkNumber,
      cardNumber,
      bankCardNumber);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Expence &&
          other.id == this.id &&
          other.amount == this.amount &&
          other.transaction == this.transaction &&
          other.paymentType == this.paymentType &&
          other.amountGive == this.amountGive &&
          other.change == this.change &&
          other.currency == this.currency &&
          other.banque == this.banque &&
          other.checkNumber == this.checkNumber &&
          other.cardNumber == this.cardNumber &&
          other.bankCardNumber == this.bankCardNumber);
}

class ExpencesCompanion extends UpdateCompanion<Expence> {
  final Value<int> id;
  final Value<double> amount;
  final Value<String> transaction;
  final Value<String> paymentType;
  final Value<double> amountGive;
  final Value<double> change;
  final Value<String> currency;
  final Value<String?> banque;
  final Value<int?> checkNumber;
  final Value<int?> cardNumber;
  final Value<double?> bankCardNumber;
  const ExpencesCompanion({
    this.id = const Value.absent(),
    this.amount = const Value.absent(),
    this.transaction = const Value.absent(),
    this.paymentType = const Value.absent(),
    this.amountGive = const Value.absent(),
    this.change = const Value.absent(),
    this.currency = const Value.absent(),
    this.banque = const Value.absent(),
    this.checkNumber = const Value.absent(),
    this.cardNumber = const Value.absent(),
    this.bankCardNumber = const Value.absent(),
  });
  ExpencesCompanion.insert({
    this.id = const Value.absent(),
    required double amount,
    required String transaction,
    required String paymentType,
    required double amountGive,
    required double change,
    required String currency,
    this.banque = const Value.absent(),
    this.checkNumber = const Value.absent(),
    this.cardNumber = const Value.absent(),
    this.bankCardNumber = const Value.absent(),
  })  : amount = Value(amount),
        transaction = Value(transaction),
        paymentType = Value(paymentType),
        amountGive = Value(amountGive),
        change = Value(change),
        currency = Value(currency);
  static Insertable<Expence> custom({
    Expression<int>? id,
    Expression<double>? amount,
    Expression<String>? transaction,
    Expression<String>? paymentType,
    Expression<double>? amountGive,
    Expression<double>? change,
    Expression<String>? currency,
    Expression<String?>? banque,
    Expression<int?>? checkNumber,
    Expression<int?>? cardNumber,
    Expression<double?>? bankCardNumber,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (amount != null) 'amount': amount,
      if (transaction != null) 'transaction': transaction,
      if (paymentType != null) 'payment_type': paymentType,
      if (amountGive != null) 'amount_give': amountGive,
      if (change != null) 'change': change,
      if (currency != null) 'currency': currency,
      if (banque != null) 'banque': banque,
      if (checkNumber != null) 'check_number': checkNumber,
      if (cardNumber != null) 'card_number': cardNumber,
      if (bankCardNumber != null) 'bank_card_number': bankCardNumber,
    });
  }

  ExpencesCompanion copyWith(
      {Value<int>? id,
      Value<double>? amount,
      Value<String>? transaction,
      Value<String>? paymentType,
      Value<double>? amountGive,
      Value<double>? change,
      Value<String>? currency,
      Value<String?>? banque,
      Value<int?>? checkNumber,
      Value<int?>? cardNumber,
      Value<double?>? bankCardNumber}) {
    return ExpencesCompanion(
      id: id ?? this.id,
      amount: amount ?? this.amount,
      transaction: transaction ?? this.transaction,
      paymentType: paymentType ?? this.paymentType,
      amountGive: amountGive ?? this.amountGive,
      change: change ?? this.change,
      currency: currency ?? this.currency,
      banque: banque ?? this.banque,
      checkNumber: checkNumber ?? this.checkNumber,
      cardNumber: cardNumber ?? this.cardNumber,
      bankCardNumber: bankCardNumber ?? this.bankCardNumber,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (transaction.present) {
      map['transaction'] = Variable<String>(transaction.value);
    }
    if (paymentType.present) {
      map['payment_type'] = Variable<String>(paymentType.value);
    }
    if (amountGive.present) {
      map['amount_give'] = Variable<double>(amountGive.value);
    }
    if (change.present) {
      map['change'] = Variable<double>(change.value);
    }
    if (currency.present) {
      map['currency'] = Variable<String>(currency.value);
    }
    if (banque.present) {
      map['banque'] = Variable<String?>(banque.value);
    }
    if (checkNumber.present) {
      map['check_number'] = Variable<int?>(checkNumber.value);
    }
    if (cardNumber.present) {
      map['card_number'] = Variable<int?>(cardNumber.value);
    }
    if (bankCardNumber.present) {
      map['bank_card_number'] = Variable<double?>(bankCardNumber.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExpencesCompanion(')
          ..write('id: $id, ')
          ..write('amount: $amount, ')
          ..write('transaction: $transaction, ')
          ..write('paymentType: $paymentType, ')
          ..write('amountGive: $amountGive, ')
          ..write('change: $change, ')
          ..write('currency: $currency, ')
          ..write('banque: $banque, ')
          ..write('checkNumber: $checkNumber, ')
          ..write('cardNumber: $cardNumber, ')
          ..write('bankCardNumber: $bankCardNumber')
          ..write(')'))
        .toString();
  }
}

class $ExpencesTable extends Expences with TableInfo<$ExpencesTable, Expence> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExpencesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double?> amount = GeneratedColumn<double?>(
      'amount', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _transactionMeta =
      const VerificationMeta('transaction');
  @override
  late final GeneratedColumn<String?> transaction = GeneratedColumn<String?>(
      'transaction', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _paymentTypeMeta =
      const VerificationMeta('paymentType');
  @override
  late final GeneratedColumn<String?> paymentType = GeneratedColumn<String?>(
      'payment_type', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _amountGiveMeta = const VerificationMeta('amountGive');
  @override
  late final GeneratedColumn<double?> amountGive = GeneratedColumn<double?>(
      'amount_give', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _changeMeta = const VerificationMeta('change');
  @override
  late final GeneratedColumn<double?> change = GeneratedColumn<double?>(
      'change', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _currencyMeta = const VerificationMeta('currency');
  @override
  late final GeneratedColumn<String?> currency = GeneratedColumn<String?>(
      'currency', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _banqueMeta = const VerificationMeta('banque');
  @override
  late final GeneratedColumn<String?> banque = GeneratedColumn<String?>(
      'banque', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _checkNumberMeta =
      const VerificationMeta('checkNumber');
  @override
  late final GeneratedColumn<int?> checkNumber = GeneratedColumn<int?>(
      'check_number', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _cardNumberMeta = const VerificationMeta('cardNumber');
  @override
  late final GeneratedColumn<int?> cardNumber = GeneratedColumn<int?>(
      'card_number', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _bankCardNumberMeta =
      const VerificationMeta('bankCardNumber');
  @override
  late final GeneratedColumn<double?> bankCardNumber = GeneratedColumn<double?>(
      'bank_card_number', aliasedName, true,
      type: const RealType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        amount,
        transaction,
        paymentType,
        amountGive,
        change,
        currency,
        banque,
        checkNumber,
        cardNumber,
        bankCardNumber
      ];
  @override
  String get aliasedName => _alias ?? 'expences';
  @override
  String get actualTableName => 'expences';
  @override
  VerificationContext validateIntegrity(Insertable<Expence> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('transaction')) {
      context.handle(
          _transactionMeta,
          transaction.isAcceptableOrUnknown(
              data['transaction']!, _transactionMeta));
    } else if (isInserting) {
      context.missing(_transactionMeta);
    }
    if (data.containsKey('payment_type')) {
      context.handle(
          _paymentTypeMeta,
          paymentType.isAcceptableOrUnknown(
              data['payment_type']!, _paymentTypeMeta));
    } else if (isInserting) {
      context.missing(_paymentTypeMeta);
    }
    if (data.containsKey('amount_give')) {
      context.handle(
          _amountGiveMeta,
          amountGive.isAcceptableOrUnknown(
              data['amount_give']!, _amountGiveMeta));
    } else if (isInserting) {
      context.missing(_amountGiveMeta);
    }
    if (data.containsKey('change')) {
      context.handle(_changeMeta,
          change.isAcceptableOrUnknown(data['change']!, _changeMeta));
    } else if (isInserting) {
      context.missing(_changeMeta);
    }
    if (data.containsKey('currency')) {
      context.handle(_currencyMeta,
          currency.isAcceptableOrUnknown(data['currency']!, _currencyMeta));
    } else if (isInserting) {
      context.missing(_currencyMeta);
    }
    if (data.containsKey('banque')) {
      context.handle(_banqueMeta,
          banque.isAcceptableOrUnknown(data['banque']!, _banqueMeta));
    }
    if (data.containsKey('check_number')) {
      context.handle(
          _checkNumberMeta,
          checkNumber.isAcceptableOrUnknown(
              data['check_number']!, _checkNumberMeta));
    }
    if (data.containsKey('card_number')) {
      context.handle(
          _cardNumberMeta,
          cardNumber.isAcceptableOrUnknown(
              data['card_number']!, _cardNumberMeta));
    }
    if (data.containsKey('bank_card_number')) {
      context.handle(
          _bankCardNumberMeta,
          bankCardNumber.isAcceptableOrUnknown(
              data['bank_card_number']!, _bankCardNumberMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Expence map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Expence.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ExpencesTable createAlias(String alias) {
    return $ExpencesTable(attachedDatabase, alias);
  }
}

class Load extends DataClass implements Insertable<Load> {
  final int id;
  final String name;
  final int weight;
  final String? unitWeight;
  final int temperature;
  final String? unitTemperature;
  final int loadPrice;
  final int totalMileage;
  final bool isempty;
  final String? consignee;
  final String currency;
  final String status;
  final String? notes;
  final int shipmentId;
  Load(
      {required this.id,
      required this.name,
      required this.weight,
      this.unitWeight,
      required this.temperature,
      this.unitTemperature,
      required this.loadPrice,
      required this.totalMileage,
      required this.isempty,
      this.consignee,
      required this.currency,
      required this.status,
      this.notes,
      required this.shipmentId});
  factory Load.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Load(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      weight: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}weight'])!,
      unitWeight: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}unit_weight']),
      temperature: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}temperature'])!,
      unitTemperature: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}unit_temperature']),
      loadPrice: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}load_price'])!,
      totalMileage: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}total_mileage'])!,
      isempty: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}isempty'])!,
      consignee: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}consignee']),
      currency: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}currency'])!,
      status: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}status'])!,
      notes: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}notes']),
      shipmentId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}shipment_id'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['weight'] = Variable<int>(weight);
    if (!nullToAbsent || unitWeight != null) {
      map['unit_weight'] = Variable<String?>(unitWeight);
    }
    map['temperature'] = Variable<int>(temperature);
    if (!nullToAbsent || unitTemperature != null) {
      map['unit_temperature'] = Variable<String?>(unitTemperature);
    }
    map['load_price'] = Variable<int>(loadPrice);
    map['total_mileage'] = Variable<int>(totalMileage);
    map['isempty'] = Variable<bool>(isempty);
    if (!nullToAbsent || consignee != null) {
      map['consignee'] = Variable<String?>(consignee);
    }
    map['currency'] = Variable<String>(currency);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String?>(notes);
    }
    map['shipment_id'] = Variable<int>(shipmentId);
    return map;
  }

  LoadsCompanion toCompanion(bool nullToAbsent) {
    return LoadsCompanion(
      id: Value(id),
      name: Value(name),
      weight: Value(weight),
      unitWeight: unitWeight == null && nullToAbsent
          ? const Value.absent()
          : Value(unitWeight),
      temperature: Value(temperature),
      unitTemperature: unitTemperature == null && nullToAbsent
          ? const Value.absent()
          : Value(unitTemperature),
      loadPrice: Value(loadPrice),
      totalMileage: Value(totalMileage),
      isempty: Value(isempty),
      consignee: consignee == null && nullToAbsent
          ? const Value.absent()
          : Value(consignee),
      currency: Value(currency),
      status: Value(status),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      shipmentId: Value(shipmentId),
    );
  }

  factory Load.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Load(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      weight: serializer.fromJson<int>(json['weight']),
      unitWeight: serializer.fromJson<String?>(json['unitWeight']),
      temperature: serializer.fromJson<int>(json['temperature']),
      unitTemperature: serializer.fromJson<String?>(json['unitTemperature']),
      loadPrice: serializer.fromJson<int>(json['loadPrice']),
      totalMileage: serializer.fromJson<int>(json['totalMileage']),
      isempty: serializer.fromJson<bool>(json['isempty']),
      consignee: serializer.fromJson<String?>(json['consignee']),
      currency: serializer.fromJson<String>(json['currency']),
      status: serializer.fromJson<String>(json['status']),
      notes: serializer.fromJson<String?>(json['notes']),
      shipmentId: serializer.fromJson<int>(json['shipmentId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'weight': serializer.toJson<int>(weight),
      'unitWeight': serializer.toJson<String?>(unitWeight),
      'temperature': serializer.toJson<int>(temperature),
      'unitTemperature': serializer.toJson<String?>(unitTemperature),
      'loadPrice': serializer.toJson<int>(loadPrice),
      'totalMileage': serializer.toJson<int>(totalMileage),
      'isempty': serializer.toJson<bool>(isempty),
      'consignee': serializer.toJson<String?>(consignee),
      'currency': serializer.toJson<String>(currency),
      'status': serializer.toJson<String>(status),
      'notes': serializer.toJson<String?>(notes),
      'shipmentId': serializer.toJson<int>(shipmentId),
    };
  }

  Load copyWith(
          {int? id,
          String? name,
          int? weight,
          String? unitWeight,
          int? temperature,
          String? unitTemperature,
          int? loadPrice,
          int? totalMileage,
          bool? isempty,
          String? consignee,
          String? currency,
          String? status,
          String? notes,
          int? shipmentId}) =>
      Load(
        id: id ?? this.id,
        name: name ?? this.name,
        weight: weight ?? this.weight,
        unitWeight: unitWeight ?? this.unitWeight,
        temperature: temperature ?? this.temperature,
        unitTemperature: unitTemperature ?? this.unitTemperature,
        loadPrice: loadPrice ?? this.loadPrice,
        totalMileage: totalMileage ?? this.totalMileage,
        isempty: isempty ?? this.isempty,
        consignee: consignee ?? this.consignee,
        currency: currency ?? this.currency,
        status: status ?? this.status,
        notes: notes ?? this.notes,
        shipmentId: shipmentId ?? this.shipmentId,
      );
  @override
  String toString() {
    return (StringBuffer('Load(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('weight: $weight, ')
          ..write('unitWeight: $unitWeight, ')
          ..write('temperature: $temperature, ')
          ..write('unitTemperature: $unitTemperature, ')
          ..write('loadPrice: $loadPrice, ')
          ..write('totalMileage: $totalMileage, ')
          ..write('isempty: $isempty, ')
          ..write('consignee: $consignee, ')
          ..write('currency: $currency, ')
          ..write('status: $status, ')
          ..write('notes: $notes, ')
          ..write('shipmentId: $shipmentId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      name,
      weight,
      unitWeight,
      temperature,
      unitTemperature,
      loadPrice,
      totalMileage,
      isempty,
      consignee,
      currency,
      status,
      notes,
      shipmentId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Load &&
          other.id == this.id &&
          other.name == this.name &&
          other.weight == this.weight &&
          other.unitWeight == this.unitWeight &&
          other.temperature == this.temperature &&
          other.unitTemperature == this.unitTemperature &&
          other.loadPrice == this.loadPrice &&
          other.totalMileage == this.totalMileage &&
          other.isempty == this.isempty &&
          other.consignee == this.consignee &&
          other.currency == this.currency &&
          other.status == this.status &&
          other.notes == this.notes &&
          other.shipmentId == this.shipmentId);
}

class LoadsCompanion extends UpdateCompanion<Load> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> weight;
  final Value<String?> unitWeight;
  final Value<int> temperature;
  final Value<String?> unitTemperature;
  final Value<int> loadPrice;
  final Value<int> totalMileage;
  final Value<bool> isempty;
  final Value<String?> consignee;
  final Value<String> currency;
  final Value<String> status;
  final Value<String?> notes;
  final Value<int> shipmentId;
  const LoadsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.weight = const Value.absent(),
    this.unitWeight = const Value.absent(),
    this.temperature = const Value.absent(),
    this.unitTemperature = const Value.absent(),
    this.loadPrice = const Value.absent(),
    this.totalMileage = const Value.absent(),
    this.isempty = const Value.absent(),
    this.consignee = const Value.absent(),
    this.currency = const Value.absent(),
    this.status = const Value.absent(),
    this.notes = const Value.absent(),
    this.shipmentId = const Value.absent(),
  });
  LoadsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int weight,
    this.unitWeight = const Value.absent(),
    required int temperature,
    this.unitTemperature = const Value.absent(),
    required int loadPrice,
    required int totalMileage,
    this.isempty = const Value.absent(),
    this.consignee = const Value.absent(),
    required String currency,
    required String status,
    this.notes = const Value.absent(),
    required int shipmentId,
  })  : name = Value(name),
        weight = Value(weight),
        temperature = Value(temperature),
        loadPrice = Value(loadPrice),
        totalMileage = Value(totalMileage),
        currency = Value(currency),
        status = Value(status),
        shipmentId = Value(shipmentId);
  static Insertable<Load> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? weight,
    Expression<String?>? unitWeight,
    Expression<int>? temperature,
    Expression<String?>? unitTemperature,
    Expression<int>? loadPrice,
    Expression<int>? totalMileage,
    Expression<bool>? isempty,
    Expression<String?>? consignee,
    Expression<String>? currency,
    Expression<String>? status,
    Expression<String?>? notes,
    Expression<int>? shipmentId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (weight != null) 'weight': weight,
      if (unitWeight != null) 'unit_weight': unitWeight,
      if (temperature != null) 'temperature': temperature,
      if (unitTemperature != null) 'unit_temperature': unitTemperature,
      if (loadPrice != null) 'load_price': loadPrice,
      if (totalMileage != null) 'total_mileage': totalMileage,
      if (isempty != null) 'isempty': isempty,
      if (consignee != null) 'consignee': consignee,
      if (currency != null) 'currency': currency,
      if (status != null) 'status': status,
      if (notes != null) 'notes': notes,
      if (shipmentId != null) 'shipment_id': shipmentId,
    });
  }

  LoadsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int>? weight,
      Value<String?>? unitWeight,
      Value<int>? temperature,
      Value<String?>? unitTemperature,
      Value<int>? loadPrice,
      Value<int>? totalMileage,
      Value<bool>? isempty,
      Value<String?>? consignee,
      Value<String>? currency,
      Value<String>? status,
      Value<String?>? notes,
      Value<int>? shipmentId}) {
    return LoadsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      weight: weight ?? this.weight,
      unitWeight: unitWeight ?? this.unitWeight,
      temperature: temperature ?? this.temperature,
      unitTemperature: unitTemperature ?? this.unitTemperature,
      loadPrice: loadPrice ?? this.loadPrice,
      totalMileage: totalMileage ?? this.totalMileage,
      isempty: isempty ?? this.isempty,
      consignee: consignee ?? this.consignee,
      currency: currency ?? this.currency,
      status: status ?? this.status,
      notes: notes ?? this.notes,
      shipmentId: shipmentId ?? this.shipmentId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (weight.present) {
      map['weight'] = Variable<int>(weight.value);
    }
    if (unitWeight.present) {
      map['unit_weight'] = Variable<String?>(unitWeight.value);
    }
    if (temperature.present) {
      map['temperature'] = Variable<int>(temperature.value);
    }
    if (unitTemperature.present) {
      map['unit_temperature'] = Variable<String?>(unitTemperature.value);
    }
    if (loadPrice.present) {
      map['load_price'] = Variable<int>(loadPrice.value);
    }
    if (totalMileage.present) {
      map['total_mileage'] = Variable<int>(totalMileage.value);
    }
    if (isempty.present) {
      map['isempty'] = Variable<bool>(isempty.value);
    }
    if (consignee.present) {
      map['consignee'] = Variable<String?>(consignee.value);
    }
    if (currency.present) {
      map['currency'] = Variable<String>(currency.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String?>(notes.value);
    }
    if (shipmentId.present) {
      map['shipment_id'] = Variable<int>(shipmentId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LoadsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('weight: $weight, ')
          ..write('unitWeight: $unitWeight, ')
          ..write('temperature: $temperature, ')
          ..write('unitTemperature: $unitTemperature, ')
          ..write('loadPrice: $loadPrice, ')
          ..write('totalMileage: $totalMileage, ')
          ..write('isempty: $isempty, ')
          ..write('consignee: $consignee, ')
          ..write('currency: $currency, ')
          ..write('status: $status, ')
          ..write('notes: $notes, ')
          ..write('shipmentId: $shipmentId')
          ..write(')'))
        .toString();
  }
}

class $LoadsTable extends Loads with TableInfo<$LoadsTable, Load> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LoadsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<int?> weight = GeneratedColumn<int?>(
      'weight', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _unitWeightMeta = const VerificationMeta('unitWeight');
  @override
  late final GeneratedColumn<String?> unitWeight = GeneratedColumn<String?>(
      'unit_weight', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _temperatureMeta =
      const VerificationMeta('temperature');
  @override
  late final GeneratedColumn<int?> temperature = GeneratedColumn<int?>(
      'temperature', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _unitTemperatureMeta =
      const VerificationMeta('unitTemperature');
  @override
  late final GeneratedColumn<String?> unitTemperature =
      GeneratedColumn<String?>('unit_temperature', aliasedName, true,
          type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _loadPriceMeta = const VerificationMeta('loadPrice');
  @override
  late final GeneratedColumn<int?> loadPrice = GeneratedColumn<int?>(
      'load_price', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _totalMileageMeta =
      const VerificationMeta('totalMileage');
  @override
  late final GeneratedColumn<int?> totalMileage = GeneratedColumn<int?>(
      'total_mileage', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _isemptyMeta = const VerificationMeta('isempty');
  @override
  late final GeneratedColumn<bool?> isempty = GeneratedColumn<bool?>(
      'isempty', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (isempty IN (0, 1))',
      defaultValue: const Constant(false));
  final VerificationMeta _consigneeMeta = const VerificationMeta('consignee');
  @override
  late final GeneratedColumn<String?> consignee = GeneratedColumn<String?>(
      'consignee', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _currencyMeta = const VerificationMeta('currency');
  @override
  late final GeneratedColumn<String?> currency = GeneratedColumn<String?>(
      'currency', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String?> status = GeneratedColumn<String?>(
      'status', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String?> notes = GeneratedColumn<String?>(
      'notes', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _shipmentIdMeta = const VerificationMeta('shipmentId');
  @override
  late final GeneratedColumn<int?> shipmentId = GeneratedColumn<int?>(
      'shipment_id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        weight,
        unitWeight,
        temperature,
        unitTemperature,
        loadPrice,
        totalMileage,
        isempty,
        consignee,
        currency,
        status,
        notes,
        shipmentId
      ];
  @override
  String get aliasedName => _alias ?? 'loads';
  @override
  String get actualTableName => 'loads';
  @override
  VerificationContext validateIntegrity(Insertable<Load> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('weight')) {
      context.handle(_weightMeta,
          weight.isAcceptableOrUnknown(data['weight']!, _weightMeta));
    } else if (isInserting) {
      context.missing(_weightMeta);
    }
    if (data.containsKey('unit_weight')) {
      context.handle(
          _unitWeightMeta,
          unitWeight.isAcceptableOrUnknown(
              data['unit_weight']!, _unitWeightMeta));
    }
    if (data.containsKey('temperature')) {
      context.handle(
          _temperatureMeta,
          temperature.isAcceptableOrUnknown(
              data['temperature']!, _temperatureMeta));
    } else if (isInserting) {
      context.missing(_temperatureMeta);
    }
    if (data.containsKey('unit_temperature')) {
      context.handle(
          _unitTemperatureMeta,
          unitTemperature.isAcceptableOrUnknown(
              data['unit_temperature']!, _unitTemperatureMeta));
    }
    if (data.containsKey('load_price')) {
      context.handle(_loadPriceMeta,
          loadPrice.isAcceptableOrUnknown(data['load_price']!, _loadPriceMeta));
    } else if (isInserting) {
      context.missing(_loadPriceMeta);
    }
    if (data.containsKey('total_mileage')) {
      context.handle(
          _totalMileageMeta,
          totalMileage.isAcceptableOrUnknown(
              data['total_mileage']!, _totalMileageMeta));
    } else if (isInserting) {
      context.missing(_totalMileageMeta);
    }
    if (data.containsKey('isempty')) {
      context.handle(_isemptyMeta,
          isempty.isAcceptableOrUnknown(data['isempty']!, _isemptyMeta));
    }
    if (data.containsKey('consignee')) {
      context.handle(_consigneeMeta,
          consignee.isAcceptableOrUnknown(data['consignee']!, _consigneeMeta));
    }
    if (data.containsKey('currency')) {
      context.handle(_currencyMeta,
          currency.isAcceptableOrUnknown(data['currency']!, _currencyMeta));
    } else if (isInserting) {
      context.missing(_currencyMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('shipment_id')) {
      context.handle(
          _shipmentIdMeta,
          shipmentId.isAcceptableOrUnknown(
              data['shipment_id']!, _shipmentIdMeta));
    } else if (isInserting) {
      context.missing(_shipmentIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Load map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Load.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $LoadsTable createAlias(String alias) {
    return $LoadsTable(attachedDatabase, alias);
  }
}

class Location extends DataClass implements Insertable<Location> {
  final int id;
  final String? locationName;
  final String? addressLineOne;
  final String? addressLineTwo;
  final String? city;
  final String? country;
  final String? state;
  final String? zipCode;
  final double latitude;
  final double longitude;
  Location(
      {required this.id,
      this.locationName,
      this.addressLineOne,
      this.addressLineTwo,
      this.city,
      this.country,
      this.state,
      this.zipCode,
      required this.latitude,
      required this.longitude});
  factory Location.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Location(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      locationName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}location_name']),
      addressLineOne: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}address_line_one']),
      addressLineTwo: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}address_line_two']),
      city: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}city']),
      country: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}country']),
      state: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}state']),
      zipCode: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}zip_code']),
      latitude: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}latitude'])!,
      longitude: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}longitude'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || locationName != null) {
      map['location_name'] = Variable<String?>(locationName);
    }
    if (!nullToAbsent || addressLineOne != null) {
      map['address_line_one'] = Variable<String?>(addressLineOne);
    }
    if (!nullToAbsent || addressLineTwo != null) {
      map['address_line_two'] = Variable<String?>(addressLineTwo);
    }
    if (!nullToAbsent || city != null) {
      map['city'] = Variable<String?>(city);
    }
    if (!nullToAbsent || country != null) {
      map['country'] = Variable<String?>(country);
    }
    if (!nullToAbsent || state != null) {
      map['state'] = Variable<String?>(state);
    }
    if (!nullToAbsent || zipCode != null) {
      map['zip_code'] = Variable<String?>(zipCode);
    }
    map['latitude'] = Variable<double>(latitude);
    map['longitude'] = Variable<double>(longitude);
    return map;
  }

  LocationsCompanion toCompanion(bool nullToAbsent) {
    return LocationsCompanion(
      id: Value(id),
      locationName: locationName == null && nullToAbsent
          ? const Value.absent()
          : Value(locationName),
      addressLineOne: addressLineOne == null && nullToAbsent
          ? const Value.absent()
          : Value(addressLineOne),
      addressLineTwo: addressLineTwo == null && nullToAbsent
          ? const Value.absent()
          : Value(addressLineTwo),
      city: city == null && nullToAbsent ? const Value.absent() : Value(city),
      country: country == null && nullToAbsent
          ? const Value.absent()
          : Value(country),
      state:
          state == null && nullToAbsent ? const Value.absent() : Value(state),
      zipCode: zipCode == null && nullToAbsent
          ? const Value.absent()
          : Value(zipCode),
      latitude: Value(latitude),
      longitude: Value(longitude),
    );
  }

  factory Location.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Location(
      id: serializer.fromJson<int>(json['id']),
      locationName: serializer.fromJson<String?>(json['locationName']),
      addressLineOne: serializer.fromJson<String?>(json['addressLineOne']),
      addressLineTwo: serializer.fromJson<String?>(json['addressLineTwo']),
      city: serializer.fromJson<String?>(json['city']),
      country: serializer.fromJson<String?>(json['country']),
      state: serializer.fromJson<String?>(json['state']),
      zipCode: serializer.fromJson<String?>(json['zipCode']),
      latitude: serializer.fromJson<double>(json['latitude']),
      longitude: serializer.fromJson<double>(json['longitude']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'locationName': serializer.toJson<String?>(locationName),
      'addressLineOne': serializer.toJson<String?>(addressLineOne),
      'addressLineTwo': serializer.toJson<String?>(addressLineTwo),
      'city': serializer.toJson<String?>(city),
      'country': serializer.toJson<String?>(country),
      'state': serializer.toJson<String?>(state),
      'zipCode': serializer.toJson<String?>(zipCode),
      'latitude': serializer.toJson<double>(latitude),
      'longitude': serializer.toJson<double>(longitude),
    };
  }

  Location copyWith(
          {int? id,
          String? locationName,
          String? addressLineOne,
          String? addressLineTwo,
          String? city,
          String? country,
          String? state,
          String? zipCode,
          double? latitude,
          double? longitude}) =>
      Location(
        id: id ?? this.id,
        locationName: locationName ?? this.locationName,
        addressLineOne: addressLineOne ?? this.addressLineOne,
        addressLineTwo: addressLineTwo ?? this.addressLineTwo,
        city: city ?? this.city,
        country: country ?? this.country,
        state: state ?? this.state,
        zipCode: zipCode ?? this.zipCode,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
      );
  @override
  String toString() {
    return (StringBuffer('Location(')
          ..write('id: $id, ')
          ..write('locationName: $locationName, ')
          ..write('addressLineOne: $addressLineOne, ')
          ..write('addressLineTwo: $addressLineTwo, ')
          ..write('city: $city, ')
          ..write('country: $country, ')
          ..write('state: $state, ')
          ..write('zipCode: $zipCode, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, locationName, addressLineOne,
      addressLineTwo, city, country, state, zipCode, latitude, longitude);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Location &&
          other.id == this.id &&
          other.locationName == this.locationName &&
          other.addressLineOne == this.addressLineOne &&
          other.addressLineTwo == this.addressLineTwo &&
          other.city == this.city &&
          other.country == this.country &&
          other.state == this.state &&
          other.zipCode == this.zipCode &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude);
}

class LocationsCompanion extends UpdateCompanion<Location> {
  final Value<int> id;
  final Value<String?> locationName;
  final Value<String?> addressLineOne;
  final Value<String?> addressLineTwo;
  final Value<String?> city;
  final Value<String?> country;
  final Value<String?> state;
  final Value<String?> zipCode;
  final Value<double> latitude;
  final Value<double> longitude;
  const LocationsCompanion({
    this.id = const Value.absent(),
    this.locationName = const Value.absent(),
    this.addressLineOne = const Value.absent(),
    this.addressLineTwo = const Value.absent(),
    this.city = const Value.absent(),
    this.country = const Value.absent(),
    this.state = const Value.absent(),
    this.zipCode = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
  });
  LocationsCompanion.insert({
    this.id = const Value.absent(),
    this.locationName = const Value.absent(),
    this.addressLineOne = const Value.absent(),
    this.addressLineTwo = const Value.absent(),
    this.city = const Value.absent(),
    this.country = const Value.absent(),
    this.state = const Value.absent(),
    this.zipCode = const Value.absent(),
    required double latitude,
    required double longitude,
  })  : latitude = Value(latitude),
        longitude = Value(longitude);
  static Insertable<Location> custom({
    Expression<int>? id,
    Expression<String?>? locationName,
    Expression<String?>? addressLineOne,
    Expression<String?>? addressLineTwo,
    Expression<String?>? city,
    Expression<String?>? country,
    Expression<String?>? state,
    Expression<String?>? zipCode,
    Expression<double>? latitude,
    Expression<double>? longitude,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (locationName != null) 'location_name': locationName,
      if (addressLineOne != null) 'address_line_one': addressLineOne,
      if (addressLineTwo != null) 'address_line_two': addressLineTwo,
      if (city != null) 'city': city,
      if (country != null) 'country': country,
      if (state != null) 'state': state,
      if (zipCode != null) 'zip_code': zipCode,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
    });
  }

  LocationsCompanion copyWith(
      {Value<int>? id,
      Value<String?>? locationName,
      Value<String?>? addressLineOne,
      Value<String?>? addressLineTwo,
      Value<String?>? city,
      Value<String?>? country,
      Value<String?>? state,
      Value<String?>? zipCode,
      Value<double>? latitude,
      Value<double>? longitude}) {
    return LocationsCompanion(
      id: id ?? this.id,
      locationName: locationName ?? this.locationName,
      addressLineOne: addressLineOne ?? this.addressLineOne,
      addressLineTwo: addressLineTwo ?? this.addressLineTwo,
      city: city ?? this.city,
      country: country ?? this.country,
      state: state ?? this.state,
      zipCode: zipCode ?? this.zipCode,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (locationName.present) {
      map['location_name'] = Variable<String?>(locationName.value);
    }
    if (addressLineOne.present) {
      map['address_line_one'] = Variable<String?>(addressLineOne.value);
    }
    if (addressLineTwo.present) {
      map['address_line_two'] = Variable<String?>(addressLineTwo.value);
    }
    if (city.present) {
      map['city'] = Variable<String?>(city.value);
    }
    if (country.present) {
      map['country'] = Variable<String?>(country.value);
    }
    if (state.present) {
      map['state'] = Variable<String?>(state.value);
    }
    if (zipCode.present) {
      map['zip_code'] = Variable<String?>(zipCode.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocationsCompanion(')
          ..write('id: $id, ')
          ..write('locationName: $locationName, ')
          ..write('addressLineOne: $addressLineOne, ')
          ..write('addressLineTwo: $addressLineTwo, ')
          ..write('city: $city, ')
          ..write('country: $country, ')
          ..write('state: $state, ')
          ..write('zipCode: $zipCode, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude')
          ..write(')'))
        .toString();
  }
}

class $LocationsTable extends Locations
    with TableInfo<$LocationsTable, Location> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocationsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _locationNameMeta =
      const VerificationMeta('locationName');
  @override
  late final GeneratedColumn<String?> locationName = GeneratedColumn<String?>(
      'location_name', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _addressLineOneMeta =
      const VerificationMeta('addressLineOne');
  @override
  late final GeneratedColumn<String?> addressLineOne = GeneratedColumn<String?>(
      'address_line_one', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _addressLineTwoMeta =
      const VerificationMeta('addressLineTwo');
  @override
  late final GeneratedColumn<String?> addressLineTwo = GeneratedColumn<String?>(
      'address_line_two', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _cityMeta = const VerificationMeta('city');
  @override
  late final GeneratedColumn<String?> city = GeneratedColumn<String?>(
      'city', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _countryMeta = const VerificationMeta('country');
  @override
  late final GeneratedColumn<String?> country = GeneratedColumn<String?>(
      'country', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _stateMeta = const VerificationMeta('state');
  @override
  late final GeneratedColumn<String?> state = GeneratedColumn<String?>(
      'state', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _zipCodeMeta = const VerificationMeta('zipCode');
  @override
  late final GeneratedColumn<String?> zipCode = GeneratedColumn<String?>(
      'zip_code', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _latitudeMeta = const VerificationMeta('latitude');
  @override
  late final GeneratedColumn<double?> latitude = GeneratedColumn<double?>(
      'latitude', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _longitudeMeta = const VerificationMeta('longitude');
  @override
  late final GeneratedColumn<double?> longitude = GeneratedColumn<double?>(
      'longitude', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        locationName,
        addressLineOne,
        addressLineTwo,
        city,
        country,
        state,
        zipCode,
        latitude,
        longitude
      ];
  @override
  String get aliasedName => _alias ?? 'locations';
  @override
  String get actualTableName => 'locations';
  @override
  VerificationContext validateIntegrity(Insertable<Location> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('location_name')) {
      context.handle(
          _locationNameMeta,
          locationName.isAcceptableOrUnknown(
              data['location_name']!, _locationNameMeta));
    }
    if (data.containsKey('address_line_one')) {
      context.handle(
          _addressLineOneMeta,
          addressLineOne.isAcceptableOrUnknown(
              data['address_line_one']!, _addressLineOneMeta));
    }
    if (data.containsKey('address_line_two')) {
      context.handle(
          _addressLineTwoMeta,
          addressLineTwo.isAcceptableOrUnknown(
              data['address_line_two']!, _addressLineTwoMeta));
    }
    if (data.containsKey('city')) {
      context.handle(
          _cityMeta, city.isAcceptableOrUnknown(data['city']!, _cityMeta));
    }
    if (data.containsKey('country')) {
      context.handle(_countryMeta,
          country.isAcceptableOrUnknown(data['country']!, _countryMeta));
    }
    if (data.containsKey('state')) {
      context.handle(
          _stateMeta, state.isAcceptableOrUnknown(data['state']!, _stateMeta));
    }
    if (data.containsKey('zip_code')) {
      context.handle(_zipCodeMeta,
          zipCode.isAcceptableOrUnknown(data['zip_code']!, _zipCodeMeta));
    }
    if (data.containsKey('latitude')) {
      context.handle(_latitudeMeta,
          latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta));
    } else if (isInserting) {
      context.missing(_latitudeMeta);
    }
    if (data.containsKey('longitude')) {
      context.handle(_longitudeMeta,
          longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta));
    } else if (isInserting) {
      context.missing(_longitudeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Location map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Location.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $LocationsTable createAlias(String alias) {
    return $LocationsTable(attachedDatabase, alias);
  }
}

class Notfication extends DataClass implements Insertable<Notfication> {
  final int id;
  final String title;
  final String notes;
  final String updatedOn;
  final bool isRead;
  Notfication(
      {required this.id,
      required this.title,
      required this.notes,
      required this.updatedOn,
      required this.isRead});
  factory Notfication.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Notfication(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      notes: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}notes'])!,
      updatedOn: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_on'])!,
      isRead: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_read'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['notes'] = Variable<String>(notes);
    map['updated_on'] = Variable<String>(updatedOn);
    map['is_read'] = Variable<bool>(isRead);
    return map;
  }

  NotficationsCompanion toCompanion(bool nullToAbsent) {
    return NotficationsCompanion(
      id: Value(id),
      title: Value(title),
      notes: Value(notes),
      updatedOn: Value(updatedOn),
      isRead: Value(isRead),
    );
  }

  factory Notfication.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Notfication(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      notes: serializer.fromJson<String>(json['notes']),
      updatedOn: serializer.fromJson<String>(json['updatedOn']),
      isRead: serializer.fromJson<bool>(json['isRead']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'notes': serializer.toJson<String>(notes),
      'updatedOn': serializer.toJson<String>(updatedOn),
      'isRead': serializer.toJson<bool>(isRead),
    };
  }

  Notfication copyWith(
          {int? id,
          String? title,
          String? notes,
          String? updatedOn,
          bool? isRead}) =>
      Notfication(
        id: id ?? this.id,
        title: title ?? this.title,
        notes: notes ?? this.notes,
        updatedOn: updatedOn ?? this.updatedOn,
        isRead: isRead ?? this.isRead,
      );
  @override
  String toString() {
    return (StringBuffer('Notfication(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('notes: $notes, ')
          ..write('updatedOn: $updatedOn, ')
          ..write('isRead: $isRead')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, notes, updatedOn, isRead);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Notfication &&
          other.id == this.id &&
          other.title == this.title &&
          other.notes == this.notes &&
          other.updatedOn == this.updatedOn &&
          other.isRead == this.isRead);
}

class NotficationsCompanion extends UpdateCompanion<Notfication> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> notes;
  final Value<String> updatedOn;
  final Value<bool> isRead;
  const NotficationsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.notes = const Value.absent(),
    this.updatedOn = const Value.absent(),
    this.isRead = const Value.absent(),
  });
  NotficationsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String notes,
    required String updatedOn,
    this.isRead = const Value.absent(),
  })  : title = Value(title),
        notes = Value(notes),
        updatedOn = Value(updatedOn);
  static Insertable<Notfication> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? notes,
    Expression<String>? updatedOn,
    Expression<bool>? isRead,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (notes != null) 'notes': notes,
      if (updatedOn != null) 'updated_on': updatedOn,
      if (isRead != null) 'is_read': isRead,
    });
  }

  NotficationsCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? notes,
      Value<String>? updatedOn,
      Value<bool>? isRead}) {
    return NotficationsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      notes: notes ?? this.notes,
      updatedOn: updatedOn ?? this.updatedOn,
      isRead: isRead ?? this.isRead,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (updatedOn.present) {
      map['updated_on'] = Variable<String>(updatedOn.value);
    }
    if (isRead.present) {
      map['is_read'] = Variable<bool>(isRead.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NotficationsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('notes: $notes, ')
          ..write('updatedOn: $updatedOn, ')
          ..write('isRead: $isRead')
          ..write(')'))
        .toString();
  }
}

class $NotficationsTable extends Notfications
    with TableInfo<$NotficationsTable, Notfication> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NotficationsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String?> notes = GeneratedColumn<String?>(
      'notes', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _updatedOnMeta = const VerificationMeta('updatedOn');
  @override
  late final GeneratedColumn<String?> updatedOn = GeneratedColumn<String?>(
      'updated_on', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _isReadMeta = const VerificationMeta('isRead');
  @override
  late final GeneratedColumn<bool?> isRead = GeneratedColumn<bool?>(
      'is_read', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (is_read IN (0, 1))',
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [id, title, notes, updatedOn, isRead];
  @override
  String get aliasedName => _alias ?? 'notfications';
  @override
  String get actualTableName => 'notfications';
  @override
  VerificationContext validateIntegrity(Insertable<Notfication> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    } else if (isInserting) {
      context.missing(_notesMeta);
    }
    if (data.containsKey('updated_on')) {
      context.handle(_updatedOnMeta,
          updatedOn.isAcceptableOrUnknown(data['updated_on']!, _updatedOnMeta));
    } else if (isInserting) {
      context.missing(_updatedOnMeta);
    }
    if (data.containsKey('is_read')) {
      context.handle(_isReadMeta,
          isRead.isAcceptableOrUnknown(data['is_read']!, _isReadMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Notfication map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Notfication.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $NotficationsTable createAlias(String alias) {
    return $NotficationsTable(attachedDatabase, alias);
  }
}

class Payroll extends DataClass implements Insertable<Payroll> {
  final int id;
  final int userId;
  final double netRevenue;
  final double grossIncome;
  final String status;
  final String notes;
  final int tenantId;
  final bool isdeleted;
  final DateTime periodStart;
  final DateTime periodEnd;
  final double percent;
  final double revenueAfterPercent;
  final double totalAdvance;
  final double credit;
  final String currency;
  Payroll(
      {required this.id,
      required this.userId,
      required this.netRevenue,
      required this.grossIncome,
      required this.status,
      required this.notes,
      required this.tenantId,
      required this.isdeleted,
      required this.periodStart,
      required this.periodEnd,
      required this.percent,
      required this.revenueAfterPercent,
      required this.totalAdvance,
      required this.credit,
      required this.currency});
  factory Payroll.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Payroll(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      userId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user_id'])!,
      netRevenue: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}net_revenue'])!,
      grossIncome: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}gross_income'])!,
      status: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}status'])!,
      notes: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}notes'])!,
      tenantId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tenant_id'])!,
      isdeleted: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}isdeleted'])!,
      periodStart: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}period_start'])!,
      periodEnd: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}period_end'])!,
      percent: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}percent'])!,
      revenueAfterPercent: const RealType().mapFromDatabaseResponse(
          data['${effectivePrefix}revenue_after_percent'])!,
      totalAdvance: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}total_advance'])!,
      credit: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}credit'])!,
      currency: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}currency'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    map['net_revenue'] = Variable<double>(netRevenue);
    map['gross_income'] = Variable<double>(grossIncome);
    map['status'] = Variable<String>(status);
    map['notes'] = Variable<String>(notes);
    map['tenant_id'] = Variable<int>(tenantId);
    map['isdeleted'] = Variable<bool>(isdeleted);
    map['period_start'] = Variable<DateTime>(periodStart);
    map['period_end'] = Variable<DateTime>(periodEnd);
    map['percent'] = Variable<double>(percent);
    map['revenue_after_percent'] = Variable<double>(revenueAfterPercent);
    map['total_advance'] = Variable<double>(totalAdvance);
    map['credit'] = Variable<double>(credit);
    map['currency'] = Variable<String>(currency);
    return map;
  }

  PayrollsCompanion toCompanion(bool nullToAbsent) {
    return PayrollsCompanion(
      id: Value(id),
      userId: Value(userId),
      netRevenue: Value(netRevenue),
      grossIncome: Value(grossIncome),
      status: Value(status),
      notes: Value(notes),
      tenantId: Value(tenantId),
      isdeleted: Value(isdeleted),
      periodStart: Value(periodStart),
      periodEnd: Value(periodEnd),
      percent: Value(percent),
      revenueAfterPercent: Value(revenueAfterPercent),
      totalAdvance: Value(totalAdvance),
      credit: Value(credit),
      currency: Value(currency),
    );
  }

  factory Payroll.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Payroll(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      netRevenue: serializer.fromJson<double>(json['netRevenue']),
      grossIncome: serializer.fromJson<double>(json['grossIncome']),
      status: serializer.fromJson<String>(json['status']),
      notes: serializer.fromJson<String>(json['notes']),
      tenantId: serializer.fromJson<int>(json['tenantId']),
      isdeleted: serializer.fromJson<bool>(json['isdeleted']),
      periodStart: serializer.fromJson<DateTime>(json['periodStart']),
      periodEnd: serializer.fromJson<DateTime>(json['periodEnd']),
      percent: serializer.fromJson<double>(json['percent']),
      revenueAfterPercent:
          serializer.fromJson<double>(json['revenueAfterPercent']),
      totalAdvance: serializer.fromJson<double>(json['totalAdvance']),
      credit: serializer.fromJson<double>(json['credit']),
      currency: serializer.fromJson<String>(json['currency']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'netRevenue': serializer.toJson<double>(netRevenue),
      'grossIncome': serializer.toJson<double>(grossIncome),
      'status': serializer.toJson<String>(status),
      'notes': serializer.toJson<String>(notes),
      'tenantId': serializer.toJson<int>(tenantId),
      'isdeleted': serializer.toJson<bool>(isdeleted),
      'periodStart': serializer.toJson<DateTime>(periodStart),
      'periodEnd': serializer.toJson<DateTime>(periodEnd),
      'percent': serializer.toJson<double>(percent),
      'revenueAfterPercent': serializer.toJson<double>(revenueAfterPercent),
      'totalAdvance': serializer.toJson<double>(totalAdvance),
      'credit': serializer.toJson<double>(credit),
      'currency': serializer.toJson<String>(currency),
    };
  }

  Payroll copyWith(
          {int? id,
          int? userId,
          double? netRevenue,
          double? grossIncome,
          String? status,
          String? notes,
          int? tenantId,
          bool? isdeleted,
          DateTime? periodStart,
          DateTime? periodEnd,
          double? percent,
          double? revenueAfterPercent,
          double? totalAdvance,
          double? credit,
          String? currency}) =>
      Payroll(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        netRevenue: netRevenue ?? this.netRevenue,
        grossIncome: grossIncome ?? this.grossIncome,
        status: status ?? this.status,
        notes: notes ?? this.notes,
        tenantId: tenantId ?? this.tenantId,
        isdeleted: isdeleted ?? this.isdeleted,
        periodStart: periodStart ?? this.periodStart,
        periodEnd: periodEnd ?? this.periodEnd,
        percent: percent ?? this.percent,
        revenueAfterPercent: revenueAfterPercent ?? this.revenueAfterPercent,
        totalAdvance: totalAdvance ?? this.totalAdvance,
        credit: credit ?? this.credit,
        currency: currency ?? this.currency,
      );
  @override
  String toString() {
    return (StringBuffer('Payroll(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('netRevenue: $netRevenue, ')
          ..write('grossIncome: $grossIncome, ')
          ..write('status: $status, ')
          ..write('notes: $notes, ')
          ..write('tenantId: $tenantId, ')
          ..write('isdeleted: $isdeleted, ')
          ..write('periodStart: $periodStart, ')
          ..write('periodEnd: $periodEnd, ')
          ..write('percent: $percent, ')
          ..write('revenueAfterPercent: $revenueAfterPercent, ')
          ..write('totalAdvance: $totalAdvance, ')
          ..write('credit: $credit, ')
          ..write('currency: $currency')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      userId,
      netRevenue,
      grossIncome,
      status,
      notes,
      tenantId,
      isdeleted,
      periodStart,
      periodEnd,
      percent,
      revenueAfterPercent,
      totalAdvance,
      credit,
      currency);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Payroll &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.netRevenue == this.netRevenue &&
          other.grossIncome == this.grossIncome &&
          other.status == this.status &&
          other.notes == this.notes &&
          other.tenantId == this.tenantId &&
          other.isdeleted == this.isdeleted &&
          other.periodStart == this.periodStart &&
          other.periodEnd == this.periodEnd &&
          other.percent == this.percent &&
          other.revenueAfterPercent == this.revenueAfterPercent &&
          other.totalAdvance == this.totalAdvance &&
          other.credit == this.credit &&
          other.currency == this.currency);
}

class PayrollsCompanion extends UpdateCompanion<Payroll> {
  final Value<int> id;
  final Value<int> userId;
  final Value<double> netRevenue;
  final Value<double> grossIncome;
  final Value<String> status;
  final Value<String> notes;
  final Value<int> tenantId;
  final Value<bool> isdeleted;
  final Value<DateTime> periodStart;
  final Value<DateTime> periodEnd;
  final Value<double> percent;
  final Value<double> revenueAfterPercent;
  final Value<double> totalAdvance;
  final Value<double> credit;
  final Value<String> currency;
  const PayrollsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.netRevenue = const Value.absent(),
    this.grossIncome = const Value.absent(),
    this.status = const Value.absent(),
    this.notes = const Value.absent(),
    this.tenantId = const Value.absent(),
    this.isdeleted = const Value.absent(),
    this.periodStart = const Value.absent(),
    this.periodEnd = const Value.absent(),
    this.percent = const Value.absent(),
    this.revenueAfterPercent = const Value.absent(),
    this.totalAdvance = const Value.absent(),
    this.credit = const Value.absent(),
    this.currency = const Value.absent(),
  });
  PayrollsCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    required double netRevenue,
    required double grossIncome,
    required String status,
    required String notes,
    required int tenantId,
    this.isdeleted = const Value.absent(),
    required DateTime periodStart,
    required DateTime periodEnd,
    required double percent,
    required double revenueAfterPercent,
    required double totalAdvance,
    required double credit,
    required String currency,
  })  : userId = Value(userId),
        netRevenue = Value(netRevenue),
        grossIncome = Value(grossIncome),
        status = Value(status),
        notes = Value(notes),
        tenantId = Value(tenantId),
        periodStart = Value(periodStart),
        periodEnd = Value(periodEnd),
        percent = Value(percent),
        revenueAfterPercent = Value(revenueAfterPercent),
        totalAdvance = Value(totalAdvance),
        credit = Value(credit),
        currency = Value(currency);
  static Insertable<Payroll> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<double>? netRevenue,
    Expression<double>? grossIncome,
    Expression<String>? status,
    Expression<String>? notes,
    Expression<int>? tenantId,
    Expression<bool>? isdeleted,
    Expression<DateTime>? periodStart,
    Expression<DateTime>? periodEnd,
    Expression<double>? percent,
    Expression<double>? revenueAfterPercent,
    Expression<double>? totalAdvance,
    Expression<double>? credit,
    Expression<String>? currency,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (netRevenue != null) 'net_revenue': netRevenue,
      if (grossIncome != null) 'gross_income': grossIncome,
      if (status != null) 'status': status,
      if (notes != null) 'notes': notes,
      if (tenantId != null) 'tenant_id': tenantId,
      if (isdeleted != null) 'isdeleted': isdeleted,
      if (periodStart != null) 'period_start': periodStart,
      if (periodEnd != null) 'period_end': periodEnd,
      if (percent != null) 'percent': percent,
      if (revenueAfterPercent != null)
        'revenue_after_percent': revenueAfterPercent,
      if (totalAdvance != null) 'total_advance': totalAdvance,
      if (credit != null) 'credit': credit,
      if (currency != null) 'currency': currency,
    });
  }

  PayrollsCompanion copyWith(
      {Value<int>? id,
      Value<int>? userId,
      Value<double>? netRevenue,
      Value<double>? grossIncome,
      Value<String>? status,
      Value<String>? notes,
      Value<int>? tenantId,
      Value<bool>? isdeleted,
      Value<DateTime>? periodStart,
      Value<DateTime>? periodEnd,
      Value<double>? percent,
      Value<double>? revenueAfterPercent,
      Value<double>? totalAdvance,
      Value<double>? credit,
      Value<String>? currency}) {
    return PayrollsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      netRevenue: netRevenue ?? this.netRevenue,
      grossIncome: grossIncome ?? this.grossIncome,
      status: status ?? this.status,
      notes: notes ?? this.notes,
      tenantId: tenantId ?? this.tenantId,
      isdeleted: isdeleted ?? this.isdeleted,
      periodStart: periodStart ?? this.periodStart,
      periodEnd: periodEnd ?? this.periodEnd,
      percent: percent ?? this.percent,
      revenueAfterPercent: revenueAfterPercent ?? this.revenueAfterPercent,
      totalAdvance: totalAdvance ?? this.totalAdvance,
      credit: credit ?? this.credit,
      currency: currency ?? this.currency,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (netRevenue.present) {
      map['net_revenue'] = Variable<double>(netRevenue.value);
    }
    if (grossIncome.present) {
      map['gross_income'] = Variable<double>(grossIncome.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (tenantId.present) {
      map['tenant_id'] = Variable<int>(tenantId.value);
    }
    if (isdeleted.present) {
      map['isdeleted'] = Variable<bool>(isdeleted.value);
    }
    if (periodStart.present) {
      map['period_start'] = Variable<DateTime>(periodStart.value);
    }
    if (periodEnd.present) {
      map['period_end'] = Variable<DateTime>(periodEnd.value);
    }
    if (percent.present) {
      map['percent'] = Variable<double>(percent.value);
    }
    if (revenueAfterPercent.present) {
      map['revenue_after_percent'] =
          Variable<double>(revenueAfterPercent.value);
    }
    if (totalAdvance.present) {
      map['total_advance'] = Variable<double>(totalAdvance.value);
    }
    if (credit.present) {
      map['credit'] = Variable<double>(credit.value);
    }
    if (currency.present) {
      map['currency'] = Variable<String>(currency.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PayrollsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('netRevenue: $netRevenue, ')
          ..write('grossIncome: $grossIncome, ')
          ..write('status: $status, ')
          ..write('notes: $notes, ')
          ..write('tenantId: $tenantId, ')
          ..write('isdeleted: $isdeleted, ')
          ..write('periodStart: $periodStart, ')
          ..write('periodEnd: $periodEnd, ')
          ..write('percent: $percent, ')
          ..write('revenueAfterPercent: $revenueAfterPercent, ')
          ..write('totalAdvance: $totalAdvance, ')
          ..write('credit: $credit, ')
          ..write('currency: $currency')
          ..write(')'))
        .toString();
  }
}

class $PayrollsTable extends Payrolls with TableInfo<$PayrollsTable, Payroll> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PayrollsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int?> userId = GeneratedColumn<int?>(
      'user_id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _netRevenueMeta = const VerificationMeta('netRevenue');
  @override
  late final GeneratedColumn<double?> netRevenue = GeneratedColumn<double?>(
      'net_revenue', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _grossIncomeMeta =
      const VerificationMeta('grossIncome');
  @override
  late final GeneratedColumn<double?> grossIncome = GeneratedColumn<double?>(
      'gross_income', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String?> status = GeneratedColumn<String?>(
      'status', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String?> notes = GeneratedColumn<String?>(
      'notes', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _tenantIdMeta = const VerificationMeta('tenantId');
  @override
  late final GeneratedColumn<int?> tenantId = GeneratedColumn<int?>(
      'tenant_id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _isdeletedMeta = const VerificationMeta('isdeleted');
  @override
  late final GeneratedColumn<bool?> isdeleted = GeneratedColumn<bool?>(
      'isdeleted', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (isdeleted IN (0, 1))',
      defaultValue: const Constant(false));
  final VerificationMeta _periodStartMeta =
      const VerificationMeta('periodStart');
  @override
  late final GeneratedColumn<DateTime?> periodStart =
      GeneratedColumn<DateTime?>('period_start', aliasedName, false,
          type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _periodEndMeta = const VerificationMeta('periodEnd');
  @override
  late final GeneratedColumn<DateTime?> periodEnd = GeneratedColumn<DateTime?>(
      'period_end', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _percentMeta = const VerificationMeta('percent');
  @override
  late final GeneratedColumn<double?> percent = GeneratedColumn<double?>(
      'percent', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _revenueAfterPercentMeta =
      const VerificationMeta('revenueAfterPercent');
  @override
  late final GeneratedColumn<double?> revenueAfterPercent =
      GeneratedColumn<double?>('revenue_after_percent', aliasedName, false,
          type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _totalAdvanceMeta =
      const VerificationMeta('totalAdvance');
  @override
  late final GeneratedColumn<double?> totalAdvance = GeneratedColumn<double?>(
      'total_advance', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _creditMeta = const VerificationMeta('credit');
  @override
  late final GeneratedColumn<double?> credit = GeneratedColumn<double?>(
      'credit', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _currencyMeta = const VerificationMeta('currency');
  @override
  late final GeneratedColumn<String?> currency = GeneratedColumn<String?>(
      'currency', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        userId,
        netRevenue,
        grossIncome,
        status,
        notes,
        tenantId,
        isdeleted,
        periodStart,
        periodEnd,
        percent,
        revenueAfterPercent,
        totalAdvance,
        credit,
        currency
      ];
  @override
  String get aliasedName => _alias ?? 'payrolls';
  @override
  String get actualTableName => 'payrolls';
  @override
  VerificationContext validateIntegrity(Insertable<Payroll> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('net_revenue')) {
      context.handle(
          _netRevenueMeta,
          netRevenue.isAcceptableOrUnknown(
              data['net_revenue']!, _netRevenueMeta));
    } else if (isInserting) {
      context.missing(_netRevenueMeta);
    }
    if (data.containsKey('gross_income')) {
      context.handle(
          _grossIncomeMeta,
          grossIncome.isAcceptableOrUnknown(
              data['gross_income']!, _grossIncomeMeta));
    } else if (isInserting) {
      context.missing(_grossIncomeMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    } else if (isInserting) {
      context.missing(_notesMeta);
    }
    if (data.containsKey('tenant_id')) {
      context.handle(_tenantIdMeta,
          tenantId.isAcceptableOrUnknown(data['tenant_id']!, _tenantIdMeta));
    } else if (isInserting) {
      context.missing(_tenantIdMeta);
    }
    if (data.containsKey('isdeleted')) {
      context.handle(_isdeletedMeta,
          isdeleted.isAcceptableOrUnknown(data['isdeleted']!, _isdeletedMeta));
    }
    if (data.containsKey('period_start')) {
      context.handle(
          _periodStartMeta,
          periodStart.isAcceptableOrUnknown(
              data['period_start']!, _periodStartMeta));
    } else if (isInserting) {
      context.missing(_periodStartMeta);
    }
    if (data.containsKey('period_end')) {
      context.handle(_periodEndMeta,
          periodEnd.isAcceptableOrUnknown(data['period_end']!, _periodEndMeta));
    } else if (isInserting) {
      context.missing(_periodEndMeta);
    }
    if (data.containsKey('percent')) {
      context.handle(_percentMeta,
          percent.isAcceptableOrUnknown(data['percent']!, _percentMeta));
    } else if (isInserting) {
      context.missing(_percentMeta);
    }
    if (data.containsKey('revenue_after_percent')) {
      context.handle(
          _revenueAfterPercentMeta,
          revenueAfterPercent.isAcceptableOrUnknown(
              data['revenue_after_percent']!, _revenueAfterPercentMeta));
    } else if (isInserting) {
      context.missing(_revenueAfterPercentMeta);
    }
    if (data.containsKey('total_advance')) {
      context.handle(
          _totalAdvanceMeta,
          totalAdvance.isAcceptableOrUnknown(
              data['total_advance']!, _totalAdvanceMeta));
    } else if (isInserting) {
      context.missing(_totalAdvanceMeta);
    }
    if (data.containsKey('credit')) {
      context.handle(_creditMeta,
          credit.isAcceptableOrUnknown(data['credit']!, _creditMeta));
    } else if (isInserting) {
      context.missing(_creditMeta);
    }
    if (data.containsKey('currency')) {
      context.handle(_currencyMeta,
          currency.isAcceptableOrUnknown(data['currency']!, _currencyMeta));
    } else if (isInserting) {
      context.missing(_currencyMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Payroll map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Payroll.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $PayrollsTable createAlias(String alias) {
    return $PayrollsTable(attachedDatabase, alias);
  }
}

class Shipment extends DataClass implements Insertable<Shipment> {
  final int id;
  final DateTime pickUpTime;
  final DateTime dropOffTime;
  final String? notes;
  final DateTime? createdAt;
  final DateTime? updateddAt;
  final bool? isDeleted;
  final String dispatcher;
  final String broker;
  final String status;
  final String expeditor;
  final String? docs;
  Shipment(
      {required this.id,
      required this.pickUpTime,
      required this.dropOffTime,
      this.notes,
      this.createdAt,
      this.updateddAt,
      this.isDeleted,
      required this.dispatcher,
      required this.broker,
      required this.status,
      required this.expeditor,
      this.docs});
  factory Shipment.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Shipment(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      pickUpTime: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}pick_up_time'])!,
      dropOffTime: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}drop_off_time'])!,
      notes: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}notes']),
      createdAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at']),
      updateddAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}updatedd_at']),
      isDeleted: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_deleted']),
      dispatcher: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}dispatcher'])!,
      broker: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}broker'])!,
      status: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}status'])!,
      expeditor: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}expeditor'])!,
      docs: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}docs']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['pick_up_time'] = Variable<DateTime>(pickUpTime);
    map['drop_off_time'] = Variable<DateTime>(dropOffTime);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String?>(notes);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime?>(createdAt);
    }
    if (!nullToAbsent || updateddAt != null) {
      map['updatedd_at'] = Variable<DateTime?>(updateddAt);
    }
    if (!nullToAbsent || isDeleted != null) {
      map['is_deleted'] = Variable<bool?>(isDeleted);
    }
    map['dispatcher'] = Variable<String>(dispatcher);
    map['broker'] = Variable<String>(broker);
    map['status'] = Variable<String>(status);
    map['expeditor'] = Variable<String>(expeditor);
    if (!nullToAbsent || docs != null) {
      map['docs'] = Variable<String?>(docs);
    }
    return map;
  }

  ShipmentsCompanion toCompanion(bool nullToAbsent) {
    return ShipmentsCompanion(
      id: Value(id),
      pickUpTime: Value(pickUpTime),
      dropOffTime: Value(dropOffTime),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updateddAt: updateddAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updateddAt),
      isDeleted: isDeleted == null && nullToAbsent
          ? const Value.absent()
          : Value(isDeleted),
      dispatcher: Value(dispatcher),
      broker: Value(broker),
      status: Value(status),
      expeditor: Value(expeditor),
      docs: docs == null && nullToAbsent ? const Value.absent() : Value(docs),
    );
  }

  factory Shipment.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Shipment(
      id: serializer.fromJson<int>(json['id']),
      pickUpTime: serializer.fromJson<DateTime>(json['pickUpTime']),
      dropOffTime: serializer.fromJson<DateTime>(json['dropOffTime']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      updateddAt: serializer.fromJson<DateTime?>(json['updateddAt']),
      isDeleted: serializer.fromJson<bool?>(json['isDeleted']),
      dispatcher: serializer.fromJson<String>(json['dispatcher']),
      broker: serializer.fromJson<String>(json['broker']),
      status: serializer.fromJson<String>(json['status']),
      expeditor: serializer.fromJson<String>(json['expeditor']),
      docs: serializer.fromJson<String?>(json['docs']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'pickUpTime': serializer.toJson<DateTime>(pickUpTime),
      'dropOffTime': serializer.toJson<DateTime>(dropOffTime),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'updateddAt': serializer.toJson<DateTime?>(updateddAt),
      'isDeleted': serializer.toJson<bool?>(isDeleted),
      'dispatcher': serializer.toJson<String>(dispatcher),
      'broker': serializer.toJson<String>(broker),
      'status': serializer.toJson<String>(status),
      'expeditor': serializer.toJson<String>(expeditor),
      'docs': serializer.toJson<String?>(docs),
    };
  }

  Shipment copyWith(
          {int? id,
          DateTime? pickUpTime,
          DateTime? dropOffTime,
          String? notes,
          DateTime? createdAt,
          DateTime? updateddAt,
          bool? isDeleted,
          String? dispatcher,
          String? broker,
          String? status,
          String? expeditor,
          String? docs}) =>
      Shipment(
        id: id ?? this.id,
        pickUpTime: pickUpTime ?? this.pickUpTime,
        dropOffTime: dropOffTime ?? this.dropOffTime,
        notes: notes ?? this.notes,
        createdAt: createdAt ?? this.createdAt,
        updateddAt: updateddAt ?? this.updateddAt,
        isDeleted: isDeleted ?? this.isDeleted,
        dispatcher: dispatcher ?? this.dispatcher,
        broker: broker ?? this.broker,
        status: status ?? this.status,
        expeditor: expeditor ?? this.expeditor,
        docs: docs ?? this.docs,
      );
  @override
  String toString() {
    return (StringBuffer('Shipment(')
          ..write('id: $id, ')
          ..write('pickUpTime: $pickUpTime, ')
          ..write('dropOffTime: $dropOffTime, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updateddAt: $updateddAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('dispatcher: $dispatcher, ')
          ..write('broker: $broker, ')
          ..write('status: $status, ')
          ..write('expeditor: $expeditor, ')
          ..write('docs: $docs')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, pickUpTime, dropOffTime, notes, createdAt,
      updateddAt, isDeleted, dispatcher, broker, status, expeditor, docs);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Shipment &&
          other.id == this.id &&
          other.pickUpTime == this.pickUpTime &&
          other.dropOffTime == this.dropOffTime &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt &&
          other.updateddAt == this.updateddAt &&
          other.isDeleted == this.isDeleted &&
          other.dispatcher == this.dispatcher &&
          other.broker == this.broker &&
          other.status == this.status &&
          other.expeditor == this.expeditor &&
          other.docs == this.docs);
}

class ShipmentsCompanion extends UpdateCompanion<Shipment> {
  final Value<int> id;
  final Value<DateTime> pickUpTime;
  final Value<DateTime> dropOffTime;
  final Value<String?> notes;
  final Value<DateTime?> createdAt;
  final Value<DateTime?> updateddAt;
  final Value<bool?> isDeleted;
  final Value<String> dispatcher;
  final Value<String> broker;
  final Value<String> status;
  final Value<String> expeditor;
  final Value<String?> docs;
  const ShipmentsCompanion({
    this.id = const Value.absent(),
    this.pickUpTime = const Value.absent(),
    this.dropOffTime = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updateddAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.dispatcher = const Value.absent(),
    this.broker = const Value.absent(),
    this.status = const Value.absent(),
    this.expeditor = const Value.absent(),
    this.docs = const Value.absent(),
  });
  ShipmentsCompanion.insert({
    this.id = const Value.absent(),
    required DateTime pickUpTime,
    required DateTime dropOffTime,
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updateddAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
    required String dispatcher,
    required String broker,
    required String status,
    required String expeditor,
    this.docs = const Value.absent(),
  })  : pickUpTime = Value(pickUpTime),
        dropOffTime = Value(dropOffTime),
        dispatcher = Value(dispatcher),
        broker = Value(broker),
        status = Value(status),
        expeditor = Value(expeditor);
  static Insertable<Shipment> custom({
    Expression<int>? id,
    Expression<DateTime>? pickUpTime,
    Expression<DateTime>? dropOffTime,
    Expression<String?>? notes,
    Expression<DateTime?>? createdAt,
    Expression<DateTime?>? updateddAt,
    Expression<bool?>? isDeleted,
    Expression<String>? dispatcher,
    Expression<String>? broker,
    Expression<String>? status,
    Expression<String>? expeditor,
    Expression<String?>? docs,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (pickUpTime != null) 'pick_up_time': pickUpTime,
      if (dropOffTime != null) 'drop_off_time': dropOffTime,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (updateddAt != null) 'updatedd_at': updateddAt,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (dispatcher != null) 'dispatcher': dispatcher,
      if (broker != null) 'broker': broker,
      if (status != null) 'status': status,
      if (expeditor != null) 'expeditor': expeditor,
      if (docs != null) 'docs': docs,
    });
  }

  ShipmentsCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? pickUpTime,
      Value<DateTime>? dropOffTime,
      Value<String?>? notes,
      Value<DateTime?>? createdAt,
      Value<DateTime?>? updateddAt,
      Value<bool?>? isDeleted,
      Value<String>? dispatcher,
      Value<String>? broker,
      Value<String>? status,
      Value<String>? expeditor,
      Value<String?>? docs}) {
    return ShipmentsCompanion(
      id: id ?? this.id,
      pickUpTime: pickUpTime ?? this.pickUpTime,
      dropOffTime: dropOffTime ?? this.dropOffTime,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updateddAt: updateddAt ?? this.updateddAt,
      isDeleted: isDeleted ?? this.isDeleted,
      dispatcher: dispatcher ?? this.dispatcher,
      broker: broker ?? this.broker,
      status: status ?? this.status,
      expeditor: expeditor ?? this.expeditor,
      docs: docs ?? this.docs,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (pickUpTime.present) {
      map['pick_up_time'] = Variable<DateTime>(pickUpTime.value);
    }
    if (dropOffTime.present) {
      map['drop_off_time'] = Variable<DateTime>(dropOffTime.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String?>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime?>(createdAt.value);
    }
    if (updateddAt.present) {
      map['updatedd_at'] = Variable<DateTime?>(updateddAt.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool?>(isDeleted.value);
    }
    if (dispatcher.present) {
      map['dispatcher'] = Variable<String>(dispatcher.value);
    }
    if (broker.present) {
      map['broker'] = Variable<String>(broker.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (expeditor.present) {
      map['expeditor'] = Variable<String>(expeditor.value);
    }
    if (docs.present) {
      map['docs'] = Variable<String?>(docs.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ShipmentsCompanion(')
          ..write('id: $id, ')
          ..write('pickUpTime: $pickUpTime, ')
          ..write('dropOffTime: $dropOffTime, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updateddAt: $updateddAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('dispatcher: $dispatcher, ')
          ..write('broker: $broker, ')
          ..write('status: $status, ')
          ..write('expeditor: $expeditor, ')
          ..write('docs: $docs')
          ..write(')'))
        .toString();
  }
}

class $ShipmentsTable extends Shipments
    with TableInfo<$ShipmentsTable, Shipment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ShipmentsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _pickUpTimeMeta = const VerificationMeta('pickUpTime');
  @override
  late final GeneratedColumn<DateTime?> pickUpTime = GeneratedColumn<DateTime?>(
      'pick_up_time', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _dropOffTimeMeta =
      const VerificationMeta('dropOffTime');
  @override
  late final GeneratedColumn<DateTime?> dropOffTime =
      GeneratedColumn<DateTime?>('drop_off_time', aliasedName, false,
          type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String?> notes = GeneratedColumn<String?>(
      'notes', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime?> createdAt = GeneratedColumn<DateTime?>(
      'created_at', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _updateddAtMeta = const VerificationMeta('updateddAt');
  @override
  late final GeneratedColumn<DateTime?> updateddAt = GeneratedColumn<DateTime?>(
      'updatedd_at', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _isDeletedMeta = const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<bool?> isDeleted = GeneratedColumn<bool?>(
      'is_deleted', aliasedName, true,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (is_deleted IN (0, 1))',
      defaultValue: const Constant(false));
  final VerificationMeta _dispatcherMeta = const VerificationMeta('dispatcher');
  @override
  late final GeneratedColumn<String?> dispatcher = GeneratedColumn<String?>(
      'dispatcher', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _brokerMeta = const VerificationMeta('broker');
  @override
  late final GeneratedColumn<String?> broker = GeneratedColumn<String?>(
      'broker', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String?> status = GeneratedColumn<String?>(
      'status', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _expeditorMeta = const VerificationMeta('expeditor');
  @override
  late final GeneratedColumn<String?> expeditor = GeneratedColumn<String?>(
      'expeditor', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _docsMeta = const VerificationMeta('docs');
  @override
  late final GeneratedColumn<String?> docs = GeneratedColumn<String?>(
      'docs', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        pickUpTime,
        dropOffTime,
        notes,
        createdAt,
        updateddAt,
        isDeleted,
        dispatcher,
        broker,
        status,
        expeditor,
        docs
      ];
  @override
  String get aliasedName => _alias ?? 'shipments';
  @override
  String get actualTableName => 'shipments';
  @override
  VerificationContext validateIntegrity(Insertable<Shipment> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('pick_up_time')) {
      context.handle(
          _pickUpTimeMeta,
          pickUpTime.isAcceptableOrUnknown(
              data['pick_up_time']!, _pickUpTimeMeta));
    } else if (isInserting) {
      context.missing(_pickUpTimeMeta);
    }
    if (data.containsKey('drop_off_time')) {
      context.handle(
          _dropOffTimeMeta,
          dropOffTime.isAcceptableOrUnknown(
              data['drop_off_time']!, _dropOffTimeMeta));
    } else if (isInserting) {
      context.missing(_dropOffTimeMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updatedd_at')) {
      context.handle(
          _updateddAtMeta,
          updateddAt.isAcceptableOrUnknown(
              data['updatedd_at']!, _updateddAtMeta));
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    }
    if (data.containsKey('dispatcher')) {
      context.handle(
          _dispatcherMeta,
          dispatcher.isAcceptableOrUnknown(
              data['dispatcher']!, _dispatcherMeta));
    } else if (isInserting) {
      context.missing(_dispatcherMeta);
    }
    if (data.containsKey('broker')) {
      context.handle(_brokerMeta,
          broker.isAcceptableOrUnknown(data['broker']!, _brokerMeta));
    } else if (isInserting) {
      context.missing(_brokerMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('expeditor')) {
      context.handle(_expeditorMeta,
          expeditor.isAcceptableOrUnknown(data['expeditor']!, _expeditorMeta));
    } else if (isInserting) {
      context.missing(_expeditorMeta);
    }
    if (data.containsKey('docs')) {
      context.handle(
          _docsMeta, docs.isAcceptableOrUnknown(data['docs']!, _docsMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Shipment map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Shipment.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ShipmentsTable createAlias(String alias) {
    return $ShipmentsTable(attachedDatabase, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  final int id;
  final String firstname;
  final String lastname;
  final String? address;
  final String email;
  final String username;
  final String password;
  final Role role;
  final String? city;
  final String? country;
  final String? state;
  final String? zipCode;
  final String? telephoneOne;
  final String? telephoneTwo;
  final bool isActive;
  final double? latitude;
  final double? longitude;
  User(
      {required this.id,
      required this.firstname,
      required this.lastname,
      this.address,
      required this.email,
      required this.username,
      required this.password,
      required this.role,
      this.city,
      this.country,
      this.state,
      this.zipCode,
      this.telephoneOne,
      this.telephoneTwo,
      required this.isActive,
      this.latitude,
      this.longitude});
  factory User.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return User(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      firstname: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}firstname'])!,
      lastname: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}lastname'])!,
      address: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}address']),
      email: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}email'])!,
      username: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}username'])!,
      password: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}password'])!,
      role: $UsersTable.$converter0.mapToDart(const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}role']))!,
      city: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}city']),
      country: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}country']),
      state: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}state']),
      zipCode: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}zip_code']),
      telephoneOne: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}telephone_one']),
      telephoneTwo: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}telephone_two']),
      isActive: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_active'])!,
      latitude: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}latitude']),
      longitude: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}longitude']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['firstname'] = Variable<String>(firstname);
    map['lastname'] = Variable<String>(lastname);
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String?>(address);
    }
    map['email'] = Variable<String>(email);
    map['username'] = Variable<String>(username);
    map['password'] = Variable<String>(password);
    {
      final converter = $UsersTable.$converter0;
      map['role'] = Variable<int>(converter.mapToSql(role)!);
    }
    if (!nullToAbsent || city != null) {
      map['city'] = Variable<String?>(city);
    }
    if (!nullToAbsent || country != null) {
      map['country'] = Variable<String?>(country);
    }
    if (!nullToAbsent || state != null) {
      map['state'] = Variable<String?>(state);
    }
    if (!nullToAbsent || zipCode != null) {
      map['zip_code'] = Variable<String?>(zipCode);
    }
    if (!nullToAbsent || telephoneOne != null) {
      map['telephone_one'] = Variable<String?>(telephoneOne);
    }
    if (!nullToAbsent || telephoneTwo != null) {
      map['telephone_two'] = Variable<String?>(telephoneTwo);
    }
    map['is_active'] = Variable<bool>(isActive);
    if (!nullToAbsent || latitude != null) {
      map['latitude'] = Variable<double?>(latitude);
    }
    if (!nullToAbsent || longitude != null) {
      map['longitude'] = Variable<double?>(longitude);
    }
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      firstname: Value(firstname),
      lastname: Value(lastname),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      email: Value(email),
      username: Value(username),
      password: Value(password),
      role: Value(role),
      city: city == null && nullToAbsent ? const Value.absent() : Value(city),
      country: country == null && nullToAbsent
          ? const Value.absent()
          : Value(country),
      state:
          state == null && nullToAbsent ? const Value.absent() : Value(state),
      zipCode: zipCode == null && nullToAbsent
          ? const Value.absent()
          : Value(zipCode),
      telephoneOne: telephoneOne == null && nullToAbsent
          ? const Value.absent()
          : Value(telephoneOne),
      telephoneTwo: telephoneTwo == null && nullToAbsent
          ? const Value.absent()
          : Value(telephoneTwo),
      isActive: Value(isActive),
      latitude: latitude == null && nullToAbsent
          ? const Value.absent()
          : Value(latitude),
      longitude: longitude == null && nullToAbsent
          ? const Value.absent()
          : Value(longitude),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<int>(json['id']),
      firstname: serializer.fromJson<String>(json['firstname']),
      lastname: serializer.fromJson<String>(json['lastname']),
      address: serializer.fromJson<String?>(json['address']),
      email: serializer.fromJson<String>(json['email']),
      username: serializer.fromJson<String>(json['username']),
      password: serializer.fromJson<String>(json['password']),
      role: serializer.fromJson<Role>(json['role']),
      city: serializer.fromJson<String?>(json['city']),
      country: serializer.fromJson<String?>(json['country']),
      state: serializer.fromJson<String?>(json['state']),
      zipCode: serializer.fromJson<String?>(json['zipCode']),
      telephoneOne: serializer.fromJson<String?>(json['telephoneOne']),
      telephoneTwo: serializer.fromJson<String?>(json['telephoneTwo']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      latitude: serializer.fromJson<double?>(json['latitude']),
      longitude: serializer.fromJson<double?>(json['longitude']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'firstname': serializer.toJson<String>(firstname),
      'lastname': serializer.toJson<String>(lastname),
      'address': serializer.toJson<String?>(address),
      'email': serializer.toJson<String>(email),
      'username': serializer.toJson<String>(username),
      'password': serializer.toJson<String>(password),
      'role': serializer.toJson<Role>(role),
      'city': serializer.toJson<String?>(city),
      'country': serializer.toJson<String?>(country),
      'state': serializer.toJson<String?>(state),
      'zipCode': serializer.toJson<String?>(zipCode),
      'telephoneOne': serializer.toJson<String?>(telephoneOne),
      'telephoneTwo': serializer.toJson<String?>(telephoneTwo),
      'isActive': serializer.toJson<bool>(isActive),
      'latitude': serializer.toJson<double?>(latitude),
      'longitude': serializer.toJson<double?>(longitude),
    };
  }

  User copyWith(
          {int? id,
          String? firstname,
          String? lastname,
          String? address,
          String? email,
          String? username,
          String? password,
          Role? role,
          String? city,
          String? country,
          String? state,
          String? zipCode,
          String? telephoneOne,
          String? telephoneTwo,
          bool? isActive,
          double? latitude,
          double? longitude}) =>
      User(
        id: id ?? this.id,
        firstname: firstname ?? this.firstname,
        lastname: lastname ?? this.lastname,
        address: address ?? this.address,
        email: email ?? this.email,
        username: username ?? this.username,
        password: password ?? this.password,
        role: role ?? this.role,
        city: city ?? this.city,
        country: country ?? this.country,
        state: state ?? this.state,
        zipCode: zipCode ?? this.zipCode,
        telephoneOne: telephoneOne ?? this.telephoneOne,
        telephoneTwo: telephoneTwo ?? this.telephoneTwo,
        isActive: isActive ?? this.isActive,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
      );
  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('firstname: $firstname, ')
          ..write('lastname: $lastname, ')
          ..write('address: $address, ')
          ..write('email: $email, ')
          ..write('username: $username, ')
          ..write('password: $password, ')
          ..write('role: $role, ')
          ..write('city: $city, ')
          ..write('country: $country, ')
          ..write('state: $state, ')
          ..write('zipCode: $zipCode, ')
          ..write('telephoneOne: $telephoneOne, ')
          ..write('telephoneTwo: $telephoneTwo, ')
          ..write('isActive: $isActive, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      firstname,
      lastname,
      address,
      email,
      username,
      password,
      role,
      city,
      country,
      state,
      zipCode,
      telephoneOne,
      telephoneTwo,
      isActive,
      latitude,
      longitude);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.firstname == this.firstname &&
          other.lastname == this.lastname &&
          other.address == this.address &&
          other.email == this.email &&
          other.username == this.username &&
          other.password == this.password &&
          other.role == this.role &&
          other.city == this.city &&
          other.country == this.country &&
          other.state == this.state &&
          other.zipCode == this.zipCode &&
          other.telephoneOne == this.telephoneOne &&
          other.telephoneTwo == this.telephoneTwo &&
          other.isActive == this.isActive &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> id;
  final Value<String> firstname;
  final Value<String> lastname;
  final Value<String?> address;
  final Value<String> email;
  final Value<String> username;
  final Value<String> password;
  final Value<Role> role;
  final Value<String?> city;
  final Value<String?> country;
  final Value<String?> state;
  final Value<String?> zipCode;
  final Value<String?> telephoneOne;
  final Value<String?> telephoneTwo;
  final Value<bool> isActive;
  final Value<double?> latitude;
  final Value<double?> longitude;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.firstname = const Value.absent(),
    this.lastname = const Value.absent(),
    this.address = const Value.absent(),
    this.email = const Value.absent(),
    this.username = const Value.absent(),
    this.password = const Value.absent(),
    this.role = const Value.absent(),
    this.city = const Value.absent(),
    this.country = const Value.absent(),
    this.state = const Value.absent(),
    this.zipCode = const Value.absent(),
    this.telephoneOne = const Value.absent(),
    this.telephoneTwo = const Value.absent(),
    this.isActive = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
  });
  UsersCompanion.insert({
    this.id = const Value.absent(),
    required String firstname,
    required String lastname,
    this.address = const Value.absent(),
    required String email,
    required String username,
    required String password,
    required Role role,
    this.city = const Value.absent(),
    this.country = const Value.absent(),
    this.state = const Value.absent(),
    this.zipCode = const Value.absent(),
    this.telephoneOne = const Value.absent(),
    this.telephoneTwo = const Value.absent(),
    this.isActive = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
  })  : firstname = Value(firstname),
        lastname = Value(lastname),
        email = Value(email),
        username = Value(username),
        password = Value(password),
        role = Value(role);
  static Insertable<User> custom({
    Expression<int>? id,
    Expression<String>? firstname,
    Expression<String>? lastname,
    Expression<String?>? address,
    Expression<String>? email,
    Expression<String>? username,
    Expression<String>? password,
    Expression<Role>? role,
    Expression<String?>? city,
    Expression<String?>? country,
    Expression<String?>? state,
    Expression<String?>? zipCode,
    Expression<String?>? telephoneOne,
    Expression<String?>? telephoneTwo,
    Expression<bool>? isActive,
    Expression<double?>? latitude,
    Expression<double?>? longitude,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (firstname != null) 'firstname': firstname,
      if (lastname != null) 'lastname': lastname,
      if (address != null) 'address': address,
      if (email != null) 'email': email,
      if (username != null) 'username': username,
      if (password != null) 'password': password,
      if (role != null) 'role': role,
      if (city != null) 'city': city,
      if (country != null) 'country': country,
      if (state != null) 'state': state,
      if (zipCode != null) 'zip_code': zipCode,
      if (telephoneOne != null) 'telephone_one': telephoneOne,
      if (telephoneTwo != null) 'telephone_two': telephoneTwo,
      if (isActive != null) 'is_active': isActive,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
    });
  }

  UsersCompanion copyWith(
      {Value<int>? id,
      Value<String>? firstname,
      Value<String>? lastname,
      Value<String?>? address,
      Value<String>? email,
      Value<String>? username,
      Value<String>? password,
      Value<Role>? role,
      Value<String?>? city,
      Value<String?>? country,
      Value<String?>? state,
      Value<String?>? zipCode,
      Value<String?>? telephoneOne,
      Value<String?>? telephoneTwo,
      Value<bool>? isActive,
      Value<double?>? latitude,
      Value<double?>? longitude}) {
    return UsersCompanion(
      id: id ?? this.id,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      address: address ?? this.address,
      email: email ?? this.email,
      username: username ?? this.username,
      password: password ?? this.password,
      role: role ?? this.role,
      city: city ?? this.city,
      country: country ?? this.country,
      state: state ?? this.state,
      zipCode: zipCode ?? this.zipCode,
      telephoneOne: telephoneOne ?? this.telephoneOne,
      telephoneTwo: telephoneTwo ?? this.telephoneTwo,
      isActive: isActive ?? this.isActive,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (firstname.present) {
      map['firstname'] = Variable<String>(firstname.value);
    }
    if (lastname.present) {
      map['lastname'] = Variable<String>(lastname.value);
    }
    if (address.present) {
      map['address'] = Variable<String?>(address.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (role.present) {
      final converter = $UsersTable.$converter0;
      map['role'] = Variable<int>(converter.mapToSql(role.value)!);
    }
    if (city.present) {
      map['city'] = Variable<String?>(city.value);
    }
    if (country.present) {
      map['country'] = Variable<String?>(country.value);
    }
    if (state.present) {
      map['state'] = Variable<String?>(state.value);
    }
    if (zipCode.present) {
      map['zip_code'] = Variable<String?>(zipCode.value);
    }
    if (telephoneOne.present) {
      map['telephone_one'] = Variable<String?>(telephoneOne.value);
    }
    if (telephoneTwo.present) {
      map['telephone_two'] = Variable<String?>(telephoneTwo.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double?>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double?>(longitude.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('firstname: $firstname, ')
          ..write('lastname: $lastname, ')
          ..write('address: $address, ')
          ..write('email: $email, ')
          ..write('username: $username, ')
          ..write('password: $password, ')
          ..write('role: $role, ')
          ..write('city: $city, ')
          ..write('country: $country, ')
          ..write('state: $state, ')
          ..write('zipCode: $zipCode, ')
          ..write('telephoneOne: $telephoneOne, ')
          ..write('telephoneTwo: $telephoneTwo, ')
          ..write('isActive: $isActive, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude')
          ..write(')'))
        .toString();
  }
}

class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _firstnameMeta = const VerificationMeta('firstname');
  @override
  late final GeneratedColumn<String?> firstname = GeneratedColumn<String?>(
      'firstname', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _lastnameMeta = const VerificationMeta('lastname');
  @override
  late final GeneratedColumn<String?> lastname = GeneratedColumn<String?>(
      'lastname', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _addressMeta = const VerificationMeta('address');
  @override
  late final GeneratedColumn<String?> address = GeneratedColumn<String?>(
      'address', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String?> email = GeneratedColumn<String?>(
      'email', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _usernameMeta = const VerificationMeta('username');
  @override
  late final GeneratedColumn<String?> username = GeneratedColumn<String?>(
      'username', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _passwordMeta = const VerificationMeta('password');
  @override
  late final GeneratedColumn<String?> password = GeneratedColumn<String?>(
      'password', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumnWithTypeConverter<Role, int?> role =
      GeneratedColumn<int?>('role', aliasedName, false,
              type: const IntType(), requiredDuringInsert: true)
          .withConverter<Role>($UsersTable.$converter0);
  final VerificationMeta _cityMeta = const VerificationMeta('city');
  @override
  late final GeneratedColumn<String?> city = GeneratedColumn<String?>(
      'city', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _countryMeta = const VerificationMeta('country');
  @override
  late final GeneratedColumn<String?> country = GeneratedColumn<String?>(
      'country', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _stateMeta = const VerificationMeta('state');
  @override
  late final GeneratedColumn<String?> state = GeneratedColumn<String?>(
      'state', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _zipCodeMeta = const VerificationMeta('zipCode');
  @override
  late final GeneratedColumn<String?> zipCode = GeneratedColumn<String?>(
      'zip_code', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _telephoneOneMeta =
      const VerificationMeta('telephoneOne');
  @override
  late final GeneratedColumn<String?> telephoneOne = GeneratedColumn<String?>(
      'telephone_one', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _telephoneTwoMeta =
      const VerificationMeta('telephoneTwo');
  @override
  late final GeneratedColumn<String?> telephoneTwo = GeneratedColumn<String?>(
      'telephone_two', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _isActiveMeta = const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool?> isActive = GeneratedColumn<bool?>(
      'is_active', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (is_active IN (0, 1))',
      defaultValue: const Constant(true));
  final VerificationMeta _latitudeMeta = const VerificationMeta('latitude');
  @override
  late final GeneratedColumn<double?> latitude = GeneratedColumn<double?>(
      'latitude', aliasedName, true,
      type: const RealType(), requiredDuringInsert: false);
  final VerificationMeta _longitudeMeta = const VerificationMeta('longitude');
  @override
  late final GeneratedColumn<double?> longitude = GeneratedColumn<double?>(
      'longitude', aliasedName, true,
      type: const RealType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        firstname,
        lastname,
        address,
        email,
        username,
        password,
        role,
        city,
        country,
        state,
        zipCode,
        telephoneOne,
        telephoneTwo,
        isActive,
        latitude,
        longitude
      ];
  @override
  String get aliasedName => _alias ?? 'users';
  @override
  String get actualTableName => 'users';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('firstname')) {
      context.handle(_firstnameMeta,
          firstname.isAcceptableOrUnknown(data['firstname']!, _firstnameMeta));
    } else if (isInserting) {
      context.missing(_firstnameMeta);
    }
    if (data.containsKey('lastname')) {
      context.handle(_lastnameMeta,
          lastname.isAcceptableOrUnknown(data['lastname']!, _lastnameMeta));
    } else if (isInserting) {
      context.missing(_lastnameMeta);
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('username')) {
      context.handle(_usernameMeta,
          username.isAcceptableOrUnknown(data['username']!, _usernameMeta));
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('password')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['password']!, _passwordMeta));
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    context.handle(_roleMeta, const VerificationResult.success());
    if (data.containsKey('city')) {
      context.handle(
          _cityMeta, city.isAcceptableOrUnknown(data['city']!, _cityMeta));
    }
    if (data.containsKey('country')) {
      context.handle(_countryMeta,
          country.isAcceptableOrUnknown(data['country']!, _countryMeta));
    }
    if (data.containsKey('state')) {
      context.handle(
          _stateMeta, state.isAcceptableOrUnknown(data['state']!, _stateMeta));
    }
    if (data.containsKey('zip_code')) {
      context.handle(_zipCodeMeta,
          zipCode.isAcceptableOrUnknown(data['zip_code']!, _zipCodeMeta));
    }
    if (data.containsKey('telephone_one')) {
      context.handle(
          _telephoneOneMeta,
          telephoneOne.isAcceptableOrUnknown(
              data['telephone_one']!, _telephoneOneMeta));
    }
    if (data.containsKey('telephone_two')) {
      context.handle(
          _telephoneTwoMeta,
          telephoneTwo.isAcceptableOrUnknown(
              data['telephone_two']!, _telephoneTwoMeta));
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    if (data.containsKey('latitude')) {
      context.handle(_latitudeMeta,
          latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta));
    }
    if (data.containsKey('longitude')) {
      context.handle(_longitudeMeta,
          longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    return User.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }

  static TypeConverter<Role, int> $converter0 =
      const EnumIndexConverter<Role>(Role.values);
}

class Vehicle extends DataClass implements Insertable<Vehicle> {
  final int id;
  final String vin;
  final int number;
  final String make;
  final String model;
  final int maxTow;
  final int? curbWeight;
  final String type;
  final bool isEmpty;
  Vehicle(
      {required this.id,
      required this.vin,
      required this.number,
      required this.make,
      required this.model,
      required this.maxTow,
      this.curbWeight,
      required this.type,
      required this.isEmpty});
  factory Vehicle.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Vehicle(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      vin: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}vin'])!,
      number: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}number'])!,
      make: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}make'])!,
      model: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}model'])!,
      maxTow: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}max_tow'])!,
      curbWeight: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}curb_weight']),
      type: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}type'])!,
      isEmpty: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_empty'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['vin'] = Variable<String>(vin);
    map['number'] = Variable<int>(number);
    map['make'] = Variable<String>(make);
    map['model'] = Variable<String>(model);
    map['max_tow'] = Variable<int>(maxTow);
    if (!nullToAbsent || curbWeight != null) {
      map['curb_weight'] = Variable<int?>(curbWeight);
    }
    map['type'] = Variable<String>(type);
    map['is_empty'] = Variable<bool>(isEmpty);
    return map;
  }

  VehiclesCompanion toCompanion(bool nullToAbsent) {
    return VehiclesCompanion(
      id: Value(id),
      vin: Value(vin),
      number: Value(number),
      make: Value(make),
      model: Value(model),
      maxTow: Value(maxTow),
      curbWeight: curbWeight == null && nullToAbsent
          ? const Value.absent()
          : Value(curbWeight),
      type: Value(type),
      isEmpty: Value(isEmpty),
    );
  }

  factory Vehicle.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Vehicle(
      id: serializer.fromJson<int>(json['id']),
      vin: serializer.fromJson<String>(json['vin']),
      number: serializer.fromJson<int>(json['number']),
      make: serializer.fromJson<String>(json['make']),
      model: serializer.fromJson<String>(json['model']),
      maxTow: serializer.fromJson<int>(json['maxTow']),
      curbWeight: serializer.fromJson<int?>(json['curbWeight']),
      type: serializer.fromJson<String>(json['type']),
      isEmpty: serializer.fromJson<bool>(json['isEmpty']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'vin': serializer.toJson<String>(vin),
      'number': serializer.toJson<int>(number),
      'make': serializer.toJson<String>(make),
      'model': serializer.toJson<String>(model),
      'maxTow': serializer.toJson<int>(maxTow),
      'curbWeight': serializer.toJson<int?>(curbWeight),
      'type': serializer.toJson<String>(type),
      'isEmpty': serializer.toJson<bool>(isEmpty),
    };
  }

  Vehicle copyWith(
          {int? id,
          String? vin,
          int? number,
          String? make,
          String? model,
          int? maxTow,
          int? curbWeight,
          String? type,
          bool? isEmpty}) =>
      Vehicle(
        id: id ?? this.id,
        vin: vin ?? this.vin,
        number: number ?? this.number,
        make: make ?? this.make,
        model: model ?? this.model,
        maxTow: maxTow ?? this.maxTow,
        curbWeight: curbWeight ?? this.curbWeight,
        type: type ?? this.type,
        isEmpty: isEmpty ?? this.isEmpty,
      );
  @override
  String toString() {
    return (StringBuffer('Vehicle(')
          ..write('id: $id, ')
          ..write('vin: $vin, ')
          ..write('number: $number, ')
          ..write('make: $make, ')
          ..write('model: $model, ')
          ..write('maxTow: $maxTow, ')
          ..write('curbWeight: $curbWeight, ')
          ..write('type: $type, ')
          ..write('isEmpty: $isEmpty')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, vin, number, make, model, maxTow, curbWeight, type, isEmpty);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Vehicle &&
          other.id == this.id &&
          other.vin == this.vin &&
          other.number == this.number &&
          other.make == this.make &&
          other.model == this.model &&
          other.maxTow == this.maxTow &&
          other.curbWeight == this.curbWeight &&
          other.type == this.type &&
          other.isEmpty == this.isEmpty);
}

class VehiclesCompanion extends UpdateCompanion<Vehicle> {
  final Value<int> id;
  final Value<String> vin;
  final Value<int> number;
  final Value<String> make;
  final Value<String> model;
  final Value<int> maxTow;
  final Value<int?> curbWeight;
  final Value<String> type;
  final Value<bool> isEmpty;
  const VehiclesCompanion({
    this.id = const Value.absent(),
    this.vin = const Value.absent(),
    this.number = const Value.absent(),
    this.make = const Value.absent(),
    this.model = const Value.absent(),
    this.maxTow = const Value.absent(),
    this.curbWeight = const Value.absent(),
    this.type = const Value.absent(),
    this.isEmpty = const Value.absent(),
  });
  VehiclesCompanion.insert({
    this.id = const Value.absent(),
    required String vin,
    required int number,
    required String make,
    required String model,
    required int maxTow,
    this.curbWeight = const Value.absent(),
    required String type,
    this.isEmpty = const Value.absent(),
  })  : vin = Value(vin),
        number = Value(number),
        make = Value(make),
        model = Value(model),
        maxTow = Value(maxTow),
        type = Value(type);
  static Insertable<Vehicle> custom({
    Expression<int>? id,
    Expression<String>? vin,
    Expression<int>? number,
    Expression<String>? make,
    Expression<String>? model,
    Expression<int>? maxTow,
    Expression<int?>? curbWeight,
    Expression<String>? type,
    Expression<bool>? isEmpty,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (vin != null) 'vin': vin,
      if (number != null) 'number': number,
      if (make != null) 'make': make,
      if (model != null) 'model': model,
      if (maxTow != null) 'max_tow': maxTow,
      if (curbWeight != null) 'curb_weight': curbWeight,
      if (type != null) 'type': type,
      if (isEmpty != null) 'is_empty': isEmpty,
    });
  }

  VehiclesCompanion copyWith(
      {Value<int>? id,
      Value<String>? vin,
      Value<int>? number,
      Value<String>? make,
      Value<String>? model,
      Value<int>? maxTow,
      Value<int?>? curbWeight,
      Value<String>? type,
      Value<bool>? isEmpty}) {
    return VehiclesCompanion(
      id: id ?? this.id,
      vin: vin ?? this.vin,
      number: number ?? this.number,
      make: make ?? this.make,
      model: model ?? this.model,
      maxTow: maxTow ?? this.maxTow,
      curbWeight: curbWeight ?? this.curbWeight,
      type: type ?? this.type,
      isEmpty: isEmpty ?? this.isEmpty,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (vin.present) {
      map['vin'] = Variable<String>(vin.value);
    }
    if (number.present) {
      map['number'] = Variable<int>(number.value);
    }
    if (make.present) {
      map['make'] = Variable<String>(make.value);
    }
    if (model.present) {
      map['model'] = Variable<String>(model.value);
    }
    if (maxTow.present) {
      map['max_tow'] = Variable<int>(maxTow.value);
    }
    if (curbWeight.present) {
      map['curb_weight'] = Variable<int?>(curbWeight.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (isEmpty.present) {
      map['is_empty'] = Variable<bool>(isEmpty.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VehiclesCompanion(')
          ..write('id: $id, ')
          ..write('vin: $vin, ')
          ..write('number: $number, ')
          ..write('make: $make, ')
          ..write('model: $model, ')
          ..write('maxTow: $maxTow, ')
          ..write('curbWeight: $curbWeight, ')
          ..write('type: $type, ')
          ..write('isEmpty: $isEmpty')
          ..write(')'))
        .toString();
  }
}

class $VehiclesTable extends Vehicles with TableInfo<$VehiclesTable, Vehicle> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VehiclesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _vinMeta = const VerificationMeta('vin');
  @override
  late final GeneratedColumn<String?> vin = GeneratedColumn<String?>(
      'vin', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _numberMeta = const VerificationMeta('number');
  @override
  late final GeneratedColumn<int?> number = GeneratedColumn<int?>(
      'number', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _makeMeta = const VerificationMeta('make');
  @override
  late final GeneratedColumn<String?> make = GeneratedColumn<String?>(
      'make', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _modelMeta = const VerificationMeta('model');
  @override
  late final GeneratedColumn<String?> model = GeneratedColumn<String?>(
      'model', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _maxTowMeta = const VerificationMeta('maxTow');
  @override
  late final GeneratedColumn<int?> maxTow = GeneratedColumn<int?>(
      'max_tow', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _curbWeightMeta = const VerificationMeta('curbWeight');
  @override
  late final GeneratedColumn<int?> curbWeight = GeneratedColumn<int?>(
      'curb_weight', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String?> type = GeneratedColumn<String?>(
      'type', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _isEmptyMeta = const VerificationMeta('isEmpty');
  @override
  late final GeneratedColumn<bool?> isEmpty = GeneratedColumn<bool?>(
      'is_empty', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (is_empty IN (0, 1))',
      defaultValue: const Constant(true));
  @override
  List<GeneratedColumn> get $columns =>
      [id, vin, number, make, model, maxTow, curbWeight, type, isEmpty];
  @override
  String get aliasedName => _alias ?? 'vehicles';
  @override
  String get actualTableName => 'vehicles';
  @override
  VerificationContext validateIntegrity(Insertable<Vehicle> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('vin')) {
      context.handle(
          _vinMeta, vin.isAcceptableOrUnknown(data['vin']!, _vinMeta));
    } else if (isInserting) {
      context.missing(_vinMeta);
    }
    if (data.containsKey('number')) {
      context.handle(_numberMeta,
          number.isAcceptableOrUnknown(data['number']!, _numberMeta));
    } else if (isInserting) {
      context.missing(_numberMeta);
    }
    if (data.containsKey('make')) {
      context.handle(
          _makeMeta, make.isAcceptableOrUnknown(data['make']!, _makeMeta));
    } else if (isInserting) {
      context.missing(_makeMeta);
    }
    if (data.containsKey('model')) {
      context.handle(
          _modelMeta, model.isAcceptableOrUnknown(data['model']!, _modelMeta));
    } else if (isInserting) {
      context.missing(_modelMeta);
    }
    if (data.containsKey('max_tow')) {
      context.handle(_maxTowMeta,
          maxTow.isAcceptableOrUnknown(data['max_tow']!, _maxTowMeta));
    } else if (isInserting) {
      context.missing(_maxTowMeta);
    }
    if (data.containsKey('curb_weight')) {
      context.handle(
          _curbWeightMeta,
          curbWeight.isAcceptableOrUnknown(
              data['curb_weight']!, _curbWeightMeta));
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('is_empty')) {
      context.handle(_isEmptyMeta,
          isEmpty.isAcceptableOrUnknown(data['is_empty']!, _isEmptyMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Vehicle map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Vehicle.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $VehiclesTable createAlias(String alias) {
    return $VehiclesTable(attachedDatabase, alias);
  }
}

abstract class _$LocalDatabase extends GeneratedDatabase {
  _$LocalDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $ChatUsersTable chatUsers = $ChatUsersTable(this);
  late final $DirectMessagesTable directMessages = $DirectMessagesTable(this);
  late final $DriversTable drivers = $DriversTable(this);
  late final $ExpencesTable expences = $ExpencesTable(this);
  late final $LoadsTable loads = $LoadsTable(this);
  late final $LocationsTable locations = $LocationsTable(this);
  late final $NotficationsTable notfications = $NotficationsTable(this);
  late final $PayrollsTable payrolls = $PayrollsTable(this);
  late final $ShipmentsTable shipments = $ShipmentsTable(this);
  late final $UsersTable users = $UsersTable(this);
  late final $VehiclesTable vehicles = $VehiclesTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        chatUsers,
        directMessages,
        drivers,
        expences,
        loads,
        locations,
        notfications,
        payrolls,
        shipments,
        users,
        vehicles
      ];
}
