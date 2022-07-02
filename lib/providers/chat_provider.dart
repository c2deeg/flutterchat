import 'package:cle_app/data/database/local_database/database.dart';
import 'package:flutter/cupertino.dart';

class ChatProvider extends ChangeNotifier {
  bool _isLoading = false;
  List<DirectMessage> _selectedChatroom = [];
  Map<int, List<DirectMessage>> _chatrooms = {};

  bool get isloading => _isLoading;
  List<DirectMessage> get selectedChatroom => _selectedChatroom;
  Map<int, List<DirectMessage>> get chatrooms => _chatrooms;

  ChatProvider() {}

  setLoading(bool loading) async {
    _isLoading = loading;
    notifyListeners();
  }

  setChatrooms() {}

  setSelectedChatroom() {}

  init() {}

  sendMessage() {}
}
