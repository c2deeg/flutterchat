// import 'dart:async';
// import 'dart:developer';
// import 'dart:io';

// import 'package:permission_handler/permission_handler.dart';
// import 'package:xmpp_plugin/error_response_event.dart';
// import 'package:xmpp_plugin/models/chat_state_model.dart';
// import 'package:xmpp_plugin/models/connection_event.dart';
// import 'package:xmpp_plugin/models/message_model.dart';
// import 'package:xmpp_plugin/models/present_mode.dart';
// import 'package:xmpp_plugin/success_response_event.dart';
// import 'package:xmpp_plugin/xmpp_plugin.dart';

// class ChatService {
//   Future<void> connect() async {
//     final auth = {
//       "user_jid":
//           "${_userNameController.text}@${_hostController.text}/${Platform.isAndroid ? "Android" : "iOS"}",
//       "password": "${_passwordController.text}",
//       "host": "${_hostController.text}",
//       "port": '5222',
//       "nativeLogFilePath": NativeLogHelper.logFilePath,
//       "requireSSLConnection": true,
//       "autoDeliveryReceipt": true,
//       "useStreamManagement": false,
//       "automaticReconnection": true,
//     };

//     flutterXmpp = XmppConnection(auth);
//     await flutterXmpp.start(_onError);
//     await flutterXmpp.login();
//   }

//   void checkStoragePermission() async {
//     var status = await Permission.storage.status;
//     if (!status.isGranted) {
//       final PermissionStatus _permissionStatus =
//           await Permission.storage.request();
//       if (_permissionStatus.isGranted) {
//         String filePath = await NativeLogHelper().getDefaultLogFilePath();
//         print('logFilePath: $filePath');
//       } else {
//         print('logFilePath: please allow permission');
//       }
//     } else {
//       String filePath = await NativeLogHelper().getDefaultLogFilePath();
//       print('logFilePath: $filePath');
//     }
//   }

//   void _onError(Object error) {
//     // TODO : Handle the Error event
//   }

//   @override
//   void onXmppError(ErrorResponseEvent errorResponseEvent) {
//     print(
//         'receiveEvent onXmppError: ${errorResponseEvent.toErrorResponseData().toString()}');
//   }

//   @override
//   void onSuccessEvent(SuccessResponseEvent successResponseEvent) {
//     print(
//         'receiveEvent successEventReceive: ${successResponseEvent.toSuccessResponseData().toString()}');
//   }

//   @override
//   void onChatMessage(MessageChat messageChat) {
//     events.add(messageChat);
//     print('onChatMessage: ${messageChat.toEventData()}');
//   }

//   @override
//   void onGroupMessage(MessageChat messageChat) {
//     events.add(messageChat);
//     print('onGroupMessage: ${messageChat.toEventData()}');
//   }

//   @override
//   void onNormalMessage(MessageChat messageChat) {
//     events.add(messageChat);
//     print('onNormalMessage: ${messageChat.toEventData()}');
//   }

//   @override
//   void onPresenceChange(PresentModel presentModel) {
//     presentMo.add(presentModel);
//     log('onPresenceChange ~~>>${presentModel.toJson()}');
//   }

//   @override
//   void onChatStateChange(ChatState chatState) {
//     log('onChatStateChange ~~>>$chatState');
//   }

//   @override
//   void onConnectionEvents(ConnectionEvent connectionEvent) {
//     log('onConnectionEvents ~~>>${connectionEvent.toJson()}');
//     connectionStatus = connectionEvent.type!.toConnectionName();
//     setState(() {});
//   }

//   Future<void> disconnectXMPP() async => await flutterXmpp.logout();

//   Future<String> joinMucGroups(List<String> allGroupsId) async {
//     return await flutterXmpp.joinMucGroups(allGroupsId);
//   }

//   Future<bool> joinMucGroup(String groupId) async {
//     return await flutterXmpp.joinMucGroup(groupId);
//   }

//   Future<void> addMembersInGroup(String groupName, List<String> members) async {
//     await flutterXmpp.addMembersInGroup(groupName, members);
//   }

//   Future<void> addAdminsInGroup(
//       String groupName, List<String> adminMembers) async {
//     await flutterXmpp.addAdminsInGroup(groupName, adminMembers);
//   }

//   Future<void> getMembers(String groupName) async {
//     await flutterXmpp.getMembers(groupName);
//   }

//   Future<void> getOwners(String groupName) async {
//     await flutterXmpp.getOwners(groupName);
//   }

//   Future<void> getOnlineMemberCount(String groupName) async {
//     await flutterXmpp.getOnlineMemberCount(groupName);
//   }

//   Future<void> removeMember(String groupName, List<String> membersJid) async {
//     await flutterXmpp.removeMember(groupName, membersJid);
//   }

//   Future<void> removeAdmin(String groupName, List<String> membersJid) async {
//     await flutterXmpp.removeAdmin(groupName, membersJid);
//   }

//   Future<void> addOwner(String groupName, List<String> membersJid) async {
//     await flutterXmpp.addOwner(groupName, membersJid);
//   }

//   Future<void> removeOwner(String groupName, List<String> membersJid) async {
//     await flutterXmpp.removeOwner(groupName, membersJid);
//   }

//   Future<void> getAdmins(String groupName) async {
//     await flutterXmpp.getAdmins(groupName);
//   }

//   Future<void> changePresenceType(presenceType, presenceMode) async {
//     await flutterXmpp.changePresenceType(presenceType, presenceMode);
//   }
// }
