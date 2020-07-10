import 'package:flutter/foundation.dart';

class UserData extends ChangeNotifier {
  Map user = Map();

  void setUser(Map user) {
    this.user = user;
    print('User set successfuly.');
  }

  Map getUser() {
    return this.user;
  }
}
