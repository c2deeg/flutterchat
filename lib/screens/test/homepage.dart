// import 'package:cle_app/screens/test/test.dart';
// import 'package:flutter/material.dart';

// class HomePage extends StatefulWidget {
//   final String groupName;
//   final Function(String, List<String>) addMembersInGroup;
//   final Function(String, List<String>) addAdminsInGroup;
//   final Function(String, List<String>) removeMember;
//   final Function(String, List<String>) removeAdmin;
//   final Function(String, List<String>) addOwner;
//   final Function(String, List<String>) removeOwner;
//   final Function(String) getMembers;
//   final Function(String) getAdmins;
//   final Function(String) getOwners;
//   final Function(String) getOnlineMemberCount;

//   const HomePage(
//       {required this.groupName,
//       required this.addMembersInGroup,
//       required this.addAdminsInGroup,
//       required this.removeMember,
//       required this.removeAdmin,
//       required this.addOwner,
//       required this.removeOwner,
//       required this.getMembers,
//       required this.getOwners,
//       required this.getAdmins,
//       required this.getOnlineMemberCount});

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final TextEditingController _memberController = TextEditingController();
//   List<String?> addMemberList = [];
//   List<String?> addAdminList = [];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('HomePage'),
//         backgroundColor: Colors.black,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 15),
//           child: Column(
//             children: [
//               const SizedBox(
//                 height: 10,
//               ),
//               customTextField(
//                 hintText: 'Member Id',
//                 textEditController: _memberController,
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               ElevatedButton(
//                 onPressed: () async {
//                   widget.addMembersInGroup(
//                       widget.groupName, [(_memberController.text)]);
//                 },
//                 child: const Text('Add Member'),
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.black,
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               ElevatedButton(
//                 onPressed: () async {
//                   widget.addAdminsInGroup(
//                       widget.groupName, [(_memberController.text)]);
//                 },
//                 child: const Text('Add Admin'),
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.black,
//                 ),
//               ),
//               const Divider(
//                 color: Colors.black,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   ElevatedButton(
//                     onPressed: () async {
//                       widget.getMembers(widget.groupName);
//                     },
//                     child: const Text('Get Member'),
//                     style: ElevatedButton.styleFrom(
//                       primary: Colors.black,
//                     ),
//                   ),
//                   ElevatedButton(
//                     onPressed: () async {
//                       widget.getAdmins(widget.groupName);
//                     },
//                     child: const Text('Get Admin'),
//                     style: ElevatedButton.styleFrom(
//                       primary: Colors.black,
//                     ),
//                   ),
//                 ],
//               ),
//               const Divider(
//                 color: Colors.black,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   ElevatedButton(
//                     onPressed: () async {
//                       widget.removeMember(
//                           widget.groupName, [(_memberController.text)]);
//                     },
//                     child: const Text('Remove Member'),
//                     style: ElevatedButton.styleFrom(
//                       primary: Colors.black,
//                     ),
//                   ),
//                   ElevatedButton(
//                     onPressed: () async {
//                       widget.removeAdmin(
//                           widget.groupName, [(_memberController.text)]);
//                     },
//                     child: const Text('Remove admin'),
//                     style: ElevatedButton.styleFrom(
//                       primary: Colors.black,
//                     ),
//                   ),
//                 ],
//               ),
//               const Divider(
//                 color: Colors.black,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   ElevatedButton(
//                     onPressed: () async {
//                       widget.addOwner(
//                           widget.groupName, [(_memberController.text)]);
//                     },
//                     child: const Text('Add owner'),
//                     style: ElevatedButton.styleFrom(
//                       primary: Colors.black,
//                     ),
//                   ),
//                   ElevatedButton(
//                     onPressed: () async {
//                       widget.removeOwner(
//                           widget.groupName, [(_memberController.text)]);
//                     },
//                     child: const Text('Remove owner'),
//                     style: ElevatedButton.styleFrom(
//                       primary: Colors.black,
//                     ),
//                   ),
//                 ],
//               ),
//               const Divider(
//                 color: Colors.black,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   ElevatedButton(
//                     onPressed: () async {
//                       widget.getOwners(widget.groupName);
//                     },
//                     child: const Text('List owner'),
//                     style: ElevatedButton.styleFrom(
//                       primary: Colors.black,
//                     ),
//                   ),
//                   ElevatedButton(
//                     onPressed: () async {
//                       widget.getOnlineMemberCount(widget.groupName);
//                     },
//                     child: const Text('Get Occupants Size'),
//                     style: ElevatedButton.styleFrom(
//                       primary: Colors.black,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Future<ListView> _getMemberList(addMemberList) async {
//     return ListView.builder(
//       itemCount: addMemberList.length,
//       itemBuilder: (context, i) {
//         return ListTile(
//           title: Text("${addMemberList[i]}"),
//         );
//       },
//     );
//   }

//   Future<ListView> _getAdminList(addAdminList) async {
//     return ListView.builder(
//       itemCount: addAdminList.length,
//       itemBuilder: (context, i) {
//         return ListTile(
//           title: Text("${addAdminList[i]}"),
//         );
//       },
//     );
//   }
// }
