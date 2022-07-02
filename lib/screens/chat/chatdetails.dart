import 'dart:async';
import 'dart:developer';
import 'package:cle_app/data/settings/local_data.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'ChatMessage.dart';
import 'dart:developer' as developer;

List<ChatMessage> messages = [

];

class ChatDetails extends StatefulWidget {

  // const ChatDetails({super.key});
  const ChatDetails({super.key, required this.item});
  final item;



  @override
  State<ChatDetails> createState() => _ChatDetailsState();
}

class _ChatDetailsState extends State<ChatDetails> {
  // const ChatDetails({Key? key}) : super(key: key);
  TextEditingController myController = TextEditingController();

  ScrollController controller = ScrollController();
  late IO.Socket socket;
  String username = LocalData().user.username;



  void initState() {
    super.initState();
    connect();
  }


  //
  // void dispose() {
  //   socket.disconnect();
  //   socket.dispose();
  // }
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
    socket.emit('set-room', {
      'name1': LocalData().user.username + "-" + widget.item,
      'name2': widget.item + "-" + LocalData().user.username
    });
    socket.on('set-room', (roomID) {
      print("roomID--------" + roomID.toString());
    });
    socket.on('onlineStack', (onlineuser) {
      print('onlinecheck---'+onlineuser.toString());
      print('checkkey---'+onlineuser['username'].toString());
    });
    socket.on('chat-msg', (data) {
      print("mess--------" + data.toString());
      var msgdata = data["msg"];
      var msgFrom = data["msgFrom"];
      print("msgdata--------" + msgdata.toString());
      print("msgfrom--------------"+msgFrom.toString());
      setState(() {
        if (msgFrom != LocalData().user.username) {
          if(msgdata!=null){
            messages.add(ChatMessage(
                messageContent: msgdata.toString(), messageType: "receiver"));
            Timer(Duration(milliseconds: 100),
                    () => controller.jumpTo(controller.position.maxScrollExtent));
          }
        }
      });
    });
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
            padding: EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      "<https://randomuser.me/api/portraits/men/5.jpg>"),
                  maxRadius: 20,
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        widget.item,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        "",
                        style: TextStyle(
                            color: Colors.grey.shade600, fontSize: 13),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.settings,
                  color: Colors.black54,
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  bottom: kFloatingActionButtonMargin + 48),
              child: ListView.builder(
                controller: controller,
                itemCount: messages.length,
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 10, bottom: 10),
                physics: AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.only(
                        left: 14, right: 14, top: 10, bottom: 10),
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
                        padding: EdgeInsets.all(16),
                        child: Text(
                          messages[index].messageContent,
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: EdgeInsets.only(left: 10),
                height: 60,
                width: double.infinity,
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: TextField(
                        textCapitalization: TextCapitalization.sentences,
                        maxLines: 10,
                        controller: myController,
                        decoration: InputDecoration(
                            hintText: "Write message...",
                            hintStyle: TextStyle(color: Colors.black54),
                            border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.only(top: 10, bottom: 10, right: 5),
                      child: FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            if(widget.item!=null){
                              if (myController.text.length > 0) {
                                socket.emit('chat-msg', {
                                  'msg': myController.text,
                                  'msgTo': widget.item,
                                  "date": DateTime.now().toString()
                                });
                                messages.add(ChatMessage(
                                    messageContent: myController.text,
                                    messageType: "sender"));
                                Timer(
                                    Duration(milliseconds: 100),
                                        () => controller.jumpTo(
                                        controller.position.maxScrollExtent));
                              }
                            }

                          });
                          myController.text = "";
                        },
                        child: Icon(
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
      ),
    );
  }
}