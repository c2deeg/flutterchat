import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:cle_app/api/Model/getuserlistModel.dart';
import 'package:cle_app/data/api/api.dart';
import 'package:cle_app/data/settings/local_data.dart';
import 'package:cle_app/screens/screens.dart';
import 'package:cle_app/services/services.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../services/vehical_service.dart';
import 'UserListModel.dart';
import 'chatdetails.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;
import 'package:socket_io_client/socket_io_client.dart' as IO;





class ChatsPage extends StatefulWidget {
  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
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
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    FavoriteContacts(),
                    Expanded(
                      child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
                          child: Center(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    FontAwesomeIcons.solidComments,
                                    color: Colors.black,
                                    size: 70,
                                  ),
                                  Text(
                                    "No Messages...yet.",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 30),
                                  ),
                                  Text(
                                    "Start chatting with the people within our company.",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 16),
                                  )
                                ]),
                          )
                        // child: const ChatMessageTile(),
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

  @override
  State<FavoriteContacts> createState() => _FavoriteContactsState();
}

class _FavoriteContactsState extends State<FavoriteContacts> {

  late var items = [];
  late var ids = [];
  var result;
  late IO.Socket socket;
  String username = LocalData().user.username;
  late var onlineusername = [];
  int selectedIndex = 0;
  final List<String> categories = ['Messages', 'Online', 'Groups', 'Urgent'];


  void connect() {
    socket = IO.io("http://im2.tainosystems.com:7200", <String, dynamic>{
      "transports": ["websocket"],
      "autoconnect": false,
    });
    socket.connect();
    socket.onConnect((data) => print("connected hogi"));
    print(socket.connected);
    log('data: $socket.connected');
    socket.emit('set-user-data', username);


    socket.on('onlineStack', (data) {
      print('onlinecheck---'+data.toString());
      print('usernamecheck---'+username);

      print('checkkey---'+data[1].toString());
      var listdata  = data[1];
      print('checkkeydata---'+data[1].toString());


      this.setState(() {
        this.items.clear();
        for(var i = 1; i<data.length;i++){
          this.onlineusername.add(data[i]["username"]);
          print(this.onlineusername.toString());
          if (data[i]["status"] == "online"){
            this.items.add(data[i]['username']);
          }
          developer.log("checkonlineuser"+onlineusername.length.toString());
        }
      });
    });

    socket.on('oops', (opsdata){
      print('undefined'+opsdata);

    });

  }

  //void onlineStack(){
  //  }
  Future <void> getusers() async{
    final token = await SecureStore.getToken();
    Uri uri = Uri.parse('https://app.sysgestock.com/tnslogisticsapi/getalluser/'+token!);
    final response = await http.get(uri);
    var data = json.decode(response.body);
    print(data);
    this.items = [];
    this.setState(() {
      result = data['result'];
      for(var i = 0; i< result.length; i++){
        this.items.add(result[i]['username']);
        this.ids.add(result[i]['id']);
      }
      print(this.items.toString());
    });

  }

  // Future<List<GetUser>> getuserList() async {
  //   developer.log("apiHit Successfully0");
  //   final token = await SecureStore.getToken().toString();
  //   developer.log('token----   '+token);
  //   final response = await http.get(Uri.parse('https://app.sysgestock.com/tnslogisticsapi/getalluser/'+token));
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
        Container(
          height: 80,
          color: Colors.red[900],
          alignment: Alignment.centerLeft,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: TextButton(
                  onPressed: (() {
                    setState(() {
                      selectedIndex = index;

                    });
                    if (selectedIndex == 1){
                      // this.items.clear();
                      developer.log("selectedindex--"+selectedIndex.toString());
                      // connect();
                    }else if (selectedIndex == 0){
                      // this.items.clear();
                      developer.log("selectedindex--"+selectedIndex.toString());
                      // getusers();
                    }

                  }),
                  child: Text(
                    categories[index],
                    style: TextStyle(
                        color:
                        index == selectedIndex ? Colors.white : Colors.white54,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5),
                  ),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Favorite Contacts',
                style: TextStyle(
                    color: Colors.red, fontSize: 20, letterSpacing: .9),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_horiz),
                color: Colors.red,
                iconSize: 30,
              )
            ],
          ),
        ),
        SizedBox(
            height: 120,
            child:
            result?.length == null
                ? Center(child: CircularProgressIndicator()):
            ListView.builder(
                scrollDirection: Axis.horizontal,

                itemCount: result.length,
                shrinkWrap: true,
                padding: const EdgeInsets.only(left: 10.0),
                itemBuilder: (context, index) {

                  return GestureDetector(
                    onTap: () {

                      developer.log("tapeeeed-------"+items[index]);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  ChatDetails(item:result[index]['username']),
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
                          const CircleAvatar(
                            radius: 18,
                            child: FaIcon(FontAwesomeIcons.solidUser),
                          ),
                          Text(
                            '${result[index]['username']}',
                            style: const TextStyle(
                                color: Colors.red, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  );
                })

        ),
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

class MyHttpOverrides extends HttpOverrides{
  @override

  HttpClient createHttpClient(context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}