import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:cle_app/data/settings/local_data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;
import 'chat_message.dart';
import 'dart:developer' as developer;
import 'package:http/http.dart' as http;

List<ChatMessage> messages = [];

class ChatDetails extends StatefulWidget {
  // const ChatDetails({super.key});
  const ChatDetails(
      {super.key,
      required this.item,
      required this.name,
      required this.messageid});
  final String item;
  final String name;
  final messageid;

  @override
  State<ChatDetails> createState() => _ChatDetailsState();
}

class _ChatDetailsState extends State<ChatDetails> {
  late var items = [];
  dynamic roomid;

// const ChatDetails({Key? key}) : super(key: key);
  TextEditingController myController = TextEditingController();

  ScrollController controller = ScrollController();
  late io.Socket socket;
  String username = LocalData().user.username;

  bool isPageLoading = true;

  int i = 1;
  int n = 1000;

  var reversedList;
  var roomassignid;
  bool scrollcheck = true;

  @override
  void initState() {
    super.initState();

    connect();
    getData();
    updatestatusread();
  }

  getData() {
    if (mounted) {
      controller.addListener(() async {
        if (controller.position.pixels == controller.position.maxScrollExtent &&
            isPageLoading == false) {
          final prefs = await SharedPreferences.getInstance();

          isPageLoading = true;

          if (i < n) {
            getOldChats(roomid, i++, n);
          }
        } else if (controller.position.pixels ==
                controller.position.minScrollExtent &&
            isPageLoading == false) {
          final prefs = await SharedPreferences.getInstance();

          isPageLoading = true;
          Future.delayed(const Duration(milliseconds: 500), () async {});
          isPageLoading = false;

          if (i > 2) {
            getOldChats(roomid, i--, n);
          }
        }
      });
    }
  }

  void getList() {
//    c.getjob;
    print("c.getjob");
    //   jobList.addAll(c.getjob);

    /* jobList.add(new JobListModel("Junior Product Designer","Amsterdam"));
    jobList.add(new JobListModel("UI Designer","Newburgh"));
    jobList.add(new JobListModel("Web Designer","Yonkers"));
    jobList.add(new JobListModel("Product Designer","Amsterdam"));
    jobList.add(new JobListModel("Web Designer","NewyorkCity"));
    jobList.add(new JobListModel("Junior Product Designer","Amsterdam"));
    jobList.add(new JobListModel("Junior Product Designer","Amsterdam"));
    jobList.add(new JobListModel("UI Designer","Newburgh"));
    jobList.add(new JobListModel("Web Designer","Yonkers"));
    jobList.add(new JobListModel("Product Designer","Amsterdam"));
    jobList.add(new JobListModel("Web Designer","NewyorkCity"));
    jobList.add(new JobListModel("Junior Product Designer","Amsterdam"));*/
  }

  Future<void> updatestatusread() async {
    Uri uri = Uri.parse(
        'http://im2.tainosystems.com:7200/api/messages/ReadMessage/' +
            widget.messageid);
    final response = await http.put(uri);
    var code = response.statusCode;
    print("checkmessageapicode---------" + code.toString());
  }

  Future<void> deletemesaage(String messageid) async {
    Uri uri = Uri.parse(
        'http://im2.tainosystems.com:7200/api/messages/deleteByMessageId/' +
            messageid);
    final response = await http.delete(uri);
    // initState();
    var code = response.statusCode;
    if (kDebugMode) {
      print('deleteapicode---------------------' + code.toString());
    }
    getOldChats(roomassignid, 1, 100);
    if (kDebugMode) {
      print('roomapicode---------------------' + roomassignid.toString());
    }
  }
//changes
  Future<void> getOldChats(String room_id, int pageNo, int pageSize) async {
    items = [];
    reversedList = [];
    messages = [];
    messages = [];
    Uri uri = Uri.parse(
        'http://im2.tainosystems.com:7200/api/messages/getOldChat?room_id=' +
            room_id +
            '&pageNo=' +
            pageNo.toString() +
            '&pageSize=' +
            pageSize.toString());
    final response = await http.get(uri);
    var data = json.decode(response.body);
    items = data['items'];
    reversedList = new List.from(items.reversed);
    setState(() {
      for (var i = 0; i < reversedList.length; i++) {
        if (reversedList[i]['fromMsg'] != username) {
          messages.add(ChatMessage(
              messageContent: reversedList[i]['msg'], messageType: "receiver"));
        } else {
          messages.add(ChatMessage(
              messageContent: reversedList[i]['msg'], messageType: "sender"));
        }
      }
    });
    if (messages.length > 10) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        controller.jumpTo(controller.position.maxScrollExtent + 30);
      });
    } else {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        controller.jumpTo(controller.position.maxScrollExtent);
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    socket.disconnect();
    socket.dispose();
    messages.clear();
  }

  void connect() {
    socket = io.io("http://im2.tainosystems.com:7200", <String, dynamic>{
      "transports": ["websocket"],
      "autoconnect": false,
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
    socket.emit('set-room', {
      'name1': LocalData().user.username + "-" + widget.item,
      'name2': widget.item + "-" + LocalData().user.username
    });
    socket.on('set-room', (roomID) {
      roomid = roomID;

      if (kDebugMode) {
        print("roomID--------" + roomID.toString());
      }
      setState(() {
        roomassignid = roomID;
      });
      getOldChats(roomID, 1, 1000);
    });
    socket.on('chat-msg', (data) {
      var msgdata = data["msg"];
      var msgFrom = data["msgFrom"];
      if (kDebugMode) {
        print("msgdata--------" + msgdata.toString());
        print("msgfrom--------------" + msgFrom.toString());
      }
      setState(() {
        if (msgFrom != LocalData().user.username) {
          if (msgdata != null) {
            messages.add(ChatMessage(
                messageContent: msgdata.toString(), messageType: "receiver"));
            Timer(const Duration(milliseconds: 100),
                () => controller.jumpTo(controller.position.maxScrollExtent));
          }
        }
      });
    });

    socket.on('onlineStack', (onlineuser) {});
  }

  @override
  Widget build(BuildContext context) {
    // nam = ModalRoute.of(context)!.settings.arguments as String;
    // connect(nam);
    developer.log("userssss---" + LocalData().user.username);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(right: 16, top: 4),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  width: 2,
                ),
                SizedBox(
                  height: 48,
                  child: ProfilePicture(
                    name: widget.name,
                    radius: 31,
                    fontsize: 24,
                    random: false,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  widget.name,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.only(bottom: kFloatingActionButtonMargin + 48),
            child: Scrollbar(
              child: ListView.builder(
                controller: controller,
                itemCount: messages.length,
                reverse: false,
                shrinkWrap: true,
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                physics: const AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  // controller.jumpTo(controller.position.maxScrollExtent);

                  if (scrollcheck == true) {
                    WidgetsBinding.instance.addPostFrameCallback((_) => {
                          controller.jumpTo(controller.position.maxScrollExtent)
                        });
                    scrollcheck = false;
                    print("printingdata222-----------------------");
                  } else {
                    print("printingdata-----------------------");
                  }

                  return Container(
                    padding: const EdgeInsets.only(
                      left: 14,
                      right: 14,
                      top: 10,
                    ),
                    child: Align(
                      alignment: (messages[index].messageType == "receiver"
                          ? Alignment.topLeft
                          : Alignment.topRight),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: (messages[index].messageType == "receiver"
                              ? Colors.grey.shade200
                              : Colors.red[200]),
                        ),
                        padding: const EdgeInsets.all(16),
                        child: GestureDetector(
                          onLongPress: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Delete Chat?'),
                                content: const Text(
                                    'Would you like to delete this conversation?'),
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(2.0))),
                                actions: [
                                  TextButton(
                                      child: const Text('Delete'),
                                      onPressed: () {
                                        // getOldChats(roomassignid,1,10000);
                                        Navigator.of(context).pop(
                                          deletemesaage(
                                              reversedList[index]['id']),
                                        );
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                          content: Text(
                                              "Message deleted successfully"),
                                          backgroundColor: Colors.red,
                                        ));
                                      })
                                ],
                              ),
                            );
                          },
                          child: Text(
                            messages[index].messageContent,
                            style: const TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: const EdgeInsets.only(left: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TextField(
                      textCapitalization: TextCapitalization.sentences,
                      maxLines: 10,
                      controller: myController,
                      decoration: const InputDecoration(
                          hintText: "Write message...",
                          hintStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, bottom: 10, right: 5),
                    child: FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          if (myController.text.isNotEmpty) {
                            socket.emit('chat-msg', {
                              'msg': myController.text,
                              'msgTo': widget.item,
                              "date": DateTime.now().toString()
                            });

                            messages.add(ChatMessage(
                                messageContent: myController.text,
                                messageType: "sender"));
                            // messages = List.from(messages.reversed);

                            Timer(
                                const Duration(milliseconds: 100),
                                () => controller.jumpTo(
                                    controller.position.maxScrollExtent));
                          }
                        });
                        myController.text = "";
                      },
                      child: const Icon(
                        Icons.send,
                        color: Colors.white,
                        size: 18,
                      ),
                      backgroundColor: Colors.red,
                      elevation: 0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
