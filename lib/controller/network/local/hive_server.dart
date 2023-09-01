import 'package:hive_flutter/hive_flutter.dart';

class HiveServer {
  static Future<void> initializeDB() async {
    await Hive.initFlutter();
  }

  Future<void> insertOrUpdateUser(String email, String password) async {
    final userBox = await Hive.openBox('users');
    bool isExist = false;
    for (var key in userBox.keys) {
      final dynamic user = userBox.get(key);
      if (user['email'] == email && user['password'] == password) {
        isExist = true;
        break;
      }
    }
    if (isExist) {
      //update count
      await userBox.put(email, {
        'email': email,
        'password': password,
        'count': userBox.get(email)['count'] + 1,
      });
      userBox.close();
      print("🚨count updated");
    } else {
      await userBox.put(email, {
        'email': email,
        'password': password,
        'count': 1,
      });
      userBox.close();
      print('inserted item✅');
    }
  }

  Future<List<dynamic>> getAllUsers() async {
    final userBox = await Hive.openBox('users');
    final List<dynamic> users = [];
    for (var key in userBox.keys) {
      final user = userBox.get(key);
      users.add(user);
    }
    userBox.close();
    return users;
  }
}
