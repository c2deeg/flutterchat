import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:cle_app/data/settings/local_data.dart';
import 'package:cle_app/services/services.dart';
import 'package:cle_app/widgets/pickers/dropdown_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:intl/intl.dart';
import 'chatdetails.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;
import 'package:socket_io_client/socket_io_client.dart' as io;

class ChatsPage extends StatefulWidget {
  const ChatsPage({Key? key}) : super(key: key);

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  late io.Socket socket;
  String username = LocalData().user.username;
  List<dynamic>? contactList;
  late var onlineusername = [];
  var onlineusercheckofsocket;
  var oldmessagedata;
  var apidata;

  @override
  void initState() {
    super.initState();
    connect();
    getOldChats();
  }

  void onResumed() {
    connect();
  }

  Future<void> getOldChats() async {
    // Uri uri = Uri.parse('http://im2.tainosystems.com:7200/api/messages/getOldChat?room_id='+room_id+'&pageNo='+pageNo.toString()+'&pageSize='+pageSize.toString());
    Uri uri = Uri.parse(
        'http://im2.tainosystems.com:7200/api/messages/getlastMessage?username=' +
            username);
    print("checkingforlocalstorage" + username.toString());
    if (kDebugMode) {
      print("checkurl" + uri.toString());
    }
    final response = await http.get(uri);
    var data = json.decode(response.body);
    if (mounted) {
      setState(() {
        apidata = data['data'];
      });
    }

    print("apidatafornewclone" + apidata.toString());
  }

  void connect() {
    socket = io.io("http://im2.tainosystems.com:7200", <String, dynamic>{
      "transports": ["websocket"],
      "autoconnect": true,
    });
    socket.connect();
    socket.onConnect((data) {
      if (kDebugMode) {
        print("connected hogi");
      }
    });

    if (kDebugMode) {
      print(socket.connected);
    }
    log('data: $socket.connected');
    socket.emit('set-user-data', username);
    socket.on('onlineStack', (data) {
      if (mounted) {
        setState(() {
          onlineusercheckofsocket = data;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red[900],
        body: Column(
          children: [
            // const CategorySelector(),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 248, 228, 230),
                  // borderRadius: BorderRadius.only(
                  //   topLeft: Radius.circular(30),
                  //   topRight: Radius.circular(30),
                  // ),
                ),
                child: Column(
                  children: [
                    FavoriteContacts(onContactsLoaded: (contacts) {
                      setState(() {
                        contactList = contacts;
                      });
                    }),
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        child: apidata?.length == null || contactList == null
                            ? const Center(child: CircularProgressIndicator())
                            : ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: apidata.length,
                            itemBuilder: (context, index) {
                              var name = apidata[index]['name1']
                                  .toString()
                                  .split("-");
                              name[0];

                              var strDate =
                              apidata[index]['chat'][0]['createdOn'];
                              var stringFormat;
                              try {
                                final dateFormat = DateFormat('h:mm a');

                                stringFormat = dateFormat
                                    .format(DateTime.parse(strDate));
                                if (kDebugMode) {
                                  print('checkingfordatestringFormat' +
                                      stringFormat);
                                  print(stringFormat.runtimeType);
                                }
                              } on Exception catch (exception) {
                                if (kDebugMode) {
                                  print(exception);
                                }
                              }

                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ChatDetails(
                                              name: apidata[index]['chat'][0]['msgFrom'] !=
                                                  username
                                                  ? contactList?.firstWhere(
                                                      (user) =>
                                                  user['username'] ==
                                                      apidata[index]['chat']
                                                      [0]['msgFrom'],
                                                  orElse: () =>
                                                  {
                                                    'nom':
                                                    "test@test.com"
                                                  })['nom']
                                                  : contactList?.firstWhere(
                                                  orElse: () =>
                                                  {
                                                    'nom': "test@test.com"
                                                  },
                                                      (user) =>
                                                  user['username'] ==
                                                      apidata[index]['chat'][0]['msgTo'])['nom'],
                                              item: apidata[index]['chat'][0]['msgFrom'] !=
                                                  username
                                                  ? apidata[index]['chat'][0]['msgFrom']
                                                  : apidata[index]['chat'][0]['msgTo'],
                                              messageid: apidata[index]['chat'][0]['_id']),
                                    ),
                                  );

                                  // onlineusercheckofsocket[index]
                                  // ['username']
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    children: [
                                      const SizedBox(width: 20),
                                      ProfilePicture(
                                        name: apidata[index]['chat'][0]['msgFrom'] !=
                                            username
                                            ? contactList?.firstWhere(
                                                (user) =>
                                            user['username'] ==
                                                apidata[index]['chat']
                                                [0]['msgFrom'],
                                            orElse: () =>
                                            {
                                              'nom': "test@test.com"
                                            })['nom']
                                            : contactList?.firstWhere(
                                            orElse: () =>
                                            {
                                              'nom': "test@test.com"
                                            },
                                                (user) =>
                                            user['username'] ==
                                                apidata[index]['chat'][0]['msgTo'])['nom'],
                                        radius: 31,
                                        fontsize: 30,
                                        random: false,
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                Text(
                                                  apidata[index]['chat'][0]
                                                  ['msgFrom'] !=
                                                      username
                                                      ? contactList
                                                      ?.firstWhere((user) =>
                                                  user['username'] ==
                                                      apidata[index]['chat'][0]['msgFrom'],
                                                      orElse: () =>
                                                      {
                                                        'nom':
                                                        "test@test.com"
                                                      })['nom']
                                                      : contactList?.firstWhere(
                                                      orElse: () =>
                                                      {
                                                        'nom':
                                                        "test@test.com"
                                                      },
                                                          (user) =>
                                                      user['username'] ==
                                                          apidata[index]
                                                          ['chat'][0]
                                                          ['msgTo'])['nom'],
                                                  // '${apidata[index]['chat'][0]['msgTo']}',
                                                  style: const TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 16),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .fromLTRB(
                                                      0, 0, 20, 0),
                                                  child: Text(
                                                    stringFormat,
                                                    // apidata[index]['chat']
                                                    //             .length !=
                                                    //         0
                                                    //     ? apidata[index][
                                                    //                 'chat'][0]
                                                    //             [
                                                    //             'createdOn']
                                                    //         .toString()
                                                    //         .substring(
                                                    //             11, 16)
                                                    //     : "",

                                                    // apidata[index]['chat'].length != 0?apidata[index]['chat'][0]['createdOn']:"",
                                                    // '${onlineusercheckofsocket[index]['status']}',
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 10),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 10),
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                Text(
                                                  apidata[index]['chat']
                                                      .length !=
                                                      0
                                                      ? apidata[index]
                                                  ['chat'][0]['msg']
                                                      : "",
                                                  // '${onlineusercheckofsocket[index]['status']}',

                                                  overflow:
                                                  TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12),
                                                ),
                                                Padding(
                                                    padding:
                                                    const EdgeInsets
                                                        .fromLTRB(
                                                        0, 0, 10, 0),
                                                    child: SizedBox(
                                                      width: 50,
                                                      // <-- Your width
                                                      height: 20,
                                                      child: Visibility(
                                                        visible: apidata[index]
                                                        ['chat'][0]['read'] == "false"
                                                            ? true
                                                            : false,
                                                        child:
                                                        ElevatedButton(
                                                          child: Text(
                                                            "New",
                                                            style: TextStyle(
                                                                fontSize:
                                                                11,
                                                                fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                            maxLines: 1,
                                                          ),
                                                          onPressed: () {
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder: (
                                                                    context) =>
                                                                    ChatDetails(
                                                                        name: apidata[index]['chat'][0]['msgFrom'] !=
                                                                            username
                                                                            ? contactList
                                                                            ?.firstWhere(
                                                                                (
                                                                                user) =>
                                                                            user['username'] ==
                                                                                apidata[index]['chat']
                                                                                [0]['msgFrom'],
                                                                            orElse: () =>
                                                                            {
                                                                              'nom':
                                                                              "test@test.com"
                                                                            })['nom']
                                                                            : contactList
                                                                            ?.firstWhere(
                                                                            orElse: () =>
                                                                            {
                                                                              'nom': "test@test.com"
                                                                            },
                                                                                (
                                                                                user) =>
                                                                            user['username'] ==
                                                                                apidata[index]['chat'][0]['msgTo'])['nom'],
                                                                        item: apidata[index]['chat'][0]['msgFrom'] !=
                                                                            username
                                                                            ? apidata[index]['chat'][0]['msgFrom']
                                                                            : apidata[index]['chat'][0]['msgTo'],
                                                                        messageid: apidata[index]['chat'][0]['_id']),
                                                              ),
                                                            );
                                                          },
                                                          style:
                                                          ElevatedButton
                                                              .styleFrom(
                                                            primary:
                                                            Colors.red,
                                                            onPrimary:
                                                            Colors
                                                                .white,
                                                            shape:
                                                            RoundedRectangleBorder(
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  10.0),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    )),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

class FavoriteContacts extends StatefulWidget {
  const FavoriteContacts({Key? key, required this.onContactsLoaded})
      : super(key: key);

  final ValueChanged<List<dynamic>?> onContactsLoaded;

  @override
  State<FavoriteContacts> createState() => _FavoriteContactsState();
}

class _FavoriteContactsState extends State<FavoriteContacts> {
  late var items = [];
  late var ids = [];
  var result;
  late io.Socket socket;
  String username = LocalData().user.username;
  late var onlineusername = [];
  int selectedIndex = 0;
  final List<String> categories = ['Messages', 'Online', 'Groups', 'Urgent'];

  void connect() {
    socket = io.io("http://im2.tainosystems.com:7200", <String, dynamic>{
      "transports": ["websocket"],
      "autoconnect": false,
    });
    socket.connect();
    socket.onConnect((data) => print("connected hogi"));
    if (kDebugMode) {
      print(socket.connected);
    }
    log('data: $socket.connected');
    socket.emit('set-user-data', username);

    socket.on('onlineStack', (data) {
      if (kDebugMode) {
        print('onlinecheck---' + data.toString());
        print('usernamecheck---' + username);
        print('checkkey---' + data[1].toString());
      }

      var listdata = data[1];
      if (kDebugMode) {
        print('checkkeydata---' + data[1].toString());
      }

      if (mounted) {
        setState(() {
          items.clear();
          for (var i = 1; i < data.length; i++) {
            onlineusername.add(data[i]["username"]);
            if (kDebugMode) {
              print(onlineusername.toString());
            }
            if (data[i]["status"] == "online") {
              items.add(data[i]['username']);
            }
            developer.log("checkonlineuser" + onlineusername.length.toString());
          }
        });
      }
    });

    socket.on('oops', (opsdata) {
      if (kDebugMode) {
        print('undefined' + opsdata);
      }
    });
  }

  //void onlineStack(){
  //  }
  Future<void> getusers() async {
    final token = await SecureStore.getToken();
    Uri uri = Uri.parse(
        'https://logistics.tainosystems.com/api/v1/getalluser/' + token!);
    // Uri uri = Uri.parse(
    //     'https://app.sysgestock.com/tnslogisticsapi/getalluser/' + token!);
    final response = await http.get(uri);
    var data = json.decode(response.body);
    if (kDebugMode) {
      print(data);
    }
    items = [];
    if (mounted) {
      setState(() {
        result = data['result'];
        widget.onContactsLoaded(result);
        for (var i = 0; i < result.length; i++) {
          items.add(result[i]['username']);
          ids.add(result[i]['id']);
        }
        if (kDebugMode) {
          print(items.toString());
        }
      });
    }
  }

  // Future<List<GetUser>> getuserList() async {
  //   developer.log("apiHit Successfully0");
  //   final token = await SecureStore.getToken().toString();
  //   developer.log('token----   '+token);
  //   final response = await http.get(Uri.parse('https://logistics.tainosystems.com/api/v1/getalluser/'+token));
  //   developer.log('checkresponse12' + response.body);
  //
  //   if (response.statusCode == 200) {
  //     developer.log('checkresponse' + response.statusCode.toString());
  //     developer.log("apiHit Successfully");
  //     var res = json.decode(response.body);
  //     developer.log("res Successfully---"+res);
  //
  //     final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
  //
  //     developer.log("parsed-------"+parsed.toString());
  //
  //     return parsed.map<GetUser>((json) => GetUser.fromMap(json["result"])).toList();
  //   } else {
  //     developer.log("apiHit failed");
  //
  //     throw Exception('Failed to load UserList');
  //   }
  // }
  @override
  void initState() {
    getusers();
    super.initState();
    connect();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Container(
        //   height: 80,
        //   color: Colors.red[900],
        //   alignment: Alignment.centerLeft,
        //   child: ListView.builder(
        //     shrinkWrap: true,
        //     physics: const BouncingScrollPhysics(),
        //     scrollDirection: Axis.horizontal,
        //     itemCount: categories.length,
        //     itemBuilder: (context, index) {
        //       return Padding(
        //         padding: const EdgeInsets.symmetric(
        //           horizontal: 20,
        //         ),
        //         child: TextButton(
        //           onPressed: (() {
        //             setState(() {
        //               selectedIndex = index;
        //             });
        //             if (selectedIndex == 1) {
        //               // this.items.clear();
        //               developer
        //                   .log("selectedindex--" + selectedIndex.toString());
        //               // connect();
        //             } else if (selectedIndex == 0) {
        //               // this.items.clear();
        //               developer
        //                   .log("selectedindex--" + selectedIndex.toString());
        //               // getusers();
        //             }
        //           }),
        //           child: Text(
        //             categories[index],
        //             style: TextStyle(
        //                 color: index == selectedIndex
        //                     ? Colors.white
        //                     : Colors.white54,
        //                 fontSize: 25,
        //                 fontWeight: FontWeight.bold,
        //                 letterSpacing: 1.5),
        //           ),
        //         ),
        //       );
        //     },
        //   ),
        // ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Contacts',
                style: TextStyle(
                    color: Colors.red, fontSize: 20, letterSpacing: .9),
              ),
              if (result?.length != null)
                IconButton(
                  onPressed: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    DropDownState(
                      DropDown(
                        submitButtonColor: Colors.grey.shade300,
                        searchHintText: 'Search Contacts',
                        bottomSheetTitle: 'Contacts',
                        searchBackgroundColor: Colors.black12,
                        dataList: (result as List<dynamic>)
                            .map((e) =>
                            SelectedListItem(false,
                              e['nom'] != null
                                  ? '${e['nom']}'
                                  : '${e['username']}',
                              value: e['username'],
                            ))
                            .toList(),
                        selectedItem: (name, value) {
                          print(value);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ChatDetails(
                                    item: value,
                                    name: name,
                                    messageid: '',
                                  ),
                            ),
                          );
                        },
                        enableMultipleSelection: false,
                        searchController: TextEditingController(),
                      ),
                    ).showModal(context);
                  },
                  icon: const Icon(Icons.search),
                  color: Colors.red,
                  iconSize: 30,
                )
            ],
          ),
        ),
        SizedBox(
            height: 120,
            child: result?.length == null
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: result.length,
                shrinkWrap: true,
                padding: const EdgeInsets.only(left: 10.0),
                itemBuilder: (context, index) {
                  final contact = result[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ChatDetails(
                                item: contact['username'],
                                name: contact['nom'] != null
                                    ? '${contact['nom']}'
                                    : '${contact['username']}',
                                messageid: '',
                              ),
                          // settings: RouteSettings(
                          //   arguments: items[index],
                          // )
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          ProfilePicture(
                            name: contact['nom'] != null
                                ? '${contact['nom']}'
                                : '${contact['username']}',
                            radius: 31,
                            fontsize: 30,
                            random: false,
                          ),
                          Text(
                            contact['nom'] != null
                                ? '${contact['nom']}'
                                : '${contact['username']}',
                            style: const TextStyle(
                                color: Colors.red, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  );
                })),
      ],
    );
  }
}
//
// class CategorySelector extends StatefulWidget {
//   const CategorySelector({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   State<CategorySelector> createState() => _CategorySelectorState();
// }
//
// class _CategorySelectorState extends State<CategorySelector> {
//   int selectedIndex = 0;
//   final List<String> categories = ['Messages', 'Online', 'Groups', 'Urgent'];
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 80,
//       color: Colors.red[900],
//       child:
//       ListView.builder(
//         shrinkWrap: true,
//         physics: const BouncingScrollPhysics(),
//         scrollDirection: Axis.horizontal,
//         itemCount: categories.length,
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: const EdgeInsets.symmetric(
//               horizontal: 20,
//             ),
//             child: TextButton(
//               onPressed: (() {
//                 Null;
//                 // setState(() {
//                 //   // selectedIndex = index;
//                 // });
//
//               }),
//               child: Text(
//                 categories[index],
//                 style: TextStyle(
//                     color:
//                     index == selectedIndex ? Colors.white : Colors.white54,
//                     fontSize: 25,
//                     fontWeight: FontWeight.bold,
//                     letterSpacing: 1.5),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
